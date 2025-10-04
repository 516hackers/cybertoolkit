#!/bin/bash
# 516 Hackers - Cybertoolkit Tactical Inventory
# Operational Tool Inventory System

set -e

# Tactical Color Scheme
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color


echo -e "${RED}"
    echo '╔══════════════════════════════════════════════════════════════╗'
    echo '║                                                              ║'
    echo '║                  ██████╗   ██╗  ██████╗                      ║'
    echo '║                  ██╔════╝  ██║  ██╔════╝                     ║'
    echo '║                  ███████╗  ██║  ███████╗                     ║'
    echo '║                  ╚════██║  ██║  ██╔══██║                     ║'
    echo '║                  ███████║  ██║  ╚█████╔╝                     ║'
    echo '║                                                              ║'
    echo '╚══════════════════════════════════════════════════════════════╝'
 

echo -e "${NC}"
echo -e "${BLUE}┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                    TACTICAL TOOL INVENTORY - CLASSIFIED                       │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${YELLOW}Operation: 516 Hackers | Status: ACTIVE | Clearance: OPERATIONAL${NC}"
echo ""


# Operational Functions
get_operational_status() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}■ OPERATIONAL${NC}"
    else
        echo -e "${RED}□ OFFLINE${NC}"
    fi
}

get_tool_clearance() {
    case $1 in
        "nmap"|"masscan"|"rustscan") echo -e "${RED}LEVEL 4 - NETWORK OPS${NC}" ;;
        "gobuster"|"ffuf"|"nikto") echo -e "${ORANGE}LEVEL 3 - WEB OPS${NC}" ;;
        "john"|"hashcat") echo -e "${YELLOW}LEVEL 2 - CRYPTO OPS${NC}" ;;
        "whois"|"subfinder") echo -e "${BLUE}LEVEL 1 - RECON OPS${NC}" ;;
        *) echo -e "${CYAN}LEVEL 1 - STANDARD${NC}" ;;
    esac
}

display_tactical_category() {
    local category=$1
    local codename=$2
    local description=$3
    echo -e "\n${RED}▌${NC}${WHITE} TACTICAL CATEGORY: ${BLUE}$category${NC}"
    echo -e "${RED}│${NC}${CYAN}   Codename: $codename${NC}"
    echo -e "${RED}│${NC}${YELLOW}   Mission: $description${NC}"
    echo -e "${RED}└─────────────────────────────────────────────────────────────────────────────${NC}"
}

display_tactical_tool() {
    local tool_path=$1
    local tool_name=$2
    local callsign=$3
    local description=$4
    local install_method=$5
    
    # Extract base command
    local base_command=$(basename "$tool_path" | sed 's/-wrapper.sh//' | sed 's/.py//')
    
    echo -e "${GREEN}├─ ${WHITE}TOOL: ${YELLOW}$tool_name${NC}"
    echo -e "${GREEN}│  ${CYAN}├─ Callsign: ${WHITE}$callsign${NC}"
    echo -e "${GREEN}│  ${CYAN}├─ Description: ${WHITE}$description${NC}"
    echo -e "${GREEN}│  ${CYAN}├─ Operational Status: $(get_operational_status "$base_command")${NC}"
    echo -e "${GREEN}│  ${CYAN}├─ Clearance Level: $(get_tool_clearance "$base_command")${NC}"
    echo -e "${GREEN}│  ${CYAN}├─ Deployment: ${GREEN}$tool_path${NC}"
    echo -e "${GREEN}│  ${CYAN}└─ Acquisition: ${YELLOW}$install_method${NC}"
    echo ""
}

# 🎯 TACTICAL OPERATIONS INVENTORY

# 🔍 INTELLIGENCE GATHERING
display_tactical_category "RECONNAISSANCE" "EYES_ONLY" "Passive & Active Intelligence Gathering"

display_tactical_tool \
    "./tools/reconnaissance/whois-wrapper.sh" \
    "WHOIS Intelligence" \
    "DOMAIN_SCAN" \
    "Domain registration intelligence and footprint analysis" \
    "apt install whois / pkg install whois"

display_tactical_tool \
    "./tools/reconnaissance/subfinder-wrapper.sh" \
    "Subdomain Recon" \
    "SUB_HUNTER" \
    "Attack surface enumeration and subdomain discovery" \
    "go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"

display_tactical_tool \
    "./tools/reconnaissance/theHarvester/run_theharvester.py" \
    "OSINT Harvest" \
    "INTEL_GATHER" \
    "Multi-source OSINT intelligence collection" \
    "pip install theharvester"

