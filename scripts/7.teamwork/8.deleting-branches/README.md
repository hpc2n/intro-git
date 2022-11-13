## 8. Deleting branches

1. Everyone should now create two more branches in the repo. In each case, switch to the branch, create a file in it, and push the branch

2. Check which branches exist, remotely and locally

3. Try and delete a remote branch with `git push origin --delete myownbranch

4. Try delete a local branch with `git branch -D <alsomyownbranch`>

5. Do a `git status`, `git log` and `git branch` to see what has happened

6. The branch you deleted locally is still on the repo. Get another copy of it (`git pull` and `git fetch`, possibly with suitable flags will get it back for you)

