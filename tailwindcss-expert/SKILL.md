---
name: Tailwind CSS Expert
description: Comprehensive Tailwind CSS knowledge base covering all utility classes, responsive design, component patterns, customization, and best practices for modern web development with Tailwind CSS v4.
---

# Tailwind CSS Complete Knowledge Base

You are a Tailwind CSS expert with comprehensive knowledge of all utility classes, responsive design patterns, component composition, and best practices. Provide accurate, detailed answers with complete HTML examples using modern Tailwind CSS syntax.

**Current Tailwind CSS Version: v4.1+ (2025-2026)**

---

## Table of Contents
1. Core Concepts & Philosophy
2. Layout System
3. Spacing & Sizing
4. Typography
5. Colors & Backgrounds
6. Borders & Effects
7. Filters & Transforms
8. Flexbox & Grid
9. Responsive Design
10. State Variants
11. Dark Mode
12. Component Patterns
13. Customization & Configuration
14. Best Practices
15. V4 New Features

---

## 1. CORE CONCEPTS & PHILOSOPHY

### What is Tailwind CSS?
- **Utility-first CSS framework** - Compose designs using low-level utility classes
- **Highly customizable** - Configure design system via CSS and configuration
- **Performance-optimized** - Only includes CSS for classes you actually use
- **Mobile-first** - Responsive by default with intuitive breakpoint system
- **Component-friendly** - Extract patterns into reusable components

### Utility-First Approach
Instead of writing custom CSS, you compose designs directly in HTML:

```html
<!-- Traditional CSS approach -->
<div class="chat-notification">
  <div class="chat-notification-logo"></div>
  <div class="chat-notification-content">
    <h4 class="chat-notification-title">ChitChat</h4>
    <p class="chat-notification-message">You have a new message!</p>
  </div>
</div>

<!-- Tailwind CSS approach -->
<div class="max-w-sm mx-auto bg-white rounded-xl shadow-lg flex items-center space-x-4 p-6">
  <div class="shrink-0">
    <img class="size-12" src="logo.svg" alt="ChitChat Logo">
  </div>
  <div>
    <h4 class="text-xl font-medium text-black">ChitChat</h4>
    <p class="text-slate-500">You have a new message!</p>
  </div>
</div>
```

### Key Benefits
- **Faster development** - No context switching between HTML and CSS
- **Consistent design** - Built-in design system constraints
- **Easy maintenance** - Changes are localized to components
- **Smaller CSS** - Automatic purging of unused styles

---

## 2. LAYOUT SYSTEM

### Container
Center and constrain content width:

```html
<!-- Basic container -->
<div class="container mx-auto">
  <!-- Content -->
</div>

<!-- Responsive container with padding -->
<div class="container mx-auto px-4 md:px-6 lg:px-8">
  <!-- Content -->
</div>
```

### Display
Control element display type:

```html
<div class="block">Block element</div>
<div class="inline-block">Inline-block element</div>
<div class="inline">Inline element</div>
<div class="flex">Flex container</div>
<div class="inline-flex">Inline flex container</div>
<div class="grid">Grid container</div>
<div class="inline-grid">Inline grid container</div>
<div class="hidden">Hidden element</div>
```

### Position
Position elements:

```html
<!-- Static (default) -->
<div class="static">Static positioning</div>

<!-- Relative -->
<div class="relative">
  <div class="absolute top-0 right-0">Absolute child</div>
</div>

<!-- Fixed (viewport) -->
<div class="fixed top-0 left-0 right-0">Fixed header</div>

<!-- Sticky -->
<div class="sticky top-0">Sticky header</div>

<!-- Inset utilities -->
<div class="absolute inset-0">All edges at 0</div>
<div class="absolute inset-x-0 top-0">Top, left, and right at 0</div>
<div class="absolute inset-y-0 left-0">Left, top, and bottom at 0</div>

<!-- Individual edges -->
<div class="absolute top-4 right-4">Top-right corner</div>
<div class="absolute bottom-8 left-8">Bottom-left corner</div>
```

### Z-Index
Control stacking order:

```html
<div class="z-0">z-index: 0</div>
<div class="z-10">z-index: 10</div>
<div class="z-20">z-index: 20</div>
<div class="z-30">z-index: 30</div>
<div class="z-40">z-index: 40</div>
<div class="z-50">z-index: 50</div>
<div class="z-auto">z-index: auto</div>
```

---

## 3. SPACING & SIZING

### Padding & Margin
Spacing scale: 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 72, 80, 96

```html
<!-- Padding -->
<div class="p-4">Padding on all sides (1rem)</div>
<div class="px-6">Horizontal padding (1.5rem)</div>
<div class="py-8">Vertical padding (2rem)</div>
<div class="pt-2 pr-4 pb-2 pl-4">Individual sides</div>

<!-- Margin -->
<div class="m-4">Margin on all sides</div>
<div class="mx-auto">Centered horizontally</div>
<div class="my-8">Vertical margin</div>
<div class="-mt-4">Negative top margin</div>

<!-- Space between children -->
<div class="flex space-x-4">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>

<div class="space-y-6">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

### Width & Height
```html
<!-- Fixed sizes -->
<div class="w-32 h-32">128px × 128px</div>

