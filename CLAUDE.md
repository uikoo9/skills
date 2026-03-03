# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains a collection of comprehensive skills for Claude Code, including Node.js, Next.js, Tailwind CSS, and CSS Tricks - complete knowledge bases covering all core features, modules, APIs, and best practices.

## Repository Structure

```
skills/
├── nodejs-expert/          # Node.js Complete Guide Skill
│   ├── SKILL.md           # Core skill file (1200+ lines of Node.js knowledge)
│   ├── README.md          # Detailed installation and usage guide
│   ├── TEST.md            # Test cases for validating skill activation
│   ├── EXAMPLES.md        # 15+ real-world usage examples
│   └── install.sh         # Automated installation script
├── nextjs-expert/         # Next.js Complete Expert Guide
│   ├── SKILL.md           # Core skill file (Next.js 15+ knowledge)
│   ├── README.md          # Installation and usage guide
│   ├── EXAMPLES.md        # Real-world usage examples
│   └── install.sh         # Automated installation script
├── tailwindcss-expert/    # Tailwind CSS Expert Guide
│   ├── SKILL.md           # Core skill file (Tailwind v4+ knowledge)
│   ├── README.md          # Installation and usage guide
│   ├── EXAMPLES.md        # Real-world usage examples
│   └── install.sh         # Automated installation script
├── css-tricks/            # CSS Tricks Collection
│   ├── SKILL.md           # Core skill file (52 CSS tricks)
│   ├── README.md          # Installation and usage guide
│   └── install.sh         # Automated installation script
├── package.json           # Project metadata
├── README.md              # Main repository documentation
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

### ⚠️ Critical Requirement: YAML Frontmatter

**EVERY SKILL.md FILE MUST START WITH YAML FRONTMATTER**

Claude Code requires YAML frontmatter at the beginning of each SKILL.md file to recognize and register the skill. Without this metadata, the skill will not be detected.

**Required format:**

```yaml
---
name: Skill Name
description: Brief description of the skill covering main features and use cases.
---
```

**Example:**

```yaml
---
name: Next.js Expert
description: Comprehensive Next.js knowledge base covering all core features, App Router, Server/Client Components, data fetching, caching, routing, and modern development patterns for Next.js 15+.
---

# Next.js Complete Expert Guide
...rest of content...
```

**Common mistake:** Starting the file directly with `# Title` without the frontmatter block will cause the skill to be invisible to Claude Code.

### Updating the Skill

When updating `SKILL.md`:

1. **Maintain frontmatter** - ALWAYS keep the YAML frontmatter at the top
2. **Maintain structure** - Keep the organized section layout
3. **Use modern syntax** - ESM imports with `node:` prefix, async/await
4. **Include complete examples** - Code should be runnable as-is
5. **Add error handling** - All examples should handle errors properly
6. **Explain the "why"** - Not just "how to do it" but "why this way"
7. **Update version info** - Keep version numbers current

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

1. **Verify YAML frontmatter** - Ensure the file starts with `---` and contains `name:` and `description:` fields
2. Copy/link the updated skill to `~/.claude/skills/`
   ```bash
   cp -r <skill-name> ~/.claude/skills/
   ```
3. Restart Claude Code or wait for automatic refresh
4. Check if skill appears in the available skills list (shown in system-reminder messages)
5. Ask Claude Code test questions from `TEST.md` or `EXAMPLES.md`
6. Verify responses include:
   - Detailed explanations
   - Complete code examples
   - Modern syntax (ESM, async/await)
   - Error handling
   - Best practices

### Troubleshooting: Skill Not Detected

If a skill doesn't appear in Claude Code:

1. **Check YAML frontmatter** - Most common issue is missing or malformed frontmatter
   ```bash
   head -n 5 <skill-name>/SKILL.md
   ```
   Should show:
   ```yaml
   ---
   name: Skill Name
   description: ...
   ---
   ```

2. **Verify file location** - Skill should be in `~/.claude/skills/<skill-name>/SKILL.md`

3. **Check file permissions** - Ensure SKILL.md is readable
   ```bash
   ls -la ~/.claude/skills/<skill-name>/SKILL.md
   ```

4. **Restart Claude Code** - Changes may require restart to take effect

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

## Available Skills

### 1. Node.js Complete Guide
- **Name**: `nodejs-complete-guide`
- **Description**: Comprehensive Node.js knowledge base covering all core modules, APIs, async programming, streams, events, file system, networking, and best practices for modern Node.js development.
- **Version**: 1.0.0
- **Last Updated**: 2026-02-10
- **Node.js Version**: v25.6.0

### 2. Next.js Expert
- **Name**: `nextjs-expert`
- **Description**: Comprehensive Next.js knowledge base covering all core features, App Router, Server/Client Components, data fetching, caching, routing, and modern development patterns for Next.js 15+.
- **Version**: 1.0.0
- **Last Updated**: 2026-03-03
- **Next.js Version**: 15.x

### 3. Tailwind CSS Expert
- **Name**: `tailwindcss-expert`
- **Description**: Comprehensive Tailwind CSS knowledge base covering all utility classes, responsive design, component patterns, customization, and best practices for modern web development with Tailwind CSS v4.
- **Version**: 1.0.0
- **Last Updated**: 2026-02-12
- **Tailwind Version**: v4.1+

### 4. CSS Tricks
- **Name**: `css-tricks`
- **Description**: 52 essential CSS tricks and techniques for modern web design. Covers borders, backgrounds, shapes, visual effects, user experience, layouts, animations, and utilities with production-ready code examples.
- **Version**: 1.0.0
- **Last Updated**: 2026-02-13

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

- The main deliverables are the `SKILL.md` files in each skill directory
- **CRITICAL**: Every SKILL.md must have YAML frontmatter with `name` and `description`
- All code examples should use modern syntax (ESM with `node:` prefix, async/await)
- Prioritize modern patterns over legacy approaches
- Include security considerations where relevant
- Keep examples complete and runnable
- Maintain consistency in code style across all examples
- When creating new skills, always start with the frontmatter template

## Known Issues & Solutions

### Issue: Skill Not Detected by Claude Code (Fixed 2026-03-03)

**Problem**: Skills without YAML frontmatter at the beginning of SKILL.md are invisible to Claude Code.

**Affected**:
- ✅ Fixed: `nextjs-expert` - missing frontmatter
- ✅ Fixed: `css-tricks` - missing frontmatter

**Solution**: Added required YAML frontmatter:
```yaml
---
name: Skill Name
description: Brief description...
---
```

**Prevention**: Always validate frontmatter before committing new or updated skills.