# 🌐 NETWORK OPERATIONS
display_tactical_category "NETWORK OPERATIONS" "NETWAR" "Network Reconnaissance & Enumeration"

display_tactical_tool \
    "./tools/network/nmap-wrapper.sh" \
    "Network Mapper" \
    "PORT_SCAN" \
    "Advanced network discovery and service enumeration" \
    "apt install nmap / pkg install nmap"

display_tactical_tool \
    "./tools/network/masscan-wrapper.sh" \
    "Mass Scanner" \
    "SWEEP_OPERATION" \
    "High-speed internet-scale port scanning" \
    "apt install masscan"

display_tactical_tool \
    "./tools/network/rustscan-wrapper.sh" \
    "Rust Scanner" \
    "FAST_SCAN" \
    "Modern asynchronous port scanner with scripting" \
    "cargo install rustscan / docker pull rustscan/rustscan"

# 🕸️ WEB APPLICATION OPERATIONS
display_tactical_category "WEB APPLICATION" "WEBSTRIKE" "Web Infrastructure Testing"

display_tactical_tool \
    "./tools/web/gobuster-wrapper.sh" \
    "Directory Buster" \
    "DIR_FORCE" \
    "Advanced directory and file brute-forcing" \
    "apt install gobuster / go install github.com/OJ/gobuster/v3@latest"

display_tactical_tool \
    "./tools/web/ffuf-wrapper.sh" \
    "Web Fuzzer" \
    "FUZZ_OP" \
    "High-performance web application fuzzing" \
    "go install github.com/ffuf/ffuf@latest"

display_tactical_tool \
    "./tools/web/dirb-wrapper.sh" \
    "Content Scanner" \
    "CONTENT_SCAN" \
    "Web content scanner and directory brute-forcer" \
    "apt install dirb"

# 🎯 VULNERABILITY ASSESSMENT
display_tactical_category "VULNERABILITY" "VULN_SCAN" "Security Vulnerability Analysis"

display_tactical_tool \
    "./tools/vulnerability/nikto-wrapper.sh" \
    "Web Scanner" \
    "WEB_AUDIT" \
    "Comprehensive web server security scanner" \
    "apt install nikto"

display_tactical_tool \
    "./tools/vulnerability/nuclei-wrapper.sh" \
    "Vulnerability Scanner" \
    "TEMPLATE_STRIKE" \
    "Template-based vulnerability detection engine" \
    "go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"

display_tactical_tool \
    "./tools/vulnerability/wpscan-wrapper.sh" \
    "WordPress Audit" \
    "WP_AUDIT" \
    "WordPress vulnerability scanner and enumerator" \
    "gem install wpscan"

# 🔐 CRYPTOGRAPHIC OPERATIONS
display_tactical_category "PASSWORD" "CRYPTO_BREAK" "Cryptographic Analysis & Testing"

display_tactical_tool \
    "./tools/password/john-wrapper.sh" \
    "Password Cracker" \
    "JTR_OP" \
    "Advanced password cracking and hash analysis" \
    "apt install john / pkg install john"

display_tactical_tool \
    "./tools/password/hashcat-wrapper.sh" \
    "Hash Cracker" \
    "HASH_BREAK" \
    "GPU-accelerated password recovery tool" \
    "apt install hashcat"

# 📊 FORENSIC & ANALYSIS
display_tactical_category "ANALYSIS" "FORENSIC_OPS" "Digital Forensics & Data Analysis"

display_tactical_tool \
    "./tools/analysis/metadata-extractor.py" \
    "Metadata Analysis" \
    "META_SCAN" \
    "Comprehensive file metadata extraction and analysis" \
    "pip install pdfplumber Pillow"

display_tactical_tool \
    "./tools/analysis/exiftool-wrapper.sh" \
    "EXIF Analysis" \
    "EXIF_EXTRACT" \
    "Digital media metadata analysis and manipulation" \
    "apt install libimage-exiftool-perl"

# 🔧 SUPPORT OPERATIONS
display_tactical_category "UTILITY" "SUPPORT_OPS" "Operational Support & Utilities"

display_tactical_tool \
    "./tools/utils/osint_lookup.py" \
    "OSINT Lookup" \
    "INTEL_QUERY" \
    "Multi-source open source intelligence gathering" \
    "pip install requests"