<!-- Fractions -->
<div class="w-1/2">50% width</div>
<div class="w-1/3">33.333% width</div>
<div class="w-2/3">66.666% width</div>
<div class="w-1/4">25% width</div>
<div class="w-full">100% width</div>

<!-- Viewport units -->
<div class="w-screen">100vw width</div>
<div class="h-screen">100vh height</div>
<div class="min-h-screen">Minimum 100vh height</div>

<!-- Size utilities (v4+) -->
<div class="size-12">width: 3rem; height: 3rem</div>
<div class="size-full">width: 100%; height: 100%</div>

<!-- Min/Max -->
<div class="min-w-0">min-width: 0</div>
<div class="max-w-md">max-width: 28rem</div>
<div class="max-w-prose">max-width: 65ch</div>
<div class="max-w-screen-xl">max-width: 1280px</div>

<!-- Arbitrary values -->
<div class="w-[347px]">width: 347px</div>
<div class="min-h-[calc(100vh-64px)]">min-height: calc(100vh - 64px)</div>
```

---

## 4. TYPOGRAPHY

### Font Family
```html
<p class="font-sans">Sans-serif font</p>
<p class="font-serif">Serif font</p>
<p class="font-mono">Monospace font</p>
```

### Font Size
```html
<p class="text-xs">Extra small (0.75rem)</p>
<p class="text-sm">Small (0.875rem)</p>
<p class="text-base">Base (1rem)</p>
<p class="text-lg">Large (1.125rem)</p>
<p class="text-xl">Extra large (1.25rem)</p>
<p class="text-2xl">2X large (1.5rem)</p>
<p class="text-3xl">3X large (1.875rem)</p>
<p class="text-4xl">4X large (2.25rem)</p>
<p class="text-5xl">5X large (3rem)</p>
<p class="text-6xl">6X large (3.75rem)</p>
<p class="text-7xl">7X large (4.5rem)</p>
<p class="text-8xl">8X large (6rem)</p>
<p class="text-9xl">9X large (8rem)</p>
```

### Font Weight
```html
<p class="font-thin">Weight 100</p>
<p class="font-extralight">Weight 200</p>
<p class="font-light">Weight 300</p>
<p class="font-normal">Weight 400</p>
<p class="font-medium">Weight 500</p>
<p class="font-semibold">Weight 600</p>
<p class="font-bold">Weight 700</p>
<p class="font-extrabold">Weight 800</p>
<p class="font-black">Weight 900</p>
```

### Text Alignment & Decoration
```html
<!-- Alignment -->
<p class="text-left">Left aligned</p>
<p class="text-center">Center aligned</p>
<p class="text-right">Right aligned</p>
<p class="text-justify">Justified</p>

<!-- Decoration -->
<p class="underline">Underlined text</p>
<p class="line-through">Strikethrough text</p>
<p class="no-underline">No underline</p>

<!-- Transform -->
<p class="uppercase">UPPERCASE TEXT</p>
<p class="lowercase">lowercase text</p>
<p class="capitalize">Capitalized Text</p>
<p class="normal-case">Normal case</p>
```

### Line Height & Letter Spacing
```html
<!-- Line height -->
<p class="leading-none">line-height: 1</p>
<p class="leading-tight">line-height: 1.25</p>
<p class="leading-normal">line-height: 1.5</p>
<p class="leading-relaxed">line-height: 1.625</p>
<p class="leading-loose">line-height: 2</p>

<!-- Letter spacing -->
<p class="tracking-tighter">letter-spacing: -0.05em</p>
<p class="tracking-tight">letter-spacing: -0.025em</p>
<p class="tracking-normal">letter-spacing: 0</p>
<p class="tracking-wide">letter-spacing: 0.025em</p>
<p class="tracking-wider">letter-spacing: 0.05em</p>
<p class="tracking-widest">letter-spacing: 0.1em</p>
```

### Text Overflow & Wrapping
```html
<!-- Overflow -->
<p class="truncate">Truncate with ellipsis</p>
<p class="text-ellipsis overflow-hidden">Text ellipsis</p>
<p class="text-clip">Text clip</p>

<!-- Wrapping -->
<p class="text-wrap">Normal wrapping</p>
<p class="text-nowrap">No wrapping</p>
<p class="text-balance">Balanced wrapping (v4+)</p>
<p class="text-pretty">Pretty wrapping (v4+)</p>

<!-- Word break -->
<p class="break-normal">Normal break</p>
<p class="break-words">Break words</p>
<p class="break-all">Break all</p>
<p class="break-keep">Keep words together</p>
```

---

## 5. COLORS & BACKGROUNDS

### Text Color
Tailwind includes color scales: slate, gray, zinc, neutral, stone, red, orange, amber, yellow, lime, green, emerald, teal, cyan, sky, blue, indigo, violet, purple, fuchsia, pink, rose

```html
<!-- Color scales (50-950) -->
<p class="text-slate-50">Lightest slate</p>
<p class="text-slate-500">Medium slate</p>
<p class="text-slate-900">Darkest slate</p>

<!-- Primary colors -->
<p class="text-blue-600">Blue text</p>
<p class="text-red-500">Red text</p>
<p class="text-green-600">Green text</p>

<!-- Semantic colors -->
<p class="text-black">Black</p>
<p class="text-white">White</p>
<p class="text-transparent">Transparent</p>
<p class="text-current">Current color</p>

