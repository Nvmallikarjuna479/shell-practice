#!/bin/bash

echo "Please enter the number:"
read NUMBER

REMINDER=$(($NUMBER % 2))

if [ $REMINER -eq 0 ]; then
    echo "Given Number $NUMBER is even"
else
    echo "Given Number $NUMBER is odd"
fi