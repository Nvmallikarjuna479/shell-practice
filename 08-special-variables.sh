#!/bin/bash

echo "all variables passed to the script: $@"
echo "all variables passed to the script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID of this script execution: $$"
sleep 50 &
echo "PID of last excution command in background is : $!"
