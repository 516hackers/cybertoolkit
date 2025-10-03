#!/bin/bash
# Cybertoolkit - Tools Lister
# Display all available tools in the 516 Hackers Toolkit

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                516 Hackers - Cybertoolkit                   ║"
echo "║                     Available Tools                         ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to check if tool is available
check_tool_available() {
    local tool_name=$1
    if command -v "$tool_name" &> /dev/null; then
        echo -e "${GREEN}✅${NC}"
    else
        echo -e "${RED}❌${NC}"
    fi
}

# Function to display category
display_category() {
    local category=$1
    local description=$2
    echo -e "\n${PURPLE}▐■${NC} ${BLUE}$category${NC}"
    echo -e "${CYAN}└── $description${NC}"
    echo "────────────────────────────────────────────────────────────────────"
}

# Function to display tool
display_tool() {
    local tool_path=$1
    local tool_name=$2
    local description=$3
    local install_method=$4
    
    if [ -f "$tool_path" ] && [ -x "$tool_path" ]; then
        local status="${GREEN}✓${NC}"
    else
        local status="${RED}✗${NC}"
    fi
    
    # Extract base command for availability check
    local base_command=$(basename "$tool_path" | sed 's/-wrapper.sh//' | sed 's/.py//')
    
    printf " ${status} ${YELLOW}%-25s${NC} %-40s\n" "$tool_name" "$description"
    printf "    ${CYAN}├─ Usage:${NC} ${GREEN}%s${NC}\n" "$tool_path"
    printf "    ${CYAN}├─ Install:${NC} %s\n" "$install_method"
    printf "    ${CYAN}└─ Available: %s${NC}\n" "$(check_tool_available "$base_command")"
    echo ""
}

# 🔍 RECONNAISSANCE TOOLS
display_category "RECONNAISSANCE" "Information Gathering & OSINT Tools"

display_tool \
    "./tools/reconnaissance/whois-wrapper.sh" \
    "WHOIS Lookup" \
    "Domain registration information lookup" \
    "apt install whois / pkg install whois"

display_tool \
    "./tools/reconnaissance/subfinder-wrapper.sh" \
    "Subfinder" \
    "Subdomain discovery tool" \
    "go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"

display_tool \
    "./tools/reconnaissance/theHarvester/run_theharvester.py" \
    "theHarvester" \
    "OSINT email and subdomain gathering" \
    "pip install theharvester"

# 🌐 NETWORK TOOLS
display_category "NETWORK" "Network Scanning & Enumeration"

display_tool \
    "./tools/network/nmap-wrapper.sh" \
    "Nmap" \
    "Network discovery and security auditing" \
    "apt install nmap / pkg install nmap"

display_tool \
    "./tools/network/masscan-wrapper.sh" \
    "Masscan" \
    "Mass IP port scanner" \
    "apt install masscan"

display_tool \
    "./tools/network/rustscan-wrapper.sh" \
    "RustScan" \
    "Modern port scanner written in Rust" \
    "cargo install rustscan / docker pull rustscan/rustscan"

# 🕸️ WEB APPLICATION TOOLS
display_category "WEB APPLICATION" "Web Security Testing"

display_tool \
    "./tools/web/gobuster-wrapper.sh" \
    "Gobuster" \
    "Directory/file & DNS busting tool" \
    "apt install gobuster / go install github.com/OJ/gobuster/v3@latest"

display_tool \
    "./tools/web/ffuf-wrapper.sh" \
    "FFUF" \
    "Fast web fuzzer written in Go" \
    "go install github.com/ffuf/ffuf@latest"

display_tool \
    "./tools/web/dirb-wrapper.sh" \
    "DIRB" \
    "Web content scanner" \
    "apt install dirb"

# 🎯 VULNERABILITY ASSESSMENT
display_category "VULNERABILITY" "Vulnerability Scanning & Analysis"

display_tool \
    "./tools/vulnerability/nikto-wrapper.sh" \
    "Nikto" \
    "Web server scanner" \
    "apt install nikto"

display_tool \
    "./tools/vulnerability/nuclei-wrapper.sh" \
    "Nuclei" \
    "Template-based vulnerability scanner" \
    "go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"

display_tool \
    "./tools/vulnerability/wpscan-wrapper.sh" \
    "WPScan" \
    "WordPress security scanner" \
    "gem install wpscan"

# 🔐 PASSWORD SECURITY
display_category "PASSWORD" "Password Testing & Cracking"

display_tool \
    "./tools/password/john-wrapper.sh" \
    "John the Ripper" \
    "Password cracking tool" \
    "apt install john / pkg install john"

display_tool \
    "./tools/password/hashcat-wrapper.sh" \
    "Hashcat" \
    "Advanced password recovery tool" \
    "apt install hashcat"

# 📊 ANALYSIS TOOLS
display_category "ANALYSIS" "Forensic & Data Analysis"