display_tactical_tool \
    "./tools/utils/ffmpeg-wrapper.sh" \
    "Media Processor" \
    "MEDIA_OPS" \
    "Audio/video processing and analysis" \
    "apt install ffmpeg / pkg install ffmpeg"

display_tactical_tool \
    "./tools/utils/sample_report_generator.py" \
    "Report Generator" \
    "REPORT_GEN" \
    "Automated security assessment reporting" \
    "pip install jinja2"

# 📊 OPERATIONAL INTELLIGENCE
echo -e "${RED}"
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                       OPERATIONAL INTELLIGENCE                           │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"

# Calculate operational metrics
total_tools=$(find tools -name "*.sh" -o -name "*.py" | grep -E "(wrapper\.sh|\.py)" | grep -v "__pycache__" | wc -l)
operational_tools=0
offline_tools=0

for tool in $(find tools -name "*.sh" -o -name "*.py" | grep -E "(wrapper\.sh|\.py)" | grep -v "__pycache__"); do
    base_cmd=$(basename "$tool" | sed 's/-wrapper.sh//' | sed 's/.py//')
    if command -v "$base_cmd" &> /dev/null; then
        ((operational_tools++))
    else
        ((offline_tools++))
    fi
done

readiness_score=$(( (operational_tools * 100) / total_tools ))

echo -e "${CYAN}├─ OPERATIONAL READINESS: ${NC}"
echo -e "${CYAN}│  ├─ Total Assets: ${WHITE}$total_tools${NC}"
echo -e "${CYAN}│  ├─ Operational: ${GREEN}$operational_tools${NC}"
echo -e "${CYAN}│  ├─ Offline: ${RED}$offline_tools${NC}"
echo -e "${CYAN}│  └─ Readiness Score: ${YELLOW}$readiness_score%${NC}"

# Platform intelligence
echo -e "${CYAN}├─ PLATFORM INTELLIGENCE: ${NC}"
if [[ "$OSTYPE" == "linux-android"* ]]; then
    echo -e "${CYAN}│  └─ Platform: ${GREEN}TERMUX - MOBILE OPS${NC}"
elif [[ -f "/etc/debian_version" ]]; then
    if grep -q "Kali" /etc/os-release 2>/dev/null; then
        echo -e "${CYAN}│  └─ Platform: ${RED}KALI LINUX - OFFENSIVE OPS${NC}"
    else
        echo -e "${CYAN}│  └─ Platform: ${BLUE}DEBIAN - STANDARD OPS${NC}"
    fi
else
    echo -e "${CYAN}│  └─ Platform: ${YELLOW}UNKNOWN - LIMITED OPS${NC}"
fi

# 🚀 TACTICAL DEPLOYMENT GUIDE
echo -e "${RED}"
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                        TACTICAL DEPLOYMENT                               │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${GREEN}├─ INITIAL DEPLOYMENT:${NC}"
echo -e "${GREEN}│  └─ ${WHITE}./scripts/check-env.sh${NC} - Operational readiness check"

echo -e "${GREEN}├─ FULL DEPLOYMENT:${NC}"
echo -e "${GREEN}│  └─ ${WHITE}./scripts/install-all.sh${NC} - Complete tool acquisition"

echo -e "${GREEN}├─ TEST DEPLOYMENT:${NC}"
echo -e "${GREEN}│  └─ ${WHITE}./tools/reconnaissance/whois-wrapper.sh example.com${NC} - Basic functionality test"

# 🎯 OPERATIONAL SCENARIOS
echo -e "${RED}"
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                        OPERATIONAL SCENARIOS                             │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${BLUE}├─ SCENARIO 1: TARGET RECONNAISSANCE${NC}"
echo -e "${BLUE}│  ├─ ${GREEN}./tools/reconnaissance/whois-wrapper.sh target.com${NC}"
echo -e "${BLUE}│  ├─ ${GREEN}./tools/reconnaissance/subfinder-wrapper.sh target.com${NC}"
echo -e "${BLUE}│  └─ ${GREEN}./tools/reconnaissance/theHarvester/run_theharvester.py -d target.com${NC}"

echo -e "${ORANGE}├─ SCENARIO 2: NETWORK MAPPING${NC}"
echo -e "${ORANGE}│  ├─ ${GREEN}./tools/network/nmap-wrapper.sh 192.168.1.1 quick${NC}"
echo -e "${ORANGE}│  ├─ ${GREEN}./tools/network/nmap-wrapper.sh 192.168.1.1 full${NC}"
echo -e "${ORANGE}│  └─ ${GREEN}./tools/network/masscan-wrapper.sh 192.168.1.0/24${NC}"

