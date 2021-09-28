#
# Functionality for setting the Git user information
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#
#
# Sets the Git user information. Should be called while inside a repository.
#
# Arguments:
#  1. Name (optional, defaults to "John Doe")
#  2. Email address (optional, defaults to "john.doe@email.com")
#
function set_user_info {

    if [ $# -gt 2 ]; then
        exit 1
    fi

    local NAME="John Doe"
    if [ $# -ge 1 ]; then
        local NAME="${1}"
    fi

    local EMAIL="john.doe@email.com"
    if [ $# -ge 2 ]; then
        local EMAIL="${2}"
    fi

    git config --local user.name "${NAME}"
    git config --local user.email "${EMAIL}"
}
