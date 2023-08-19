#!/bin/bash
USERID=$(id -u)

VALIDATE(){
    if [$1 -ne 0]
then
    echo "$2 is failure"
    exit 1
else
    echo "$2 is Success"
fi
}
if [$USERID -ne 0]
then
    echo "ERROR::please run with root access"
else
    echo "you are the root user"
fi

yum install mysql -y
VALIDATE $? "Installing MYSQL"
yum install postfix -y
VALIDATE $? "Installing postfix"