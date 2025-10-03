#!/bin/bash
# FFUF Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/ffuf_$(date +%Y%m%d_%H%M%S).log"

echo "[516] FFUF Wrapper - Starting fast web fuzzing" | tee -a "$LOG_FILE"

if ! command -v ffuf &> /dev/null; then
    echo "Error: ffuf not found. Install with:" | tee -a "$LOG_FILE"
    echo "  Go: go install github.com/ffuf/ffuf@latest" | tee -a "$LOG_FILE"
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "Usage: $0 <url> <wordlist> [options]" | tee -a "$LOG_FILE"
    echo "Example: $0 http://example.com/FUZZ /usr/share/wordlists/dirb/common.txt" | tee -a "$LOG_FILE"
    exit 1
fi

URL=$1
WORDLIST=$2

echo "[516] Target: $URL" | tee -a "$LOG_FILE"
echo "[516] Wordlist: $WORDLIST" | tee -a "$LOG_FILE"

ffuf -u "$URL" -w "$WORDLIST" -c -v | tee -a "$LOG_FILE"

echo "[516] FFUF fuzzing completed" | tee -a "$LOG_FILE"
