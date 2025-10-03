#!/bin/bash
# Cybertoolkit Installer - 516 Hackers Toolkit

set -e

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                516 Hackers - Cybertoolkit                   ║"
echo "║                 Complete Installation Script                ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "📋 LEGAL NOTICE: This toolkit is for authorized testing only."
echo "   By continuing, you agree to use these tools ethically and"
echo "   only on systems you have permission to test."
echo ""

read -p "❓ Do you agree to use this toolkit ethically and legally? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Installation cancelled. Legal consent required."
    exit 1
fi

echo "✅ Legal consent confirmed. Starting installation..."
echo ""

# Detect platform
if [[ "$OSTYPE" == "linux-android"* ]]; then
    PLATFORM="termux"
    echo "📱 Platform detected: Termux"
elif [[ -f "/etc/debian_version" ]] || grep -q "Kali" /etc/os-release 2>/dev/null; then
    PLATFORM="kali"
    echo "🐉 Platform detected: Kali Linux"
else
    PLATFORM="unknown"
    echo "❓ Platform: Unknown (attempting generic Linux)"
fi

install_kali() {
    echo ""
    echo "🔧 Installing Kali Linux packages..."
    sudo apt update
    
    # Basic tools
    sudo apt install -y whois nmap masscan nikto gobuster dirb
    
    # Python tools
    pip3 install theharvester pdfplumber Pillow
    
    echo "✅ Kali Linux packages installed"
}

install_termux() {
    echo ""
    echo "🔧 Installing Termux packages..."
    pkg update
    
    # Basic tools
    pkg install -y whois nmap python
    
    # Python tools
    pip install theharvester pdfplumber Pillow
    
    echo "✅ Termux packages installed"
}

install_go_tools() {
    echo ""
    echo "🔧 Installing Go-based tools..."
    
    if command -v go &> /dev/null; then
        echo "📦 Installing Go tools..."
        
        # Subfinder
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
        
        # Nuclei
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
        
        # FFUF
        go install github.com/ffuf/ffuf@latest
        
        echo "✅ Go tools installed"
    else
        echo "⚠️  Go not installed. Skipping Go-based tools."
    fi
}

make_executable() {
    echo ""
    echo "🔧 Making wrapper scripts executable..."
    find ../tools -name "*.sh" -exec chmod +x {} \;
    find ../tools -name "*.py" -exec chmod +x {} \;
    echo "✅ Wrapper scripts made executable"
}

# Main installation
case $PLATFORM in
    "kali")
        install_kali
        ;;
    "termux")
        install_termux
        ;;
    *)
        echo "⚠️  Unknown platform. Attempting basic installation..."
        ;;
esac

install_go_tools
make_executable

echo ""
echo "🎉 Installation completed!"
echo ""
echo "📚 Next steps:"
echo "   1. Review the tools in the tools/ directory"
echo "   2. Read the LEGAL.md file for usage guidelines"
echo "   3. Start with: ./tools/reconnaissance/whois-wrapper.sh example.com"
echo ""
echo "🔐 Remember: Always get proper authorization before testing!"
