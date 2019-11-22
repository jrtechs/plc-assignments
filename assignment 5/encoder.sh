#!/bin/bash

#Author Jeffery Russell 11-22-19

function encode_message
{
    declare -A MYMAP

    while IFS= read -r line
    do
        arr=($line)
        MYMAP[${arr[0]}]=${arr[1]}
    done < "$2"


    # make sure file exists and is empty
    > $3

    while IFS= read -r line
    do
        for word in $line
        do
            printf "%s" ${MYMAP[${word},]} >> $3
            printf ' ' >> $3
        done
        echo "" >> $3
    done < "$1"

    echo "Done encoding message."
}


if [ $# -eq 3 ];
then
    if [ -f $1 ]
    then
        if [ -f $2 ]
        then
            encode_message $1 $2 $3
        else
            echo "File $2 does not exist"
        fi
    else
        echo "File $1 does not exist"
    fi
else
    echo "Usage:"
    echo "     encoder.sh <plane_text_file> <secret_key_file> <encoded_file>"
fi