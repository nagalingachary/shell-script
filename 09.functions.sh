#!/bin/bash

DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
then
    echo -e "$2 is $R failure $N"
    exit 1
else
    echo -e "$2 is $G Success $N"
fi
}
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR::please run with root access"
else
    echo "you are the root user"
fi

yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MYSQL"
yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"