## 7. Teamwork and branches

Now you will be creating a new branch in the repo your group is sharing, but you will create in from the GitHub page 

1. Everyone in the group create a new branch in the repo - this time you could try doing it from the GitHub page

2. Check which remote branches exist with `git branch -r`

3. Check which local branches you have with `git branch`

4. Use `git status` to see which branch you are on.

5. Check with `git branch -a` to see all local and remote branches

6. Do a `git pull` from the command line to get a list of all branches. Switch to the branch you created on GitHub with `git checkout --track origin/mynewbranch`. Again do `git branch` to see which branch you are on.

7. Create a new file and put some content to it. Add and commit it. Check for changes (`git status`, `git log`). Push the changes.

8. Try and merge the branches from the command line. Remember to first pull any changes from your other group members. Also remember to switch to the branch you want to merge it to (main in this case).

9. Were you succesful? Why or why not? Is there are difference between what happens when the owner of the branch tries this and when everyone else does?

10. After doing this, everyone should again do a `git pull` (on the command line)

11. Use `git status`, `git branch`, and `git log` to see what has happened. If you want a "prettier" and sometimes easier to read view, use `git log --graph --oneline --decorate --all`


