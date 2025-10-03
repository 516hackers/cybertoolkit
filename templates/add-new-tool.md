# 🛠️ New Tool Addition Template

Use this template when adding a new tool to Cybertoolkit. Follow these guidelines to ensure consistency and quality.

## 📋 Pre-Submission Checklist

### Legal & Ethical Review
- [ ] Tool is for authorized security testing only
- [ ] Tool doesn't facilitate illegal activities
- [ ] Proper legal notices included
- [ ] Ethical usage guidelines documented

### Technical Requirements
- [ ] Works on Kali Linux
- [ ] Works on Termux (if possible)
- [ ] No hardcoded credentials
- [ ] Input validation implemented
- [ ] Error handling included

## 🏗️ Tool Structure

### Required Files
```
tools/category/tool-name/
├── tool-wrapper.sh # Main wrapper script
├── README.md # Tool documentation
├── requirements.txt # Python dependencies (if any)
└── examples/ # Usage examples (optional)
└── example-usage.txt
```

### Directory Categories
Choose the appropriate category for your tool:
- **reconnaissance**: Information gathering (WHOIS, subdomain enumeration, etc.)
- **network**: Network scanning and enumeration (nmap, masscan, etc.)
- **web**: Web application testing (gobuster, nikto, etc.)
- **vulnerability**: Vulnerability scanners (nuclei, etc.)
- **password**: Password security tools (john, hashcat, etc.)
- **analysis**: Forensic and analysis tools (metadata extraction, etc.)
- **utils**: Utility and helper tools (OSINT, reporting, etc.)

## 📝 Wrapper Script Template

```bash
#!/bin/bash
# Tool Name - 516 Hackers Toolkit
# Legal: Only use on authorized targets

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/toolname_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Tool Name - Starting operation"

# Check if tool is installed
if ! command -v tool-command &> /dev/null; then
    echo "Error: tool-command not found. Install with:"
    echo "  Kali: sudo apt install package-name"
    echo "  Termux: pkg install package-name"
    echo "  Go: go install github.com/author/tool@latest"
    echo "  Pip: pip install package-name"
    exit 1
fi

# Validate arguments
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target> [options]"
    echo "Examples:"
    echo "  $0 example.com"
    echo "  $0 192.168.1.1 --option value"
    exit 1
fi

TARGET=$1
shift
OPTIONS="$*"

echo "[516] Target: $TARGET"
echo "[516] Starting scan..."

# Tool execution with proper error handling
if [ -z "$OPTIONS" ]; then
    tool-command "$TARGET"
else
    tool-command "$TARGET" $OPTIONS
fi

echo "[516] Operation completed"
} | tee -a "$LOG_FILE"
