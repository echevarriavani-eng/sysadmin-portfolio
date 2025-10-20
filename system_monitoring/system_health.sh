#!/bin/bash
#=================================================
# System Health Monitoring Script
# Author: Stevanie Echevarria
# Date: October 20,2025
#=================================================


echo "=================================================="
echo "   SYSTEM HEALTH CHECK REPORT"
echo "=================================================="
echo ""

# Hostname and uptime
echo "Hostname      : $(hostname)"
echo "Uptime        : $(uptime -p)"
echo ""

# CPU load averages
echo "CPU Load (1,5,15 min): $(uptime | awk -F'load average: ' '{ print $2}')
echo ""

# Memory usage
echo "Memory Usage  :"
free -h | awk '/^Mem/ {print " Used: "$3" / Total: "$2}'
echo ""

# Disk usage
echo "Disk Usage   :"
df -h --total |awk 'total/ {print " Used: "$3" / Total "$2" ("$5" used)"}'
echo ""

# Logged in users
echo "Active Users :"
who
echo ""
# Top 5 CPU + Memory processes
echo "Top 5 Processes by CPU & Memory:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -6
echo ""

echo "============================================
echo "Report generated on : $(date)"
echo "============================================
