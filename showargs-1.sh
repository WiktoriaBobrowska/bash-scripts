#!/bin/bash

arg=false

if [ "$1" == "-r" ]
then
   arg=true
   shift
fi

t=( $* )

echo $#

for((i=0;i<$#;i++))
do
   if $arg
   then
      echo ${t[$#-i-1]} 
   else
      echo ${t[i]} 
   fi
done
