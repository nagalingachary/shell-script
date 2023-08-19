#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::please run this script with root access $N"
    exit 1
else
    echo "You are the root user"
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Installing $2........$R FAILURE $N"
        exit 1
    else
        echo "Installing $2........$G SUCCESS $N"
    fi
}

for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed,Lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo "$Y $i is already installed $N"
    fi
done

