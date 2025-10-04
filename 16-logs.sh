#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo  "ERROR:: Please run this script with root previllages"
    exit 1
fi

LOGS_DIR="/var/log/shell-script"
SCRIPT_NAME=$(echo  $0 | cut -d "." -f1)
LOG_FILE="$LOGS_DIR/$SCRIPT_NAME.log"

mkdir -p $LOGS_DIR
echo "Script started executed at: $(date)"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e  "ERROR:: installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo "installing $2 ... $G SUCCESS $N"
    fi 
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y  &>>$LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e "mysql is already exist ... $Y SKIPPING $N"
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y  &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx is already exist ... $Y SKIPPING $N"
fi

dnf list installed python3  &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y  &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 is already exist ... $Y SKIPPING $N"
fi