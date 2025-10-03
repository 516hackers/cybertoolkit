#!/bin/bash
# Nmap Wrapper - 516 Hackers Toolkit
# Enhanced with 516 security scanning profiles

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/nmap_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Nmap Wrapper - Starting network reconnaissance"

if ! command -v nmap &> /dev/null; then
    echo "Error: nmap not found. Install with:"
    echo "  Kali: sudo apt install nmap"
    echo "  Termux: pkg install nmap"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "516 Hackers - Nmap Wrapper"
    echo "Usage: $0 <target> [scan_type]"
    echo "Scan types:"
    echo "  quick    - TCP SYN quick scan (default)"
    echo "  stealth  - Stealth SYN scan"
    echo "  full     - Full TCP connect scan"
    echo "  udp      - UDP port scan"
    echo "  vuln     - Vulnerability scan"
    echo "Example: $0 192.168.1.1 quick"
    exit 1
fi

TARGET=$1
SCAN_TYPE=${2:-quick}

echo "[516] Target: $TARGET"
echo "[516] Scan Type: $SCAN_TYPE"

case $SCAN_TYPE in
    "quick")
        nmap -sS -T4 -F "$TARGET"
        ;;
    "stealth")
        nmap -sS -T2 -f "$TARGET"
        ;;
    "full")
        nmap -sT -A -p- "$TARGET"
        ;;
    "udp")
        nmap -sU --top-ports 100 "$TARGET"
        ;;
    "vuln")
        nmap -sS --script vuln "$TARGET"
        ;;
    *)
        echo "[516] Unknown scan type. Using quick scan."
        nmap -sS -T4 -F "$TARGET"
        ;;
esac

echo "[516] Network reconnaissance completed"
} | tee -a "$LOG_FILE"
