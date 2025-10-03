Looking at your file structure, I can see you have `cybertoolkit/docs/installation.md` already. Let me provide the complete code for this file and then list all remaining documentation files you need.

## docs/installation.md (Complete Code)

```markdown
# 📥 Installation Guide

## System Requirements

### Minimum Requirements
- **Kali Linux** (Recommended) or **Termux** (Android)
- **Storage**: 2GB free space
- **RAM**: 2GB minimum
- **Internet**: Required for tool downloads

### Recommended
- **Kali Linux 2023+** or **Termux 0.118+**
- **Storage**: 5GB+ free space
- **RAM**: 4GB+
- **CPU**: Multi-core processor

## 🐉 Kali Linux Installation

### Method 1: Automated Installation (Recommended)
```bash
# Clone repository
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit

# Run automated installer
./scripts/install-all.sh
```

### Method 2: Manual Kali Installation
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install core tools
sudo apt install -y \
    whois nmap masscan nikto \
    gobuster dirb john python3 \
    python3-pip git curl

# Install Python tools
pip3 install theharvester pdfplumber Pillow requests

# Install Go tools (optional)
sudo apt install -y golang-go
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/ffuf/ffuf@latest

# Make scripts executable
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
chmod +x tools/**/*.py
```

## 📱 Termux Installation

### Method 1: Automated Installation
```bash
# Update packages
pkg update && pkg upgrade -y

# Clone repository
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit

# Run installer
./scripts/install-all.sh
```

### Method 2: Manual Termux Installation
```bash
# Install essential packages
pkg install -y git python nodejs

# Install core tools
pkg install -y \
    whois nmap python python-pip \
    git curl wget

# Install Python tools
pip install theharvester pdfplumber Pillow requests

# Make scripts executable
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
chmod +x tools/**/*.py

# Setup storage access
termux-setup-storage
```

## 🐳 Docker Installation

### Using Pre-built Image
```bash
# Pull latest image
docker pull 516hackers/cybertoolkit:latest

# Run container
docker run -it --rm -v $(pwd):/workspace 516hackers/cybertoolkit
```

### Build from Source
```bash
# Clone repository
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit

# Build Docker image
docker build -t cybertoolkit -f docker/Dockerfile .

# Run container
docker run -it --rm -v $(pwd):/workspace cybertoolkit
```

## 🔧 Development Setup

### VS Code with Dev Containers
1. Install Docker and VS Code
2. Install "Dev Containers" extension
3. Open project in VS Code
4. Reopen in container when prompted

### Manual Development Setup
```bash
# Clone repository
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit

# Create virtual environment (optional)
python3 -m venv .venv
source .venv/bin/activate

# Install development dependencies
pip install shellcheck  # For shell script linting

# Setup pre-commit hooks (if configured)
pre-commit install
```

## 🧪 Verification

### Environment Check
```bash
./scripts/check-env.sh
```

**Expected Output:**
```
🔍 Platform Information:
   🐉 Platform: Kali Linux

📦 Tool Availability:
   ✅ whois
   ✅ nmap
   ✅ nikto
   ✅ python3

🐍 Python Modules:
   ✅ theHarvester
   ✅ pdfplumber
   ✅ PIL
   ✅ requests

✅ Environment check completed
```

### Test Installation
```bash
# Test basic functionality
./tests/shell/test_basic.sh

# Test individual tools (safe examples)
./tools/reconnaissance/whois-wrapper.sh example.com
./tools/network/nmap-wrapper.sh scanme.nmap.org quick
```

## 🔄 Updates

### Updating Cybertoolkit
```bash
cd cybertoolkit
git pull origin main
./scripts/install-all.sh
```

### Updating Individual Tools
```bash
# Kali Linux packages
sudo apt update && sudo apt upgrade

# Python tools
pip3 install --upgrade theharvester pdfplumber Pillow requests

# Go tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/ffuf/ffuf@latest
```

## 🐛 Troubleshooting

### Common Issues

**Permission Errors:**
```bash
# Make all scripts executable
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
chmod +x tools/**/*.py
```

**Tool Not Found:**
```bash
# Check if tool is installed
which nmap

# Run environment check
./scripts/check-env.sh

# Add Go tools to PATH
export PATH=$PATH:~/go/bin
```

