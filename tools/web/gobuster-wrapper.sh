#!/bin/bash
# Gobuster Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/gobuster_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Gobuster Wrapper - Starting directory brute-forcing"

if ! command -v gobuster &> /dev/null; then
    echo "Error: gobuster not found. Install with:"
    echo "  Kali: sudo apt install gobuster"
    echo "  Go: go install github.com/OJ/gobuster/v3@latest"
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "Usage: $0 <mode> <target> [wordlist]"
    echo "Modes: dir, dns, vhost"
    echo "Example: $0 dir http://example.com /usr/share/wordlists/dirb/common.txt"
    exit 1
fi

MODE=$1
TARGET=$2
WORDLIST=${3:-/usr/share/wordlists/dirb/common.txt}

echo "[516] Mode: $MODE"
echo "[516] Target: $TARGET"

case $MODE in
    "dir")
        gobuster dir -u "$TARGET" -w "$WORDLIST"
        ;;
    "dns")
        gobuster dns -d "$TARGET" -w "$WORDLIST"
        ;;
    "vhost")
        gobuster vhost -u "$TARGET" -w "$WORDLIST"
        ;;
    *)
        echo "[516] Unknown mode. Using directory mode."
        gobuster dir -u "$TARGET" -w "$WORDLIST"
        ;;
esac

echo "[516] Gobuster scan completed"
} | tee -a "$LOG_FILE"
