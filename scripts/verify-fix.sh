
echo "✅ Verification Script - 516 Hackers"
echo "===================================="

echo "🔧 Testing tool wrappers..."

# Test each category
echo ""
echo "🔍 RECONNAISSANCE TOOLS:"
./tools/reconnaissance/whois-wrapper.sh example.com > /dev/null 2>&1 && echo "✅ WHOIS wrapper" || echo "❌ WHOIS wrapper"

echo ""
echo "🌐 NETWORK TOOLS:"
./tools/network/nmap-wrapper.sh scanme.nmap.org quick > /dev/null 2>&1 && echo "✅ Nmap wrapper" || echo "❌ Nmap wrapper"

echo ""
echo "🕸️ WEB TOOLS:"
./tools/web/gobuster-wrapper.sh dir http://example.com > /dev/null 2>&1 && echo "✅ Gobuster wrapper" || echo "❌ Gobuster wrapper"

echo ""
echo "🎯 VULNERABILITY TOOLS:"
./tools/vulnerability/nikto-wrapper.sh http://example.com > /dev/null 2>&1 && echo "✅ Nikto wrapper" || echo "❌ Nikto wrapper"

echo ""
echo "📊 Checking logs directory..."
if [ -d "logs" ]; then
    echo "✅ Logs directory exists"
    echo "   Files in logs: $(ls logs/ | wc -l)"
else
    echo "❌ Logs directory missing"
fi

echo ""
echo "🎉 Verification complete!"
