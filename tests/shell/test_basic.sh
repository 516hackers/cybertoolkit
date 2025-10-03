#!/bin/bash
# Basic functionality tests

echo "Running basic tests..."

# Test script syntax
echo "🔍 Checking shell scripts with shellcheck..."
find ../tools -name "*.sh" -exec shellcheck {} \;

# Test Python syntax
echo "🔍 Checking Python scripts..."
python3 -m py_compile ../tools/utils/osint_lookup.py
python3 -m py_compile ../tools/analysis/metadata-extractor.py
python3 -m py_compile ../tools/reconnaissance/theHarvester/run_theharvester.py

echo "✅ Basic tests completed"
