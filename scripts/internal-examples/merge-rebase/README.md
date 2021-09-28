# Merge conflicts and rebasing

This exercise demonstrates how to solve a merge conflic using rebasing. Enter
the `repository` directory and check the current status:

```
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   file.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

You can see that the file `file.txt` has been modified since the last commit:

```
$ git diff
diff --git a/file.txt b/file.txt
index 40183bc..ef84ac4 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1 @@
-This file contains something interesting.
+I agree. This is a very nice file.
```

Try commiting the changes and push them to the remote:

```
$ git add file.txt 
$ git commit -m "This is my oppinion"
[master d83aebe] This is my oppinion
 1 file changed, 1 insertion(+), 1 deletion(-)
```

You will surely notice that the push was unsuccesful:

```
$ git push
To ../.local_remote
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to '../.local_remote'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

This means that the remote contains changes that are missing from your local
remote. It is possible that you are lucky and Git is able to fix this problem
automatically:

```
$ git pull
```

You will notice that the following opens to your text editor:

```
 1 Merge branch 'master' of ../.local_remote
 2 # Please enter a commit message to explain why this merge is necessary,
 3 # especially if it merges an updated upstream into a topic branch.
 4 #
 5 # Lines starting with '#' will be ignored, and an empty message aborts
 6 # the commit.
```
 
This means that Git is able to merge the two version, yours and the one on the
remote. The commit that you are creating will merge the histories together:

```
$ git log
commit fa605d6b3773a552a698eae8f0b27e6fd1797792 (HEAD -> master)
Merge: d83aebe 91fd27e
Author: John Doe <john.doe@email.com>
Date:   Tue Aug 4 12:55:31 2020 +0200

    Merge branch 'master' of ../.local_remote
...
```

You could simply continue to work normally from here but the merge commit you
just created is not actually necessary in this situation. Try falling back to
the previous commit:

```
$ git reset --hard HEAD~
$ git log
commit d83aebe319729681e9e0e760ee303ba1c0bc5035 (HEAD -> master)
Author: John Doe <john.doe@email.com>
Date:   Tue Aug 4 12:54:17 2020 +0200

    This is my oppinion
...
```

Now, pull again but tell Git to rebase your branch:

```
$ git pull --rebase
First, rewinding head to replay your work on top of it...
Applying: This is my oppinion
```

You can now see that the merge commit was not necessary:

```
$ git log
commit b5df98692d88e4a141435d720e8193f6a1821b8d (HEAD -> master)
Author: John Doe <john.doe@email.com>
Date:   Tue Aug 4 12:54:17 2020 +0200

    This is my oppinion

commit 91fd27e3e1077cf1ffe91b43717cff456349dc99 (origin/master)
Author: Some Other User <my.email@address.com>
Date:   Tue Aug 4 12:35:52 2020 +0200

    Problems, there are so many of them
...
```

You can now push the changes to the remote:

```
$ git push
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 321 bytes | 321.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To ../.local_remote
   91fd27e..b5df986  master -> master
```
