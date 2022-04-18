#! /bin/bash

if [ "$1" == "-b" ]
then
  shift
  echo "==${1-p1}=="
  echo "==${2-p2}=="
  echo "==${3-p3}=="
else
  echo "==${1:-p1}=="
  echo "==${2:-p2}=="
  echo "==${3:-p3}=="
fi
