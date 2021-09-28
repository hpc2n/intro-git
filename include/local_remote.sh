#
# Functionality for creating a repository that tracks a local remote
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

#
# Creates a repository that tracks a local remote. If the local remote exists,
# the repository is made to track it and no new remote is created
#
# Arguments:
#  1. Local directory name for the repository
#  2. Local directory name for the local remote (optional)
#  3. Branch name (optional)
#
function create_repo_with_local_remote {

    if [ $# -lt 1 ] || [ $# -gt 3 ]; then
        exit 1
    fi

    local DIRECTORY="${1}"

    local REMOTE=".local_remote"
    if [ $# -eq 2 ]; then
        local REMOTE="${2}"
    fi

    local BRANCH="master"
    if [ $# -eq 3 ]; then
        local BRANCH="${3}"
    fi

    # create a local bare repository that functions as the local remote
    if [ ! -d "${REMOTE}" ]; then
        mkdir "${REMOTE}"
        (
            cd "${REMOTE}"
            git init --bare
        )
    fi

    # create an empty repository
    mkdir "${DIRECTORY}"
    (
        cd "${DIRECTORY}"
        git init

        # create ${BRANCH} branch
        git checkout -b ${BRANCH}

        # add the local remote and make ${BRANCH} track it
        cat >> .git/config <<EOL
[remote "origin"]
	url = ../${REMOTE}
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "${BRANCH}"]
	remote = origin
	merge = refs/heads/${BRANCH}
EOL
    )
}
