#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::please run this script with root access"
    exit 1
else
    echo "You are the root user"
fi

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo "Installing $2........ FAILURE"
    else
        echo "Installing $2........ SUCCESS"
    fi
}

for i in $@
do 
    yum list installed $i
    if [ $? -ne 0 ]
    then
        echo "$i is not installed,Lets install it"
        yum install $i -y
        VALIDATE $? "$i"
    else
        echo "$i is already installed"
    fi
done

