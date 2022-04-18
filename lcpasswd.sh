#!/bin/bash


#file=$(cat $1)


#echo $file | awk -F: 'print $1' | tr [A-Z] [a-z]  


#echo $file | awk -F: 'print tolower($1)":"$2":"$3":"$4":"$5":"$6'

awk -F: '{print tolower($1)":"$2":"$3":"$4":"$5":"$6":"$7}' $1

