#!/bin/bash
# FFUF Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/ffuf_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] FFUF Wrapper - Starting fast web fuzzing"

if ! command -v ffuf &> /dev/null; then
    echo "Error: ffuf not found. Install with:"
    echo "  Go: go install github.com/ffuf/ffuf@latest"
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "Usage: $0 <url> <wordlist> [options]"
    echo "Example: $0 http://example.com/FUZZ /usr/share/wordlists/dirb/common.txt"
    exit 1
fi

URL=$1
WORDLIST=$2

echo "[516] Target: $URL"
echo "[516] Wordlist: $WORDLIST"

ffuf -u "$URL" -w "$WORDLIST" -c -v

echo "[516] FFUF fuzzing completed"
} | tee -a "$LOG_FILE"