**Python Import Errors:**
```bash
# Reinstall Python packages
pip3 install --force-reinstall theharvester pdfplumber Pillow requests

# Check Python environment
python3 --version
pip3 list | grep -E "(theharvester|pdfplumber|Pillow|requests)"
```

**Network Issues in Docker:**
```bash
# Run with network privileges
docker run -it --rm --network host -v $(pwd):/workspace cybertoolkit
```

### Platform-Specific Issues

**Kali Linux:**
- Some tools require root privileges
- Use `sudo` for network scans
- Ensure virtualization is enabled in BIOS

**Termux:**
- Limited root access
- Some network operations restricted
- Storage permissions needed

**Termux Storage Permission:**
```bash
# Grant storage access
termux-setup-storage

# Check permissions
ls -la ~/storage/
```

**Termux Package Issues:**
```bash
# Clean package cache
pkg clean

# Reinstall packages
pkg reinstall python nmap
```

## 📊 Post-Installation Checklist

- [ ] Environment check passes
- [ ] Basic tools test successfully
- [ ] Logs directory created
- [ ] Legal notice read and understood
- [ ] Authorization for testing obtained

## 🚀 Quick Start Examples

### Basic Reconnaissance
```bash
# Domain information
./tools/reconnaissance/whois-wrapper.sh example.com

# Subdomain discovery
./tools/reconnaissance/subfinder-wrapper.sh example.com

# Network scan
./tools/network/nmap-wrapper.sh 192.168.1.1 quick
```

### Web Application Testing
```bash
# Directory scanning
./tools/web/gobuster-wrapper.sh dir http://example.com

# Vulnerability scanning
./tools/vulnerability/nikto-wrapper.sh http://example.com
```

## 🤝 Getting Help

- **GitHub Issues**: [Bug reports and feature requests](https://github.com/516hackers/cybertoolkit/issues)
- **Documentation**: Check other files in `docs/` directory
- **Community**: GitHub Discussions for questions

## ⚠️ Important Notes

### Legal Compliance
- Always obtain proper authorization before testing
- Read and understand [LEGAL.md](../LEGAL.md)
- Use only for ethical security testing

### Platform Limitations
- **Termux**: Some advanced features may not work
- **Kali**: Recommended for full functionality
- **Docker**: Network scanning may require special privileges

### Security Best Practices
- Keep tools updated
- Use secure connections (VPN) when testing externally
- Store logs and reports securely
- Follow responsible disclosure practices

---

**Need help? Check the [FAQ.md](FAQ.md) or open an issue on GitHub!**

*Last updated: $(date)*
```

## 📋 Remaining Documentation Files Needed:

Based on your file structure, here are the remaining documentation files you need:

### **Root Directory (6 files):**
1. `README.md` ✅ *(Already provided in previous response)*
2. `LEGAL.md` 
3. `LICENSE.md` 
4. `CONTRIBUTING.md` 
5. `CODE_OF_CONDUCT.md` 
6. `.gitignore` ✅ *(Already provided)*

### **docs/ Directory (2 files):**
1. `installation.md` ✅ *(Provided above)*
2. `platform_notes.md` 
3. `FAQ.md` 

### **templates/ Directory (2 files):**
1. `add-new-tool.md` 
2. `report-template.md` 

### **.github/ Directory (2 files):**
1. `ISSUE_TEMPLATE.md` 
2. `PULL_REQUEST_TEMPLATE.md` 

### **Tool Category README files (7 files):**
1. `tools/reconnaissance/README.md`
2. `tools/network/README.md` 
3. `tools/web/README.md`
4. `tools/vulnerability/README.md`
5. `tools/password/README.md`
6. `tools/analysis/README.md`
7. `tools/utils/README.md`

## 📊 Summary:
- **✅ Already provided**: 2 files (README.md, .gitignore)
- **✅ Just provided**: 1 file (installation.md)  
- **❌ Remaining**: 14 files

## 🚀 Next Steps:

Would you like me to provide the remaining 14 files? I can generate them systematically starting with the most critical ones:

1. **Legal & License files** (LEGAL.md, LICENSE.md, CONTRIBUTING.md)
2. **Tool category READMEs** (7 files for each tool category)
3. **Templates** (add-new-tool.md, report-template.md)
4. **GitHub templates** (ISSUE_TEMPLATE.md, PULL_REQUEST_TEMPLATE.md)
5. **Remaining docs** (platform_notes.md, FAQ.md, CODE_OF_CONDUCT.md)

Which set would you like me to work on next?
