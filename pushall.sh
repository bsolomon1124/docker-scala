#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

docker login

while read v; do
    if [[ "$v" == "" ]]; then
        continue
    fi
    if [[ "$(docker image ls -q bsolomon1124/scala:$v 2> /dev/null)" == "" ]]; then
        echo "Skipping push of bsolomon1124/scala:${v}: image not found"
    else
        docker push "bsolomon1124/scala:$v"
    fi
done <VERSIONS
