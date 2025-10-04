#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root previllages"
fi 

dnf install mysql -y

if [ $? -eg 0 ]; then
    echo "installing mysql is successful"
else
   echo "ERROR:: installing mysql is failed"
fi 
