# 🤝 Contributing to Cybertoolkit

Welcome to the 516 Hackers community! We're excited that you want to contribute to our ethical security toolkit. This guide will help you get started with contributing effectively.

## 🎯 Before You Start

### Legal & Ethical Requirements
- ✅ I have read and understood [LEGAL.md](LEGAL.md)
- ✅ I will only contribute tools for authorized security testing
- ✅ I have the rights to contribute the code I'm submitting
- ✅ My contributions comply with ethical security practices

### Required Knowledge
- Basic understanding of shell scripting (Bash)
- Familiarity with security tools and their ethical use
- Knowledge of Git and GitHub workflows
- Understanding of cross-platform compatibility (Kali Linux & Termux)

## 📋 Types of Contributions We Welcome

### 🛠️ New Security Tools
- **Reconnaissance tools**: Information gathering utilities
- **Network scanners**: Port and service discovery tools
- **Web application testers**: Directory scanners, vulnerability detectors
- **Analysis tools**: Forensics and data analysis utilities
- **Password security tools**: Hash crackers and analysis tools

### 📚 Documentation Improvements
- Tool usage guides and examples
- Installation instructions
- Troubleshooting guides
- Tutorials and walkthroughs

### 🐛 Bug Fixes & Enhancements
- Platform-specific fixes (Kali Linux, Termux)
- Performance improvements
- Security vulnerability patches
- User experience enhancements

## 🚀 Getting Started

### Step 1: Fork the Repository
1. Click the "Fork" button in the top-right of the repository page
2. Clone your fork locally:
```bash
git clone https://github.com/YOUR_USERNAME/cybertoolkit.git
cd cybertoolkit
```

### Step 2: Create a Feature Branch
```bash
git checkout -b feature/amazing-tool
# or
git checkout -b fix/bug-description
```

### Step 3: Set Up Development Environment
```bash
# Make all scripts executable
chmod +x scripts/*.sh
chmod +x tools/**/*.sh
chmod +x tools/**/*.py

# Test your environment
./scripts/check-env.sh
```

## 🏗️ Adding New Tools

### Tool Structure Requirements
Each new tool must follow this structure:
```
tools/category/tool-name/
├── tool-wrapper.sh          # Main wrapper script
├── README.md               # Tool documentation
├── requirements.txt        # Python dependencies (if any)
└── examples/              # Usage examples (optional)
    └── example-usage.txt
```

### Required Tool Categories
- **reconnaissance**: Information gathering tools
- **network**: Network scanning and enumeration
- **web**: Web application testing tools
- **vulnerability**: Vulnerability scanners
- **password**: Password security tools
- **analysis**: Forensic and analysis tools
- **utils**: Utility and helper tools

### Wrapper Script Template
```bash
#!/bin/bash
# Tool Name - 516 Hackers Toolkit
# Legal: Only use on authorized targets

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/tool_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Tool Name - Starting operation"

# Check if tool is installed
if ! command -v tool-command &> /dev/null; then
    echo "Error: tool-command not found. Install with:"
    echo "  Kali: sudo apt install package-name"
    echo "  Termux: pkg install package-name"
    echo "  Go: go install tool-repo@latest"
    exit 1
fi

# Validate arguments
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target> [options]"
    echo "Example: $0 example.com"
    exit 1
fi

TARGET=$1

echo "[516] Target: $TARGET"
echo "[516] Starting scan..."

# Your tool execution logic here
tool-command --option "$TARGET"

echo "[516] Operation completed successfully"
} | tee -a "$LOG_FILE"
```

### Tool README.md Template
```markdown
# Tool Name

## Purpose
Brief description of what the tool does and its use cases.

## Installation
### Kali Linux
```bash
sudo apt install package-name
```

### Termux
```bash
pkg install package-name
```

### Go Installation
```bash
go install github.com/tool/repo@latest
```

## Usage
```bash
./tool-wrapper.sh <target> [options]
```

## Examples
```bash
# Basic usage
./tool-wrapper.sh example.com

# With specific options
./tool-wrapper.sh 192.168.1.1 --option value
```

## Output Description
Explain what the tool outputs and how to interpret results.

## Legal Notice
This tool is for authorized security testing only. Always obtain proper permission before use.
```

## 📝 Code Standards

### Shell Script Standards
- Use `#!/bin/bash` shebang
- Include `set -e` for error handling
- Follow ShellCheck guidelines (no warnings)
- Use meaningful variable names
- Include proper error messages
- Support both Kali Linux and Termux when possible

### Python Script Standards
- Use `#!/usr/bin/env python3` shebang
- Follow PEP8 style guide
- Include type hints when possible
- Use meaningful function and variable names
- Include proper exception handling
- Add docstrings for all functions

### Documentation Standards
- Use clear, concise language
- Include practical examples
- Document all parameters and options
- Explain tool output interpretation
- Include legal and ethical usage notes

## 🧪 Testing Requirements

### Platform Testing Checklist
- [ ] **Kali Linux**: Test functionality and installation
- [ ] **Termux**: Test functionality and installation (if applicable)
- [ ] **Docker**: Verify container compatibility (if applicable)

### Functionality Testing
- [ ] Tool installs correctly on supported platforms
- [ ] Wrapper script executes without errors
- [ ] Logging works correctly
- [ ] Error handling functions properly
- [ ] Help/usage information displays correctly

