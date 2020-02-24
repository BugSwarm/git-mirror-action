#!/bin/sh

set -e

SOURCE_REPO=$1
DESTINATION_REPO=$2
SOURCE_REPO_NAME=`basename $SOURCE_REPO .git`

GIT_SSH_COMMAND="ssh -v"

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"

git clone $SOURCE_REPO

cd $SOURCE_REPO_NAME

git remote set-url --push origin $DESTINATION_REPO

# Use --force-with-lease to ensure we do not overwrite
# someone elses work by force pushing
git push origin master --force
