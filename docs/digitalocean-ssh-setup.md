# DigitalOcean & SSH

To get Vagrant and DigitalOcean to work properly you need to set up an SSH key.
(I prefer to use a separate SSH key just for DigitalOcean).

The setup procedure is described [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)

## 1) Create RSA Key Pair

```sh
$ ssh-keygen -t rsa
```

When being asked the following
```sh
Enter file in which to save the key (/home/demo/.ssh/id_rsa):
```
I just choose another path, just to not conflict with existing keys: `/Users/<username>/.ssh/do_id_rsa`

Then enter the pass-phrase and add the generated key to your local ssh-agent:

```sh
$ ssh-add ~/.ssh/do_id_rsa
```

## 2) Get your public key

Copy the **public** key generated

```sh
$ cat /Users/<username>/.ssh/do_id_rsa.pub
```
(Or just open the `do_id_rsa.pub` file in a text-editor).

## 3) Make your key available on DO

- Log into your DO account
- Go to Settings > Security > "Add SSH Key"
- Paste the public key and use "vagrant" as name