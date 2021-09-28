# Discarding local changes

This exercise demonstrates how to discard local changes. Enter the `repository`
directory and attempt to pull the latest changes from the remote:

```
$ git pull
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), 253 bytes | 253.00 KiB/s, done.
From ../.local_remote
   16d0bed..f3ceb31  master     -> origin/master
Updating 16d0bed..f3ceb31
error: Your local changes to the following files would be overwritten by merge:
        file.txt
Please commit your changes or stash them before you merge.
Aborting
```

The pull will fail because you have uncommitted local changes that would be
overwritten by the pull:

```
$ git diff
diff --git a/file.txt b/file.txt
index 40183bc..23ca83e 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1,2 @@
 This file contains something interesting.
+I agree. This is a very nice file.
```

Let's see what is causing the problem by investigating the difference between 
the HEAD and the remote:

```
$ git diff HEAD origin/master
diff --git a/file.txt b/file.txt
index 40183bc..ee38b7b 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1,2 @@
 This file contains something interesting.
+But it is not ready yet.
```

It appears that someone else is still working on the file. We have several options
for solving the problem depending on whether or not we want to keep the local
changes.

## Stashing

The first option is to `stash` the local changes:

```
$ git stash
Saved working directory and index state WIP on master: 584019e First commit
$ git pull
Updating 584019e..82b95f9
Fast-forward
 file.txt | 1 +
 1 file changed, 1 insertion(+)
```

The stash command removes the uncommitted changes and **stores** them. The pull
is now successful. We can see that the stash contains a single entry:

```
$ git stash list
stash@{0}: WIP on master: 584019e First commit
$ git show stash@{0}
commit bf6352925ad8a092cf1adec33a00faadc534e3b1 (refs/stash)
Merge: 584019e 1bbe40b
Author: John Doe <john.doe@email.com>
Date:   Tue Aug 11 13:24:04 2020 +0200

    WIP on master: 584019e First commit

diff --cc file.txt
index 40183bc,40183bc..23ca83e
--- a/file.txt
+++ b/file.txt
@@@ -1,1 -1,1 +1,2 @@@
  This file contains something interesting.
++I agree. This is a very nice file.
```

We can now restore the uncommitted changes from the stash:

```
$ git stash pop
Auto-merging file.txt
CONFLICT (content): Merge conflict in file.txt
The stash entry is kept in case you need it again.
```

We must of course solve the resulting merge conflict:

```
  1 This file contains something interesting.                                        
  2 <<<<<<< Updated upstream                                                         
  3 But it is not ready yet.                                                         
  4 =======                                                                          
  5 I agree. This is a very nice file.                                               
  6 >>>>>>> Stashed changes
```

After solving the conflict etc, you could delete the stashed changes:

```
$ git stash list
stash@{0}: WIP on master: 584019e First commit
$ git stash drop stash@{0}
Dropped stash@{0} (bf6352925ad8a092cf1adec33a00faadc534e3b1)
```

However, we are **not** going to delete them now.

## Permanent discard

The other option is to permanently discard the local changes. Let us return back to
the starting situation:

```
$ git reset --hard HEAD~
HEAD is now at c21605e First commit
$ git stash pop
On branch master
Your branch is behind 'origin/master' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   file.txt

no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (7c032a9986c0deec3691b53d9b365ee021066ee3)
```

We are now back where we started:

```
$ git diff
diff --git a/file.txt b/file.txt
index 40183bc..23ca83e 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1,2 @@
 This file contains something interesting.
+I agree. This is a very nice file.
$ git pull
Updating c21605e..89c2869
error: Your local changes to the following files would be overwritten by merge:
        file.txt
Please commit your changes or stash them before you merge.
Aborting
```

The local changes to the file `file.txt` can be **permanently** discarded with
the following command:

```
$ git checkout -- file.txt
$ git pull
Updating c21605e..89c2869
Fast-forward
 file.txt | 1 +
 1 file changed, 1 insertion(+)
$ cat file.txt 
This file contains something interesting.
But it is not ready yet.
```

You could also discard **all** local changes with the following command:

```
$ git reset --hard
```
