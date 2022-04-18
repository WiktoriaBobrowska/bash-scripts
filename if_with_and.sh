#!/bin/bash

if [ $# -eq 0 ];
then
username="admin"
password="secret"
else
username=$1
password=$2
fi

echo "username : $username"
echo "password : $password"

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
echo "valid user and password"
else
echo "invalid user or password"
fi
