#!/bin/bash

n=$1
echo "number=$1"

if [[ ( $n -eq 15 || $n -eq 45 ) ]]
then
echo "You won the game"
else
echo "You lost the game"
fi