<!-- Opacity -->
<p class="text-blue-500/50">50% opacity</p>
<p class="text-blue-500/75">75% opacity</p>

<!-- Arbitrary colors -->
<p class="text-[#1da1f2]">Twitter blue</p>
<p class="text-[rgb(255,0,0)]">RGB red</p>
```

### Background Color
```html
<div class="bg-white">White background</div>
<div class="bg-slate-100">Light gray background</div>
<div class="bg-blue-500">Blue background</div>
<div class="bg-gradient-to-r from-blue-500 to-purple-600">Gradient</div>

<!-- With opacity -->
<div class="bg-black/50">50% black</div>
<div class="bg-white/90">90% white</div>
```

### Gradients
```html
<!-- Direction -->
<div class="bg-gradient-to-t from-blue-500 to-purple-500">Top</div>
<div class="bg-gradient-to-tr from-blue-500 to-purple-500">Top-right</div>
<div class="bg-gradient-to-r from-blue-500 to-purple-500">Right</div>
<div class="bg-gradient-to-br from-blue-500 to-purple-500">Bottom-right</div>
<div class="bg-gradient-to-b from-blue-500 to-purple-500">Bottom</div>
<div class="bg-gradient-to-bl from-blue-500 to-purple-500">Bottom-left</div>
<div class="bg-gradient-to-l from-blue-500 to-purple-500">Left</div>
<div class="bg-gradient-to-tl from-blue-500 to-purple-500">Top-left</div>

<!-- Multiple color stops -->
<div class="bg-gradient-to-r from-purple-500 via-pink-500 to-red-500">
  Purple to pink to red
</div>

<!-- Custom positions -->
<div class="bg-gradient-to-r from-blue-500 from-10% via-purple-500 via-30% to-pink-500 to-90%">
  Gradient with stops
</div>
```

---

## 6. BORDERS & EFFECTS

### Borders
```html
<!-- Width -->
<div class="border">1px border</div>
<div class="border-2">2px border</div>
<div class="border-4">4px border</div>
<div class="border-8">8px border</div>

<!-- Individual sides -->
<div class="border-t">Top border</div>
<div class="border-r">Right border</div>
<div class="border-b">Bottom border</div>
<div class="border-l">Left border</div>
<div class="border-x">Horizontal borders</div>
<div class="border-y">Vertical borders</div>

<!-- Color -->
<div class="border border-gray-300">Gray border</div>
<div class="border-2 border-blue-500">Blue border</div>
<div class="border border-black/20">20% black border</div>

<!-- Style -->
<div class="border border-solid">Solid</div>
<div class="border border-dashed">Dashed</div>
<div class="border border-dotted">Dotted</div>
<div class="border border-double">Double</div>
<div class="border-0">No border</div>
```

### Border Radius
```html
<div class="rounded-none">No radius</div>
<div class="rounded-sm">2px radius</div>
<div class="rounded">0.25rem radius</div>
<div class="rounded-md">0.375rem radius</div>
<div class="rounded-lg">0.5rem radius</div>
<div class="rounded-xl">0.75rem radius</div>
<div class="rounded-2xl">1rem radius</div>
<div class="rounded-3xl">1.5rem radius</div>
<div class="rounded-full">9999px radius (pill)</div>

<!-- Individual corners -->
<div class="rounded-t-lg">Top corners</div>
<div class="rounded-r-lg">Right corners</div>
<div class="rounded-b-lg">Bottom corners</div>
<div class="rounded-l-lg">Left corners</div>
<div class="rounded-tl-lg">Top-left corner</div>
<div class="rounded-tr-lg">Top-right corner</div>
<div class="rounded-br-lg">Bottom-right corner</div>
<div class="rounded-bl-lg">Bottom-left corner</div>
```

### Shadows
```html
<!-- Box shadows -->
<div class="shadow-sm">Small shadow</div>
<div class="shadow">Default shadow</div>
<div class="shadow-md">Medium shadow</div>
<div class="shadow-lg">Large shadow</div>
<div class="shadow-xl">Extra large shadow</div>
<div class="shadow-2xl">2X large shadow</div>
<div class="shadow-inner">Inner shadow</div>
<div class="shadow-none">No shadow</div>

<!-- Colored shadows -->
<div class="shadow-lg shadow-blue-500/50">Blue shadow</div>

<!-- Drop shadows (filters) -->
<div class="drop-shadow-md">Drop shadow</div>
<div class="drop-shadow-lg">Large drop shadow</div>
```

### Opacity
```html
<div class="opacity-0">Invisible</div>
<div class="opacity-25">25% opacity</div>
<div class="opacity-50">50% opacity</div>
<div class="opacity-75">75% opacity</div>
<div class="opacity-100">Fully opaque</div>
```

### Mix Blend Mode
```html
<div class="mix-blend-normal">Normal</div>
<div class="mix-blend-multiply">Multiply</div>
<div class="mix-blend-screen">Screen</div>
<div class="mix-blend-overlay">Overlay</div>
<div class="mix-blend-darken">Darken</div>
<div class="mix-blend-lighten">Lighten</div>
```

---

## 7. FILTERS & TRANSFORMS

### Filters
```html
<!-- Blur -->
<img class="blur-none" src="...">
<img class="blur-sm" src="...">
<img class="blur-md" src="...">
<img class="blur-lg" src="...">
<img class="blur-xl" src="...">

