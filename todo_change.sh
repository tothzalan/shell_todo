#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Wrong number of args!"
    echo "SYNOPSIS: ./todo_change.sh todo_file"
else
    INDEX=1
    while read line
    do
        echo "$INDEX: $line"
        INDEX=$((INDEX+1))
    done < $1

    echo -n "Which line to change? "
    read n
    sed -i "${n}s/\[.]/[✓]/" $1
fi
