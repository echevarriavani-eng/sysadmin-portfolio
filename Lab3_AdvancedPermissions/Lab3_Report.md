# Lab 3: Advanced file Permissions
**Author:** Stevanie Echevarria
**Date:** October 17, 2025
** Course:** SysAdmin Labs Portfolio
**System:** Ubuntu (VirtualBox VM)

---

## Objective
The goal of this lab was to understand and apply advance Linux file permissions, including symbolic and numeric modes, and special permissions like the  **sticky bit**.


---

## Commands Used

| Command | Description |
|----------|--------------|
| `chmod 740 fileA.txt` | Gives owner full ( rwx ) access, group read, others none |
| `chmod g+w fileB.txt` | Adds write permissions to group |
| `chmod o-r fileB.txt` | Removes read permision from others |
| `chmod 1777 shared_dir` | Adds the **sticky bit** so only file owners can delect their owner files |
| ls -l | List file permissions and ownershipto verify changes |


---


## Results

After applying permissions, the results were as follows:

| -rwxr---fileA.txt |
| -rw-rw-- fileB.txt |
rwxrwxrwt shared_dir

The final "t" in ` shared_dir 'confirms that the stcky bit is enabled.


---


## Reflection
This lab help me understand how to control file access using both symbolic and numeric modes.
I also learned that the ** sticky bit ** protects shared directories by restricting deletions to the file owner.
These skills are essential for managing secure multi-user environments as a Systems Administrator.


---

**Status:** Completed and synced to GitHub. 
