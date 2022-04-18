#!/bin/bash
set -e

sh ./websiteV4.sh 2>&1 | tee results/websiteV4.txt
sh ./websiteV6.sh 2>&1 | tee results/websiteV6.txt
sh ./certificate.sh 2>&1 | tee results/certificate.txt


if [[ `git status --porcelain` ]]; then
  # Changes
  git config --global user.name 'CI'
  git config --global user.email 'masterwow3@users.noreply.github.com'
  git add .
  git commit -am "update results"
  git push
  exit 1
fi