display_tool \
    "./tools/analysis/metadata-extractor.py" \
    "Metadata Extractor" \
    "Extract metadata from various file types" \
    "pip install pdfplumber Pillow"

display_tool \
    "./tools/analysis/exiftool-wrapper.sh" \
    "ExifTool" \
    "Read and write meta information in files" \
    "apt install libimage-exiftool-perl"

# 🔧 UTILITY TOOLS
display_category "UTILITY" "Helper & Support Tools"

display_tool \
    "./tools/utils/osint_lookup.py" \
    "OSINT Lookup" \
    "Multi-source OSINT gathering tool" \
    "pip install requests"

display_tool \
    "./tools/utils/ffmpeg-wrapper.sh" \
    "FFmpeg" \
    "Video/audio processing tool" \
    "apt install ffmpeg / pkg install ffmpeg"

display_tool \
    "./tools/utils/sample_report_generator.py" \
    "Report Generator" \
    "Generate security assessment reports" \
    "pip install jinja2"

# 📊 STATISTICS
echo -e "${CYAN}"
echo "────────────────────────────────────────────────────────────────────"
echo -e "${PURPLE}📊 TOOLKIT STATISTICS${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"

total_tools=$(find tools -name "*.sh" -o -name "*.py" | grep -E "(wrapper\.sh|\.py)" | grep -v "__pycache__" | wc -l)
categories=$(find tools -maxdepth 1 -type d | tail -n +2 | wc -l)

echo -e "Total Tools: ${GREEN}$total_tools${NC}"
echo -e "Categories: ${BLUE}$categories${NC}"

# Platform availability
echo -e "\n${CYAN}🏁 QUICK START${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"
echo -e "Run environment check: ${GREEN}./scripts/check-env.sh${NC}"
echo -e "Install all tools: ${GREEN}./scripts/install-all.sh${NC}"
echo -e "Test a tool: ${GREEN}./tools/reconnaissance/whois-wrapper.sh example.com${NC}"

# Legal notice
echo -e "\n${RED}⚖️  LEGAL NOTICE${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"
echo -e "All tools are for ${YELLOW}authorized security testing only${NC}."
echo -e "Always obtain proper permission before using these tools."
echo -e "Read ${GREEN}LEGAL.md${NC} for complete usage guidelines."

# Usage examples
echo -e "\n${CYAN}🚀 USAGE EXAMPLES${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"
echo -e "${YELLOW}Reconnaissance:${NC}"
echo -e "  ${GREEN}./tools/reconnaissance/whois-wrapper.sh example.com${NC}"
echo -e "  ${GREEN}./tools/reconnaissance/subfinder-wrapper.sh example.com${NC}"
echo -e ""
echo -e "${YELLOW}Network Scanning:${NC}"
echo -e "  ${GREEN}./tools/network/nmap-wrapper.sh 192.168.1.1 quick${NC}"
echo -e "  ${GREEN}./tools/network/masscan-wrapper.sh 192.168.1.0/24${NC}"
echo -e ""
echo -e "${YELLOW}Web Testing:${NC}"
echo -e "  ${GREEN}./tools/web/gobuster-wrapper.sh dir http://example.com${NC}"
echo -e "  ${GREEN}./tools/vulnerability/nikto-wrapper.sh http://example.com${NC}"

# Quick reference table
echo -e "\n${CYAN}📋 QUICK REFERENCE TABLE${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"
printf "${YELLOW}%-20s | %-30s | %s${NC}\n" "Category" "Primary Tools" "Count"
echo -e "────────────────────────────────────────────────────────────────────"

for category_dir in tools/*/; do
    category=$(basename "$category_dir")
    tool_count=$(find "$category_dir" -name "*.sh" -o -name "*.py" | grep -E "(wrapper\.sh|\.py)" | grep -v "__pycache__" | wc -l)
    
    case $category in
        "reconnaissance")
            tools="WHOIS, Subfinder, theHarvester"
            ;;
        "network")
            tools="Nmap, Masscan, RustScan"
            ;;
        "web")
            tools="Gobuster, FFUF, DIRB"
            ;;
        "vulnerability")
            tools="Nikto, Nuclei, WPScan"
            ;;
        "password")
            tools="John, Hashcat"
            ;;
        "analysis")
            tools="Metadata, ExifTool"
            ;;
        "utils")
            tools="OSINT, FFmpeg, Reports"
            ;;
        *)
            tools="Various"
            ;;
    esac
    
    printf "%-20s | %-30s | ${GREEN}%2d${NC} tools\n" "$category" "$tools" "$tool_count"
done

echo -e "\n${GREEN}✅ Use '--help' with any tool wrapper for specific usage instructions${NC}"
echo -e "${BLUE}🔧 Run './scripts/check-env.sh' to verify your installation${NC}"

# Make it executable
chmod +x scripts/list-tools.sh