echo -e "${YELLOW}├─ SCENARIO 3: WEB APPLICATION ASSESSMENT${NC}"
echo -e "${YELLOW}│  ├─ ${GREEN}./tools/web/gobuster-wrapper.sh dir http://target.com${NC}"
echo -e "${YELLOW}│  ├─ ${GREEN}./tools/vulnerability/nikto-wrapper.sh http://target.com${NC}"
echo -e "${YELLOW}│  └─ ${GREEN}./tools/vulnerability/nuclei-wrapper.sh http://target.com${NC}"

# ⚠️ OPERATIONAL SECURITY
echo -e "${RED}"
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                        OPERATIONAL SECURITY                              │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${RED}├─ SECURITY PROTOCOLS:${NC}"
echo -e "${RED}│  ├─ ${WHITE}ALL OPERATIONS REQUIRE PROPER AUTHORIZATION${NC}"
echo -e "${RED}│  ├─ ${WHITE}MAINTAIN OPERATIONAL SECURITY AT ALL TIMES${NC}"
echo -e "${RED}│  ├─ ${WHITE}SECURE COMMUNICATIONS FOR SENSITIVE OPERATIONS${NC}"
echo -e "${RED}│  └─ ${WHITE}FOLLOW RULES OF ENGAGEMENT FOR EACH MISSION${NC}"

echo -e "${RED}├─ LEGAL COMPLIANCE:${NC}"
echo -e "${RED}│  ├─ ${YELLOW}READ AND UNDERSTAND LEGAL.MD BEFORE DEPLOYMENT${NC}"
echo -e "${RED}│  ├─ ${YELLOW}OBTAIN WRITTEN AUTHORIZATION FOR ALL TESTING${NC}"
echo -e "${RED}│  └─ ${YELLOW}REPORT FINDINGS THROUGH PROPER CHANNELS${NC}"

# 📈 OPERATIONAL STATISTICS
echo -e "${PURPLE}"
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                        OPERATIONAL STATISTICS                            │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${CYAN}┌─ TOOL DISTRIBUTION BY CATEGORY${NC}"
for category_dir in tools/*/; do
    category=$(basename "$category_dir")
    tool_count=$(find "$category_dir" -name "*.sh" -o -name "*.py" | grep -E "(wrapper\.sh|\.py)" | grep -v "__pycache__" | wc -l)
    operational_in_category=0
    
    for tool in "$category_dir"*; do
        if [[ -f "$tool" && -x "$tool" ]]; then
            ((operational_in_category++))
        fi
    done
    
    percentage=$(( (operational_in_category * 100) / tool_count ))
    
    # Create progress bar
    bar=""
    for ((i=0; i<20; i++)); do
        if (( i < percentage / 5 )); then
            bar+="${GREEN}■${NC}"
        else
            bar+="${RED}□${NC}"
        fi
    done
    
    printf "${CYAN}│  %-15s: %2d/%-2d tools [%s] %3d%%${NC}\n" "$category" "$operational_in_category" "$tool_count" "$bar" "$percentage"
done
echo -e "${CYAN}└─────────────────────────────────────────────────────────────────────────────${NC}"

# 🎯 FINAL OPERATIONAL BRIEF
echo -e "${GREEN}"
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo -e "│                         OPERATIONAL BRIEFING                             │"
echo -e "└─────────────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${WHITE}Mission: Cybertoolkit Operational Deployment${NC}"
echo -e "${WHITE}Status: ${GREEN}READY FOR DEPLOYMENT${NC}"
echo -e "${WHITE}Readiness: ${YELLOW}$readiness_score%${NC}"
echo -e "${WHITE}Next Action: ${CYAN}Execute operational scenarios as required${NC}"

echo -e "\n${RED}⚠️  516 HACKERS OPERATIONAL SECURITY NOTICE:${NC}"
echo -e "${YELLOW}All tools are for authorized security operations only.${NC}"
echo -e "${YELLOW}Maintain operational security and legal compliance at all times.${NC}"
echo -e "${YELLOW}Report through proper channels and follow ethical guidelines.${NC}"

echo -e "\n${BLUE}« OPERATION CYBERTOOLKIT - 516 HACKERS »${NC}"
echo -e "${WHITE}$(date) | CLEARANCE: OPERATIONAL | CLASSIFICATION: RESTRICTED${NC}"
