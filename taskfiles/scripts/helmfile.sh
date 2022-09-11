#!/bin/bash

COMMAND=$1; shift
NAMESPACE=$1; shift
RELEASE=$1; shift

set -e

NS_DIR="$(pwd)/helmfiles/namespace-releases"

usage(){
    echo "Invalid usage."
    echo
    echo "Arguments:"
    echo "<command> The Helmfile command to use. Current value is $([ -z "$COMMAND" ] && echo ❌ Missing || echo ✅ $COMMAND)."
    echo "<namespace> Must be a file that exists in $NS_DIR. Current value is $([ -z "$NAMESPACE" ] && echo ❌ Missing || echo ✅ $NAMESPACE)."
    echo "[release-name] Optionally select a single release"
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

if [ "$NAMESPACE" = "sealed-secrets" ]; then
    TEXT="You are about to modify the $NAMESPACE namespace.

Deleting the sealed-secrets controller will render all existing SealedSecrets invalid.

Make sure you have backup copies of all your secrets. Are you sure you want to continue?"
    gum confirm	--prompt.foreground "#ff0000" "$TEXT"
fi

set -x
helmfile $DEBUG_LOGS --interactive -f "$NAMESPACE_FILE_PATH" $SELECTOR $COMMAND "$@"