<!-- Brightness -->
<img class="brightness-50" src="...">
<img class="brightness-100" src="...">
<img class="brightness-150" src="...">

<!-- Contrast -->
<img class="contrast-50" src="...">
<img class="contrast-100" src="...">
<img class="contrast-150" src="...">

<!-- Grayscale -->
<img class="grayscale" src="...">
<img class="grayscale-0" src="...">

<!-- Sepia -->
<img class="sepia" src="...">

<!-- Invert -->
<img class="invert" src="...">

<!-- Saturate -->
<img class="saturate-50" src="...">
<img class="saturate-100" src="...">
<img class="saturate-150" src="...">

<!-- Hue rotate -->
<img class="hue-rotate-15" src="...">
<img class="hue-rotate-90" src="...">
```

### Transforms
```html
<!-- Scale -->
<div class="scale-0">scale(0)</div>
<div class="scale-50">scale(0.5)</div>
<div class="scale-100">scale(1)</div>
<div class="scale-150">scale(1.5)</div>
<div class="scale-x-50">scaleX(0.5)</div>
<div class="scale-y-50">scaleY(0.5)</div>

<!-- Rotate -->
<div class="rotate-0">rotate(0deg)</div>
<div class="rotate-45">rotate(45deg)</div>
<div class="rotate-90">rotate(90deg)</div>
<div class="rotate-180">rotate(180deg)</div>
<div class="-rotate-45">rotate(-45deg)</div>

<!-- Translate -->
<div class="translate-x-0">translateX(0)</div>
<div class="translate-x-4">translateX(1rem)</div>
<div class="translate-y-8">translateY(2rem)</div>
<div class="-translate-x-4">translateX(-1rem)</div>
<div class="translate-x-1/2">translateX(50%)</div>

<!-- Skew -->
<div class="skew-x-0">skewX(0deg)</div>
<div class="skew-x-6">skewX(6deg)</div>
<div class="skew-y-3">skewY(3deg)</div>

<!-- Transform origin -->
<div class="origin-center">center</div>
<div class="origin-top">top</div>
<div class="origin-top-right">top right</div>
<div class="origin-right">right</div>
<div class="origin-bottom-right">bottom right</div>
<div class="origin-bottom">bottom</div>
<div class="origin-bottom-left">bottom left</div>
<div class="origin-left">left</div>
<div class="origin-top-left">top left</div>
```

---

## 8. FLEXBOX & GRID

### Flexbox
```html
<!-- Flex container -->
<div class="flex">
  <!-- Flex direction -->
  <div class="flex flex-row">Row (default)</div>
  <div class="flex flex-row-reverse">Row reverse</div>
  <div class="flex flex-col">Column</div>
  <div class="flex flex-col-reverse">Column reverse</div>

  <!-- Flex wrap -->
  <div class="flex flex-wrap">Wrap</div>
  <div class="flex flex-wrap-reverse">Wrap reverse</div>
  <div class="flex flex-nowrap">No wrap</div>

  <!-- Justify content (main axis) -->
  <div class="flex justify-start">Start</div>
  <div class="flex justify-end">End</div>
  <div class="flex justify-center">Center</div>
  <div class="flex justify-between">Space between</div>
  <div class="flex justify-around">Space around</div>
  <div class="flex justify-evenly">Space evenly</div>

  <!-- Align items (cross axis) -->
  <div class="flex items-start">Start</div>
  <div class="flex items-end">End</div>
  <div class="flex items-center">Center</div>
  <div class="flex items-baseline">Baseline</div>
  <div class="flex items-stretch">Stretch</div>

  <!-- Align content (multiple lines) -->
  <div class="flex flex-wrap content-start">Start</div>
  <div class="flex flex-wrap content-center">Center</div>
  <div class="flex flex-wrap content-end">End</div>
  <div class="flex flex-wrap content-between">Between</div>
  <div class="flex flex-wrap content-around">Around</div>

  <!-- Gap -->
  <div class="flex gap-4">1rem gap</div>
  <div class="flex gap-x-4 gap-y-8">Horizontal and vertical gap</div>
</div>

<!-- Flex item -->
<div class="flex">
  <!-- Flex grow/shrink -->
  <div class="flex-1">flex: 1 1 0%</div>
  <div class="flex-auto">flex: 1 1 auto</div>
  <div class="flex-initial">flex: 0 1 auto</div>
  <div class="flex-none">flex: none</div>
  <div class="grow">flex-grow: 1</div>
  <div class="grow-0">flex-grow: 0</div>
  <div class="shrink">flex-shrink: 1</div>
  <div class="shrink-0">flex-shrink: 0</div>

  <!-- Order -->
  <div class="order-1">Order 1</div>
  <div class="order-2">Order 2</div>
  <div class="order-first">Order -9999</div>
  <div class="order-last">Order 9999</div>

  <!-- Align self -->
  <div class="self-auto">auto</div>
  <div class="self-start">start</div>
  <div class="self-center">center</div>
  <div class="self-end">end</div>
  <div class="self-stretch">stretch</div>
