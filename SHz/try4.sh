#!/bin/ksh

echo "###########################"
echo "## Reading from regular INI file. Way 2Ext"
echo "###########################"

FILENAME="MVP03.txt"

source <(grep = <(grep -A2 '\[SUPERPROJECT100500\]' $FILENAME))
echo $FIRST_DATE
echo $SECOND_DATE

source <(grep = <(grep -A2 '\[SUPERPROJECT666\]' $FILENAME))
echo $FIRST_DATE
echo $SECOND_DATE

# Write?
# Regex: 
# Find: Start+Optional Whatever+Section+Optional Whatever+Variable+=+OLD_VALUE+Whatever+End
# and replace to: