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

---

### 🎨 Tailwind CSS Expert

A comprehensive Tailwind CSS knowledge base covering all utility classes, responsive design, component patterns, and v4+ best practices.

**Coverage includes:**
- **Core Concepts**: Utility-first approach, philosophy
- **Layout System**: Container, Display, Position, Z-Index
- **Spacing & Sizing**: Padding, Margin, Width, Height, Size utilities
- **Typography**: Fonts, text size, line height, alignment, decoration
- **Colors & Backgrounds**: Complete color palette, gradients, opacity
- **Borders & Effects**: Borders, radius, shadows, blend modes
- **Filters & Transforms**: Blur, Scale, Rotate, Translate
- **Flexbox & Grid**: Complete layout systems
- **Responsive Design**: Breakpoint system, container queries (v4+)
- **State Variants**: Hover, Focus, Group, Peer
- **Dark Mode**: Complete implementation guide
- **Component Patterns**: Button, Card, Form, Modal, Navigation, etc.
- **Customization**: @theme, arbitrary values, custom utilities
- **V4 Features**: size-*, container queries, logical properties

📖 [Full Documentation](./tailwindcss-expert/README.md) | 📝 [Usage Examples](./tailwindcss-expert/EXAMPLES.md)

**Features:**
- ✅ 3000+ lines of comprehensive documentation
- ✅ Accurate class name syntax
- ✅ Complete HTML component examples
- ✅ Responsive and accessibility best practices
- ✅ Based on Tailwind CSS v4.1+ (2025-2026)

---

### ⚡ Next.js Complete Expert Guide

A comprehensive Next.js knowledge base covering all core features, App Router, Server/Client Components, data fetching, caching mechanisms, and Next.js 15+ best practices.

**Coverage includes:**
- **Core Concepts**: Project structure, file conventions, TypeScript configuration
- **Routing System**: File-based routing, dynamic routes, route groups, parallel routes, intercepting routes
- **Server & Client Components**: When to use each, composition patterns, data sharing strategies
- **Data Fetching**: Server Components, Client Components, streaming, request deduplication
- **Caching System**: 4 caching mechanisms, fetch API caching, Cache Tags, revalidation
- **Navigation Optimization**: Link component, prefetching strategies, performance optimization
- **Server Actions**: Creating and invoking actions, form handling, validation, error handling
- **API Routes**: Route Handlers, all HTTP methods, streaming responses
- **Built-in Components**: Image, Link, Font, Script, Form optimization
- **Rendering Strategies**: Static, Dynamic, ISR, Streaming, Partial Prerendering
- **Error Handling**: Error Boundaries, Loading States, Not Found pages
- **Configuration**: next.config.js, Route Segment Config, environment variables, Metadata API
- **Best Practices**: Component organization, performance optimization, security practices, deployment checklist

📖 [Full Documentation](./nextjs-expert/README.md) | 📝 [Usage Examples](./nextjs-expert/EXAMPLES.md)

**Features:**
- ✅ 2000+ lines of comprehensive documentation
- ✅ 400+ code examples
- ✅ TypeScript-first approach
- ✅ Production-ready complete examples
- ✅ Based on Next.js 15.x (2026)

---

### 🎯 CSS Tricks - You Need to Know

A comprehensive collection of 52 practical CSS tricks and techniques for common web design challenges, with production-ready solutions.

**Coverage includes:**
- **Borders & Backgrounds** (6 tricks): Translucent borders, multiple borders, inner rounded corners, background positioning, striped backgrounds, 1px lines
- **Shape Drawing** (6 tricks): Ellipses, parallelograms, angled corners, pie charts, speech bubbles, polygons
- **Visual Effects** (9 tricks): Shadows, glassmorphism, zebra stripes, text effects, circular text, image comparison sliders
- **User Experience** (11 tricks): Mouse cursors, extended click areas, custom form controls, background dimming, text underlines, custom scrollbars
- **Structure & Layout** (7 tricks): Full-screen backgrounds with fixed content, sticky footers, centering solutions, holy grail layout, double wing layout, Flexbox guide
- **Transitions & Animations** (7 tricks): Bounce effects, elastic animations, blinking effects, typing animations, jitter effects, smooth scrolling, circular animations
- **Other Utilities** (3 tricks): Common code snippets, CSS custom properties, fun CSS projects

📖 [Full Documentation](./css-tricks/README.md) | 📝 [Usage Examples](./css-tricks/EXAMPLES.md)

