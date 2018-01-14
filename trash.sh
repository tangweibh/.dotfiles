#!/usr/bin/env bash
# return if no argument is provided
if [ $# -eq 0 ]
then
  echo "No argument is provided!"
  exit 1
fi

# create the trash dir if it does not exist
trash_dir=~/.trash
if [ ! -d $trash_dir ]
then
  echo "create $trash_dir"
  mkdir $trash_dir
fi

# move files to the trash dir and show the usage
mv "$@" $trash_dir
du -sh $trash_dir
