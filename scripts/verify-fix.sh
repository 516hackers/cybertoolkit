

echo "✅ 516 Hackers - Verification Script"
echo "==================================="

echo "🔧 Testing wrapper scripts..."

# Test each wrapper
tools=(
    "tools/reconnaissance/whois-wrapper.sh example.com"
    "tools/network/nmap-wrapper.sh scanme.nmap.org quick"
    "tools/web/gobuster-wrapper.sh dir http://example.com"
    "tools/vulnerability/nikto-wrapper.sh http://example.com"
)

for tool_cmd in "${tools[@]}"; do
    tool=$(echo "$tool_cmd" | cut -d' ' -f1)
    if [ -f "$tool" ]; then
        # Test if wrapper runs without permission errors
        timeout 10s $tool_cmd > /dev/null 2>&1
        if [ $? -eq 0 ] || [ $? -eq 124 ]; then
            echo "✅ $tool - WORKING"
        else
            echo "❌ $tool - FAILED"
        fi
    else
        echo "⚠️  $tool - NOT FOUND"
    fi
done

echo ""
echo "📁 Checking logs directory..."
if [ -d "logs" ]; then
    echo "✅ Logs directory exists"
    log_count=$(find logs -name "*.log" 2>/dev/null | wc -l)
    echo "   Log files: $log_count"
else
    echo "❌ Logs directory missing"
fi

echo ""
echo "🎉 Verification complete!"
