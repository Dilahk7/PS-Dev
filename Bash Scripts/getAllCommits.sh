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
  read branch

  case $branch in
  et) selected_dir="$et";;
  cm) selected_dir="$cm";;
  wl) selected_dir="$wl";;
  ad) selected_dir="$ad";;
  *) echo "Invalid branch selection"; exit 1;;
esac


if [ -d "$selected_dir" ]; then
  cd "$selected_dir"
  echo "Changed to branch: $branch"
else
  echo "Directory for branch $branch not found."
fi

echo "Enter A date to fetch Commits from : Format 2023-07-15"
read SPECIFIC_DATE

#SPECIFIC_DATE="2023-07-15"
AUTHORS=(
  "sahil.saini@peoplestrong.com"
  "khalid.najam@peoplestrong.com"
  "smitojha11@gmail.com"
  "rakesh.1@peoplestrong.com")


for author_email in "${AUTHORS[@]}"; do
  echo "==================================="
  echo "Commits by author $author_email after $SPECIFIC_DATE:"
  git log --author="$author_email" --since="$SPECIFIC_DATE" --oneline | grep -v "Merged in" 
done