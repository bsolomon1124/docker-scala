#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

# MacOs compat (no readlink -f)
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$SCRIPTPATH"

while read v; do
    if [[ "$v" == "" ]]; then
        continue
    fi
    if [[ "$(docker image ls -q bsolomon1124/scala:$v 2> /dev/null)" == "" ]]; then
        pushd "$v"
        docker image build -t "bsolomon1124/scala:$v" .
        popd
    else
        echo "Skipping bsolomon1124/scala:${v}: already exists"
    fi
done <VERSIONS
