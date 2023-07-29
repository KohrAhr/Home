#!/bin/bash
ansible-lint $1
VAR_RESULT=$?
if [ $VAR_RESULT == 2 ]
then
    exit 0
else
    exit $VAR_RESULT
fi
