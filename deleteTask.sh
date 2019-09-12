#!/bin/bash
iDs=()
result=""
while : 
    do
    fileLenght=$(wc -l < task.csv)
        for i in {0..$fileLenght}
        do
            line=$(awk -F ";" '{print $1}' task.csv)
            iDs+=($line)
    done
    awk -F ";" '{print "Id:",$1,"Title :",$2,"Desc. :",$3, "Due date: ",$4}' task.csv
    echo "Enter the id of the task:"
    read taskId
    for j in "${iDs[@]}"
        do
        result="ID not found"
            if [ $j -eq $taskId ]
            then
                remove="$taskId"
                sed -i "/^$remove;/d" task.csv
                result="Removed"
                break
            fi
        done
    echo "$result"
    break
done
