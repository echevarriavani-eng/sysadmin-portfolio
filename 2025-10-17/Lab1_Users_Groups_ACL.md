# Lab 1: Users, Groups, & Permissions
**Date:** Oct 17, 2025
**Objective:** Practice user management, group management, and ACLs on Ubuntu.
## Commands Used
id bob
sudo groupadd finance
sudo groupadd devops
sudo usermod -aG finance,devops, alice
sudo mkdir /srv/shared
sudo chown root:finance /srv/shared
sudo chmod 770 /srv/shared
sudo apt install acl -y
sudo setfacl -m g:finance:rwx /srv/shared
sudo setfacl -m g:devops:rx /srv/shared
getfacl /srv/shared

## Results
- ALice belongs to finance and devops
- Finance groups has full access.
- DevOpshave read and execute access.


