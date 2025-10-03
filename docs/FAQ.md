# ❓ Frequently Asked Questions

## 🤔 General Questions

### What is Cybertoolkit?
Cybertoolkit is a comprehensive collection of ethical security tools wrapped with consistent interfaces, automated logging, and legal compliance features. It's designed by 516 Hackers to make security testing more accessible, organized, and responsible.

### Who is this toolkit for?
- **Security Students** learning penetration testing
- **Ethical Hackers** conducting authorized assessments
- **System Administrators** testing their own networks
- **Bug Bounty Hunters** working within program scopes
- **Cybersecurity Enthusiasts** practicing in lab environments

### Is this legal to use?
**Yes, when used properly and ethically.** You MUST have explicit written permission to test any system. Unauthorized scanning or testing is illegal in most jurisdictions. Always read and follow our [LEGAL.md](../LEGAL.md) documentation.

### What makes this different from other security toolkits?
- **516 Hackers Branding**: Community-driven development
- **Automated Logging**: All activities are timestamped and recorded
- **Legal Compliance**: Built-in consent requirements and ethical guidelines
- **Cross-Platform**: Works on Kali Linux and Termux (Android)
- **Consistent Interface**: All tools follow the same usage patterns

## 🛠️ Installation Issues

### Installation fails with "Permission denied" errors
```bash
# Make all scripts executable
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
chmod +x tools/**/*.py

# If still having issues, check your umask
umask 0022
```

### "Command not found" errors after installation
```bash
# Run environment check to see what's missing
./scripts/check-env.sh

# Common solutions:
# - Add Go tools to PATH: export PATH=$PATH:~/go/bin
# - Restart your terminal session
# - Run the installer again: ./scripts/install-all.sh
```

### Python tools show "ModuleNotFoundError"
```bash
# Reinstall Python packages
pip3 install --force-reinstall theharvester pdfplumber Pillow requests

# Check if you're using the right Python version
python3 --version
pip3 --version

# Verify installation
python3 -c "import theharvester; print('theHarvester OK')"
```

### Go tools not working after installation
```bash
# Check Go installation
go version

# Add Go binary directory to PATH
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc

# Reinstall tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
```

## 🔧 Tool-Specific Issues

### Nmap scans are slow or not working
**Common causes and solutions:**
```bash
# Run with sudo for SYN scans (Kali Linux)
sudo ./tools/network/nmap-wrapper.sh target quick

# Check if target is reachable
ping target

# Try different scan types
./tools/network/nmap-wrapper.sh target full    # Comprehensive
./tools/network/nmap-wrapper.sh target stealth # Slower, stealthier
```

### Masscan not showing results
```bash
# Masscan requires root privileges
sudo ./tools/network/masscan-wrapper.sh 192.168.1.0/24 1-1000

# Check your network interface
sudo masscan --interfaces

# Use specific interface if needed
sudo masscan -p1-1000 192.168.1.0/24 -e eth0
```

### Gobuster not finding directories
```bash
# Try different wordlists
./tools/web/gobuster-wrapper.sh dir http://target.com /usr/share/wordlists/dirb/common.txt
./tools/web/gobuster-wrapper.sh dir http://target.com /usr/share/wordlists/dirb/big.txt

# Add file extensions
gobuster dir -u http://target.com -w wordlist.txt -x php,html,txt

# Adjust timeout if needed
gobuster dir -u http://target.com -w wordlist.txt -t 50
```

### Nikto scan takes too long
```bash
# Use specific plugins only
nikto -h http://target.com -Plugins "apache_expect_xss"

# Skip database tests
nikto -h http://target.com -nodb

# Adjust timeout
nikto -h http://target.com -timeout 3
```

## 📱 Platform-Specific Issues

### Termux: "Permission denied" for storage
```bash
# Grant storage permissions
termux-setup-storage

# Check if permissions were granted
ls -la ~/storage/

# If still issues, check Termux storage permission in Android settings
```

### Termux: Network scans not working
**This is normal due to Android restrictions:**
- Raw socket access requires root
- Use TCP connect scans instead of SYN scans
- Some port ranges may be blocked by mobile carriers

**Workarounds:**
```bash
# Use TCP connect scans
./tools/network/nmap-wrapper.sh target -sT

# Try specific ports only
./tools/network/nmap-wrapper.sh target -p 80,443,22,21

# Use rooted device with tsu
pkg install tsu
tsu -c './tools/network/nmap-wrapper.sh target full'
```

