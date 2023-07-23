#!/bin/ksh

echo $'\n'First day of month
date -d "-0 month -$(($(date +%d)-1)) days"

echo $'\n'Proof: no 29/Feb/2021
date -d 'Oct 14 2020 + 4 months + 2 weeks + 1 day'

#echo $'\n'Sample No 1
#date -d 'now - 4 months'

#echo $'\n'Sample No 2
#date -d 'now + 4 months + 2 weeks'

echo $'\n'First Day, last month
date -d "-1 month -$(($(date +%d)-1)) days"

echo $'\n'Last Day, current month
date -d "-$(date +%d) days +1 month"

echo $'\n'Last Day, last month
date -d "-$(date +%d) days -0 month"

echo $'\n'Last Day, month before last month
date -d "-$(date +%d) days -1 month"

echo $'\n'Try date format. First day of current month
date +"%m/%d/%Y" -d "-0 month -$(($(date +%d)-1)) days"

echo $'\n'Try date format. First Day, month before last month
date +"%m/%d/%Y" -d "-2 month -$(($(date +%d)-1)) days"

echo $'\n'Try date format. Last Day, month before last month
date +"%m/%d/%Y" -d "-$(date +%d) days -1 month"
