#!/bin/ksh

echo "###########################"
echo "## Reading from regular INI file. Way 1"
echo "###########################"

FILENAME="MVP02.txt"

VAR_FIRST_DATE=$(awk -F "=" '/FIRST_DATE/ {print $2}' $FILENAME)
echo $VAR_FIRST_DATE

VAR_SECOND_DATE=$(awk -F "=" '/SECOND_DATE/ {print $2}' $FILENAME)
echo $VAR_SECOND_DATE

echo "###########################"
echo "## Reading from regular INI file. Way 2"
echo "###########################"

source <(grep = $FILENAME)
echo $FIRST_DATE
echo $SECOND_DATE
