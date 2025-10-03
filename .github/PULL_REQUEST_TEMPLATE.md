# 🔄 Pull Request Template

```
---
name: "🔧 Pull Request"
about: Submit changes to Cybertoolkit
title: '[PR TYPE]: Brief description of changes'
labels: ['pull-request', 'triage']
assignees: ''

---
```

# 🔧 Pull Request

## 📋 PR Checklist

### Legal & Ethical Compliance
- [ ] I have read and understood the [LEGAL.md](../LEGAL.md) document
- [ ] This contribution complies with ethical security practices
- [ ] I have the rights to contribute this code
- [ ] This code is intended for authorized security testing only
- [ ] I am not introducing any malicious code or backdoors

### Code Quality
- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works

### Testing
- [ ] Tested on Kali Linux
- [ ] Tested on Termux (if applicable)
- [ ] All ShellCheck tests pass
- [ ] Python code follows PEP8 standards
- [ ] No breaking changes to existing functionality

## 🎯 PR Type

Please delete options that are NOT relevant:

- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] 🚀 New tool (non-breaking change which adds functionality)
- [ ] 📚 Documentation update
- [ ] 🎨 Code refactoring
- [ ] 🔧 Configuration changes
- [ ] 💡 Feature enhancement (non-breaking)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 🧹 Maintenance (dependencies, cleanup, etc.)

## 📝 Description

<!-- Please include a summary of the change and which issue is fixed. Please also include relevant motivation and context. -->

### Related Issue
<!-- If this PR addresses an issue, please link it here -->
Fixes: #`[issue-number]`

### Changes Made
<!-- List the main changes in this PR -->

1. `[Change 1]`
2. `[Change 2]`
3. `[Change 3]`

## 🧪 Testing Performed

### Platform Testing
**Kali Linux:**
- [ ] Installation works correctly
- [ ] All modified tools function as expected
- [ ] No regression in existing functionality
- [ ] Logging works properly

**Termux:**
- [ ] Installation works correctly (if applicable)
- [ ] All modified tools function as expected
- [ ] No regression in existing functionality
- [ ] Logging works properly

### Tool-Specific Testing
<!-- For new tools or tool modifications -->

**Tool:** `[Tool Name]`
- [ ] Wrapper script executes without errors
- [ ] Proper error handling for missing dependencies
- [ ] Logging to correct location
- [ ] Help/usage information displays correctly
- [ ] Cross-platform compatibility verified

### Security Testing
- [ ] No hardcoded credentials
- [ ] Input validation prevents command injection
- [ ] No sensitive information exposed
- [ ] Follows principle of least privilege

## 📊 Validation Results

### ShellCheck Results
```bash
# Run ShellCheck on modified shell scripts
shellcheck scripts/*.sh tools/**/*.sh
```
**Output:**
```
[Paste ShellCheck output here - should show no errors]
```

### Python Code Quality
```bash
# Check Python code quality
python3 -m py_compile tools/**/*.py
flake8 tools/**/*.py  # if available
```
**Output:**
```
[Paste Python validation output here]
```

### Installation Test
```bash
# Test installation process
./scripts/install-all.sh
./scripts/check-env.sh
```
**Output:**
```
[Paste environment check output here]
```

## 🔍 Code Review Checklist

### For New Tools
- [ ] Follows the wrapper script template
- [ ] Includes comprehensive README.md
- [ ] Supports both Kali Linux and Termux (where possible)
- [ ] Includes proper error handling
- [ ] Has automated logging
- [ ] Includes usage examples
- [ ] Legal compliance notices included

### For Bug Fixes
- [ ] Root cause identified and addressed
- [ ] Fix doesn't introduce new issues
- [ ] Test cases added/updated
- [ ] Documentation updated if needed

### For Documentation
- [ ] Clear and concise language
- [ ] Practical examples included
- [ ] Legal and ethical usage notes
- [ ] Cross-references to related content

## 📁 Files Modified

### Added Files
```
[List new files added]
- path/to/new-file.sh
- path/to/new-file.md
```

### Modified Files
```
[List existing files modified]
- path/to/modified-file.sh
- path/to/updated-documentation.md
```

### Removed Files
```
[List files removed (if any)]
- path/to/removed-file.sh
```

## 🎨 Screenshots / Output Examples

