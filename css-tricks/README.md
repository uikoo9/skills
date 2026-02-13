# CSS Tricks Skill

> 52 Essential CSS Tricks Every Web Developer Should Know

A comprehensive Claude Code skill containing practical CSS solutions for common web design challenges. Based on the popular [You-need-to-know-css](https://github.com/l-hammer/You-need-to-know-css) project by l-hammer.

## Overview

This skill provides Claude Code with deep knowledge of 52 CSS tricks organized into 7 categories:

### Categories

1. **Borders & Backgrounds** (6 tricks)
   - Translucent borders
   - Multiple borders
   - Inner rounding
   - Background positioning
   - Striped backgrounds
   - 1px lines for high-DPI screens

2. **Shapes** (6 tricks)
   - Ellipses and circles
   - Parallelograms
   - Cutout corners
   - Pie charts
   - Poptips/tooltips
   - Polygons (triangles, stars, hearts, etc.)

3. **Visual Effects** (9 tricks)
   - Common shadows
   - Irregular shadows
   - Frosted glass effect
   - Zebra stripes
   - Text effects (embossed, glowing, 3D, gradient)
   - Circular text
   - Line breaks
   - Image contrast sliders

4. **User Experience** (11 tricks)
   - Mouse cursor customization
   - Extended hit areas
   - Custom checkboxes
   - Custom radio buttons
   - Custom switches
   - Input alignment
   - Shadow/blur background weakening
   - Text underlines
   - Custom scrollbars

5. **Structure & Layout** (7 tricks)
   - Full background with fixed content
   - Sticky footer
   - Centering (6 methods)
   - Holy Grail layout
   - Double Wing layout
   - Order layout
   - Flexbox comprehensive guide

6. **Transition & Animations** (7 tricks)
   - Bounce animations
   - Elastic animations
   - Blink effects
   - Typing animation
   - Shake effects
   - Smooth scrolling
   - Circular motion

7. **Other Utilities** (3 tricks)
   - Common CSS snippets
   - CSS custom variables
   - Interesting CSS projects

## Installation

### Option 1: Copy to Skills Directory

```bash
cp -r css-tricks ~/.claude/skills/
```

### Option 2: Use the Installation Script

```bash
cd css-tricks
./install.sh
```

### Option 3: Symbolic Link (for development)

```bash
ln -s "$(pwd)/css-tricks" ~/.claude/skills/css-tricks
```

### For Claude Desktop/Web

1. Create a ZIP file:
   ```bash
   cd css-tricks
   zip -r css-tricks.zip .
   ```

2. Drag the ZIP file to Claude Desktop or Web interface

## What's Included

This skill provides Claude Code with knowledge of:

- **Production-ready CSS code** for 52 common design patterns
- **Multiple implementation approaches** with pros and cons
- **Browser compatibility** considerations and fallbacks
- **Performance best practices**
- **Accessibility guidelines**
- **Real-world use cases** for each technique

## Usage Examples

Once installed, Claude Code can:

### 1. Implement Custom Form Controls

**You**: "Add custom checkboxes to my form"

**Claude Code**: Will provide production-ready CSS using the custom checkbox pattern from the skill, including:
- Hidden native checkbox
- Custom pseudo-element styling
- Hover and focus states
- Disabled state handling
- Smooth transitions

### 2. Create Complex Layouts

**You**: "Implement a three-column layout with fixed sidebars"

**Claude Code**: Will suggest and implement either Holy Grail or Double Wing layout, explaining the differences and providing modern Flexbox alternatives.

### 3. Add Visual Effects

**You**: "Create a frosted glass card effect"

**Claude Code**: Will implement the frosted glass technique with pseudo-elements or backdrop-filter, including fallbacks for older browsers.

### 4. Solve Specific Problems

**You**: "How do I create a 1px border on retina displays?"

**Claude Code**: Will provide the transform-based scaling solution with media queries for different pixel densities.

## Skill Contents

### SKILL.md
The main knowledge base containing:
- Detailed explanations of each technique
- Complete code examples
- Multiple implementation approaches
- Browser support information
- Use cases and best practices

### README.md (this file)
Installation guide and overview

### EXAMPLES.md
10+ complete usage examples demonstrating how Claude Code uses this skill

### install.sh
Automated installation script

## Key Features

### Comprehensive Coverage
52 essential CSS techniques covering all aspects of modern web design

### Multiple Approaches
Most techniques include 2-3 implementation methods with trade-offs explained

### Modern CSS
Uses latest CSS features (Grid, Flexbox, Custom Properties, etc.) with fallbacks

### Production-Ready
All code is battle-tested and ready for real-world use

### Best Practices
Includes performance, accessibility, and maintainability guidelines

## Testing the Skill

After installation, test with these questions:

```
1. "How do I create semi-transparent borders?"
2. "Show me how to implement a sticky footer"
3. "Create custom checkboxes without JavaScript"
4. "How do I center an element vertically and horizontally?"
5. "Implement a frosted glass modal overlay"
6. "Create a pie chart with pure CSS"
7. "Add a typing animation effect"
8. "How do I extend the click area of a small button?"
```

Claude Code should provide detailed answers with complete code examples from the skill.

## Benefits

### For Developers
- Quick access to proven CSS solutions
- Multiple implementation options
- Browser compatibility information
- Best practices built-in

### For Teams
- Consistent code patterns
- Reduced research time
- Better code quality
- Accessible by default

### For Projects
- Faster development
- Better performance
- Cross-browser compatibility
- Modern CSS patterns

## Requirements

- Claude Code CLI
- No external dependencies
- Works with all Claude Code features

## Browser Support

The techniques in this skill support:
- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Fallbacks provided for older browsers where applicable

## Contributing

To improve this skill:

1. Test with various Claude Code questions
2. Suggest additional CSS tricks
3. Report issues or unclear explanations
4. Propose better implementation methods

## Credits

This skill is based on the excellent [You-need-to-know-css](https://github.com/l-hammer/You-need-to-know-css) project by [l-hammer](https://github.com/l-hammer).

Original project features:
- 43 CSS tricks
- Interactive demonstrations
- Chinese and English documentation
- Active community

This Claude Code skill adaptation:
- Expanded to 52 tricks
- Optimized for AI-assisted coding
- Enhanced code examples
- Added comprehensive explanations

## Version History

### v1.0.0 (2026-02-13)
- Initial release
- 52 CSS tricks across 7 categories
- Complete code examples
- Installation scripts
- Comprehensive documentation

## License

This skill documentation is provided for use with Claude Code. The original You-need-to-know-css project is licensed under Anti-996 License.

## Support

For questions or issues:
1. Check the EXAMPLES.md file
2. Review the SKILL.md content
3. Test with Claude Code directly
4. Refer to the original You-need-to-know-css project

---

**Made for Claude Code** • **52 CSS Tricks** • **Version 1.0.0**
