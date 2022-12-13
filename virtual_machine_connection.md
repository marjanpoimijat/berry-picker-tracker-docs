# Connecting to the virtual machine and setting up the production pipeline

The virtual machine runs at `berry-picker-tracker.cs.helsinki.fi`, the SSH connection is possible only through an internal network in the University, so you must connect through e.g. `melkki.cs.helsinki.fi`.

## Create SSH key on your own machine

Run:

```bash
ssh-keygen -t ed25519 -C "<your university email here>"
```

Save the key to a file named `helsinki.fi` (instead of the suggested `id_ed25519`) in your `~/.ssh/` folder (e.g. `/home/<Username>/.ssh/`).

Make sure the passphrase is secure.

Check that the key was generated in the correct place by running:

```bash
cd ~/.ssh/ && ls -l
```

You should see both a private key (`helsinki.fi`) and a public key (`helsinki.fi.pub`) in the list.

Copy the **public** key's content somewhere, it'll be needed later:

```bash
cat ./helsinki.fi.pub
```

The contents should look like:

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPSJyRS6gDgx34BYqrXn2TGjKXtwwikn4uZIulHjDlGs <your univeristy email>
```

## Authenticating to Melkki

Connect to Melkki:

```bash
ssh <university username>@melkki.cs.helsinki.fi
```

You'll then need the public key you copied earlier. Add it to the authorised keys (notice the ~~misspelling~~ American spelling of "authorised") file:

```bash
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPSJyRS6gDgx34BYqrXn2TGjKXtwwikn4uZIulHjDlGs your.name@the.university.fi" >> ~/.ssh/authorized_keys
```

Exit out of Melkki and check the connection works (i.e. it won't ask for your password when you connect again):

```bash
exit
ssh <university username>@melkki.cs.helsinki.fi
exit
```

## Authenticating to the Berry Picker Tracker Virtual Machine

Connect to Melkki and from there, connect to the BPT-VM:

```bash
ssh <university username>@melkki.cs.helsinki.fi
ssh <univeristy username>@berry-picker-tracker.cs.helsinki.fi
```

To authorise your key on the BPT-VM, you'll need a home folder for your user with a `.ssh/` folder inside it:

```bash
cd home                             && \
sudo mkdir $(whoami)                && \
sudo chown $(whoami):root $(whoami) && \
sudo chmod 750 $(whoami)            && \
cd $(whoami)                        && \
mkdir .ssh
```

Authorise your public key again:

```bash
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPSJyRS6gDgx34BYqrXn2TGjKXtwwikn4uZIulHjDlGs your.name@the.university.fi" >> ~/.ssh/authorized_keys
```

Exit out of BPT-VM and then from Melkki:

```bash
exit
exit
```

Check you can access the BPT-VM without a password:

```bash
ssh -J <username>@melkki.cs.helsinki.fi <username>@berry-picker-tracker.cs.helsinki.fi
```

## Configure SSH to use Melkki as a jump server by default

Create and/or open `~/.ssh/config` on your own machine:

```bash
code -n ~/.ssh/config
```

Add the following to the file:

```
Host berry-picker-tracker.cs.helsinki.fi
  User <your university username here>
  AddKeysToAgent yes
  IdentityFile ~/.ssh/helsinki.fi
  ProxyJump melkki.cs.helsinki.fi

Host *.helsinki.fi
  User <your university username here too>
  AddKeysToAgent yes
  IdentityFile ~/.ssh/helsinki.fi
```

---

### Adding the passphrase to a vault

- **Linux**:  
  TODO
- **MacOS**:  
  you can add `UseKeychain yes` to both hosts' configurations. Afterwards run `ssh-add -K ~/.ssh/helsinki.fi` and give it the passphrase; your passphrase is now stored in Keychain and won't be prompted)

---

You should now be able to connect to the BPT-VM without specifying a username or a password:

```bash
ssh berry-picker-tracker.cs.helsinki.fi
```

## Adding the BPT-VM as git remotes

Navigate to your copy of the `berry-picker-tracker-server` repository and run:

```bash
git remote add production berry-picker-tracker.cs.helsinki.fi:/bpt/production/code/.git && \
git remote add staging berry-picker-tracker.cs.helsinki.fi:/bpt/staging/code/.git
```

You can now run the following to push to production:

```bash
git checkout main && git pull && git push production
```

And to staging:

```bash
git checkout main && git pull && git push staging
```
