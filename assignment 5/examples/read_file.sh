#!/bin/bash
while IFS= read -r line
do
  echo "$line" > out.txt
  echo "$line" >> out2.txt
done < "$1"