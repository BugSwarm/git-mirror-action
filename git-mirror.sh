#!/bin/sh

set -e

SOURCE_REPO=$1
DESTINATION_REPO=$2

GIT_SSH_COMMAND="ssh -v"

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"

echo "Cloning..."
git clone "$SOURCE_REPO" && cd `basename "$SOURCE_REPO"`
git remote set-url --push origin "$DESTINATION_REPO"

echo "Fetching..."
git fetch -p origin

echo "Pushing..."
git push origin master
