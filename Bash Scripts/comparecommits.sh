#!/bin/bash

RED='\033[0;31m'   # Red color
GREEN='\033[0;32m' # Green color
NC='\033[0m'       # No Color

et="/home/khalid/repo/entity/altworklifeentity"
cm="/home/khalid/repo/altCommon"
wl="/home/khalid/repo/altWorklife"
ad="/home/khalid/repo/altAdmin"

echo "Pick a Branch"
echo "et for Altworklifeentity"
echo "cm for AltCommon"
echo "wl for AltWorklife"
echo "ad for AltAdmin"

read branch

case $branch in
et) selected_dir="$et" ;;
cm) selected_dir="$cm" ;;
wl) selected_dir="$wl" ;;
ad) selected_dir="$ad" ;;
*)
  echo "Invalid Directory selection"
  exit 1
  ;;
esac

if [ -d "$selected_dir" ]; then
  cd "$selected_dir"
  echo "Changed to branch: $branch"
else
  echo "Directory for branch $branch not found."
  exit 1
fi


# echo "Enter A date to fetch Commits from till today : Format 2023-07-15"
# read SPECIFIC_DATE
SPECIFIC_DATE=2023-10-12

# sleep 2
# echo "${GREEN} Stashing before proceeding ${NC}"
# git add . 
# git stash save -m "Stash before comparing $branch"
# git pull 

echo $SPECIFIC_DATE

echo "Enter a branch to compare with"
read BRANCH_NAME
# sleep 2
# git pull 
# sleep 2


# AUTHORS=(
#   "sahil.saini@peoplestrong.com"
#   "khalid.najam@peoplestrong.com"
#   "smitojha11@gmail.com"
#   "rakesh.1@peoplestrong.com"
#   "khalidnajam7@gmail.com"
#   "somen.das@peoplestrong.com"
# )
AUTHORS=(
  "khalid.najam@peoplestrong.com"
  "khalidnajam7@gmail.com"
)

baseBranchCommits=()

for author_email in "${AUTHORS[@]}"; do
  commits=$(git log --author="$author_email" --no-merges --pretty --since="$SPECIFIC_DATE" --format="%h" | grep -v "Merged in")
  # commits=$(git log --author="$author_email" --no-merges --pretty="%h %ad %an" --since="$SPECIFIC_DATE" --format="%h" | grep -v "Merged in")

  baseBranchCommits+=($commits)
done

echo -e "${GREEN}Base Branch commits saved, Checking out ${NC}"
git checkout $BRANCH_NAME
comparingBranchCommits=()

for author_email in "${AUTHORS[@]}"; do
  commits=$(git log --author="$author_email" --no-merges --pretty --since="$SPECIFIC_DATE" --format="%h" | grep -v "Merged in")
  # commits=$(git log --author="$author_email" --no-merges --pretty="%h %ad %an" --since="$SPECIFIC_DATE" --format="%h" | grep -v "Merged in")


  comparingBranchCommits+=($commits)
done


for commit in "${baseBranchCommits[@]}"; do
  found=false
  for comparingCommit in "${comparingBranchCommits[@]}"; do
    if [[ "$commit" == "$comparingCommit" ]]; then
      found=true
      break
    fi
  done
  if [ "$found" == true ]; then
    ((i++))
    echo -e "${GREEN} $i | Commit $commit exists in both the branch.${NC}"
    
    
  else
    ((j++))
    echo -e "${RED} $j | Commit $commit does not exist in $BRANCH_NAME${NC}"
    
    
  fi
done

git checkout development
