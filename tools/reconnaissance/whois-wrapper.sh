
set -e

LOG_DIR="./logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/whois_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] WHOIS Wrapper - Starting investigation"

# Check if whois is installed
if ! command -v whois &> /dev/null; then
    echo "Error: whois not found. Install with:"
    echo "  Kali: sudo apt install whois"
    echo "  Termux: pkg install whois"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <domain>"
    echo "Example: $0 example.com"
    exit 1
fi

DOMAIN=$1

echo "[516] Target: $DOMAIN"
echo "[516] Starting WHOIS lookup..."

whois "$DOMAIN"

echo "[516] WHOIS investigation completed"
} | tee -a "$LOG_FILE"
