#!/bin/bash

echo "=========================================================================="

echo "         SERVER HEALTH REPORT                                "

echo "=========================================================================="

echo "Date    :$(date)"
echo "Hostname:$(hostname) "
echo "OS      :$( cat /etc/os-release | grep PRETTY_NAME)"
echo "Kernal  :$(uname -r)"
echo "uptime  :$(uptime -p)"

echo "=========================================================================="


Disk_usage=$(df -h |awk 'NR==2 {print$5}')
echo "Disk usage :$Disk_usage"

echo "==========================================================================="

Diskvalue=${Disk_usage%\%}

if [ $Diskvalue -gt 80 ] 
then
   echo "Warning!!!!! Disk usage is High"
else 
    echo "Disk usage is sufficient"
fi

echo "============================================================================"

Memory_usage=$(free -m | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
echo "Memory usage: $Memory_usage%"

if [ $Memory_usage -gt 80 ]
then
echo "Warrning!!!!!!!! RAM is running low"
else 
echo "RAM is sufficient"
fi
echo "============================================================================="
echo " Top CPU processes"
echo "============================================================================="

ps aux --sort=-%cpu |head

echo "============================================================================="
echo "Top Memory processes"
echo "=============================================================================" 

ps aux --sort=-%mem |head

echo "=============================================================================="
 
echo "Service status"

echo "=============================================================================="

Service_status=$(systemctl check sshd)

if [ $Service_status = "active" ]
then 
echo "SSH service :Running"	
else 
echo "SSH service :Not Running"
fi


