#!/bin/sh

TAG="$1"; shift

set -ex

if [ -z "$TAG" ]; then
    echo "Missing tag arg"
    exit 1
fi

git checkout release/v1
git merge main
git tag $TAG
git push origin --tags
git push origin release/v1
