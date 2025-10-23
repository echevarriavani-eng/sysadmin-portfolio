# Lab 2: File Permissions and Ownership
**Author:** Stevanie Echevarria
**Date:** October 17, 2025
**Course:** SysAdmin Labs Portfolio
**System:** Ubuntu (VirtualBox VM)


---

## Objective
The goal of this lab was to learn how to view, modify, and manage Linux file permissions and ownership using commands like chmod, chown, and chgrp.
I also learned how interpret the system's default umask value.


---

## Commands Used

| Command | Purpose |
|-----------|---------|
| touch file1.txt file2.txt file3.txt | Create empty files|
| ls -l | List files with detailed permissions |
| chmod 755 file1.txt | Give fill permissions to owner, read/execute to group & others |
| chmod g+w file2.txt | Add write access for the group |
|sudo chown root file3.txt | Change ownership to the root |
| umask | View system's default permission mask |


---


## Results

The following permissions were applied successfully:
file1.txt ---> rwxr-xr-x
file2.txt ---> rw-rw-r--
file3.txt ---> rw-r--r--

Default umask: 0002
This means files are created as rw-rw-r-- and directories as rwxrwxr-x


---


## Reflection

This lab helped me understand how file permissions, ownership, and umask values affect access control in Linux.
I gained hands-on experience with critical commands I'll use daily as a sysAdmin.


---


## Observed Output 

| File | Permission Summary | Description |
|------|--------------------|---------------|
| `file1.txt` | `-rw-r--r--` | Standard user file owned by arys |
| `file2.txt` | `-rw-rw-r--` | Group-writable file |
| `shared_dir` | `drwxrwxrwt` | Sticky bit enabled shared directory |

**Result:** Permissions successfully applied and verified via `ls -l` output.
