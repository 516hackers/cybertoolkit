#!/bin/bash
# Subfinder Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/subfinder_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Subfinder Wrapper - Starting subdomain discovery"

if ! command -v subfinder &> /dev/null; then
    echo "Error: subfinder not found. Install with:"
    echo "  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <domain>"
    echo "Example: $0 example.com"
    exit 1
fi

DOMAIN=$1

echo "[516] Scanning domain: $DOMAIN"
subfinder -d "$DOMAIN" -silent

echo "[516] Subdomain discovery completed"
} | tee -a "$LOG_FILE"