### Kali Linux: Tools missing from fresh install
```bash
# Update package lists
sudo apt update

# Install Kali metapackages
sudo apt install kali-linux-default
sudo apt install kali-tools-information-gathering
sudo apt install kali-tools-vulnerability

# Or install tools individually
sudo apt install nmap nikto gobuster whois masscan
```

### Docker: Network scanning not working
```bash
# Run with host network mode
docker run -it --rm --network host -v $(pwd):/workspace cybertoolkit

# Or use privileged mode
docker run -it --rm --privileged -v $(pwd):/workspace cybertoolkit
```

## 🔒 Legal & Ethical Questions

### Do I need permission to test my own website?
**Yes, you should still have explicit permission** even for your own systems. This ensures proper documentation and establishes testing boundaries.

### Can I use this for bug bounty programs?
**Yes, but with important caveats:**
- Only test within the program's defined scope
- Follow all program rules and guidelines
- Don't test systems not explicitly listed in scope
- Use only the testing methods allowed by the program

### What if I accidentally scan a system without permission?
1. **Stop immediately** upon realization
2. **Document exactly** what happened and when
3. **Contact the system owner** to report the incident
4. **Delete any data** collected during the unauthorized scan
5. **Review your processes** to prevent future accidents

### Is it legal to scan the internet for research?
**Generally, no.** Internet-wide scanning without permission is typically considered unauthorized access. Always:
- Get explicit permission for each target
- Use research networks like Scanless services
- Respect robots.txt and terms of service
- Consider the legal jurisdiction

## 🎯 Usage Questions

### Where are the logs stored?
All activities are automatically logged to the `logs/` directory:
```bash
ls -la logs/
# whois_20231201_143022.log
# nmap_20231201_143125.log
# nikto_20231201_143230.log
```

Logs include:
- Timestamp of execution
- Full command output
- Error messages
- Performance metrics

### How do I interpret the tool outputs?
Each tool provides different types of information:

**WHOIS Output:**
- Domain registration details
- Registrar information
- Contact details (when available)
- Domain expiration dates

**Nmap Output:**
- Open ports and services
- Service versions
- Operating system detection
- Security script results

**Gobuster Output:**
- Discovered directories and files
- HTTP status codes
- File sizes
- Discovery time

### Can I run multiple tools simultaneously?
**Yes, but with caution:**
```bash
# Run tools in background
./tools/reconnaissance/whois-wrapper.sh example.com &
./tools/reconnaissance/subfinder-wrapper.sh example.com &

# Wait for all background jobs
wait

# Check all logs
ls -la logs/
```

**Considerations:**
- Network bandwidth limitations
- Target system load
- Your own system resources
- Legal and ethical boundaries

### How do I create custom tool configurations?
Most tools support configuration files or environment variables:

**Environment Variables:**
```bash
export CYBERTOOLKIT_LOG_DIR="/custom/log/path"
export NMAP_OPTIONS="-T4 -A"
./tools/network/nmap-wrapper.sh target
```

**Tool-Specific Configs:**
- Nmap: `~/.nmap/` directory
- Gobuster: Command-line options
- Nikto: Configuration file editing

## 🐛 Common Error Messages

### "Tool not installed" error
```bash
# Check if tool exists in PATH
which nmap

# Install missing tool
sudo apt install nmap  # Kali
pkg install nmap       # Termux

# Or use the automated installer
./scripts/install-all.sh
```

### "No targets specified" error
```bash
# Always provide a target
./tools/reconnaissance/whois-wrapper.sh example.com

# For network tools, specify IP or range
./tools/network/nmap-wrapper.sh 192.168.1.1 quick
```

### "Permission denied" for log files
```bash
# Check log directory permissions
ls -la logs/

# Fix permissions if needed
chmod 755 logs/
chmod 644 logs/*.log 2>/dev/null || true
```

### "Out of memory" errors
**On Termux:**
```bash
# Close other applications
# Use lighter tools when possible
# Process data in smaller chunks
# Increase swap space if available
```

**On Kali:**
```bash
# Check memory usage
free -h

# Kill unnecessary processes
sudo pkill -f memory-intensive-process

# Consider adding more RAM or swap
```

## 🔄 Advanced Usage

### How do I create custom tool wrappers?
Use our template: `templates/add-new-tool.md`

**Basic structure:**
```bash
#!/bin/bash
# New Tool - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/tool_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Starting operation"

# Tool check
if ! command -v tool &> /dev/null; then
    echo "Error: tool not found"
    exit 1
fi

# Your tool logic here
tool --option target

echo "[516] Operation completed"
} | tee -a "$LOG_FILE"
```

