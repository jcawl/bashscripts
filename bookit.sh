#! /bin/bash

# get date
tommorow=$(date +%Y-%m-%d --date 'next day')
tommorowAbv=$(date +%a --date 'next day')
dayName=$(date +%A --date 'next day')

# organize schedule with weekly directories
weeklyDir=`date -dlast-monday +%Y-%m-%d`

#check if directory has been made
if [ ! -d ~/schedule ]
then
    mkdir ~/schedule
fi

if [ ! -d ~/schedule/$weeklyDir ]
then
    mkdir ~/schedule/$weeklyDir
fi

# create file
if [ ! -f ~/schedule/$weeklyDir/$tommorowAbv ]; then
    touch ~/schedule/$weeklyDir/$tommorowAbv

    #header
    echo -e "My Schedule - $dayName\n----------------------" >> ~/schedule/$weeklyDir/$tommorowAbv
fi

# prompt
read -p "Task: " task
read -p "Start Time (7:15AM): " sTime
read -p "End Time (9:30AM): " eTime
read -p "Set Notification (y/n): " noti

#prompt logic
if [ $noti = "y" ]; then
    echo 'notify-send '$task'' | at $sTime $tommorowAbv
fi

#write to file
echo -e "$sTime-$eTime: $task" >> ~/schedule/$weeklyDir/$tommorowAbv
