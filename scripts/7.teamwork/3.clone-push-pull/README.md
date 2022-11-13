# 3. clone, push, pull
 
We now have SSH keys set up. Time to test it from your own machine:

1. Clone the repository, using the SSH address (click CODE on the GitHub repository and pick SSH). You will be asked for the key passphrase.

2. Enter the local repository. Do a `git pull` and see that it works. You will have to enter the key passphrase.

3. Create a file (or edit a file).

4. Add the file. Commit the file (`git add`, `git commit`)

5. Push the file. Again it will ask for the key passphrase. Success!

6. NOTE: Optionally, you could run `ssh-add` to add the key. Then you will only be asked for the passphrase once per session. This is relatively safe on Linux and macOS, but **not** on Windows where it usually saves the key passphrase permanently.

