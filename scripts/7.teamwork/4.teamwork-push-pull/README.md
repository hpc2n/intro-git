# 4. Teamwork, push and pull 

One of you should create a repository on GitHub and invite their team. Remember, on the GitHub webpage the option to create a new repository is in the top right corner - click the "+". To add members: "Settings" -> "Manage access".

1. Each person should create a file in the repository (Add and commit the file)

2. On the command line, do a `git status`. Do a `git log --graph --oneline --decorate --all`

3. NOTE! To avoid errors, do `git pull` before you stage and commit your file and also the team members should use different names for their files. See the changes appear when you do a `git pull` after all have added their file(s).

4. You could also try to push a new change before pulling the changes your team members have made. Git will complain, but you should be able to solve this kind of simple problem with `git pull --rebase` before you re-do `git push`

5. Try create more files then add and commit. Do `git status` and `git log --graph --oneline --decorate --all` before and after each step. Push the files to the repository. Check the log and status again.

6. NOTE: You will be asked for the key passphrase each time you do a push

