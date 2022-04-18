#!/bin/bash

echo "appending file=/ect/os-release"

echo "Before appending the file"
cat /etc/os-release

echo "Learning Level 5">> /etc/os-release
echo "After appending the file"
cat /etc/os-release






