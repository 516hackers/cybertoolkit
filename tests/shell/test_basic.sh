#!/bin/bash
# Basic functionality tests

echo "Running basic tests..."

# Test script syntax
echo "🔍 Checking shell scripts with shellcheck..."
find ../tools -name "*.sh" -exec shellcheck {} \;

# Test Python syntax
echo "🔍 Checking Python scripts..."
find ../tools -name "*.py" -exec python3 -m py_compile {} \;

echo "✅ Basic tests completed"
