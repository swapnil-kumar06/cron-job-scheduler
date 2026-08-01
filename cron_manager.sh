#!/bin/bash

# ==========================================
# Cron Job Scheduler and Manager
# Author : Swapnil
# ==========================================

while true
do
clear

echo "=========================================="
echo "      CRON JOB SCHEDULER & MANAGER"
echo "=========================================="
echo "Welcome!"
echo "Manage your cron jobs easily."
echo "=========================================="
echo "1. Add Cron Job"
echo "2. View Cron Jobs"
echo "3. Delete Cron Job"
echo "4. Search Cron Job"
echo "5. Backup Cron Jobs"
echo "6. Restore Cron Jobs"
echo "7. Remove All Cron Jobs"
echo "8. Exit"
echo "=========================================="

read -p "Enter your choice: " choice

case $choice in

# ------------------------------------------
# Add Cron Job
# ------------------------------------------
1)
    echo
    echo "Enter Cron Schedule"

    read -p "Minute (0-59 or *): " min
    read -p "Hour (0-23 or *): " hr
    read -p "Day of Month (1-31 or *): " dom
    read -p "Month (1-12 or *): " mon
    read -p "Day of Week (0-6 or *): " dow
    read -p "Command to Execute: " cmd

    (crontab -l 2>/dev/null
    echo "$min $hr $dom $mon $dow $cmd") | crontab -

    echo
    echo "Cron Job Added Successfully."
    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# View Cron Jobs
# ------------------------------------------
2)
    echo
    echo "Current Cron Jobs"
    echo "-------------------------"

    if crontab -l >/dev/null 2>&1
    then
        crontab -l
    else
        echo "No Cron Jobs Found."
    fi

    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# Delete Cron Job
# ------------------------------------------
3)

    if ! crontab -l >/dev/null 2>&1
    then
        echo
        echo "No Cron Jobs Available."
        read -p "Press Enter to continue..."
        continue
    fi

    echo
    echo "Current Cron Jobs"
    crontab -l | nl

    echo
    read -p "Enter Line Number to Delete: " line

    crontab -l | sed "${line}d" | crontab -

    echo
    echo "Cron Job Deleted Successfully."

    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# Search Cron Job
# ------------------------------------------
4)

    if ! crontab -l >/dev/null 2>&1
    then
        echo
        echo "No Cron Jobs Found."
        read -p "Press Enter to continue..."
        continue
    fi

    echo
    read -p "Enter Keyword to Search: " key

    echo
    result=$(crontab -l | grep "$key")

    if [ -z "$result" ]
    then
        echo "No Matching Cron Job Found."
    else
        echo "$result"
    fi

    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# Backup Cron Jobs
# ------------------------------------------
5)

    mkdir -p backup

    if crontab -l >/dev/null 2>&1
    then
        crontab -l > backup/cron_backup.txt
        echo
        echo "Backup Saved Successfully."
        echo "Location : backup/cron_backup.txt"
    else
        echo
        echo "No Cron Jobs Available to Backup."
    fi

    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# Restore Backup
# ------------------------------------------
6)

    if [ -f backup/cron_backup.txt ]
    then
        crontab backup/cron_backup.txt
        echo
        echo "Backup Restored Successfully."
    else
        echo
        echo "Backup File Not Found."
    fi

    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# Remove All Cron Jobs
# ------------------------------------------
7)

    read -p "Are you sure you want to remove all cron jobs? (y/n): " ans

    if [ "$ans" = "y" ] || [ "$ans" = "Y" ]
    then
        crontab -r
        echo
        echo "All Cron Jobs Removed."
    else
        echo
        echo "Operation Cancelled."
    fi

    read -p "Press Enter to continue..."
;;

# ------------------------------------------
# Exit
# ------------------------------------------
8)

    echo
    echo "Thank You for Using Cron Job Scheduler & Manager."
    exit
;;

# ------------------------------------------
# Invalid Choice
# ------------------------------------------
*)

    echo
    echo "Invalid Choice."
    read -p "Press Enter to continue..."
;;

esac

done