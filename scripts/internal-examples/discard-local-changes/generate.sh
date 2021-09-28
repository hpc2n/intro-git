#!/bin/bash
#
# Creates a repository that demonstrates how to discard local changes
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
    echo "I agree. This is a very nice file." >> file.txt
)

(
    cd tmp
    git pull
    echo "But it is not ready yet." >> file.txt
    git add file.txt
    git commit -m "Second commit"
    git push
)

rm -rf "tmp"
