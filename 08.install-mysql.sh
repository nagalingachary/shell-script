#!/bin/bash 
USERID=$(id -u)
if [$USERID -ne 0]
then    
    echo "ERROR::please run this script with root access"
else
    echo "INFO:you are root user"
fiyum install mysql -y