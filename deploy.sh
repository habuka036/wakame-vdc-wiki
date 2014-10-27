#!/bin/bash

#
# Deploys the Wiki to its production url.
# For internal Axsh use only.
#

set -eu

deploy_uri='git@github.com:axsh/wakame-vdc.wiki.git'

git checkout master
git pull --rebase

git push ${deploy_uri} master
