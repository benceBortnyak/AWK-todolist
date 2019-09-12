#!/bin/bash
chmod 755 *.sh
chmod 755 *.awk

clear
while true; do
    echo " Enter:
        1. task adding
        2. task deletion by order number
        3. list the today's task
        4. list the tasks for tomorrow
        5. list the tasks for the week"
    read input
    echo "option $input"

    if [ $input == 1 ]; then
        clear
        ./addTask.sh

    elif [ $input == 2 ]; then
        clear
        ./deleteTask.sh

    elif [ $input == 3 ]; then

        today=$(awk -v date="$(date +"%Y-%m-%d")" -F ";" -f todayTask.awk task.csv)
        if [[ ! $daily ]]; then
            echo "No tasks for today Hurray!"
        else
            echo "$daily"
        fi
    elif [ $input == 4 ]; then

        tomorrow=$(awk -v date="$(date '+%Y-%m-%d' --date="next day")" -F ";" -f tomorrowTask.awk task.csv)
        if [[ ! $tomorrow ]]; then
            echo "No tasks for tomorrow"
        else
            echo "$tomorrow"
        fi
    elif [ $input == 5 ]; then
        clear
        ./weekTask.sh
    else
        echo 'No such an option'
    fi

done
