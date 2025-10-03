# Cybertoolkit - 516 Hackers Toolkit

![516 Hackers](https://img.shields.io/badge/516-Hackers-blue)
![Ethical Security](https://img.shields.io/badge/Ethical-Security-green)
![Platform](https://img.shields.io/badge/Platform-Kali%20%7C%20Termux-orange)

A comprehensive cybersecurity toolkit designed for ethical security testing, penetration testing, and digital forensics. Built with ❤️ by 516 Hackers community.

## ⚠️ LEGAL DISCLAIMER

**This toolkit is for authorized security testing only.**
- You MUST have explicit permission to test any system
- Unauthorized use is illegal and unethical
- Users are solely responsible for their actions
- Educational purposes only

[Read Full Legal Notice](LEGAL.md)

## 🚀 Quick Start

### Prerequisites
- **Kali Linux** (Recommended) or **Termux** (Android)
- Basic terminal knowledge
- Legal authorization for testing

## ![Installation](https://img.shields.io/badge/Installation-blue) ![Auto](https://img.shields.io/badge/Mode-Auto-green) Method 1: Automated Installation (Recommended)



Open a terminal and run:


 1. Clone the repo
```
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit
```

 2. Make installer scripts executable
```
chmod +x scripts/*.sh
```

 3. Run the automated installer
```
./scripts/install-all.sh
```

This will install common tools and make the toolkit ready to use.

---

## ![Manual Setup](https://img.shields.io/badge/Setup-Manual-orange) Method 2: Manual Setup


1. Clone the repo:

```bash
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit
```

2. Make helper scripts executable:

```bash
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
chmod +x tools/**/*.py
```

3. Run the environment checker:

```bash
./scripts/check-env.sh
```


## ![Commands](https://img.shields.io/badge/Basic-Commands-blueviolet) Basic commands you will use

<img width="816" height="500" alt="dvbdgScreenshot (23)" src="https://github.com/user-attachments/assets/4359eb35-3431-47ee-96b6-b53dfdc1d258" />


* Show list of available tools:

```
./scripts/list-tools.sh
```

* Quick access menu:

```bash
./scripts/tools-quick.sh
```

* Run a tool wrapper (example: whois):

```bash
./tools/reconnaissance/whois-wrapper.sh example.com
```

---
### Platform-Specific Setup

#### 🐉 Kali Linux
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install core tools
sudo apt install -y whois nmap masscan nikto gobuster dirb john python3 python3-pip

# Install Python tools
pip3 install theharvester pdfplumber Pillow requests
```

#### 📱 Termux (Android)
```bash
# Update packages
pkg update && pkg upgrade -y

# Install core tools
pkg install -y whois nmap python

# Install Python tools
pip install theharvester pdfplumber Pillow requests
```

#### 🔧 Go Tools (Optional)
```bash
# Install Go if not present
sudo apt install golang-go  # Kali
pkg install golang          # Termux

# Install Go-based tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/ffuf/ffuf@latest
```

## 🛠️ Tool Categories

### 1. 🔍 Reconnaissance
| Tool | Description | Usage |
|------|-------------|--------|
| **WHOIS** | Domain registration lookup | `./tools/reconnaissance/whois-wrapper.sh example.com` |
| **Subfinder** | Subdomain discovery | `./tools/reconnaissance/subfinder-wrapper.sh example.com` |
| **theHarvester** | OSINT email & subdomain gathering | `./tools/reconnaissance/theHarvester/run_theharvester.py -d example.com -b all` |

### 2. 🌐 Network Scanning
| Tool | Description | Usage |
|------|-------------|--------|
| **Nmap** | Network discovery & security auditing | `./tools/network/nmap-wrapper.sh 192.168.1.1 quick` |
| **Masscan** | Mass port scanning | `./tools/network/masscan-wrapper.sh 192.168.1.0/24 1-1000` |

### 3. 🕸️ Web Application Testing
| Tool | Description | Usage |
|------|-------------|--------|
| **Gobuster** | Directory/file brute forcing | `./tools/web/gobuster-wrapper.sh dir http://example.com` |
| **FFUF** | Fast web fuzzer | `./tools/web/ffuf-wrapper.sh http://example.com/FUZZ wordlists/common.txt` |
| **Nikto** | Web server scanner | `./tools/vulnerability/nikto-wrapper.sh http://example.com` |

### 4. 🎯 Vulnerability Assessment
| Tool | Description | Usage |
|------|-------------|--------|
| **Nuclei** | Template-based vulnerability scanning | `./tools/vulnerability/nuclei-wrapper.sh http://example.com` |
| **Nikto** | Comprehensive web server scan | `./tools/vulnerability/nikto-wrapper.sh http://example.com` |

### 5. 🔐 Password Security
| Tool | Description | Usage |
|------|-------------|--------|
| **John the Ripper** | Password cracking | `./tools/password/john-wrapper.sh hashes.txt` |

### 6. 📊 Analysis Tools
| Tool | Description | Usage |
|------|-------------|--------|
| **Metadata Extractor** | File metadata analysis | `./tools/analysis/metadata-extractor.py document.pdf` |
| **OSINT Lookup** | Multi-source intelligence gathering | `./tools/utils/osint_lookup.py example.com` |

## 📖 Complete Usage Guide

### Step 1: Environment Setup
```bash
# Verify your environment
./scripts/check-env.sh

# Expected output:
# ✅ Platform: Kali Linux
# ✅ Tools: whois, nmap, nikto, python3
# ❌ Missing: subfinder, nuclei (install with Go)
```

### Step 2: Target Reconnaissance
```bash
# Start with domain reconnaissance
./tools/reconnaissance/whois-wrapper.sh example.com
./tools/reconnaissance/subfinder-wrapper.sh example.com
./tools/reconnaissance/theHarvester/run_theharvester.py -d example.com -b google,bing
```

### Step 3: Network Mapping
```bash
# Quick network scan
./tools/network/nmap-wrapper.sh 192.168.1.1 quick

# Comprehensive scan
./tools/network/nmap-wrapper.sh 192.168.1.1 full

# UDP scan
./tools/network/nmap-wrapper.sh 192.168.1.1 udp
```

### Step 4: Web Application Testing
```bash
# Directory brute forcing
./tools/web/gobuster-wrapper.sh dir http://example.com

# Vulnerability scanning
./tools/vulnerability/nikto-wrapper.sh http://example.com
./tools/vulnerability/nuclei-wrapper.sh http://example.com
```

### Step 5: Analysis & Reporting
```bash
# Extract metadata from files
./tools/analysis/metadata-extractor.py suspect_file.jpg -o report.json

# OSINT gathering
./tools/utils/osint_lookup.py target@example.com -t email -o osint_report.json
```

## 🗂️ Project Structure

```
cybertoolkit/
├── tools/                    # All security tools
│   ├── reconnaissance/      # Information gathering
│   ├── network/            # Network scanning
│   ├── web/               # Web application testing
│   ├── vulnerability/     # Vulnerability assessment
│   ├── password/         # Password security
│   ├── analysis/        # Digital forensics
│   └── utils/          # Utility tools
├── scripts/            # Installation & setup
├── logs/              # Activity logs (gitignored)
├── templates/         # Report templates
├── tests/            # Test scripts
└── docs/            # Documentation
```

## 🔒 Security Features

- **Automatic Logging**: All activities logged with timestamps
- **Legal Compliance**: Built-in consent requirements
- **Platform Detection**: Automatic Kali/Termux support
- **Error Handling**: Comprehensive tool availability checks
- **Ethical Focus**: Educational and authorized use only

## 📝 Logging & Reporting

All tool activities are automatically logged:
```bash
# Logs are stored in logs/ directory
ls logs/
# whois_20231201_143022.log
# nmap_20231201_143125.log
# nikto_20231201_143230.log
```

## 🐳 Docker Support

### Build Docker Image
```bash
cd docker
docker build -t cybertoolkit .
```

### Run Container
```bash
docker run -it --rm -v $(pwd):/workspace cybertoolkit
```

### VS Code Dev Container
```bash
# Open in VS Code with Dev Containers extension
code .
# Reopen in container when prompted
```

## 🤝 Contributing

We welcome ethical contributions! Please read our contributing guidelines:

1. **Fork** the repository
2. **Create** a feature branch
3. **Add** your tool with proper documentation
4. **Test** on both Kali and Termux
5. **Submit** a pull request

[See Contributing Guidelines](CONTRIBUTING.md)

## 🐛 Troubleshooting

### Common Issues

**Tool not found:**
```bash
# Check installation
./scripts/check-env.sh

# Install missing tools
./scripts/install-all.sh
```

**Permission denied:**
```bash
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
```

**Python import errors:**
```bash
pip3 install -r tools/reconnaissance/theHarvester/requirements.txt
```

### Platform-Specific Notes

**Termux Limitations:**
- Some tools may require root access
- GPU acceleration not available for hashcat
- Limited port scanning capabilities

**Kali Linux:**
- Run as root for some network operations
- Use `sudo` where required
- Pre-installed tools available

## 📜 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🙏 Acknowledgments

- **516 Hackers Community** - For collaboration and testing
- **Kali Linux Team** - For the amazing penetration testing platform
- **Termux Developers** - For bringing Linux to Android
- **Open Source Tools** - All the amazing security tools we wrap

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/516hackers/cybertoolkit/issues)
- **Discussions**: [GitHub Discussions](https://github.com/516hackers/cybertoolkit/discussions)
- **Documentation**: [Docs](docs/)

## ⭐ Star History

If you find this project useful, please give it a star! ⭐

---

**Remember: With great power comes great responsibility. Always hack ethically!**

---
*Built with ❤️ by 516 Hackers - Promoting ethical security research worldwide*
