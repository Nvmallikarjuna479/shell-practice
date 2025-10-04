#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root previllages"
    exit 1
fi 

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installing mysql is failed"
    exit 1
else
   echo "installing mysql is successful"
fi 
