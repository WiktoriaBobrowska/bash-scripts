#!/bin/bash

if [ $# -eq 0 ];
then
echo "Number is missing."
exit 1
else
n=$1
fi

if [ $n -lt 10 ];
then
echo "It is a one digit number"
else
echo "It is a two digit number"
fi
