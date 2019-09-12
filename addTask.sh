#!/bin/bash
while :
    do
        echo "Task title: "
        read taskTitle 
        echo "Task desc."
        read description
        echo "Due date":
        echo "Year:"
        read year
        echo "Month:"
        read month
        echo "Day:"
        read day
        date="$year-$month-$day"
        date -d "$date" >/dev/null
        valid=$?
        if [[ $valid -eq 0 ]]
        then
            lastId=$(awk -F ";" 'END{print $1}' task.csv)
            lastId=$((lastId+1))
            echo -e "$lastId;$taskTitle;$description;$date" | tee -a task.csv > /dev/null
            break
        else
            echo "Invalid date"
        fi
    done 