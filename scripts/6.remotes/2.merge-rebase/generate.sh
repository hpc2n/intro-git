#!/bin/bash
#
# Creates a repository that demonstrates how to do a rebase merge.
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

create_repo_with_local_remote "repository"
create_repo_with_local_remote "tmp"

(
    cd tmp
    set_user_info "Some Other User" "my.email@address.com"

    echo "This file contains something interesting." > file.txt
    git add file.txt
    git commit -m "First commit"
    git push
)

(
    cd repository
    set_user_info
    
    git pull
    echo "I agree. This is a very nice file." > file.txt
)

(
    cd tmp
    git pull
    echo "This file is not that interesting." > problems.txt
    git add problems.txt
    git commit -m "Problems, there are so many of them"
    git push
)

rm -rf "tmp"
