# 🐛 Issue Report Template

```
---
name: 🐛 Bug Report
about: Create a report to help us improve Cybertoolkit
title: '[BUG] Brief description of the issue'
labels: ['bug', 'triage']
assignees: ''

---

name: 🚀 Feature Request
about: Suggest an idea for Cybertoolkit
title: '[FEATURE] Brief feature description'
labels: ['enhancement', 'triage']
assignees: ''

---

name: 📚 Documentation Issue
about: Report an issue with documentation or suggest improvements
title: '[DOCS] Brief documentation issue'
labels: ['documentation', 'triage']
assignees: ''

---

name: 🔒 Security Issue
about: Report a security vulnerability (DO NOT DISCLOSE PUBLICLY)
title: '[SECURITY] Brief security concern'
labels: ['security']
assignees: ''

---
```

# 🐛 Bug Report

## Description
<!-- A clear and concise description of what the bug is -->

## Steps to Reproduce
1. Tool: `[which tool has the issue]`
2. Command: `[exact command used]`
3. Target: `[what you were testing]`
4. See error: `[what went wrong]`

**Expected behavior**
<!-- What you expected to happen -->

**Actual behavior**
<!-- What actually happened -->

## Environment
<!-- Please complete the following information -->

### Platform
- [ ] Kali Linux
- [ ] Termux (Android)
- [ ] Other Linux
- [ ] macOS
- [ ] Windows WSL
- [ ] Docker

### System Information
```bash
# Please provide if possible
uname -a
python3 --version
go version  # if applicable
```

### Tool Versions
```bash
# Relevant tool versions
nmap --version
nikto -Version
gobuster version
```

## Logs & Output
<!-- Please include relevant log files or command output -->

### Error Message
```
[Paste the exact error message here]
```

### Log File Content
<!-- Check logs/ directory for relevant log files -->
```
[Paste relevant log content here]
```

## Screenshots
<!-- If applicable, add screenshots to help explain your problem -->

## Additional Context
<!-- Add any other context about the problem here -->

---

# 🚀 Feature Request

## Problem Statement
<!-- Is your feature request related to a problem? Please describe -->

## Proposed Solution
<!-- Describe the solution you'd like -->

## Alternative Solutions
<!-- Describe alternatives you've considered -->

## Use Cases
<!-- How would this feature be used? Provide examples -->

### Example Usage
```bash
# How you envision using the new feature
./tools/new-feature-wrapper.sh target --new-option value
```

## Implementation Ideas
<!-- Technical thoughts on how this could be implemented -->

## Impact Assessment
- [ ] This feature would benefit multiple tools
- [ ] This is platform-agnostic (works on Kali & Termux)
- [ ] This follows ethical security practices
- [ ] This doesn't duplicate existing functionality

## Priority
- [ ] Low (nice to have)
- [ ] Medium (should have)
- [ ] High (must have)

---

# 📚 Documentation Issue

## Documentation Location
- [ ] README.md
- [ ] docs/installation.md
- [ ] docs/platform_notes.md
- [ ] docs/FAQ.md
- [ ] Tool-specific README
- [ ] CONTRIBUTING.md
- [ ] Other: `[please specify]`

## Issue Type
- [ ] Missing documentation
- [ ] Incorrect information
- [ ] Outdated content
- [ ] Typo/grammar error
- [ ] Formatting issue
- [ ] Broken links

## Description
<!-- Describe the documentation issue -->

### Current Content
```
[Paste current problematic content]
```

### Suggested Improvement
```
[Paste suggested improved content]
```

## Additional Context
<!-- Any other context about the documentation issue -->

---

# 🔒 Security Issue

## ⚠️ IMPORTANT: SECURITY DISCLOSURE GUIDELINES

**DO NOT disclose vulnerability details publicly**  
**This issue will be private to maintainers only**

## Vulnerability Type
- [ ] Code vulnerability
- [ ] Configuration issue
- [ ] Dependency vulnerability
- [ ] Ethical concern
- [ ] Other: `[please specify]`

## Severity Assessment
- [ ] Critical (immediate action required)
- [ ] High (address quickly)
- [ ] Medium (should be fixed)
- [ ] Low (informational)

## Description
<!-- High-level description without sensitive details -->

## Impact
<!-- What systems or users are affected? -->

## Steps for Private Disclosure
1. **Email security details to**: `[security contact email]`
2. **Encrypt sensitive information** using PGP if available
3. **Wait for maintainer response** before any public discussion
4. **Coordinate disclosure timeline** with maintainers

## Public References (if available)
<!-- Any public CVE, advisory, or reference without sensitive details -->

---

# 🎯 General Issue Guidelines

## Before Submitting

### For Bug Reports
- [ ] I've searched existing issues
- [ ] I've tested on both Kali and Termux (if applicable)
- [ ] I've included relevant log files
- [ ] I've verified the issue is reproducible

### For Feature Requests
- [ ] I've checked this doesn't duplicate existing features
- [ ] I've considered ethical implications
- [ ] I've thought about cross-platform compatibility

### For All Issues
- [ ] I've read the [LEGAL.md](LEGAL.md)
- [ ] I'm reporting authorized testing only
- [ ] I've included necessary environment details

## Issue Labels (Applied by Maintainers)

### Type Labels
- `bug` - Something isn't working
- `enhancement` - New feature or improvement
- `documentation` - Documentation issues
- `security` - Security vulnerabilities
- `question` - General questions

### Priority Labels
- `priority-critical` - Immediate attention required
- `priority-high` - Important issue
- `priority-medium` - Normal priority
- `priority-low` - Low priority

### Platform Labels
- `platform-kali` - Kali Linux specific
- `platform-termux` - Termux specific
- `platform-all` - Affects all platforms

### Status Labels
- `triage` - Needs initial review
- `needs-info` - Waiting for more information
- `in-progress` - Being worked on
- `fixed` - Issue resolved

## Providing Good Information

### For Tool Issues
```bash
# Please include these details when possible
./scripts/check-env.sh  # Environment check
which [tool-name]       # Tool location
[tool-name] --version   # Tool version
```

### For Installation Issues
```bash
# Include installation method details
cat /etc/os-release     # OS version
python3 --version       # Python version
go version              # Go version (if applicable)
```

### For Network-related Issues
```bash
# Network configuration details
ip addr show            # Network interfaces
ping -c 4 target.com    # Network connectivity
```

## Response Timeline

- **Initial Response**: Within 48 hours
- **Bug Fixes**: Depends on severity (1-30 days)
- **Feature Requests**: Evaluated in next planning cycle
- **Security Issues**: Immediate attention

## Legal Compliance

By submitting this issue, I confirm:
- [ ] I have proper authorization for any testing described
- [ ] I'm not disclosing sensitive target information
- [ ] I'm following responsible disclosure practices
- [ ] I've read and agree to the project's legal guidelines

---

**Thank you for helping improve Cybertoolkit!** 🛡️

*Remember: Quality issue reports help us fix problems faster and improve the toolkit for everyone.*
