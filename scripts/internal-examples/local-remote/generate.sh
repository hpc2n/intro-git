#!/bin/bash
#
# Creates a repository that tracks a local remote
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

# create a repository that tracks a local remote
create_repo_with_local_remote "repository"

# add a file to the repository and push it to the remote
(
    cd repository

    # set Git user info
    set_user_info

    echo "This file contains something interesting." > file.txt
    git add file.txt
    git commit -a -m "First commit"
    git push
)