**Features:**
- ✅ 52 CSS tricks across 7 categories
- ✅ Production-ready complete code examples
- ✅ Multiple implementation approaches compared
- ✅ Browser compatibility notes
- ✅ Based on [You-need-to-know-css](https://github.com/l-hammer/You-need-to-know-css) project

## Quick Start

### Installation

#### Option A: Install All Skills (Recommended)
```bash
# Copy all skills to your Claude Code skills directory
cp -r nodejs-expert nextjs-expert tailwindcss-expert css-tricks ~/.claude/skills/
```

#### Option B: Install Individual Skills

**Node.js Complete Guide:**
```bash
# Method 1: Direct copy
cp -r nodejs-expert ~/.claude/skills/

# Method 2: Symlink (for development)
ln -s "$(pwd)/nodejs-expert" ~/.claude/skills/nodejs-expert

# Method 3: Automated installer
cd nodejs-expert && ./install.sh
```

**Next.js Complete Expert Guide:**
```bash
# Method 1: Direct copy
cp -r nextjs-expert ~/.claude/skills/

# Method 2: Symlink (for development)
ln -s "$(pwd)/nextjs-expert" ~/.claude/skills/nextjs-expert

# Method 3: Automated installer
cd nextjs-expert && ./install.sh
```

**Tailwind CSS Expert:**
```bash
# Method 1: Direct copy
cp -r tailwindcss-expert ~/.claude/skills/

# Method 2: Symlink (for development)
ln -s "$(pwd)/tailwindcss-expert" ~/.claude/skills/tailwindcss-expert

# Method 3: Automated installer
cd tailwindcss-expert && ./install.sh
```

**CSS Tricks:**
```bash
# Method 1: Direct copy
cp -r css-tricks ~/.claude/skills/

# Method 2: Symlink (for development)
ln -s "$(pwd)/css-tricks" ~/.claude/skills/css-tricks

# Method 3: Automated installer
cd css-tricks && ./install.sh
```

### Verification

After installation, test the skills by asking Claude Code:

**Test Node.js Skill:**
```
How does the Node.js event loop work?
```

**Test Tailwind CSS Skill:**
```
Create a responsive button with Tailwind CSS
```

**Test CSS Tricks Skill:**
```
How do I create a custom checkbox?
```

If the skills are working, you'll receive detailed explanations with complete code examples.

## Usage Examples

Once installed, simply ask Claude Code related questions:

### Node.js Questions

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

### Tailwind CSS Questions

**Basic Concepts:**
- "What is utility-first CSS?"
- "How does Tailwind's breakpoint system work?"
- "Explain Tailwind's color system"

**Component Building:**
- "Create a responsive card with Tailwind CSS"
- "Show me a complete login form"
- "Create an animated modal"

**Layout Systems:**
- "How do I center content with Flexbox?"
- "Show me a 12-column responsive grid"
- "What are container queries? How to use them?"

**Dark Mode:**
- "How do I implement dark mode toggle?"
- "Show dark mode best practices"

**Advanced Features:**
- "How do I use Group and Peer variants?"
- "Show arbitrary value usage"
- "What's new in Tailwind v4?"

### CSS Tricks Questions

**Borders & Backgrounds:**
- "How do I create a translucent border?"
- "Show me how to implement multiple borders"
- "How do you create a 1px line on high-resolution screens?"

**Forms & Interactions:**
- "Create a custom checkbox"
- "How do I expand button click areas?"
- "Show me a custom toggle switch"

**Layout Solutions:**
- "Implement a sticky footer"
- "Show 6 ways to center content"
- "What is the holy grail layout?"

**Visual Effects:**
- "Create a glassmorphism effect"
- "How do I implement text typing animation?"
- "Show me a bounce animation effect"

**Practical Applications:**
- "Create an image comparison slider"
- "How do I customize scrollbar styling?"
- "Implement a dark mode toggle effect"

## Repository Structure

```
skills/
├── README.md              # Chinese documentation
├── README.en.md           # English documentation (this file)
├── CLAUDE.md             # Instructions for Claude Code when working in this repo
├── nodejs-expert/        # Node.js Complete Guide Skill
│   ├── SKILL.md          # Core skill knowledge base (1200+ lines)
│   ├── README.md         # Detailed skill documentation
│   ├── EXAMPLES.md       # 15+ real-world usage examples
│   ├── TEST.md           # Test cases for validation
│   └── install.sh        # Automated installation script
└── tailwindcss-expert/   # Tailwind CSS Expert Skill
    ├── SKILL.md          # Core skill knowledge base (3000+ lines)
    ├── README.md         # Detailed skill documentation
    ├── EXAMPLES.md       # 20+ real-world usage examples
    └── install.sh        # Automated installation script
└── css-tricks/           # CSS Tricks Skill
    ├── SKILL.md          # Core skill knowledge base (52 tricks)
    ├── README.md         # Detailed skill documentation
    ├── EXAMPLES.md       # 10+ complete usage examples
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

- **Repository Version**: 1.2.0
- **Number of Skills**: 3 (Node.js, Tailwind CSS, CSS Tricks)
- **Node.js Skill Version**: 1.0.0
- **Tailwind CSS Skill Version**: 1.0.0
- **CSS Tricks Skill Version**: 1.0.0
- **Last Updated**: 2026-02-13

## License

Skills in this repository are provided as knowledge resources for Claude Code. See individual skill directories for specific licensing information.

---

**Ready to supercharge your development with Claude Code?** Install the skills and start asking questions!

Detailed skill information:
- [Node.js Complete Guide Documentation](./nodejs-expert/README.md)
- [Tailwind CSS Expert Documentation](./tailwindcss-expert/README.md)
- [CSS Tricks Documentation](./css-tricks/README.md)
