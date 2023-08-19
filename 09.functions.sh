#!/bin/bash
USERID=$(id -u)

VALIDATE(){
    if [$1 -ne 0]
then
    echo "Installation is failure"
    exit 1
else
    echo "Installation is Success"
fi
}
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