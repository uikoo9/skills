# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains a comprehensive **Node.js Complete Guide Skill** for Claude Code - a complete knowledge base covering all Node.js core features, modules, APIs, and best practices.

## Repository Structure

```
skill-nodejs/
├── nodejs-expert/          # The Node.js Complete Guide Skill
│   ├── SKILL.md           # Core skill file (1200+ lines of Node.js knowledge)
│   ├── README.md          # Detailed installation and usage guide
│   ├── TEST.md            # Test cases for validating skill activation
│   ├── EXAMPLES.md        # 15+ real-world usage examples
│   └── install.sh         # Automated installation script
├── package.json           # Project metadata
└── CLAUDE.md             # This file
```

## What is This Skill?

The Node.js Complete Guide Skill is a comprehensive knowledge base that turns Claude Code into a Node.js expert, covering:

### Core Content (13 Major Sections)

1. **Core Concepts** - Event loop, Libuv, Node.js architecture
2. **Module System** - ESM vs CommonJS, module resolution
3. **All Core Modules** - 30+ modules including fs, http, crypto, streams, etc.
4. **Async Programming** - Callbacks, Promises, async/await, error handling
5. **Streams** - All 4 types (Readable, Writable, Duplex, Transform)
6. **File System** - Promise-based APIs, streaming, file watching
7. **Networking** - HTTP/HTTPS servers, TCP, DNS, fetch API
8. **Process Management** - Child processes, Worker Threads, Cluster
9. **Events** - EventEmitter, event patterns
10. **Buffers** - Binary data handling, encodings
11. **Cryptography** - Hashing, encryption, HMAC, post-quantum crypto
12. **Testing & Debugging** - node:test, assertions, mocking
13. **Performance** - Measurement, optimization, best practices

### Key Features

- ✅ **Complete coverage** of all Node.js core features
- ✅ **Modern syntax** - All examples use ESM and async/await
- ✅ **Runnable code** - Complete, production-ready examples
- ✅ **Best practices** - Security, performance, error handling
- ✅ **1200+ lines** of comprehensive documentation

## Installation

### For End Users

```bash
# Option 1: Copy to Claude Code skills directory
cp -r nodejs-expert ~/.claude/skills/

# Option 2: Use the automated installer
cd nodejs-expert
./install.sh

# Option 3: Create symlink (for development)
ln -s "$(pwd)/nodejs-expert" ~/.claude/skills/nodejs-complete-guide
```

### For Claude Desktop/Web

```bash
cd nodejs-expert
zip -r nodejs-complete-guide.zip .
# Then drag the ZIP to Claude Desktop or Web interface
```

## Development Guidelines

### Updating the Skill

When updating `SKILL.md`:

1. **Maintain structure** - Keep the 13-section organization
2. **Use modern syntax** - ESM imports with `node:` prefix, async/await
3. **Include complete examples** - Code should be runnable as-is
4. **Add error handling** - All examples should handle errors properly
5. **Explain the "why"** - Not just "how to do it" but "why this way"
6. **Update version info** - Keep Node.js version current (v25.6.0 as of 2026)

### Code Style in SKILL.md

```javascript
// ✅ Good - Modern, complete, runnable
import { readFile } from 'node:fs/promises';

async function loadConfig() {
  try {
    const data = await readFile('config.json', 'utf8');
    return JSON.parse(data);
  } catch (error) {
    console.error('Failed to load config:', error);
    throw error;
  }
}

// ❌ Avoid - Legacy syntax, no error handling
const fs = require('fs');
fs.readFile('config.json', (err, data) => {
  const config = JSON.parse(data);
});
```

### Testing Changes

After modifying the skill:

1. Copy/link the updated skill to `~/.claude/skills/`
2. Ask Claude Code test questions from `TEST.md` or `EXAMPLES.md`
3. Verify responses include:
   - Detailed explanations
   - Complete code examples
   - Modern syntax (ESM, async/await)
   - Error handling
   - Best practices

## Common Development Tasks

### Adding a New Section

1. Add to Table of Contents in SKILL.md
2. Create the section with:
   - Clear explanation of concepts
   - Multiple code examples
   - Best practices
   - Common pitfalls
3. Update README.md to list the new content
4. Add test cases to TEST.md or EXAMPLES.md

### Adding New Node.js Features

When new Node.js versions are released:

1. Update version number in SKILL.md header
2. Add new APIs/features to relevant sections
3. Mark version-specific features clearly (e.g., "Node.js 26+")
4. Update examples to use latest best practices
5. Add to "What's New" if creating such a section

### Improving Examples

Good examples should:
- Be complete and runnable
- Use realistic scenarios
- Include comments explaining key parts
- Show both the "happy path" and error handling
- Demonstrate best practices
- Use modern Node.js APIs

## Skill Metadata

- **Name**: Node.js Complete Guide
- **Description**: Comprehensive Node.js knowledge base covering all core modules, APIs, async programming, streams, events, file system, networking, and best practices for modern Node.js development.
- **Version**: 1.0.0
- **Last Updated**: 2026-02-10
- **Node.js Version**: v25.6.0

## Resources

- [Node.js Official Docs](https://nodejs.org/api/)
- [Node.js Event Loop Guide](https://nodejs.org/en/learn/asynchronous-work/event-loop-timers-and-nexttick)
- [Node.js Streams Guide](https://nodejs.org/en/learn/modules/how-to-use-streams)
- [Better Stack - Node.js Streams](https://betterstack.com/community/guides/scaling-nodejs/nodejs-streams/)

## Project Goals

1. **Comprehensive** - Cover all Node.js core features, not just popular ones
2. **Practical** - Provide runnable examples for real-world scenarios
3. **Modern** - Use current best practices and syntax (ESM, async/await)
4. **Educational** - Explain concepts thoroughly, not just show code
5. **Maintainable** - Keep content organized and up-to-date with Node.js releases

## Notes for Claude Code

When working in this repository:

- The main deliverable is `nodejs-expert/SKILL.md`
- All code examples should use ESM and `node:` prefix
- Prioritize modern async/await over callbacks
- Include security considerations where relevant
- Keep examples complete and runnable
- Maintain consistency in code style across all examples
