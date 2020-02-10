#!/bin/sh

set -e

SOURCE_REPO=$1
DESTINATION_REPO=$2

GIT_SSH_COMMAND="ssh -v"

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"

echo "Cloning..."
git clone "git@github.com:$SOURCE_REPO.git"
cd $SOURCE_REPO
git remote set-url --push origin "git@github.com:$DESTINATION_REPO.git"

echo "Fetching..."
git fetch -p origin

echo "Pushing..."
git push origin master
