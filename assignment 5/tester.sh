#!/bin/bash

TEMP_FILE="out.txt"
TEMP_BACK="out2.txt"

if [ $# -eq 2 ]
then
    if [ -f $1 ]
    then
        if [ -f $2 ]
        then
            echo "------- KEY ----------"
            cat $2
            echo ""
            echo ''
            echo "---- Plane Text-------"
            cat $1
            echo ""
            echo ''
            ./encoder.sh $1 $2 $TEMP_FILE
            echo "--- Encoded Text -----"
            cat $TEMP_FILE

            ./decoder.sh $TEMP_FILE $2 $TEMP_BACK
            echo ""
            echo "--- Decoded Back ----"
            cat $TEMP_BACK
            echo ""

            diff -w $1 $TEMP_BACK

            if [ $? -eq 0 ]
            then
                echo "Program works!!!!"
            else
                echo "Program done did broke up now."
            fi
        else
            echo "File $2 does not exist"
        fi
    else
        echo "File $1 does not exist"
    fi
else
    echo "Usage:"
    echo "    tester.sh <plane_text_file> <secret_key_file>"
fi