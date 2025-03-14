#!/bin/bash

USERID=$(id -u)


if [ $USER -ne 0 ]
then
    echo "You must have sudo access to execute this script"
    exit 1 # other than 0
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL... FAILURE"
        exit 1
    else
        echo "Installing MySQL ... SUCCESS"
    fi
else
echo "MySQL is already ... installed"

fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing Git... FAILURE"
        exit 1
    else
        echo "Installing Git ... SUCCESS"
    fi
else
echo "Git is already ... installed"