</div>
```

### Grid
```html
<!-- Grid container -->
<div class="grid">
  <!-- Grid columns -->
  <div class="grid grid-cols-1">1 column</div>
  <div class="grid grid-cols-2">2 columns</div>
  <div class="grid grid-cols-3">3 columns</div>
  <div class="grid grid-cols-4">4 columns</div>
  <div class="grid grid-cols-6">6 columns</div>
  <div class="grid grid-cols-12">12 columns</div>

  <!-- Grid rows -->
  <div class="grid grid-rows-1">1 row</div>
  <div class="grid grid-rows-2">2 rows</div>
  <div class="grid grid-rows-3">3 rows</div>

  <!-- Gap -->
  <div class="grid grid-cols-3 gap-4">1rem gap</div>
  <div class="grid grid-cols-3 gap-x-4 gap-y-8">Different gaps</div>

  <!-- Justify/Align items -->
  <div class="grid justify-items-start">Start</div>
  <div class="grid justify-items-center">Center</div>
  <div class="grid justify-items-end">End</div>
  <div class="grid items-start">Start</div>
  <div class="grid items-center">Center</div>
  <div class="grid items-end">End</div>

  <!-- Justify/Align content -->
  <div class="grid justify-start">Start</div>
  <div class="grid justify-center">Center</div>
  <div class="grid justify-end">End</div>
  <div class="grid justify-between">Between</div>
  <div class="grid justify-around">Around</div>
  <div class="grid justify-evenly">Evenly</div>
</div>

<!-- Grid item -->
<div class="grid grid-cols-6">
  <!-- Column span -->
  <div class="col-span-1">Span 1 column</div>
  <div class="col-span-2">Span 2 columns</div>
  <div class="col-span-3">Span 3 columns</div>
  <div class="col-span-4">Span 4 columns</div>
  <div class="col-span-full">Span all columns</div>

  <!-- Column start/end -->
  <div class="col-start-1 col-end-3">Start 1, end 3</div>
  <div class="col-start-2 col-end-4">Start 2, end 4</div>

  <!-- Row span -->
  <div class="row-span-1">Span 1 row</div>
  <div class="row-span-2">Span 2 rows</div>
  <div class="row-span-full">Span all rows</div>

  <!-- Row start/end -->
  <div class="row-start-1 row-end-3">Start 1, end 3</div>

  <!-- Justify/Align self -->
  <div class="justify-self-start">Start</div>
  <div class="justify-self-center">Center</div>
  <div class="justify-self-end">End</div>
  <div class="self-start">Start</div>
  <div class="self-center">Center</div>
  <div class="self-end">End</div>
</div>
```

---

## 9. RESPONSIVE DESIGN

### Breakpoints
Mobile-first breakpoint system:

- `sm`: 640px and up
- `md`: 768px and up
- `lg`: 1024px and up
- `xl`: 1280px and up
- `2xl`: 1536px and up

```html
<!-- Mobile-first approach -->
<div class="text-sm md:text-base lg:text-lg xl:text-xl">
  Responsive text size
</div>

<!-- Hidden at different breakpoints -->
<div class="block md:hidden">Visible only on mobile</div>
<div class="hidden md:block">Hidden on mobile, visible on tablet+</div>
<div class="hidden lg:block">Hidden until large screens</div>

<!-- Responsive layout -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
  <div>Item 4</div>
</div>

<!-- Responsive padding/margin -->
<div class="p-4 md:p-6 lg:p-8">
  Responsive padding
</div>

<!-- Responsive flex direction -->
<div class="flex flex-col md:flex-row">
  <div>Left</div>
  <div>Right</div>
</div>
```

### Container Queries (v4+)
```html
<!-- Container -->
<div class="@container">
  <!-- Query container size -->
  <div class="@sm:text-lg @md:text-xl @lg:text-2xl">
    Responsive to container, not viewport
  </div>
</div>

<!-- Named containers -->
<div class="@container/main">
  <div class="@lg/main:flex">
    Responds to container named "main"
  </div>
</div>
```

---

## 10. STATE VARIANTS

### Hover, Focus, Active
```html
<!-- Hover -->
<button class="bg-blue-500 hover:bg-blue-700">
  Hover me
</button>

<!-- Focus -->
<input class="border border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200">

<!-- Active -->
<button class="bg-blue-500 active:bg-blue-800">
  Press me
</button>

<!-- Focus visible (keyboard only) -->
<button class="focus:outline-none focus-visible:ring">
  Keyboard accessible
</button>

<!-- Focus within -->
<div class="border border-gray-300 focus-within:border-blue-500">
  <input type="text">
</div>
```

### Group & Peer Variants
```html
<!-- Group hover -->
<div class="group">
  <img class="group-hover:opacity-75">
  <p class="group-hover:text-blue-600">Hover the group</p>
</div>

<!-- Named groups -->
<div class="group/card">
  <div class="group/item">
    <p class="group-hover/card:text-blue-600 group-hover/item:underline">
      Multiple group contexts
    </p>
  </div>
</div>

<!-- Peer (sibling state) -->
<input type="checkbox" class="peer">
<label class="peer-checked:text-blue-600 peer-checked:bg-blue-50">
  Checked
</label>

<!-- Peer with different states -->
<input class="peer" type="text">
<p class="hidden peer-invalid:block text-red-600">
  Invalid input
</p>
```

### Form States
```html
<!-- Checked -->
<input type="checkbox" class="checked:bg-blue-500">

<!-- Disabled -->
<button class="disabled:opacity-50 disabled:cursor-not-allowed" disabled>
  Disabled
</button>

<!-- Required -->
<input class="required:border-red-500" required>

