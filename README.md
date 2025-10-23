<<<<<<< HEAD
# Upgrading Ubuntu Server to Version 22.04 (Jammy Jellyfish)
**Created by:** Stevanie Echevarria
**Date:** October 22, 2025 – 21:18:07
**System:**  Ubuntu 22.04.5 LTS

---

## Objective
Perform a full upgrade of Ubuntu Server from **20.04 LTS (Focal Fossa)**, confirm new kernal installation, clean the environment, and verify a successful boot.

## Commands Used
```bash
# Verify current version
lsb_release -a

# Udate and upgrade all packages
sudo apt update && sudo apt upgrade -y
sudo apt dist-upgrade -y

# Clean up unused packages
sudo apt autoremove -y
sudo apt clean

# Verify kernel and OS version
uname -r
lsb_release -a

#Reboot to load the new kernel
sudo reboot


```
## Summary

- Removed obsolete and deprecated packages

- Cleaned local apt cache

- Verified updated repositories and package list

- System rebooted successfully and running on new kernel


## Notes

- The os-prober warning is expected for Ubuntu 22.04 and doesn't affect boot functionality unless dual-booting

 
## Technical Takeaways

- I learned how distribution upgrades replace old kernels, rebuild GRUB configurations, and handle, dependency updates automatically.

- I understand the difference between apt upgrade, apt dist-upgrade, and do-release-upgrade -- each serving a different purpose in maintaining and transitioning system packages.

- I bacame more comfortable reading terminal feedback and identifying unexpected warnings versus critical errors.

- Mananging updates via CLI taught me how to critical package integrity and kernal verification are for maintaining uptime.

## Troubleshooting Lessons

- Encountering path errors (caused by parenthesese in folder names) helped me pratice debugging issues in Bash and reinforced why naming conventions matter in scripting.

- I learned to use wildcards (*Jammy*) and escape characters to safely navigate paths in Linux - a small but essential SysAdmin skill.

- I saw firsthand how small syntax details (spaces, quotes, parenthesese) canbreak automation scripts, which pushed me to improve my shell scripting habits.

## Reflection

- This lab reinforced my confidence in working directly inside the terminal and trusting my process, even when small frustrations appeared.

- I recognized that true systemswork is about methodical problem-solving, not rushing to solutions.

- Each issue i solved - from permissionsto folder naming - strenthened my resolve for automation, precision, patience, which are key in bot system administration and scripting.

- Overall I have grow a passion for treating the terminal as a workspace oc control - where i build, fix, and refine systems.


## Status

Completed Successfully!

