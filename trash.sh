#!/usr/bin/env bash
bn=$(basename $0)
if [ "$bn" != "ts" ] && [ "$bn" != "trash" ]
then
  echo "Call via ts or trash!"
  exit 1
fi

# create the trash dir if it does not exist
trash_dir=~/.trash
if [ ! -d $trash_dir ]
then
  echo "create $trash_dir"
  mkdir $trash_dir
fi

# return if call ts and no argument is provided
if [ $# -eq 0 ] && [ "$bn" == "ts" ]
then
  echo "No argument is provided!"
  exit 1
fi

# move files to the trash dir 
if [ $# -gt 0 ]
then
  mv "$@" $trash_dir
fi

# show the disk usage if call trash
if [ "$bn" == "trash" ]
then
  du -sh $trash_dir
fi

