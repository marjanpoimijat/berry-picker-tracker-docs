# The production environment

First make sure you can [connect to the BPT virtual machine](./virtual_machine_connection.md).

## Files

All files related to the production and staging environments are stored in `/bpt/production` and `/bpt/staging`. The directories are near-copies of each other:

```
/bpt/production → ls
• 📁 build-logs
• 📁 code
• 📁 db-data
• 📄 deploy
```

```
/bpt/staging → ls
• 📁 build-logs
• 📁 code
• 📁 db-data
• 📄 deploy
```

### The build logs

The build logs directory contains the build (and deployment) logs generated by the `deploy` script and the programs/commands it calls. The file name format is `"<date> <time> <git head hash> <university username>"`.

### The code

The code directory is a copy of the git repository. When a developer pushes code there from their machine, git runs the `post-receive` hook stored in `code/.git/hooks` — the hook itself is just a symlink to the `deploy` script listed above. The code directory also has a `.secrets/` directory, used by docker and detailed below in the [Docker section](#docker).

### The database data

The db-data directory is mounted by docker and used by the production/staging environment's copy of postgres. It is completely managed by postgres and should not be edited manually unless you know what you are doing.

### The deployment script

The deployment bash-script is called by git when pushing to the `code` repository. It grabs the git `HEAD` (which logically should always be the latest commit in the `main` branch) hash and uses it as a "revision id". It writes the latest `main` branch to the filesystem using `git checkout`, and builds a docker image and runs it — both using `docker-compose`. It then tags the built docker image with the revision id and as `":latest"`.

The production and staging environments have only minor differences in their deployment scripts; production uses the `production` docker project (discussed below in the [Docker section](#docker)), and staging the `staging` project etc. The staging scripts also runs `pytest` in the container, while production skips this step.

## Docker

Docker has a `prod-net` and a `stage-net` network, both having their respective `db` and `bpt` containers attached. Separate networks aren't at all necessary, but they are an extra step to ensure the staging BPT server doesn't accidentally connect to the production DB or vice versa.

```
$ docker network list
NETWORK ID     NAME       DRIVER   SCOPE
fd706a1e2ca7   prod-net   bridge   local
b46ca7ce1335   stage-net   bridge    local
…              …          …        …
```

The bpt-server image is labelled "bpt-server". The latest version is tagged as `:latest` and the staging version as `:alpha` — when stagings is merged to production, the tags point to the same version. The live production container is named `bpt-prod` and the staging container is named `bpt-stage`. The database uses the default postgres image and the names `db-prod` and `db-stage`:

```
$ docker ps
IMAGE                NAMES
bpt-server:latest    bpt-prod
bpt-server:alpha     bpt-prod
postgres             db-prod
postgres             db-stage
…                    …
```

```
$ docker network inspect prod-net
[
    {
        "Name": "prod-net",
        "Containers": {
            "1f77…": {
                "Name": "db-prod",
                "IPv4Address": "172.20.0.2/16",
            },
            "9733…": {
                "Name": "bpt-stage",
                "IPv4Address": "172.20.0.3/16",
            }
        },
        …
    }
]
```

The bpt-server source code is built into a docker image according to the `code/Dockerfile`. The image is then used in the `code/docker-compose.yml` and `code/docker-compose.staging.yml` files.

### Nginx

The `bpt-prod` and `bpt-stage` containers aren't actually connected to the outside internet. Instead we're using a reverse proxy, Nginx, to handle SSL and routing between the prod/staging environments. Nginx also lives as a docker container and its configuration is defined in `/bpt/nginx`:

```
/bpt/nginx → ls
• 📄 docker-compose.yml
• 📄 nginx.conf
```

The Nginx container is named `reverse-proxy` and has ports 80 and 443 (HTTP and HTTPS respectively) open to the internet:

```
$ docker ps
IMAGE   PORTS                                      NAMES
nginx   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   reverse-proxy
…
```

It is also connected to the `stage-net` and `prod-net`, so it can communicate with `bpt-prod` and `bpt-stage`. It listends to outside connections, if they're not coming through HTTPS, it redirects to HTTPS.

If they connection is encrypted, it'll look at the requested path, and redirect paths starting with `/v1` to the production app, and paths starting with `/dev` to the staging app:

```
cat nginx.conf
http {
    server {
        …
        location /v1/ {
            proxy_pass http://app-prod.prod-net:80/;
            …
        }
        location /dev/ {
            proxy_pass http://app-stage.stage-net:80/;
            …
        }
    }
}
```

The SSL certificates are managed by `certbot` and issued by Let's Encrypt. Certbot installs them to `/etc/letsencrypt`, and that is mounted on the Nginx container so that nginx can load the certificates.