# HPC2N: Introduction to Git - materials

This repository contains files that are used to generate materials for the HPC2N
course: Introduction to Git. The generated material is what will be shared with the participants. 

This is NOT a repo that is meant to be shared directly with the participants, only with the instructors. 

The scripts and idea was originally by Mirko Myllykoski for the "Introduction to Git" course in the fall 2020. 

## Overall idea

All scripts reside in the `scripts` directory. For example, the
`internal-examples/empty-repo` directory contains the following files:

```
$ ls scripts/internal-examples/empty-repo
generate.sh  README.md
$ cat scripts/internal-examples/empty-repo/generate.sh
mkdir test
(
    cd test
    git init
    set_user_info
)
```

When executed, the Makefile does the following to **all** subdirectories inside
the `scripts` directory that contain `generate.sh` file:

 1. Creates a directory `git_materials/aaa/bbb/ccc/`.
 2. Copies the contents of `scripts/aaa/bbb/ccc/` to `git_materials/aaa/bbb/ccc/`
    (excluding the file `generate.sh`).
 3. Executes `scripts/aaa/bbb/ccc/generate.sh` inside `git_materials/aaa/bbb/ccc/`.

For example:

```
$ make
./generate.sh scripts/ git_materials/
Generate ""
Generate "/internal-examples"
Generate "/internal-examples/empty-repo"
Initialized empty Git repository in /.../git_materials/internal-examples/empty-repo/test/.git/
...
$ ls git_materials/internal-examples/empty-repo/
README.md  test
```

## Helper functions

The following functions are automatically sourced:

### set_user_info

Sets the Git user information. Should be called while inside a repository.

Arguments:

 1. Name (optional, defaults to "John Doe")
 2. Email address (optional, defaults to "john.doe@email.com")

Example:

```
# enter the repository directory
cd repository/

# set git user information
set_user_info "Jane Doe" "jane.doe@email.com"
```

### create_repo_with_local_remote

Creates a repository that tracks a local remote.

Arguments:

 1. Local directory name for the repository
 2. Local directory name for the local remote (optional)
 3. Branch name (optional)

Example:

```
# create a repository that tracks a local remote
create_repo_with_local_remote "repository" ".local_remote" "master"

# enter the repository directory
cd repository/

# check remotes
$ git remote -v
origin  ../.local_remote (fetch)
origin  ../.local_remote (push)
```
