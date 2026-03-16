# Automated Threat Intelligence Collector (Bash Scripting Lab)

## 🎯 Project Objective

This project automates the reconnaissance and threat intelligence gathering phase of a security assessment. By utilizing *Bash scripting* to chain industry-standard tools and APIs, the script transforms a manual, time-consuming process into an efficient, one-command workflow.


##  Key Features

* **WHOIS Extraction:** Gathers domain registration and ownership details.
* **API Threat Intel:** Integrates with **VirusTotal/AbuseIPDB** to fetch live reputation data.
* **Network Analysis:** Conducts service version detection and port scanning via **Nmap**.
* **Attack Surface Discovery:** Enumerates subdomains using **Sublist3r**.
* **Automated Reporting:** Organizes all findings into a structured directory for easy analysis.

---

## 📋 Prerequisites

Before running the script, ensure your environment is configured:

* **System:** Kali Linux / Debian-based Linux
* **Dependencies:** `jq`, `curl`, `nmap`, `whois`, `sublist3r`
* **API Key:** A valid VirusTotal or AbuseIPDB API key.

---

## 🛠️ Installation & Setup

1. **Clone the repository:**
```
git clone https://github.com/[your-username]/threat-intel-automation.git
cd threat-intel-automation

```


2. **Install required tools:**
```
sudo apt update && sudo apt install jq curl nmap whois sublist3r -y

```


3. **Configure the script:**
Open `nano threatintel.sh` and replace `"your_api_key_here"` with your actual API key.


4. **Set Permissions:**
```
chmod +x threatintel.sh

```



---

## 💻 Usage

1. Create a `targets.txt` file containing the domains or IP addresses you wish to scan (one per line).
   
2. Execute the script:
```bash
./threatintel.sh targets.txt

```



### Output Structure

The script creates a `reports/` directory with organized files for each target:

```text
reports/
├─ target.com-whois.txt
├─ target.com-threatintel.json
├─ target.com-nmap.txt
└─ target.com-subdomains.txt

```

---

## 🏆 Bonus Challenges Implemented

* **GPG Encryption:** Secure the final intelligence report to protect sensitive reconnaissance data.
* **HTML Generation:** Uses `awk` to parse raw data into human-readable HTML reports.
* **Service Banner Grabbing:** Enhanced Nmap scripts to identify server software versions.

---

## ⚠️ Troubleshooting

**System Freezes:** This script performs intensive tasks (like full port scans). If your Kali Linux VM freezes:

* Ensure you have allocated at least **4GB RAM**.
* The script is optimized with `-T4` speed; if stability issues persist, consider lowering to `-T3`.
* Check Java heap settings if running Burp Suite concurrently.

---

## 🎓 Learning Outcomes

This lab provided hands-on experience with:

* **API Integration:** Handling JSON data in a CLI environment using `jq`.
* **Process Automation:** Streamlining security workflows through Bash loops and functions.
* **Data Sanitization:** Managing and formatting large outputs for professional reporting.

---

**Would you like me to help you write the `awk` command that converts these text files into a single HTML table for your report?**
