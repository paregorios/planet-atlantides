#!/bin/bash

foreign=~/Documents/Projects/planet.atlantides.org
sandbox=$PWD

if [ -z "$1" ]; then 
	echo "usage: $0 commit-msg <file>"
	exit
fi

if [ -z "$2" ]; then
    echo "committing all changes in $sandbox"
    hg commit -m "$1"
else
    echo "committing changes for $sandbox/$2"
    hg commit -m "$1" $2
fi

hg push $foreign
echo "updating $foreign"
cd $foreign
hg up
cd $sandbox


