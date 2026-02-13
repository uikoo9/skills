#!/bin/bash

# CSS Tricks Skill Installation Script
# Version: 1.0.0

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Skill information
SKILL_NAME="css-tricks"
SKILL_DISPLAY_NAME="CSS Tricks"

echo "======================================"
echo "  ${SKILL_DISPLAY_NAME} Skill Installer"
echo "======================================"
echo ""

# Detect Claude Code skills directory
CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"

if [ ! -d "$CLAUDE_DIR" ]; then
    echo -e "${YELLOW}Warning: Claude Code directory not found at $CLAUDE_DIR${NC}"
    echo "Creating directory..."
    mkdir -p "$SKILLS_DIR"
fi

if [ ! -d "$SKILLS_DIR" ]; then
    echo "Creating skills directory..."
    mkdir -p "$SKILLS_DIR"
fi

# Get the absolute path of the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_DIR="$SKILLS_DIR/$SKILL_NAME"

echo "Installation details:"
echo "  Source: $SCRIPT_DIR"
echo "  Target: $TARGET_DIR"
echo ""

# Check if skill already exists
if [ -d "$TARGET_DIR" ] || [ -L "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Skill already exists at $TARGET_DIR${NC}"
    read -p "Do you want to overwrite it? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    rm -rf "$TARGET_DIR"
fi

# Installation method selection
echo "Select installation method:"
echo "  1) Copy files (recommended for most users)"
echo "  2) Create symbolic link (recommended for development)"
echo ""
read -p "Enter choice (1 or 2): " -n 1 -r
echo ""

case $REPLY in
    1)
        echo "Copying skill files..."
        cp -r "$SCRIPT_DIR" "$TARGET_DIR"
        echo -e "${GREEN}✓${NC} Files copied successfully"
        ;;
    2)
        echo "Creating symbolic link..."
        ln -s "$SCRIPT_DIR" "$TARGET_DIR"
        echo -e "${GREEN}✓${NC} Symbolic link created successfully"
        ;;
    *)
        echo -e "${RED}Invalid choice. Installation cancelled.${NC}"
        exit 1
        ;;
esac

# Verify installation
if [ -f "$TARGET_DIR/SKILL.md" ]; then
    echo ""
    echo -e "${GREEN}======================================"
    echo "  Installation Successful!"
    echo "======================================${NC}"
    echo ""
    echo "The ${SKILL_DISPLAY_NAME} skill has been installed."
    echo ""
    echo "What's included:"
    echo "  • 52 CSS tricks across 7 categories"
    echo "  • Production-ready code examples"
    echo "  • Browser compatibility information"
    echo "  • Best practices and use cases"
    echo ""
    echo "Test the installation:"
    echo "  Ask Claude Code: 'How do I create custom checkboxes?'"
    echo "  Ask Claude Code: 'Show me how to center elements'"
    echo "  Ask Claude Code: 'Create a frosted glass effect'"
    echo ""
    echo "Documentation:"
    echo "  README:   $TARGET_DIR/README.md"
    echo "  Examples: $TARGET_DIR/EXAMPLES.md"
    echo "  Skill:    $TARGET_DIR/SKILL.md"
    echo ""
else
    echo -e "${RED}======================================"
    echo "  Installation Failed"
    echo "======================================${NC}"
    echo ""
    echo "Error: SKILL.md not found in target directory."
    echo "Please check the installation and try again."
    exit 1
fi
