#!/bin/bash

# Next.js Expert Skill Installation Script
# This script installs the Next.js Expert Skill for Claude Code

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Skill information
SKILL_NAME="nextjs-expert"
SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Next.js Expert Skill - Installation Script"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if running from correct directory
if [ ! -f "SKILL.md" ] || [ ! -f "README.md" ]; then
    echo -e "${RED}Error: Please run this script from the nextjs-expert directory${NC}"
    echo "  cd /path/to/nextjs-expert"
    echo "  ./install.sh"
    exit 1
fi

# Create Claude skills directory if it doesn't exist
echo -e "${YELLOW}→${NC} Creating Claude skills directory..."
mkdir -p "$HOME/.claude/skills"

# Check if skill already exists
if [ -d "$SKILL_DIR" ]; then
    echo -e "${YELLOW}→${NC} Skill already exists at: $SKILL_DIR"
    read -p "  Do you want to overwrite it? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Installation cancelled${NC}"
        exit 0
    fi
    echo -e "${YELLOW}→${NC} Removing existing installation..."
    rm -rf "$SKILL_DIR"
fi

# Copy skill files
echo -e "${YELLOW}→${NC} Installing Next.js Expert Skill..."
mkdir -p "$SKILL_DIR"

# Copy all files except install.sh and hidden files
for file in *; do
    if [ "$file" != "install.sh" ] && [[ "$file" != .* ]]; then
        cp -r "$file" "$SKILL_DIR/"
    fi
done

# Verify installation
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
    echo -e "${RED}✗ Installation failed${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Installation successful!${NC}"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Installation Complete"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Skill installed at: $SKILL_DIR"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code (if running)"
echo "  2. Ask Claude questions about Next.js"
echo "  3. See EXAMPLES.md for usage examples"
echo ""
echo "Example questions:"
echo "  • How do I create dynamic routes in Next.js?"
echo "  • What's the difference between Server and Client Components?"
echo "  • Show me how to implement data fetching with caching"
echo ""
echo "For more information, see README.md"
echo ""
