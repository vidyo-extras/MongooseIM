#!/usr/bin/env bash
# Converts path into an absolute path
# Similar to "readlink -f" or realpath.
# Accepts directories as an argument only.
#
# Example 1:
#     $ pwd
#     /home/user/erlang/esl/2017/MongooseIM
#     $ ./tools/abs_dirpath.sh ../
#     /home/user/erlang/esl/2017
#
# Example 2:
#     $ ./tools/abs_dirpath.sh /home/user/erlang/esl/2017
#     /home/user/erlang/esl/2017
set -e

if [ "$#" -ne 1 ]; then
    exit "Illegal number of parameters"
fi

DIR=$(echo "${1%/*}")
(cd "$DIR" && echo "$(pwd -P)")
