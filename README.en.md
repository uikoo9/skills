# Claude Code Skills Collection

English | [简体中文](./README.md)

A curated collection of professional skills for [Claude Code](https://claude.ai/code) - Anthropic's official CLI tool that brings Claude's AI capabilities directly to your development workflow.

## What are Claude Code Skills?

Skills are knowledge packages that enhance Claude Code's capabilities in specific domains. When you ask questions related to a skill's domain, Claude automatically accesses that knowledge to provide more accurate, detailed, and contextually relevant answers.

## Available Skills

### 🚀 Node.js Complete Guide

A comprehensive Node.js knowledge base covering all core features, modules, APIs, and best practices for modern Node.js development.

**Coverage includes:**
- **Core Concepts**: Event loop, Libuv, Node.js architecture
- **Module System**: ESM vs CommonJS, module resolution
- **30+ Core Modules**: fs, http, crypto, streams, worker_threads, and more
- **Async Programming**: Callbacks, Promises, async/await, error handling
- **Streams**: All 4 types (Readable, Writable, Duplex, Transform)
- **File System**: Promise-based APIs, streaming, file watching
- **Networking**: HTTP/HTTPS servers, TCP, DNS, Fetch API
- **Process Management**: Child processes, Worker Threads, Cluster
- **Events**: EventEmitter, event patterns
- **Cryptography**: Hashing, encryption, post-quantum crypto
- **Testing & Debugging**: node:test, assertions, mocking
- **Performance**: Optimization techniques and best practices

📖 [Full Documentation](./nodejs-expert/README.md) | 📝 [Usage Examples](./nodejs-expert/EXAMPLES.md) | 🧪 [Test Cases](./nodejs-expert/TEST.md)

**Features:**
- ✅ 1200+ lines of comprehensive documentation
- ✅ Modern syntax (ESM, async/await)
- ✅ Complete, runnable code examples
- ✅ Security and performance best practices
- ✅ Based on Node.js v25.6.0 (2026)

## Quick Start

### Installation

#### Option 1: Direct Copy (Recommended)
```bash
# Copy the nodejs-expert skill to your Claude Code skills directory
cp -r nodejs-expert ~/.claude/skills/
```

#### Option 2: Symlink (For Development)
```bash
# Create a symlink for easy updates
ln -s "$(pwd)/nodejs-expert" ~/.claude/skills/nodejs-expert
```

#### Option 3: Automated Installation
```bash
# Use the built-in installer
cd nodejs-expert
./install.sh
```

#### Option 4: Claude Desktop/Web
```bash
# Create a ZIP file and drag it to Claude Desktop or Web
cd nodejs-expert
zip -r nodejs-complete-guide.zip .
```

### Verification

After installation, test the skill by asking Claude Code:

```
Node.js 的事件循环是如何工作的？
```

or

```
How do I create an HTTP server in Node.js using modern syntax?
```

If the skill is working, you'll receive detailed explanations with complete code examples.

## Usage Examples

Once installed, simply ask Claude Code any Node.js related question:

**Basic Concepts:**
- "Explain the Node.js event loop phases"
- "What's the difference between ESM and CommonJS?"
- "How does Libuv work?"

**Practical Tasks:**
- "Show me how to read files using fs/promises"
- "Create a REST API server with error handling"
- "How do I use Worker Threads for CPU-intensive tasks?"

**Streams & Advanced Topics:**
- "What are the 4 types of streams in Node.js?"
- "Show me how to handle backpressure in streams"
- "How do I implement graceful shutdown?"

**Best Practices:**
- "What are Node.js security best practices?"
- "How can I optimize Node.js performance?"
- "Show me how to use the built-in test runner"

## Repository Structure

```
skills/
├── README.md              # This file
├── CLAUDE.md             # Instructions for Claude Code when working in this repo
└── nodejs-expert/        # Node.js Complete Guide Skill
    ├── SKILL.md          # Core skill knowledge base (1200+ lines)
    ├── README.md         # Detailed skill documentation
    ├── EXAMPLES.md       # 15+ real-world usage examples
    ├── TEST.md           # Test cases for validation
    └── install.sh        # Automated installation script
```

## Why Use Skills?

**Without Skills:**
- Generic responses based on training data
- May miss newer APIs or best practices
- Limited depth in specialized topics

**With Skills:**
- Domain-specific expertise
- Up-to-date knowledge (Node.js v25.6.0)
- Comprehensive coverage of all APIs
- Production-ready code examples
- Security and performance guidance

## Skill Features

### 🎯 Comprehensive Coverage
Every major Node.js feature, module, and API is documented with examples.

### 💻 Modern Syntax
All code examples use:
- ESM (ECMAScript Modules) with `node:` prefix
- `async/await` instead of callbacks
- Latest Node.js APIs and features

### 🔒 Security Focused
Built-in security considerations and best practices for every topic.

### ⚡ Performance Aware
Optimization tips and performance measurement techniques included.

### 📚 Educational
Not just "how to do it" but "why this way" - understanding the reasoning behind best practices.

### ✅ Production Ready
All examples include proper error handling and are ready to use in real applications.

## Contributing

This repository is designed to be extensible. To add a new skill:

1. Create a new directory with your skill name
2. Add a `SKILL.md` file with the knowledge base
3. Include a `README.md` with installation and usage instructions
4. Optionally add `EXAMPLES.md` and `TEST.md`
5. Update this main README.md to list your new skill

See [CLAUDE.md](./CLAUDE.md) for detailed development guidelines.

## Requirements

- **Claude Code**: Version 0.4.0 or later
- **Node.js**: v18+ (for running the examples)
- **Operating System**: macOS, Linux, or Windows

## Resources

- [Claude Code Documentation](https://claude.ai/code)
- [Node.js Official Documentation](https://nodejs.org/api/)
- [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)

## Version Information

- **Repository Version**: 1.0.0
- **Node.js Skill Version**: 1.0.0
- **Target Node.js Version**: v25.6.0 (2026)
- **Last Updated**: 2026-02-10

## License

Skills in this repository are provided as knowledge resources for Claude Code. See individual skill directories for specific licensing information.

---

**Ready to supercharge your Node.js development with Claude Code?** Install the skill and start asking questions!

For detailed information about the Node.js skill, see the [Node.js Expert Documentation](./nodejs-expert/README.md).
