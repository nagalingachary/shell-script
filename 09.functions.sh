#!/bin/bash
USERID=$(id -u)

if [$USERID -ne 0]
then
    echo "ERROR::please run with root access"
else
    echo "you are the root user"
fi
yum install mysql -y
VALIDATE $?
yum install postfix -y
VALIDATE $?