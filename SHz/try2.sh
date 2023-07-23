#!/bin/ksh

echo "##################################"
echo "## WAY 1"
echo "##################################"

VAR_FILE_NAME="MVP01.TXT"

set -x

echo $'\n'Try date format. First Day, month before last month
VAR_START_DATE=$(date +"%m/%d/%Y" -d "-2 month -$(($(date +%d)-1)) days")
echo "$VAR_START_DATE"

echo $'\n'Try date format. Last Day, month before last month
VAR_END_DATE=$(date +"%m/%d/%Y" -d "-$(date +%d) days -1 month")
echo "$VAR_END_DATE"

set +x

echo $'\n'Write variable to file
echo "$VAR_END_DATE" > $VAR_FILE_NAME
echo ...Done

echo $'\n'Read variable from file
VAR_RESULT=$(cat $VAR_FILE_NAME)
echo "$VAR_RESULT"

