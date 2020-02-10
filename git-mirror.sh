#!/bin/sh

set -e

SOURCE_REPO=$1
DESTINATION_REPO=$2

GIT_SSH_COMMAND="ssh -v"

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"

git clone $SOURCE_REPO

REPO_NAME=`basename -s .git $SOURCE_REPO`
echo "REPO_NAME=$REPO_NAME"
cd $REPO_NAME

git remote set-url --push origin $DESTINATION_REPO

git push origin master
