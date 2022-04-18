
#! /bin/bash

if [ "$1" == "-r" ] 
then
  arg=tac
  shift 1
else
  arg=cat
fi

if [ "$1" == "--" ]
then
  shift
fi

echo $#

for i 
do
  echo $i
done | $arg
