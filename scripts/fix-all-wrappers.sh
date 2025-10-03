
set -e

echo "🛠️  516 Hackers - Comprehensive Wrapper Fix"
echo "==========================================="

# Create logs directory
echo "📁 Creating logs directory..."
mkdir -p logs

# List of all wrapper scripts to fix
wrappers=(
    "tools/reconnaissance/whois-wrapper.sh"
    "tools/reconnaissance/subfinder-wrapper.sh"
    "tools/network/nmap-wrapper.sh"
    "tools/network/masscan-wrapper.sh"
    "tools/network/rustscan-wrapper.sh"
    "tools/web/gobuster-wrapper.sh"
    "tools/web/ffuf-wrapper.sh"
    "tools/web/dirb-wrapper.sh"
    "tools/vulnerability/nikto-wrapper.sh"
    "tools/vulnerability/nuclei-wrapper.sh"
    "tools/vulnerability/wpscan-wrapper.sh"
    "tools/password/john-wrapper.sh"
    "tools/password/hashcat-wrapper.sh"
    "tools/analysis/exiftool-wrapper.sh"
    "tools/utils/ffmpeg-wrapper.sh"
)

echo "🔧 Fixing log paths in wrapper scripts..."
for wrapper in "${wrappers[@]}"; do
    if [ -f "$wrapper" ]; then
        echo "Fixing: $wrapper"
        
        # Create temporary file
        temp_file=$(mktemp)
        
        # Process the file line by line
        while IFS= read -r line; do
            # Replace ../../logs with ./logs
            modified_line="${line//..\/..\/logs/.\/logs}"
            echo "$modified_line" >> "$temp_file"
        done < "$wrapper"
        
        # Replace original file
        mv "$temp_file" "$wrapper"
        
        # Make executable
        chmod +x "$wrapper"
        
        echo "✅ Fixed: $wrapper"
    else
        echo "⚠️  Not found: $wrapper"
    fi
done

# Fix Python scripts permissions
echo "🐍 Fixing Python script permissions..."
find tools -name "*.py" -exec chmod +x {} \; 2>/dev/null

echo ""
echo "🎉 All wrappers have been fixed!"
echo "📁 Logs directory: ./logs/"
echo ""
echo "🚀 Testing fixes..."
./tools/reconnaissance/whois-wrapper.sh example.com > /dev/null 2>&1 && echo "✅ WHOIS wrapper working" || echo "❌ WHOIS wrapper failed"
