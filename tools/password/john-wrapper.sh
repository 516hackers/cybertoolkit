#!/bin/bash
# John the Ripper Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/john_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] John the Ripper Wrapper - Starting password cracking"

if ! command -v john &> /dev/null; then
    echo "Error: john not found. Install with:"
    echo "  Kali: sudo apt install john"
    echo "  Termux: pkg install john"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <hash_file> [options]"
    echo "Examples:"
    echo "  $0 hashes.txt                  # Auto detect hash type"
    echo "  $0 hashes.txt --format=md5     # Specify hash format"
    echo "  $0 hashes.txt --wordlist=rockyou.txt # Wordlist attack"
    exit 1
fi

HASH_FILE=$1
shift

echo "[516] Processing hash file: $HASH_FILE"

john "$HASH_FILE" "$@"

echo "[516] Password cracking session completed"
echo "[516] Show results with: john --show $HASH_FILE"
} | tee -a "$LOG_FILE"