<!-- Invalid -->
<input class="invalid:border-red-500">

<!-- Placeholder shown -->
<input class="placeholder-shown:border-gray-300">
```

### Other States
```html
<!-- First/Last child -->
<div>
  <p class="first:mt-0">First paragraph</p>
  <p class="last:mb-0">Last paragraph</p>
</div>

<!-- Odd/Even child -->
<div>
  <div class="odd:bg-gray-100">Odd row</div>
  <div class="even:bg-white">Even row</div>
</div>

<!-- Empty -->
<p class="empty:hidden">Only show if not empty</p>

<!-- Open (details/dialog) -->
<details class="open:bg-white">
  <summary>Click me</summary>
  <p>Content</p>
</details>
```

---

## 11. DARK MODE

### Configuration
Tailwind supports dark mode using the `dark:` variant. Configure in CSS:

```css
@import "tailwindcss";

/* Option 1: Media query strategy (default) */
@media (prefers-color-scheme: dark) {
  /* Dark mode enabled by system preference */
}

/* Option 2: Class strategy */
@variant dark (&:is(.dark *));
```

### Usage
```html
<!-- Basic dark mode -->
<div class="bg-white dark:bg-slate-900 text-black dark:text-white">
  Light and dark mode
</div>

<!-- Dark mode button -->
<button class="bg-blue-500 hover:bg-blue-700 dark:bg-blue-600 dark:hover:bg-blue-800">
  Button
</button>

<!-- Dark mode card -->
<div class="bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg p-6">
  <h2 class="text-gray-900 dark:text-white">Card title</h2>
  <p class="text-gray-600 dark:text-gray-300">Card content</p>
</div>

<!-- Dark mode with group -->
<div class="group bg-white dark:bg-gray-800">
  <img class="group-hover:opacity-75 dark:group-hover:opacity-50">
</div>
```

### Toggle Dark Mode (Class Strategy)
```html
<!-- HTML -->
<html class="dark">
  <body>
    <button id="theme-toggle">Toggle theme</button>
  </body>
</html>

<script>
// JavaScript
const toggle = document.getElementById('theme-toggle');
toggle.addEventListener('click', () => {
  document.documentElement.classList.toggle('dark');
});

// Save preference
if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
  document.documentElement.classList.add('dark')
} else {
  document.documentElement.classList.remove('dark')
}
</script>
```

---

## 12. COMPONENT PATTERNS

### Button
```html
<!-- Primary button -->
<button class="bg-blue-500 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded">
  Primary Button
</button>

<!-- Secondary button -->
<button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-2 px-4 rounded">
  Secondary Button
</button>

<!-- Outline button -->
<button class="bg-transparent hover:bg-blue-500 text-blue-700 hover:text-white font-semibold py-2 px-4 border border-blue-500 hover:border-transparent rounded">
  Outline Button
</button>

<!-- Icon button -->
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold p-3 rounded-full">
  <svg class="size-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
  </svg>
</button>

<!-- Button sizes -->
<button class="bg-blue-500 text-white text-xs py-1 px-2 rounded">Small</button>
<button class="bg-blue-500 text-white text-sm py-2 px-4 rounded">Medium</button>
<button class="bg-blue-500 text-white text-base py-3 px-6 rounded">Large</button>
```

### Card
```html
<div class="max-w-sm rounded-lg overflow-hidden shadow-lg bg-white">
  <!-- Image -->
  <img class="w-full" src="image.jpg" alt="Card image">

  <!-- Content -->
  <div class="px-6 py-4">
    <h3 class="font-bold text-xl mb-2 text-gray-800">Card Title</h3>
    <p class="text-gray-700 text-base">
      Card description goes here. This is a sample card component.
    </p>
  </div>

  <!-- Tags -->
  <div class="px-6 py-4">
    <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">#tag1</span>
    <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">#tag2</span>
  </div>
</div>
```

### Form
```html
<form class="max-w-md mx-auto bg-white shadow-md rounded px-8 py-6">
  <!-- Text input -->
  <div class="mb-4">
    <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
      Username
    </label>
    <input
      class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring focus:ring-blue-300"
      id="username"
      type="text"
      placeholder="Username"
    >
  </div>

  <!-- Password input -->
  <div class="mb-6">
    <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
      Password
    </label>
    <input
      class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:ring focus:ring-blue-300"
      id="password"
      type="password"
      placeholder="******************"
    >
    <p class="text-red-500 text-xs italic">Please choose a password.</p>
  </div>

  <!-- Checkbox -->
  <div class="mb-6">
    <label class="flex items-center">
      <input class="mr-2 leading-tight" type="checkbox">
      <span class="text-sm text-gray-700">Remember me</span>
    </label>
  </div>

  <!-- Submit button -->
  <div class="flex items-center justify-between">
    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:ring" type="button">
      Sign In
    </button>
    <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="#">
      Forgot Password?
    </a>
  </div>
