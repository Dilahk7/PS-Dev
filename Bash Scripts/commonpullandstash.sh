#!/bin/bash

cd /home/khalid/repo/altCommon
echo "Enter a Commit Msg"
read cmd

git restore 'Maven Build EAR/pom.xml'
git add . 
git stash save -m "$cmd"
git pull origin master 
git stash apply stash@{0}
sleep 1
echo "Enter F to continue Merge or J to resolve Merge conflicts"
read choice

if [ "$choice" = "f" ]; then
    git add .
    git commit -m $cmd
    git checkout -b khalid/m/$cmd
    git push origin khalid/m/$cmd
else
    echo "Exiting Script to resolve Merge conflicts"
fi
cd /home/khalid/repo/altCommon