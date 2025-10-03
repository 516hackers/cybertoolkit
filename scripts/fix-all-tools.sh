
echo "🛠️  516 Hackers - Comprehensive Tool Fix"
echo "========================================"

# Create logs directory
echo "📁 Creating logs directory..."
mkdir -p logs

# Fix all wrapper script paths
echo "🔧 Fixing wrapper script paths..."
find tools -name "*-wrapper.sh" -type f | while read -r script; do
    echo "Fixing: $script"
    sed -i 's|../../logs|./logs|g' "$script"
done

# Make all scripts executable
echo "🔐 Setting executable permissions..."
chmod +x tools/**/*.sh 2>/dev/null
chmod +x tools/**/*.py 2>/dev/null
chmod +x scripts/*.sh 2>/dev/null

# Fix specific Python scripts
echo "🐍 Fixing Python script permissions..."
find tools -name "*.py" -type f -exec chmod +x {} \;

echo "✅ All fixes applied!"
echo ""
echo "📋 Quick Test Commands:"
echo "  ./tools/reconnaissance/whois-wrapper.sh example.com"
echo "  ./tools/network/nmap-wrapper.sh scanme.nmap.org quick"
echo "  ./tools/web/gobuster-wrapper.sh dir http://example.com"
