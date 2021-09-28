#!/bin/bash
#
# This file generates an empty repository.
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

# create an empty directory for the repository
mkdir repository

# enter the directory
(
    cd repository

    # initialize the repository
    git init

    # set Git user info
    set_user_info
)
