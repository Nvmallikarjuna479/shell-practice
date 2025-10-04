#!/bin/bash

echo "Please enter the number:"
read -s NUMBER

#REMINDER=$(($NUMBER % 2))

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given Number $NUMBER is even"
else
    echo "Given Number $NUMBER is odd"
fi