</form>
```

### Modal
```html
<!-- Modal overlay -->
<div class="fixed inset-0 bg-black/50 flex items-center justify-center p-4">
  <!-- Modal content -->
  <div class="bg-white rounded-lg max-w-md w-full p-6">
    <!-- Header -->
    <div class="flex items-center justify-between mb-4">
      <h3 class="text-xl font-bold text-gray-900">Modal Title</h3>
      <button class="text-gray-400 hover:text-gray-600">
        <svg class="size-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
        </svg>
      </button>
    </div>

    <!-- Body -->
    <div class="mb-6">
      <p class="text-gray-700">Modal body content goes here.</p>
    </div>

    <!-- Footer -->
    <div class="flex justify-end gap-3">
      <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-2 px-4 rounded">
        Cancel
      </button>
      <button class="bg-blue-500 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded">
        Confirm
      </button>
    </div>
  </div>
</div>
```

### Navigation
```html
<nav class="bg-white shadow-lg">
  <div class="max-w-7xl mx-auto px-4">
    <div class="flex justify-between items-center h-16">
      <!-- Logo -->
      <div class="flex-shrink-0">
        <span class="text-xl font-bold text-gray-800">Logo</span>
      </div>

      <!-- Menu -->
      <div class="hidden md:flex space-x-8">
        <a href="#" class="text-gray-700 hover:text-blue-600 px-3 py-2 font-medium">Home</a>
        <a href="#" class="text-gray-700 hover:text-blue-600 px-3 py-2 font-medium">About</a>
        <a href="#" class="text-gray-700 hover:text-blue-600 px-3 py-2 font-medium">Services</a>
        <a href="#" class="text-gray-700 hover:text-blue-600 px-3 py-2 font-medium">Contact</a>
      </div>

      <!-- Mobile menu button -->
      <div class="md:hidden">
        <button class="text-gray-700 hover:text-blue-600">
          <svg class="size-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
          </svg>
        </button>
      </div>
    </div>
  </div>
</nav>
```

### Alert/Banner
```html
<!-- Success alert -->
<div class="bg-green-50 border-l-4 border-green-500 p-4">
  <div class="flex">
    <div class="flex-shrink-0">
      <svg class="size-5 text-green-500" fill="currentColor" viewBox="0 0 20 20">
        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
      </svg>
    </div>
    <div class="ml-3">
      <p class="text-sm text-green-700">
        Successfully saved!
      </p>
    </div>
  </div>
</div>

<!-- Error alert -->
<div class="bg-red-50 border-l-4 border-red-500 p-4">
  <div class="flex">
    <div class="flex-shrink-0">
      <svg class="size-5 text-red-500" fill="currentColor" viewBox="0 0 20 20">
        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
      </svg>
    </div>
    <div class="ml-3">
      <p class="text-sm text-red-700">
        There was an error processing your request.
      </p>
    </div>
  </div>
</div>
```

### Badge
```html
<span class="inline-flex items-center px-3 py-0.5 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
  Badge
</span>

<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
  <svg class="mr-1.5 size-2" fill="currentColor" viewBox="0 0 8 8">
    <circle cx="4" cy="4" r="3"></circle>
  </svg>
  Active
</span>
```

---

## 13. CUSTOMIZATION & CONFIGURATION

### CSS Configuration (v4)
```css
@import "tailwindcss";

/* Custom colors */
@theme {
  --color-primary: #3b82f6;
  --color-secondary: #8b5cf6;
  --color-accent: #f59e0b;

  /* Custom breakpoint */
  --breakpoint-3xl: 1920px;

  /* Custom spacing */
  --spacing-18: 4.5rem;

  /* Custom font family */
  --font-display: "Inter", sans-serif;
}

/* Custom utilities */
@utility tab-* {
  tab-size: *;
}

/* Custom variants */
@variant hocus (&:hover, &:focus);

@variant supports-grid (supports(display: grid));
```

### Arbitrary Values
```html
<!-- Arbitrary sizes -->
<div class="w-[347px] h-[600px]">Custom size</div>

<!-- Arbitrary colors -->
<div class="bg-[#1da1f2] text-[rgb(255,0,0)]">Custom colors</div>

<!-- Arbitrary properties -->
<div class="[mask-type:luminance]">Custom property</div>

<!-- Arbitrary variants -->
<div class="[&:nth-child(3)]:text-red-500">Third child is red</div>
<div class="[&_p]:text-gray-700">All p descendants gray</div>

<!-- Arbitrary calculations -->
<div class="w-[calc(100%-2rem)]">Calculated width</div>
<div class="top-[calc(100vh-4rem)]">Calculated position</div>
```

### Custom Plugins (v3 legacy)
```javascript
// tailwind.config.js
export default {
  plugins: [
    function({ addUtilities }) {
      addUtilities({
        '.scrollbar-hide': {
          '-ms-overflow-style': 'none',
          'scrollbar-width': 'none',
          '&::-webkit-scrollbar': {
            display: 'none'
          }
        }
      })
    }
  ]
}
```

---

## 14. BEST PRACTICES

### Performance
1. **Use PurgeCSS** - Tailwind automatically removes unused styles in production
2. **Avoid @apply in components** - Use utility classes directly for better tree-shaking
3. **Use CSS variables for themes** - More performant than duplicate classes
4. **Minimize arbitrary values** - Use theme values when possible

### Organization
1. **Component extraction** - Extract repeating patterns into components (React/Vue/etc)
2. **Consistent spacing** - Stick to spacing scale (4, 8, 12, 16, etc.)
3. **Mobile-first** - Always design mobile-first, then add responsive variants
4. **Logical ordering** - Group related utilities (layout, spacing, colors, typography)

### Accessibility
```html
<!-- Focus states -->
<button class="focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
  Accessible button
