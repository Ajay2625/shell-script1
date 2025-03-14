#!/bin/bash

NUMBER=$1

if [ $NUMBER -ge 100 ] 
then 
    echo "$NUMBER is greater than 100"
else
    echo "$NUMBER is less than 100"