#!/bin/bash
date=""
currentDay=$(($(date '+%u')+0))
num=0
while [ $currentDay -le 7 ]
do
    date="$date"$(date '+%Y-%m-%d,' --date="$num+ days")""
    currentDay=$(($currentDay+1))
    num=$(($num+1))
done
date=${date:0:${#date}-1}
result=$(awk -v dates=$date -F ";" -f week.awk task.csv)
if [[ ! result ]];then
    echo "No tasks"
else
    echo "$result"
fi