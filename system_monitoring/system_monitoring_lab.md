# Lab 5: System Monitoring & Automation Script
**Author:** Stevanie Echevarria
**Date:** October 20, 2025
**Course:** SysAdmin Labs Portfolio
** System:** Ubuntu (VirtualBox VM)

---

## Objective 
Demonstrate automation of real-time system monitoring using a Bash script that reports uptime, resource usage, and process activity.\


---

## Commands Used

| Commands | Description |
|------------|-------------|
| `chmod +x system_health.sh` | Makes the script executable | 
| `./system_health.sh` | Runs the monitoring script |
| `tee system_report.txt` | Save the output while displaying it |
| `ps -eo pid,comm,%cpu.%mem` | Lists active processes |
| `df -h ` | Displays disk usage |
| `free -h` | displays memory usage |
| `uptime` |Shows load average |


---

## Script Overview
```bash
#!/bin/bash
# System Health Monitoring Script
# Displays uptime, CPU load, memory, disk, users, and top processes.

## Observed Output 

=============================================
    SYSTEM HEALTH CHECK REPORT
=============================================

Hostname      : thelaughingman-VirtualBox
Uptime        : up 3 hours, 12 minutes

CPU Load (1,5,15 min): 0.45, 0.38, 0.29
Memory Usage  : Used: 2.3G / Total: 3.8G (60.52%)
Disk Usage    : Used: 18G / Total: 50G (36% used)

Active Users  :
arys   tty2   Oct 20 00:12

Top 5 Processes by CPU & Memory:
PID     COMMAND    %CPU   %MEM
1032    firefox    11.3   4.0
1014    gnome-shell 5.1   2.1

===================================================
Report generated on: Sun Oct 20 01:10:02 PST 2025
===================================================


## Interpretation

The system health check confirms stable resource utilization:

- CPU load averages remain low, indicating healthy performance.
- Memory and disk usage are within optimal limits.
- No abnormal user or process activity detected.

## Troubleshooting and Lessons Learned

**Issue:** Initial permission denied when executing the script.
**Root Cause:** Fortgot to make script executable.
**Resolution:** Applied chmod +x to grant execution rights.

**Lesson Learned:** Always verify the file permissions before execution in automation workflows.

---


## Summary

This lab successfully demonstrates how to: 

- Automate system monitoring with Bash

- Combine multiple Linux commands into a single workflow

- Produce readable reports for system health tracking   