<!-- If applicable, add screenshots or command output to demonstrate changes -->

### Before Changes
```bash
# Example of previous behavior
[Command and output before changes]
```

### After Changes
```bash
# Example of new behavior
[Command and output after changes]
```

## 🌐 Cross-Platform Compatibility

### Kali Linux Specific Changes
```bash
# Kali-specific functionality (if any)
[Describe any Kali-specific implementations]
```

### Termux Specific Changes
```bash
# Termux-specific functionality (if any)
[Describe any Termux-specific implementations]
```

### Platform-Agnostic Code
```bash
# Code that works on both platforms
[Describe cross-platform implementations]
```

## 📚 Documentation Updates

### Updated Documentation
- [ ] README.md
- [ ] Tool-specific README files
- [ ] Installation guides
- [ ] Usage examples
- [ ] API documentation (if applicable)

### Documentation Changes Made
<!-- Describe what documentation was updated and why -->

1. `[Documentation change 1]`
2. `[Documentation change 2]`

## 🔧 Technical Details

### Dependencies Added/Modified
```bash
# New dependencies required
[List new package dependencies]

# Updated dependencies
[List updated package versions]
```

### Configuration Changes
```bash
# Any configuration file changes
[Describe config changes]
```

### Performance Impact
- [ ] No performance regression
- [ ] Memory usage within acceptable limits
- [ ] Network usage optimized
- [ ] Storage requirements documented

## 🚀 Deployment Notes

### Migration Requirements
<!-- If this PR requires any migration steps -->
```bash
# Steps users need to take after merging
[Describe any migration steps]
```

### Breaking Changes
<!-- If this PR contains breaking changes -->
```bash
# What breaks and how to fix
[Describe breaking changes and migration path]
```

## 🤝 Community Impact

### User Experience
- [ ] Backward compatibility maintained
- [ ] Clear upgrade path provided
- [ ] User documentation updated
- [ ] Examples and tutorials updated

### Contributor Experience
- [ ] Code follows project conventions
- [ ] Documentation for contributors updated if needed
- [ ] Testing procedures documented

## 📈 Performance Metrics

<!-- If applicable, include performance benchmarks -->

### Before Changes
```bash
# Performance metrics before changes
[Command execution time, memory usage, etc.]
```

### After Changes
```bash
# Performance metrics after changes
[Command execution time, memory usage, etc.]
```

## 🔒 Security Assessment

### Security Review
- [ ] No new security vulnerabilities introduced
- [ ] Input validation implemented where needed
- [ ] Secure coding practices followed
- [ ] Dependency security reviewed

### Ethical Considerations
- [ ] Tool usage clearly documented as ethical-only
- [ ] No functionality that enables unauthorized access
- [ ] Legal compliance maintained

## 📝 Additional Notes

<!-- Add any other information that would be helpful for reviewers -->

### Implementation Decisions
<!-- Explain why you implemented the solution this way -->

### Alternative Approaches Considered
<!-- What other solutions did you consider and why did you choose this one? -->

### Future Work
<!-- Any follow-up work that might be needed -->

## ✅ Final Checklist

- [ ] I have reviewed the [Contributing Guidelines](../CONTRIBUTING.md)
- [ ] I have added appropriate tests
- [ ] I have updated all relevant documentation
- [ ] I have verified the changes work on supported platforms
- [ ] I have not introduced any security issues
- [ ] I have followed the project's code style
- [ ] I have squashed my commits (if requested)

## 🙏 Acknowledgments

<!-- Credit any contributors, resources, or inspiration -->

- `[Acknowledgement 1]`
- `[Acknowledgement 2]`

---

**By submitting this pull request, I confirm that:**

1. ✅ I have the right to submit this code under the project's license
2. ✅ I have read and comply with the project's legal and ethical guidelines
3. ✅ My contribution is intended for authorized security testing only
4. ✅ I have tested these changes thoroughly
5. ✅ I am available to address review comments and make necessary changes

## 📞 Contact Information

**Primary Contributor:** `[Your Name]`  
**GitHub:** `[@yourusername]`  
**Email:** `[your.email@example.com]` (optional)  
**Availability for Review:** `[Days/Times you're available]`

---

**Thank you for contributing to Cybertoolkit!** 🛡️

*Together, we're building better tools for the ethical security community.*