### Security Testing
- [ ] No hardcoded credentials or sensitive information
- [ ] Input validation prevents command injection
- [ ] Tool doesn't create security vulnerabilities
- [ ] Follows principle of least privilege

## 🔍 Code Review Process

### What We Look For
1. **Legal Compliance**: Tools for authorized use only
2. **Code Quality**: Clean, maintainable code
3. **Documentation**: Comprehensive and clear
4. **Testing**: Works on supported platforms
5. **Security**: No vulnerabilities introduced

### Common Review Comments
- "Please add error handling for this case"
- "Consider adding input validation here"
- "Document this parameter in the README"
- "Test this on both Kali and Termux"
- "Add legal usage notice to documentation"

## 📤 Submitting Your Contribution

### Step 1: Update Your Fork
```bash
git fetch upstream
git merge upstream/main
```

### Step 2: Commit Your Changes
```bash
git add .
git commit -m "feat: add amazing-tool wrapper

- Add wrapper script for amazing-tool
- Include Kali and Termux installation support
- Add comprehensive documentation
- Test on both platforms

Fixes: #123"
```

### Commit Message Convention
- **feat**: New tool or feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes
- **refactor**: Code refactoring
- **test**: Test additions or fixes
- **chore**: Maintenance tasks

### Step 3: Push and Create Pull Request
```bash
git push origin feature/amazing-tool
```

Then create a Pull Request on GitHub with:
- Clear description of changes
- Testing results from both platforms
- Reference to any related issues

## 🚫 What We Don't Accept

### Prohibited Contributions
- ❌ Exploit code without responsible disclosure mechanisms
- ❌ Tools designed primarily for illegal activities
- ❌ Poorly documented or untested code
- ❌ Code that violates our ethical guidelines
- ❌ Tools with hardcoded credentials
- ❌ Malware or malicious scripts

### Restricted Tools
- Network stress testing tools (unless for authorized testing)
- Credential stealing utilities
- Exploits without proper disclosure processes
- Tools that violate privacy laws

## 🏆 Contribution Recognition

### How We Recognize Contributors
- **Contributor List**: Added to our contributors documentation
- **Release Notes**: Acknowledged in version releases
- **Community Recognition**: Featured in community updates
- **Maintainer Opportunities**: Consistent contributors may become maintainers

### Contributor Levels
- **First-time Contributor**: Welcome package and shout-out
- **Regular Contributor**: Added to contributors list
- **Core Contributor**: Maintainer responsibilities and decision input

## 🐛 Reporting Issues

### Bug Reports Should Include:
1. **Platform**: Kali Linux, Termux, or other
2. **Tool Version**: Specific version or commit
3. **Steps to Reproduce**: Clear reproduction steps
4. **Expected Behavior**: What should happen
5. **Actual Behavior**: What actually happens
6. **Logs**: Relevant log file contents
7. **Screenshots**: If applicable

### Security Vulnerability Reports
**Important**: If you find a security vulnerability, please report it responsibly:
1. **Do NOT create a public issue**
2. **Email**: security@516hackers.org (or use security advisory)
3. **Include**: Detailed description and reproduction steps
4. **Wait**: Allow time for fix before public disclosure

## 🔧 Development Setup

### Local Development Environment
```bash
# Clone and setup
git clone https://github.com/516hackers/cybertoolkit.git
cd cybertoolkit

# Install development dependencies
sudo apt install shellcheck  # For shell script linting
pip install bandit          # For Python security scanning

# Run tests
./tests/shell/test_basic.sh
```

### Using Docker for Development
```bash
# Build development image
docker build -t cybertoolkit-dev -f docker/Dockerfile .

# Run with volume mount for development
docker run -it --rm -v $(pwd):/workspace cybertoolkit-dev
```

## 📚 Learning Resources

### For New Contributors
- [Shell Scripting Guide](https://linuxcommand.org/lc3_writing_shell_scripts.php)
- [Git Handbook](https://guides.github.com/introduction/git-handbook/)
- [Security Tool Ethics](https://www.sans.org/reading-room/whitepapers/bestprac/penetration-testing-legal-issues-34115)

### Code Quality Tools
- **ShellCheck**: For shell script linting
- **Bandit**: For Python security scanning
- **Markdown Lint**: For documentation quality

## 🤔 Need Help?

### Getting Assistance
- **GitHub Discussions**: For questions and community help
- **Issue Templates**: For bug reports and feature requests
- **Documentation**: Check the `docs/` directory first
- **Code Review**: Ask specific questions in PR comments

### Mentorship Program
New contributors can request a mentor by:
1. Creating a "mentorship request" issue
2. Describing what you want to work on
3. Specifying what help you need

## 📜 Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

### Expected Behavior
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community

### Unacceptable Behavior
- The use of sexualized language or imagery
- Trolling, insulting/derogatory comments, or personal attacks
- Public or private harassment
- Publishing others' private information

## 🎉 Your First Contribution

### Good First Issues
Look for issues tagged with:
- `good-first-issue`
- `help-wanted`
- `documentation`

### Quick Start Projects
1. **Documentation improvements**
2. **Tool testing and validation**
3. **Example creation**
4. **Bug reproduction and reporting**

### Getting Your PR Merged
1. **Address all review comments**
2. **Ensure all tests pass**
3. **Update documentation as needed**
4. **Squash commits if requested**
5. **Get required approvals**

---

**Thank you for considering contributing to Cybertoolkit! Together, we can build amazing tools for the ethical security community.**

*Remember: With great power comes great responsibility. Always hack ethically!*
