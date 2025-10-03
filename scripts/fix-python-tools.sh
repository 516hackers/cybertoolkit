
echo "🐍 Fixing Python tool permissions..."

# Fix theHarvester
if [ -f "tools/reconnaissance/theHarvester/run_theharvester.py" ]; then
    chmod +x tools/reconnaissance/theHarvester/run_theharvester.py
    echo "✅ Fixed: theHarvester"
fi

# Fix metadata extractor
if [ -f "tools/analysis/metadata-extractor.py" ]; then
    chmod +x tools/analysis/metadata-extractor.py
    echo "✅ Fixed: Metadata Extractor"
fi

# Fix OSINT lookup
if [ -f "tools/utils/osint_lookup.py" ]; then
    chmod +x tools/utils/osint_lookup.py
    echo "✅ Fixed: OSINT Lookup"
fi

echo "🎉 Python tools are now executable!"
