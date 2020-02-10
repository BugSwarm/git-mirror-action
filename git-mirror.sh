#!/bin/sh

set -e

SOURCE_REPO=$1
DESTINATION_REPO=$2

GIT_SSH_COMMAND="ssh -v"

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"

echo "Cloning SOURCE_REPO..."
git clone $SOURCE_REPO

cd basename -s .git $SOURCE_REPO

echo "Setting remote origin to DESTINATION_REPO..."
git remote set-url --push origin $DESTINATION_REPO

echo "Pushing to master..."
git push origin master
