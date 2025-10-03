#!/bin/bash
# Quick tools list - minimal version

echo "🔧 Cybertoolkit - Quick Tools Reference"
echo "========================================"

echo -e "\n🔍 RECONNAISSANCE"
echo "  whois-wrapper.sh        - Domain information lookup"
echo "  subfinder-wrapper.sh    - Subdomain discovery"
echo "  run_theharvester.py     - OSINT gathering"

echo -e "\n🌐 NETWORK"
echo "  nmap-wrapper.sh         - Network scanning"
echo "  masscan-wrapper.sh      - Mass port scanning"
echo "  rustscan-wrapper.sh     - Fast port scanning"

echo -e "\n🕸️ WEB"
echo "  gobuster-wrapper.sh     - Directory busting"
echo "  ffuf-wrapper.sh         - Web fuzzing"
echo "  dirb-wrapper.sh         - Web content scanner"

echo -e "\n🎯 VULNERABILITY"
echo "  nikto-wrapper.sh        - Web server scanner"
echo "  nuclei-wrapper.sh       - Vulnerability scanner"
echo "  wpscan-wrapper.sh       - WordPress security"

echo -e "\n🔐 PASSWORD"
echo "  john-wrapper.sh         - Password cracking"
echo "  hashcat-wrapper.sh      - Advanced password recovery"

echo -e "\n📊 ANALYSIS"
echo "  metadata-extractor.py   - File metadata analysis"
echo "  exiftool-wrapper.sh     - EXIF data extraction"

echo -e "\n🔧 UTILS"
echo "  osint_lookup.py         - OSINT gathering"
echo "  ffmpeg-wrapper.sh       - Media processing"
echo "  report_generator.py     - Report generation"

echo -e "\n💡 Usage: ./tools/category/tool-wrapper.sh [target]"
echo "📖 Example: ./tools/reconnaissance/whois-wrapper.sh example.com"
