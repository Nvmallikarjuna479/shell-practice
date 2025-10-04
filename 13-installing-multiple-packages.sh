#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root previllages"
    exit 1
fi 
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: installing $2 is failed"
        exit 1
    else
        echo "installing $2 is successful"
    fi 
}
dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"