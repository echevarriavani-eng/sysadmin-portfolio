
# Network Configuration & Tesing Lab

**Author:** Stevanie Echevarria
**System:** Ubuntu (VirtualBox VM)
**Category:** SysAdmin Labs - Core Networking Fundamentals


## Objective
Demonstrate the process of configuring a ** stactic IP address**, verifiying network routes, and confirming connectivity and DNS resolution using Ubuntu Netplan utility.



---


## Phase 1 -  Network Interface Verification


**Commands Used:**
| Command | Description |
|-------------|-----------|
| `ip a show enp0s3` |Displays all active network interface and their assigned IPs. |
| `sudo nano /etc/netplan/01-netcfg.yaml` | Ioens the Netplan configuration file for editing. |
| `sudo netplan try` | Temporarily apllies configuration for testing before saving. |
| `sudo netplan apply` |Commits and applies the new configuration permanently. |
| `ip r` | Displays the systems's routing table. |
| `resolvectl status enp0s3` | Shows link details and DNS serve configuration. |
| `ping -c 4 8.8.8.8` | Tests raw netwok connectivity. |
| `ping -c 4 google.com` | Traces packet routes to destination. |
| `traceroute google.com` | Traces packet routes to a destination. |
| `nslookup google.com` | Verifies name-to-IP DNS lookup. |

---

## Observed Output

```bash
Interface:     enp0s3
Status:        UP
IPv4 Address:  10.0.2.250/24
MAC Address: 08:00:27:85:9a:11


---

## Interpretation


The interface enp0s3 was identified as active with a valid IPv4 address, confirming that the network card was functional and ready for configuration changes.


---


## Lessons Learned

- Always identify the correct gateway before assigning static IPs.
- YAML indentation is crucial; improper space causes Netplan failure.
- Combine ping, traceroute, and nslookup for full diagnostic coverage.
- Testing after each stage prents larger configuration rollbacks.
- Clear documentation ensure repeatablity and professional clarity.
