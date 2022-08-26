#!/bin/bash

COMMAND=$1; shift
NAMESPACE=$1; shift
RELEASE=$1; shift

set -e

NS_DIR="$(pwd)/helmfiles/namespace-releases"

usage(){
    echo "Invalid usage.\n"
    echo "Arguments:"
    echo "<command> The Helmfile command to use. Current value is $([ -z "$COMMAND" ] && echo ❌ Missing || echo ✅ $COMMAND)."
    echo "<namespace> Must be a file that exists in $NS_DIR. Current value is $([ -z "$NAMESPACE" ] && echo ❌ Missing || echo ✅ $NAMESPACE)."
    echo "[release-name] Optionally select a single release\n"
    exit 1
}

NAMESPACE_FILE_PATH="${NS_DIR}/${NAMESPACE}.yaml"

if [ -z "$NAMESPACE" ] || [ ! -f "$NAMESPACE_FILE_PATH" ]; then
    usage
fi

SELECTOR=""
if [ ! -z "$RELEASE" ]; then
    SELECTOR="--selector=name=$RELEASE"
fi

DEBUG_LOGS=""
if [ "$LAUNCHPAD_VERBOSE_LOGS" = "true" ]; then
    DEBUG_LOGS="--debug"
fi

# gum confirm "Are you sure you want to sync all the releases defined in $NAMESPACE_FILE_PATH?"

set -x
helmfile $DEBUG_LOGS --interactive -f "$NAMESPACE_FILE_PATH" $SELECTOR $COMMAND "$@"
