# Lab: Enable VirtualBox Guest Additions (Clipboard & Drag-and-Drop)

**Author:** Stevanie Echevarria
**Date:** <!-- replace with today’s date -->
**System:** Ubuntu (VirtualBox VM)
**Category:** SysAdmin Labs – VM Integration

---

## Objective
Enable and verify VirtualBox Guest Additions features (bidirectional clipboard, drag-and-drop, display integration) on an Ubuntu VM. Document the working process, verification, and troubleshooting.

---

## Environment
- **Host:** Windows (VirtualBox 7.x)
- **Guest:** Ubuntu 20.04/22.04 (kernel 5.15.x)
- **VM:** “Ubuntu-server”
- **Tools:** `apt`, `systemctl`, `lsmod`, `rcvboxadd`, VirtualBox menus

---

## Summary of What Was Done
1. Enabled **Shared Clipboard** and **Drag and Drop** (Devices → *Bidirectional*).
2. Inserted the **Guest Additions CD image** and installed required packages.
3. Mounted the CD (when auto-mount didn’t appear).
4. Installed Guest Additions and **rebuilt kernel modules** for the current kernel.
5. Ensured the correct **service** (`vboxadd-service.service`) is registered and running.
6. Verified with `lsmod`, `systemctl`, and paste/drag-drop tests.

---

## Commands Used

| Command | Description |
|---|---|
| `Devices → Shared Clipboard → Bidirectional` | Enables clipboard both ways (host↔guest). |
| `Devices → Drag and Drop → Bidirectional` | Enables file drag/drop both ways. |
| `sudo apt update` | Refresh package index. |
| `sudo apt install -y build-essential dkms linux-headers-$(uname -r)` | Toolchain + headers for building kernel modules. |
| `Devices → Insert Guest Additions CD image…` | Mounts the GA ISO into the VM. |
| `lsblk` | Shows block devices (check for `sr0`). |
| `sudo mkdir -p /mnt/cdrom && sudo mount /dev/sr0 /mnt/cdrom` | Manual mount when auto-mount fails. |
| `cd /mnt/cdrom && sudo ./VBoxLinuxAdditions.run` | Runs the GA installer from the CD. |
| `sudo apt install -y virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms` | Installs the distro GA packages & services. |
| `sudo /sbin/rcvboxadd setup` | Clean build of GA modules for current kernel. |
| `sudo /sbin/rcvboxadd quicksetup all` | (If multiple kernels) builds modules for each. |
| `sudo systemctl enable --now vboxadd-service.service` | Starts and enables GA service. |
| `sudo systemctl status vboxadd-service.service` | Verifies service is active. |
| `lsmod | grep vbox` | Confirms `vboxguest`, `vboxsf`, `vboxvideo` loaded. |
| `sudo reboot` | Reboots to finalize modules. |

---

## Configuration Applied

- **VirtualBox (running VM window):**
- `Devices → Shared Clipboard → Bidirectional`
- `Devices → Drag and Drop → Bidirectional`

- **Packages installed:**
- `build-essential`, `dkms`, `linux-headers-$(uname -r)`
- `virtualbox-guest-utils`, `virtualbox-guest-x11`, `virtualbox-guest-dkms`

- **Kernel modules compiled:** `vboxguest`, `vboxsf`, `vboxvideo`

---

## Verification

**Clipboard Test**
```bash
# Copy from host (Windows), then paste into VM terminal with Ctrl+Shift+V:
echo "Clipboard sync working!" && date



## Modules Loaded

lsmod | grep vbox
# Expected lines: vboxguest, vboxsf, vboxvideo


## Service Running


systemctl status vboxadd-service.service
# Expected: Active: active (running)



**Drag & Drop**

Drag a small .txt file from Windows desktop into the VM window 
file appears in ~/ or prompt to save.




## Troubleshooting

**Symptom 1**

mount: 
`/mnt/cdrom: no medium found on /dev/sr0`



Cause: Guest Additions ISO not inserted.

Fix: Devices tab 

Insert Guest Additions CD image

mount:

`sudo mkdir -p /mnt/cdrom`
`sudo mount /dev/sr0 /mnt/cdrom`


**Symptom 2**


`systemctl status vboxservice` 

 “Unit … could not be found”

`systemctl restart vboxadd-service.service` 

 “failed… error code”



Cause: Version mismatch between kernel and previously built GA modules.

Fix: Install distro GA packages and rebuild modules:


`sudo apt install -y virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms`
`sudo /sbin/rcvboxadd setup`
`sudo /sbin/rcvboxadd quicksetup all`
`sudo systemctl enable --now vboxadd-service.service`



##  Issues Encountered / Root Cause / Resolution

**Issue**: Clipboard wouldn’t paste; terminal sometimes closed on paste.

**Root Cause:** Guest Additions service not running + terminal expecting Ctrl+Shift+V (not Ctrl+V).

**Resolution:** Installed/registered vboxadd-service.service, rebuilt GA modules, used correct paste shortcut.

**Issue:** “No medium found on /dev/sr0.”

**Root Cause:** GA ISO not mounted.

**Resolution:** Inserted ISO from Devices menu and mounted /dev/sr0.

**Issue:** Service failed after partial install.

**Root Cause:** Kernel 5.15.x mismatch with previously built GA modules.

**Resolution:** rcvboxadd setup + quicksetup all and reboot.



## Lessons Learned

-VirtualBox features (clipboard/drag-drop) depend on Guest Additions modules + service.

-Linux terminals use Ctrl+Shift+V for paste.

-When services fail, check unit name (vboxadd-service.service) and rebuild modules with rcvboxadd.

-Always install headers + dkms before running Guest Additions.


## Final State

 -Bidirectional clipboard (host ↔ guest)

 -Drag & drop files

 -Display drivers loaded (vboxvideo)

 -Service active: vboxadd-service.service

 -Kernel modules loaded: vboxguest, vboxsf, vboxvideo


## Appendix: Exact Command History

`sudo apt update`
`sudo apt install -y build-essential dkms linux-headers-$(uname -r)`

`lsblk`
`sudo mkdir -p /mnt/cdrom && sudo mount /dev/sr0 /mnt/cdrom`
`cd /mnt/cdrom && sudo ./VBoxLinuxAdditions.run`
`sudo apt install -y virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms`
`sudo /sbin/rcvboxadd setup`
`sudo /sbin/rcvboxadd quicksetup all`
`sudo systemctl enable --now vboxadd-service.service`
`sudo reboot`
`lsmod | grep vbox`
`systemctl status vboxadd-service.service`
