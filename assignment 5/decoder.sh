#!/bin/bash

# Author Jeffery Russell 11-22-19
#
# Decodes a message using a file which
# simply specifies subsitutions to make
#
# Usage: <encoded_file> <secret_key_file> <plane_text_out_file>

function decode_message
{
    declare -A MYMAP

    while read line || [ -n "$line" ];
    do
        arr=($line)
        MYMAP[${arr[1]}]=${arr[0]}
    done < "$2"

    #for K in "${!MYMAP[@]}"; do echo $K; done

    # make sure file exists and is empty
    > $3

    while read line || [ -n "$line" ];
    do
        for word in $line
        do
            printf "%s" ${MYMAP[${word}]} | tr -d , >> $3
            printf ' ' >> $3
        done
        echo "" >> $3
    done < "$1"

    echo "Done decoding message."
}


if [ $# -eq 3 ];
then
    if [ -f $1 ]
    then
        if [ -f $2 ]
        then
            decode_message $1 $2 $3
        else
            echo "File $2 does not exist"
        fi
    else
        echo "File $1 does not exist"
    fi
else
    echo "Usage:"
    echo "     ecoder.sh <encoded_file> <secret_key_file> <plane_text_out_file>"
fi