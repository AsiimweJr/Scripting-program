#!/bin/bash

# ,,,,,,,Description,,,,,
# ''''''''How code works'''
# ****BODY***

read -p "Enter your name: " name
read -sp "Enter your age: " age
echo  # Adds a newline after the hidden age input

if [ "$age" -lt 35 ]; then
    if [ "$age" -lt 18 ]; then
        echo "$name is a child"
    else
        echo "$name is a youth"
    fi
else
    echo "$name is a adult"
fi

