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
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e  "ERROR:: installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "installing $2 ... $G SUCCESS $N"
    fi 
}

for PACKAGE in $@
do
    dnf list installed $PACKAGE &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $PACKAGE -y  &>>$LOG_FILE
        VALIDATE $? "$PACKAGE"
    else
        echo -e "$PACKAGE is already exist ... $Y SKIPPING $N"
    fi
done