#!/bin/bash

set -eu

deploy_remote_uri='git@github.com:axsh/wakame-vdc.wiki.git'
deploy_remote_name='production'

git checkout master
git pull --rebase

if [[  $(git remote) != *${deploy_remote_name}* ]]; then
  git remote add ${deploy_remote_name} ${deploy_remote_uri}
fi

git push ${deploy_remote_uri} master
