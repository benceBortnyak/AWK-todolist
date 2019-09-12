#!/usr/bin/awk -f
BEGIN{
    print "Task for this week after ",today
    dateReam=dates

    len=split(dateReam,checkDates,",")
    

}{
    for (i = 1; i <=len ; ++i)
        if(checkDates[i] == $4){
            print "Title: ",$2,"| Desc.: ",$3,"| Due. Date: ",$4," |"
    }
    

}