# Lab 1: Users, Groups, and ACL Permissions
** Author:** Stevanie Echevarria
**Date:** October 17, 2025
**Course** SysAdmin Labs Portfolio
**System:** Ubuntu (VirtualBox VM)


--

## Objective
The goal of this lab was to learn how to create amnd manange Linux users, groups, and file permissions.
I practiced user creation, group assignments, and managing file access control lists (ACLs) for better security.

--
## Commands Used

| Command | Purpose |
|----------|----------|
| 'sudo adduser username' | Create a new user |
| 'sudo groupadd groupname' | Create a new group|
| 'sudo usermod -aG groupname username' | Add user to group |
| 'getfacl filename' | View file ACL permissions |
| 'setfacl -m u:username:rwx filename' | Assign custom ACL permissions |
| `chmod` / `chown` | Modify traditional file permissions |

## Process Summary
1. Created a new user and confirmed their home directory.
2. Created multiple groupsand assigned users to each group.
3. Practiced switching users using `su` and verified group membership with `groups`
4. Created and shared file and applied ACL permissions to control access.
5. Verified Acl functionality by testing read/write access for each user.


## Key Takeaways
- ACLs allow more granular permission control than standard Unix permissions.
- Group and user management is essentialfor securing a multi-user enviorment.
- Proper permission assignment preventsunathorized data access.

---

## Reflection
This lab helped me understand how Linux handles user management and access control.
It also gave me hands-on practice with commands I'll use regularly as a SysAdmin.


---

**Status:** Completedand synce to GitHub. 
