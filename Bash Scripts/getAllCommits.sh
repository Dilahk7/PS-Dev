#!/bin/bash

et="/home/khalid/repo/entity/altworklifeentity"
cm="/home/khalid/repo/altCommon"
wl="/home/khalid/repo/altWorklife"
ad="/home/khalid/repo/altAdmin"

echo "Pick a Branch"
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
*) echo "Invalid dir selection"; exit 1;;
esac

if [ -d "$selected_dir" ]; then
  cd "$selected_dir"
  echo "Changed to dir: $dir"
else
  echo "Directory for dir $dir not found."
  exit 1
fi

# echo "Enter A date to fetch Commits from till today : Format 2023-07-15"
# read SPECIFIC_DATE
SPECIFIC_DATE=2023-10-16

AUTHORS=(
  "khalid.najam@peoplestrong.com"  
)

for author_email in "${AUTHORS[@]}"; do
  echo "==================================="
  echo "Commits by author $author_email after $SPECIFIC_DATE:"
  git log --author="$author_email" --since="$SPECIFIC_DATE" --pretty  --no-merges
done