### Can I integrate with other security tools?
**Yes, through various methods:**

**Command-line integration:**
```bash
# Chain tools together
./tools/reconnaissance/subfinder-wrapper.sh example.com | \
grep -oP '[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' | \
while read domain; do
    ./tools/network/nmap-wrapper.sh "$domain" quick
done
```

**API Integration:**
- Many tools support API outputs (JSON, XML)
- Use jq for JSON parsing: `tool --json | jq '.results'`
- Create custom reporting scripts

### How do I automate repetitive tasks?
**Create shell scripts:**
```bash
#!/bin/bash
# automated-scan.sh

TARGET=$1

echo "[516] Starting automated scan for: $TARGET"

# Reconnaissance
./tools/reconnaissance/whois-wrapper.sh "$TARGET"
./tools/reconnaissance/subfinder-wrapper.sh "$TARGET"

# Network scanning
./tools/network/nmap-wrapper.sh "$TARGET" full

# Web assessment (if web services found)
./tools/vulnerability/nikto-wrapper.sh "http://$TARGET"

echo "[516] Automated scan completed"
```

## 📚 Learning Resources

### Getting Started with Cybersecurity
1. **Basic Concepts**: Networking, operating systems, web technologies
2. **Hands-on Practice**: TryHackMe, Hack The Box beginner paths
3. **Methodology**: Learn penetration testing frameworks
4. **Legal Knowledge**: Understand computer misuse laws

### Recommended Learning Path
1. **Week 1-2**: Basic Linux commands and networking
2. **Week 3-4**: Web application fundamentals
3. **Week 5-6**: Tool usage and methodology
4. **Week 7-8**: Practice on authorized systems

### Practice Platforms
- **TryHackMe**: Beginner-friendly learning paths
- **Hack The Box**: More challenging scenarios
- **VulnHub**: Vulnerable VMs for practice
- **OverTheWire**: War games for skill development

### Further Reading
- "The Web Application Hacker's Handbook"
- "Nmap Network Scanning"
- "Metasploit: The Penetration Tester's Guide"
- OWASP testing guides and cheat sheets

## 🤝 Community & Support

### Getting Help
- **GitHub Issues**: For bug reports and feature requests
- **GitHub Discussions**: For questions and community help
- **Documentation**: Check the `docs/` directory first
- **Search**: Many questions have already been answered

### Reporting Bugs Effectively
When reporting issues, include:
1. **Platform**: Kali Linux, Termux, or other
2. **Error Message**: Exact text of the error
3. **Steps to Reproduce**: What you did before the error
4. **Environment**: Tool versions and system info
5. **Logs**: Relevant log file contents

### Feature Requests
We welcome suggestions! Please include:
1. **Use Case**: How you would use the feature
2. **Expected Behavior**: What should happen
3. **Why It's Useful**: The problem it solves
4. **Examples**: Similar features in other tools

## 🔄 Maintenance & Updates

### Keeping Tools Updated
```bash
# Update Cybertoolkit itself
cd cybertoolkit
git pull origin main
./scripts/install-all.sh

# Update system packages
sudo apt update && sudo apt upgrade  # Kali
pkg update && pkg upgrade           # Termux

# Update Python tools
pip3 install --upgrade theharvester pdfplumber Pillow requests

# Update Go tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
```

### Checking for Updates
```bash
# Check if repository updates are available
git fetch origin
git status

# Check tool versions
nmap --version
gobuster version
nikto -Version
```

### Backup and Migration
```bash
# Backup your logs and configurations
tar -czf cybertoolkit-backup-$(date +%Y%m%d).tar.gz logs/ templates/

# Restore from backup
tar -xzf cybertoolkit-backup-20231201.tar.gz
```

## ⚠️ Important Reminders

### Legal Compliance
- Always obtain proper authorization
- Document your testing scope and permissions
- Follow responsible disclosure practices
- Respect privacy and data protection laws

### Security Best Practices
- Keep your tools and systems updated
- Use secure connections (VPN) when testing externally
- Store sensitive data and logs securely
- Follow the principle of least privilege

### Ethical Considerations
- Don't cause unnecessary disruption
- Respect system owners and their property
- Help improve security, not exploit it
- Share knowledge responsibly

---

**Still have questions? Check our other documentation files or open an issue on GitHub! We're here to help you learn and use these tools responsibly.**
