#!/bin/bash
# Nmap Wrapper - 516 Hackers Toolkit
# Enhanced with 516 security scanning profiles

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/nmap_$(date +%Y%m%d_%H%M%S).log"

echo "[516] Nmap Wrapper - Starting network reconnaissance" | tee -a "$LOG_FILE"

if ! command -v nmap &> /dev/null; then
    echo "Error: nmap not found. Install with:" | tee -a "$LOG_FILE"
    echo "  Kali: sudo apt install nmap" | tee -a "$LOG_FILE"
    echo "  Termux: pkg install nmap" | tee -a "$LOG_FILE"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "516 Hackers - Nmap Wrapper" | tee -a "$LOG_FILE"
    echo "Usage: $0 <target> [scan_type]" | tee -a "$LOG_FILE"
    echo "Scan types:" | tee -a "$LOG_FILE"
    echo "  quick    - TCP SYN quick scan (default)" | tee -a "$LOG_FILE"
    echo "  stealth  - Stealth SYN scan" | tee -a "$LOG_FILE"
    echo "  full     - Full TCP connect scan" | tee -a "$LOG_FILE"
    echo "  udp      - UDP port scan" | tee -a "$LOG_FILE"
    echo "  vuln     - Vulnerability scan" | tee -a "$LOG_FILE"
    echo "Example: $0 192.168.1.1 quick" | tee -a "$LOG_FILE"
    exit 1
fi

TARGET=$1
SCAN_TYPE=${2:-quick}

echo "[516] Target: $TARGET" | tee -a "$LOG_FILE"
echo "[516] Scan Type: $SCAN_TYPE" | tee -a "$LOG_FILE"

case $SCAN_TYPE in
    "quick")
        nmap -sS -T4 -F "$TARGET" | tee -a "$LOG_FILE"
        ;;
    "stealth")
        nmap -sS -T2 -f "$TARGET" | tee -a "$LOG_FILE"
        ;;
    "full")
        nmap -sT -A -p- "$TARGET" | tee -a "$LOG_FILE"
        ;;
    "udp")
        nmap -sU --top-ports 100 "$TARGET" | tee -a "$LOG_FILE"
        ;;
    "vuln")
        nmap -sS --script vuln "$TARGET" | tee -a "$LOG_FILE"
        ;;
    *)
        echo "[516] Unknown scan type. Using quick scan." | tee -a "$LOG_FILE"
        nmap -sS -T4 -F "$TARGET" | tee -a "$LOG_FILE"
        ;;
esac

echo "[516] Network reconnaissance completed" | tee -a "$LOG_FILE"
