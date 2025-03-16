#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$FILE_NAME-$TIMESTAMP.log"




VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo  -e "$2... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

echo "Script Started Executing at : $TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
    echo "You must have sudo access to execute this script"
    exit 1 # other than 0
fi
dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySQL"
    
else
echo -e "MySQL is already ... $Y installed $N"

fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
echo -e "Git is already ... $Y installed $N"

fi

