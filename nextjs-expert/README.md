# Next.js Complete Expert Guide Skill

A comprehensive Next.js knowledge base for Claude Code that covers all core features, App Router, Server/Client Components, data fetching, caching, routing, and modern development patterns.

## Overview

This skill transforms Claude Code into a Next.js expert, providing detailed knowledge about:

- File-based routing system (App Router + Pages Router)
- Server and Client Components architecture
- Data fetching strategies (Server Components, Client Components, streaming)
- Comprehensive caching mechanisms (Request Memoization, Data Cache, Full Route Cache, Router Cache)
- Server Actions and data mutation patterns
- API Routes (Route Handlers)
- Built-in components (Image, Link, Font, Script, Form)
- Rendering strategies (Static, Dynamic, ISR, PPR)
- Navigation and prefetching optimizations
- Error handling and loading states
- Configuration and deployment best practices

## Installation

### Method 1: Copy to Skills Directory

```bash
# Clone or download this repository
cd /path/to/nextjs-expert

# Copy to Claude Code skills directory
cp -r . ~/.claude/skills/nextjs-expert
```

### Method 2: Use the Installation Script

```bash
cd nextjs-expert
chmod +x install.sh
./install.sh
```

### Method 3: Create Symlink (Development)

```bash
# For development, create a symlink
ln -s "$(pwd)" ~/.claude/skills/nextjs-expert
```

### For Claude Desktop/Web

```bash
# Create a ZIP file
cd nextjs-expert
zip -r nextjs-expert.zip .

# Drag the ZIP file to Claude Desktop or Web interface
```

## Verification

After installation, verify the skill is available:

```bash
ls ~/.claude/skills/
```

You should see `nextjs-expert` in the list.

## Usage

Once installed, Claude Code will automatically have access to this Next.js knowledge when you ask questions or request help with Next.js development.

### Example Questions

Ask Claude Code questions like:

- "How do I set up a new Next.js 15 project with TypeScript?"
- "What's the difference between Server and Client Components?"
- "How do I implement data fetching with caching in Next.js?"
- "Show me how to create dynamic routes with generateStaticParams"
- "How does the caching system work in Next.js?"
- "What are the best practices for Server Actions?"
- "How do I optimize images with next/image?"
- "Explain the different rendering strategies in Next.js"

### Code Generation

Claude Code can generate complete, production-ready Next.js code:

- Full page components with proper routing
- Server Actions with validation
- API routes with authentication
- Complex layouts with nested routes
- Data fetching with proper caching
- Error boundaries and loading states

## What's Included

### Core Knowledge Areas

1. **Getting Started (30+ pages)**
   - Installation and setup
   - Project structure
   - File conventions
   - TypeScript configuration

2. **Routing System (50+ examples)**
   - File-based routing
   - Dynamic routes
   - Route groups
   - Parallel and intercepting routes
   - Layouts and templates

3. **Server & Client Components (40+ patterns)**
   - When to use each
   - Composition patterns
   - Data sharing strategies
   - Context providers
   - Environment security

4. **Data Fetching (60+ examples)**
   - Server Components fetching
   - Client Components fetching
   - Parallel and sequential patterns
   - Request deduplication
   - Streaming with React.use

5. **Caching & Revalidation (70+ patterns)**
   - 4 caching mechanisms explained
   - fetch API caching
   - Cache tags and revalidation
   - Time-based and on-demand strategies
   - Router Cache optimization

6. **Navigation & Linking (50+ examples)**
   - Link component
   - useRouter hook
   - Prefetching strategies
   - Performance optimization
   - History API integration

7. **Server Actions (40+ patterns)**
   - Creating and invoking actions
   - Form handling
   - Progressive enhancement
   - Validation and error handling
   - Revalidation workflows

8. **API Routes (30+ examples)**
   - Route Handlers
   - All HTTP methods
   - Request/Response handling
   - Streaming responses
   - CORS and webhooks

9. **Built-in Components (50+ examples)**
   - Image optimization
   - Font optimization
   - Script loading strategies
   - Form enhancement
   - Link prefetching

10. **Rendering Strategies (40+ patterns)**
    - Static rendering
    - Dynamic rendering
    - ISR (Incremental Static Regeneration)
    - Streaming with Suspense
    - Partial Prerendering

11. **Error Handling (20+ patterns)**
    - Error boundaries
    - Loading states
    - Not found pages
    - Forbidden/Unauthorized
    - Global error handling

12. **Configuration (100+ options)**
    - next.config.js essentials
    - Route Segment Config
    - Environment variables
    - TypeScript setup
    - Metadata API

13. **Best Practices (50+ recommendations)**
    - Component organization
    - Performance optimization
    - Security practices
    - Testing strategies
    - Deployment checklist

### Code Examples

All examples in this skill are:
- ✅ **Complete and runnable** - No pseudo-code
- ✅ **Modern syntax** - Uses TypeScript, async/await, ESM
- ✅ **Production-ready** - Includes error handling and validation
- ✅ **Best practices** - Follows Next.js official recommendations
- ✅ **Well-documented** - Clear explanations and comments

## Features

### Comprehensive Coverage

- **400+ code examples** covering all major Next.js features
- **13 major sections** organized by topic
- **1200+ lines** of detailed documentation
- **Modern patterns** for Next.js 15+
- **Real-world scenarios** and use cases

### Modern Development

- App Router (recommended approach)
- Server Components by default
- Server Actions for mutations
- React 19 features (use hook, useActionState)
- TypeScript-first examples
- ESM module syntax

### Performance Focus

- Caching strategies explained in detail
- Prefetching and navigation optimization
- Image and font optimization
- Streaming and Suspense patterns
- Bundle size optimization

### Developer Experience

- Clear organization by topic
- Searchable content
- Copy-paste ready examples
- Troubleshooting section
- Common patterns library

## Version Info

- **Skill Version**: 1.0.0
- **Next.js Version**: 15.x
- **React Version**: 19.x
- **Node.js Version**: 20.9+
- **Last Updated**: 2026-03-03

## Contributing

This skill is part of the Claude Code skills repository. To contribute:

1. Fork the repository
2. Make your changes
3. Test with Claude Code
4. Submit a pull request

## Related Skills

- **Node.js Expert** - Complete Node.js knowledge base
- **Tailwind CSS Expert** - Utility-first CSS framework
- **CSS Tricks** - Modern CSS patterns and techniques

## License

MIT License - Free to use and modify

## Support

For issues or questions:
- Check the [EXAMPLES.md](EXAMPLES.md) for usage examples
- Review the [SKILL.md](SKILL.md) for detailed documentation
- Open an issue in the repository

## Changelog

### v1.0.0 (2026-03-03)
- Initial release
- Complete Next.js 15+ coverage
- App Router focus
- 400+ code examples
- 13 major sections
- TypeScript-first approach