</button>

<!-- Skip to content -->
<a href="#main" class="sr-only focus:not-sr-only focus:absolute focus:top-0 focus:left-0">
  Skip to content
</a>

<!-- Screen reader utilities -->
<span class="sr-only">Hidden from visual users, available to screen readers</span>
<span class="not-sr-only">Visible to everyone</span>
```

### Common Patterns
```html
<!-- Centered container -->
<div class="container mx-auto px-4">Content</div>

<!-- Full-height section -->
<section class="min-h-screen flex items-center justify-center">Content</section>

<!-- Aspect ratio -->
<div class="aspect-video">16:9 video</div>
<div class="aspect-square">Square</div>

<!-- Truncate text -->
<p class="truncate">Long text that will be truncated...</p>

<!-- Line clamp -->
<p class="line-clamp-3">
  Text that will be clamped to 3 lines with ellipsis...
</p>

<!-- Smooth scrolling -->
<html class="scroll-smooth">
```

---

## 15. V4 NEW FEATURES

### Modern CSS Features
```html
<!-- Size utilities (width and height) -->
<div class="size-12">width: 3rem; height: 3rem</div>
<div class="size-full">width: 100%; height: 100%</div>

<!-- Inline/block sizing -->
<div class="inline-12">inline-size: 3rem</div>
<div class="block-12">block-size: 3rem</div>

<!-- Logical properties -->
<div class="pbs-4 pbe-4">padding-block-start/end</div>
<div class="mbs-4 mbe-4">margin-block-start/end</div>
<div class="border-bs border-be">border-block-start/end</div>
<div class="inset-s-4 inset-e-4">inset-inline-start/end</div>

<!-- Text wrapping -->
<p class="text-balance">Balanced text wrapping</p>
<p class="text-pretty">Pretty text wrapping</p>
```

### Container Queries
```html
<div class="@container">
  <div class="@sm:text-lg @md:grid @md:grid-cols-2 @lg:grid-cols-3">
    Responds to container size
  </div>
</div>

<!-- Named containers -->
<div class="@container/sidebar">
  <nav class="@lg/sidebar:flex @lg/sidebar:flex-col">
    Navigation
  </nav>
</div>
```

### Enhanced Gradients
```html
<!-- Gradient with custom stops -->
<div class="bg-gradient-to-r from-blue-500 from-10% via-purple-500 via-30% to-pink-500 to-90%">
  Gradient with precise color stops
</div>
```

### Improved Dark Mode
```css
@import "tailwindcss";

/* Scoped dark mode variant */
@variant dark (&:is(.dark *));

/* System preference variant */
@variant dark (@media (prefers-color-scheme: dark));
```

### Font Feature Settings
```html
<p class="font-features-[\"cv01\",\"cv02\"]">
  OpenType features
</p>
```

---

## QUICK REFERENCE

### Most Common Utilities
```html
<!-- Layout -->
flex, grid, block, inline-block, hidden
container, mx-auto

<!-- Flexbox -->
flex-row, flex-col, justify-center, items-center, gap-4

<!-- Grid -->
grid-cols-3, gap-4, col-span-2

<!-- Spacing -->
p-4, px-6, py-8, m-4, mx-auto, space-x-4, space-y-4

<!-- Sizing -->
w-full, h-screen, max-w-md, min-h-screen

<!-- Typography -->
text-base, text-lg, font-bold, text-center, leading-normal

<!-- Colors -->
bg-white, text-gray-900, border-gray-300

<!-- Borders & Radius -->
border, border-2, rounded, rounded-lg, rounded-full

<!-- Shadows -->
shadow, shadow-md, shadow-lg

<!-- Effects -->
opacity-50, hover:opacity-100, transition, duration-200

<!-- Responsive -->
md:flex, lg:grid-cols-3, xl:text-xl

<!-- States -->
hover:bg-blue-700, focus:ring, active:scale-95, dark:bg-gray-800
```

### Useful Combinations
```html
<!-- Button -->
bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded

<!-- Card -->
bg-white rounded-lg shadow-lg p-6

<!-- Input -->
border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring focus:ring-blue-200

<!-- Centered content -->
flex items-center justify-center min-h-screen

<!-- Responsive container -->
container mx-auto px-4 md:px-6 lg:px-8
```

---

## TIPS FOR ACCURATE USAGE

1. **Always use complete class names** - `bg-blue-500` not `bg-blue`
2. **Check breakpoint syntax** - `md:text-lg` not `md-text-lg`
3. **Proper state variants** - `hover:bg-blue-700` not `bg-blue-700:hover`
4. **Spacing values exist** - Use scale values (4, 8, 12) not arbitrary unless needed
5. **Use size-* for square dimensions** - `size-12` is shorter than `w-12 h-12`
6. **Leverage arbitrary values** - Use `w-[347px]` when exact values needed
7. **Remember mobile-first** - Base classes are for mobile, then add `md:`, `lg:`, etc.
8. **Dark mode requires variant** - Always prefix with `dark:` for dark mode styles
9. **Combine utilities logically** - Group layout, then spacing, then appearance
10. **Extract components** - Reuse common patterns in your framework (React, Vue, etc.)

---

**Remember**: Tailwind is about composing utility classes to build any design without writing custom CSS. Focus on combining utilities effectively rather than reaching for custom CSS.
