#!/bin/sh

read_in() {
    printf "\e[1;32mDone items:\e[0m\n"
    while read x
    do
        check_done "$x"
        if [ $? -eq "1" ]; then
            echo $x
        fi 
    done < $1

    printf "\e[1;31mItems to do:\e[0m\n"
    while read x
    do
        check_done "$x"
        if [ $? -eq "0" ]; then
            echo $x
        fi 
    done < $1
}

check_done () {
    case "$1" in
        *[✓]*)
        return "1"
    esac
    return "0"
}

if [ $# -ne 1 ]; then
    echo "Wrong number of args!"
    echo "SYNOPSIS: ./todo_print.sh todo_file"
else
    read_in $1
fi
