#!/bin/bash
# Gobuster Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/gobuster_$(date +%Y%m%d_%H%M%S).log"

echo "[516] Gobuster Wrapper - Starting directory brute-forcing" | tee -a "$LOG_FILE"

if ! command -v gobuster &> /dev/null; then
    echo "Error: gobuster not found. Install with:" | tee -a "$LOG_FILE"
    echo "  Kali: sudo apt install gobuster" | tee -a "$LOG_FILE"
    echo "  Go: go install github.com/OJ/gobuster/v3@latest" | tee -a "$LOG_FILE"
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "Usage: $0 <mode> <target> [wordlist]" | tee -a "$LOG_FILE"
    echo "Modes: dir, dns, vhost" | tee -a "$LOG_FILE"
    echo "Example: $0 dir http://example.com /usr/share/wordlists/dirb/common.txt" | tee -a "$LOG_FILE"
    exit 1
fi

MODE=$1
TARGET=$2
WORDLIST=${3:-/usr/share/wordlists/dirb/common.txt}

echo "[516] Mode: $MODE" | tee -a "$LOG_FILE"
echo "[516] Target: $TARGET" | tee -a "$LOG_FILE"

case $MODE in
    "dir")
        gobuster dir -u "$TARGET" -w "$WORDLIST" | tee -a "$LOG_FILE"
        ;;
    "dns")
        gobuster dns -d "$TARGET" -w "$WORDLIST" | tee -a "$LOG_FILE"
        ;;
    "vhost")
        gobuster vhost -u "$TARGET" -w "$WORDLIST" | tee -a "$LOG_FILE"
        ;;
    *)
        echo "[516] Unknown mode. Using directory mode." | tee -a "$LOG_FILE"
        gobuster dir -u "$TARGET" -w "$WORDLIST" | tee -a "$LOG_FILE"
        ;;
esac

echo "[516] Gobuster scan completed" | tee -a "$LOG_FILE"
