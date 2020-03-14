#!/usr/bin/env bash

# Taken mostly from:
# https://github.com/docker-library/python

set -Eeuo pipefail
shopt -s nullglob

# MacOs compat (no readlink -f)
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$SCRIPTPATH"

generate_warning() {
    cat <<-EOH
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
EOH
}

while read v; do
    if [[ "$v" == "" ]]; then
        continue
    fi
    mkdir -p "$v"
    template="Dockerfile.template"
    { generate_warning; cat "$template"; } > "$v/Dockerfile"
    sed -i '' -e 's/^\(ARG SCALA_VERSION=\).*/\1'$v'/' "$v/Dockerfile"
    echo "Generated Dockerfile: $v/Dockerfile"
done <VERSIONS
