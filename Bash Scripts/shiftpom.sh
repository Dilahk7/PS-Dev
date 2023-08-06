#!/bin/bash

# set the source and destination paths
src="/home/khalid/pom.xml"
dst="/home/khalid/repo/altCommon/Maven Build EAR"

# check if the destination directory exists
if [ ! -d "$dst" ]
then
    echo "Destination directory does not exist."
    exit 1
fi

# copy the file to the destination directory and replace if it already exists
cp -f "$src" "$dst"

# check if the copy was successful
if [ $? -eq 0 ]
then
    echo "File copied successfully."
else
    echo "Error copying file."
fi

