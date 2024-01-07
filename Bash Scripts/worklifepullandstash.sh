#!/bin/bash
cd /home/khalid/repo/altWorklife
echo "Enter a Commit Msg"
read cmd

git restore src/main/webapp/
 if test -f AltOneOrganise.iml; then                                               
      git restore AltOneOrganise.iml
    fi                                                                        
         
git add .
git stash save -m "$cmd"
git pull origin development
git stash apply stash@{0}
sleep 1
echo "Enter F to continue Merge or J to resolve Merge conflicts"
read choice


if [ "$choice" = "f" ]; then
    git add .
    git commit -m $cmd
    git checkout -b khalid/dev/$cmd
    git push origin khalid/dev/$cmd
else
    echo "Exiting Script to resolve Merge conflicts"
fi
cd /home/khalid/repo/altWorklife
