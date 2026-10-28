#!/bin/bash

#line counter in files

#line_numbers=$(cat $1 | wc -l)

ln1=`cat $1 | wc -l`
ln2=`cat $2 | wc -l`

echo "Number of lines in file $1 is $ln1, and in file $2 is $ln2 "
echo "This script is using $# files named $@"



