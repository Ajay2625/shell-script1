#!/bin/bash

USER=$(id -u)

dnf list installed | grep mysqld

if [ $USER -ne 0 ]
then
    echo "You must be root user to execute this command"
else
    if [ $? -ne 0 ]
    then 
        dnf install mysql-server
    else
        echo "mysql is already installed"
    fi
fi