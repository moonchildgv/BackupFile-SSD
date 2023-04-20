#!/bin/bash

dir="path/folder"   # replace "/path/folder" with the actual path to the directory

cd "$dir" || exit         # enter the directory or terminate the script if it does not exist
if [ $(ls -1dq */ | wc -l) -gt 1 ]; then  # check if there are at least two folders
    oldest=$(ls -1dtr */ | head -n 1)      # select the oldest folder
    rm -rf "$oldest"                     # delete the oldest folder
    echo "folder $oldest has been deleted." # print a confirmation message
else
    echo "there are not enough folders to delete." # if there are less than two folders, print an error message
fi

#Note: This script deletes the oldest folder based on its creation date (using ls -1dtr),
#not based on modification date. If you prefer to use the modification date, replace ls -1dtr with ls -1dt.
