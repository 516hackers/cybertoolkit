#!/bin/bash
# WHOIS Wrapper - 516 Hackers Toolkit
# Legal: Only use on authorized targets

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/whois_$(date +%Y%m%d_%H%M%S).log"

echo "[516] WHOIS Wrapper - Starting investigation" | tee -a "$LOG_FILE"

# Check if whois is installed
if ! command -v whois &> /dev/null; then
    echo "Error: whois not found. Install with:" | tee -a "$LOG_FILE"
    echo "  Kali: sudo apt install whois" | tee -a "$LOG_FILE"
    echo "  Termux: pkg install whois" | tee -a "$LOG_FILE"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <domain>" | tee -a "$LOG_FILE"
    echo "Example: $0 example.com" | tee -a "$LOG_FILE"
    exit 1
fi

DOMAIN=$1

echo "[516] Target: $DOMAIN" | tee -a "$LOG_FILE"
echo "[516] Starting WHOIS lookup..." | tee -a "$LOG_FILE"

whois "$DOMAIN" | tee -a "$LOG_FILE"

echo "[516] WHOIS investigation completed" | tee -a "$LOG_FILE"
