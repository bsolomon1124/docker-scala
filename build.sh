#!/usr/bin/env bash
echo "WE ARE HERE 1"

set -Eeuo pipefail
shopt -s nullglob

echo "WE ARE HERE 2"

# MacOs compat (no readlink -f)
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$SCRIPTPATH"
echo "WE ARE HERE 3"
pwd
echo "WE ARE HERE 4"

while read v; do
    if [[ "$(docker image ls -q bsolomon1124/scala:$v 2> /dev/null)" == "" ]]; then
        pushd "$v"
        docker image build -t "bsolomon1124/scala:$v" .
        popd
    else
        echo "Skipping bsolomon1124/scala:${v}: already exists"
    fi
done <VERSIONS
