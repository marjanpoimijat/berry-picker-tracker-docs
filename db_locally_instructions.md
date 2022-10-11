# Instructions to connect to database locally (for Ubuntu at least)

This application uses PostgreSQL as a database, make sure that it is installed with command:

```sh
psql --version
```

If command does not return any version, go see install instructions from [here](https://www.postgresql.org/download/)

You might need to install some dev packages in order to connect database with commands:

```sh
sudo apt-get install python3-dev
```
for Python dev package and

```sh
sudo apt-get install libpq-dev
```
for PostgreSQL dev package

## After installing

After you're sure PostgreSQL is installed you can check database status with command:

```sh
service postgresql status
```

You can open PostgreSQL terminal with command:

```sh
sudo -u postgres psql
```

#### Setting up database

In psql terminal create new database named 'bpt' with command:

```
CREATE DATABASE bpt
```

#### Setting up environment variables

Create file named '.env' in the same folder as the backend root directory and put the next line in:

```
DATABASE_URI=*username*/*password*@localhost:5432/bpt
```

Where *username* is your Postgresql user and *password* is your users password. 
You can check your current user with SQL command:

```
SELECT current_user;
```

if you don't know your current user's password, you can define it in psql terminal with command:

```
\password *username*
```


When you insert something to database for the first time via application, the schema tables are created
automatically!

