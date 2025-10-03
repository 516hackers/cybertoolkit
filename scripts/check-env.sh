#!/bin/bash
# Environment Checker - 516 Hackers Toolkit

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                516 Hackers - Environment Check              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Platform detection
echo "🔍 Platform Information:"
if [[ "$OSTYPE" == "linux-android"* ]]; then
    echo "   📱 Platform: Termux"
elif [[ -f "/etc/debian_version" ]]; then
    if grep -q "Kali" /etc/os-release 2>/dev/null; then
        echo "   🐉 Platform: Kali Linux"
    else
        echo "   🐧 Platform: Debian-based Linux"
    fi
else
    echo "   ❓ Platform: $OSTYPE"
fi

echo ""
echo "📦 Tool Availability:"

tools=(
    "whois" "nmap" "masscan" "nikto" "gobuster" 
    "subfinder" "nuclei" "ffuf" "john" "python3"
)

for tool in "${tools[@]}"; do
    if command -v "$tool" &> /dev/null; then
        echo "   ✅ $tool"
    else
        echo "   ❌ $tool"
    fi
done

echo ""
echo "🐍 Python Modules:"

python_modules=(
    "theHarvester" "pdfplumber" "PIL" "requests"
)

for module in "${python_modules[@]}"; do
    if python3 -c "import $module" 2>/dev/null; then
        echo "   ✅ $module"
    else
        echo "   ❌ $module"
    fi
done

echo ""
echo "📊 System Information:"
echo "   Shell: $SHELL"
echo "   User: $(whoami)"
echo "   Directory: $(pwd)"

echo ""
echo "✅ Environment check completed"
