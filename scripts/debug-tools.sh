
echo "🐛 Debugging Tool Issues"
echo "========================"

echo "📁 Current directory: $(pwd)"
echo "👤 User: $(whoami)"
echo "🔍 Permissions:"

# Check specific tools
tools_to_check=(
    "tools/reconnaissance/whois-wrapper.sh"
    "tools/reconnaissance/theHarvester/run_theharvester.py"
    "tools/network/nmap-wrapper.sh"
    "tools/web/gobuster-wrapper.sh"
    "tools/vulnerability/nikto-wrapper.sh"
)

for tool in "${tools_to_check[@]}"; do
    if [ -f "$tool" ]; then
        echo "🔧 $tool:"
        echo "   Permissions: $(ls -la "$tool" | cut -d' ' -f1)"
        echo "   Exists: YES"
        # Check if executable
        if [ -x "$tool" ]; then
            echo "   Executable: ✅ YES"
        else
            echo "   Executable: ❌ NO"
            echo "   Fixing permissions..."
            chmod +x "$tool"
        fi
    else
        echo "🔧 $tool: ❌ NOT FOUND"
    fi
    echo ""
done

echo "📁 Logs directory:"
ls -la logs/ 2>/dev/null || echo "Logs directory not found"

echo "🎯 Testing basic functionality..."
./tools/reconnaissance/whois-wrapper.sh example.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ WHOIS wrapper working"
else
    echo "❌ WHOIS wrapper failed"
fi
