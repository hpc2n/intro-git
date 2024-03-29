# 2. Creating and using SSH-keys (if you did not do that earlier in the week/before) 

In this exercise you create SSH keys and upload to GitHub. Then test that it works.

Everyone in the team should do this! 

**Create a new SSH key**

1. Open a terminal (Git Bash on Windows). In the command below, "GitHub" is a label added to the key for clarity. You can add any you want:
    a. Do this
    ```
    $ ssh-keygen -t ed25519 -C "GitHub"
    ```
    b. If you have an older system, this may work better
    ```
    $ ssh-keygen -t rsa -b 4096 -C "GitHub"
    ```

2. You will be asked for a file to save the key. Unless you have an existing SSH key, accept the default.

3. Enter a passphrase and repeat it.

4. Add the key to the ssh-agent. Here we assume the default name: 

```
$ eval "$(ssh-agent -s)"

$ ssh-add ~/.ssh/id_rsa
```

5. Switch to the `.ssh` folder, open the file `id_rsa.pub` and copy it. Do NOT add any newlines or whitespace! 



**Adding the SSH key to GitHub**

1. On GitHub, click your avatar in the top right corner and pick "Settings".

2. Choose "SSH and GPG keys"

3. Click "Add new SSH key"

4. Add a descriptive label for the key in the "Title" field. In the key field you paste the content of the key (~/.ssh/id_rsa.pub)

![](https://i.imgur.com/DzOFZTd.png)

5. Click "Add SSH key"

6. Confirm your GitHub password if you are prompted for it. 



**Testing the SSH keys**

1. Open a terminal (or Git Bash) 

2. `$ ssh -T git@github.com`

3. It will look similar to this: 

```
$ ssh -T git@github.com
The authenticity of host 'github.com (140.82.121.4)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,140.82.121.4' (RSA) to the list of known hosts.
Enter passphrase for key '/home/bbrydsoe/.ssh/id_rsa': 
Hi bbrydsoe! You've successfully authenticated, but GitHub does not provide shell access.
```

4. Verify that the resulting message contains your username. 

5. NOTE: Optionally, you could run `ssh-add` to add the key. Then you will only be asked for the passphrase once per session. This is relatively safe on Linux and macOS, but not on Windows where it usually saves the key passphrase permanently.

