#!/bin/bash

et="/home/khalid/repo/entity/altworklifeentity"
cm="/home/khalid/repo/altCommon"
wl="/home/khalid/repo/altWorklife"
ad="/home/khalid/repo/altAdmin"

echo "Pick a Directory"
echo "et for Altworklifeentity"
echo "cm for AltCommon"
echo "wl for AltWorklife"
echo "ad for AltAdmin"
read dir

case $dir in
et) selected_dir="$et";;
cm) selected_dir="$cm";;
wl) selected_dir="$wl";;
ad) selected_dir="$ad";;
*) echo "Invalid Directory selection"; exit 1;;
esac

if [ -d "$selected_dir" ]; then
  cd "$selected_dir"
  echo "Changed to Directory: $dir"
else
  echo "$dir not found."
fi

echo "Enter A date to fetch Commits from: Format 2023-07-15"
read SPECIFIC_DATE

# SPECIFY THE TARGET BRANCH NAME HERE
TARGET_BRANCH=JAS_23.8.RX

AUTHORS=(
  "sahil.saini@peoplestrong.com"
  "khalid.najam@peoplestrong.com"
  "smitojha11@gmail.com"
  "rakesh.1@peoplestrong.com"
)

# ANSI Color codes
GREEN="\033[0;32m"
RESET="\033[0m"

for author_email in "${AUTHORS[@]}"; do
  echo "==================================="
  echo "Commits by author $author_email after $SPECIFIC_DATE in branch $TARGET_BRANCH:"
  git log --author="$author_email" --since="$SPECIFIC_DATE" --oneline $TARGET_BRANCH | grep -v "Merged in" | sed "s/\([a-f0-9]\{7\}\)/$GREEN\1$RESET/g"

  # Check if the commits exist in the target branch
  echo "Checking if these commits exist in branch $TARGET_BRANCH:"
  while read -r commit_hash _; do
    git rev-parse --quiet --verify "$commit_hash^{commit}" && echo -e "${GREEN}Commit $commit_hash exists in $TARGET_BRANCH${RESET}" || echo -e "${GREEN}Commit $commit_hash does not exist in $TARGET_BRANCH${RESET}"
  done < <(git log --author="$author_email" --since="$SPECIFIC_DATE" --oneline $TARGET_BRANCH | grep -v "Merged in")
done
