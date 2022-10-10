#!/bin/sh

TAG="$1"; shift

set -ex

git checkout release/v1
git merge main

if [ -n "$TAG" ]; then
    git tag $TAG
    git push origin --tags
fi

git push origin release/v1
git checkout main
