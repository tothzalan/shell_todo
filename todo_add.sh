#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Wrong number of args!"
    echo "SYNOPSIS: ./todo_add.sh todo_file"
else
    echo -n "Add item: "
    read LINE
    echo "[ ] $LINE" >> $1
fi
