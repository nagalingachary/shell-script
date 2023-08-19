#!/bin/bash

DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

VALIDATE() {
    if [ $1 -ne 0 ]
then
    echo "$2 is failure"
    exit 1
else
    echo "$2 is Success"
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