#!/usr/bin/awk -f
BEGIN{
    print "Tasks for today: ",date
    print"----------------------------"
}{
    
    
    if(date == $4){
        print "Title: ",$2,"| Desc.: ",$3,"| Due. Date: ",$4," |"
    }
}