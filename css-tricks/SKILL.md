# CSS Tricks - You Need to Know

**Version**: 1.0.0
**Last Updated**: 2026-02-13
**Source**: Based on [You-need-to-know-css](https://github.com/l-hammer/You-need-to-know-css)

A comprehensive collection of practical CSS tricks, techniques, and solutions for common web design problems. This skill covers 52 essential CSS patterns organized into 7 categories, providing production-ready code examples and best practices.

---

## Table of Contents

1. [Borders & Backgrounds](#1-borders--backgrounds) (6 tricks)
2. [Shapes](#2-shapes) (6 tricks)
3. [Visual Effects](#3-visual-effects) (9 tricks)
4. [User Experience](#4-user-experience) (11 tricks)
5. [Structure & Layout](#5-structure--layout) (7 tricks)
6. [Transition & Animations](#6-transition--animations) (7 tricks)
7. [Other Utilities](#7-other-utilities) (3 tricks)

---

## 1. Borders & Backgrounds

### 1.1 Translucent Borders (半透明边框)

**Problem**: By default, backgrounds extend beneath borders, covering translucent border effects.

**Solution**: Use `background-clip: padding-box` to constrain the background to the padding box.

**CSS Properties**: `background-clip`, `border`, `rgba/hsla`

```css
div {
  border: 10px solid hsla(0, 0%, 100%, .5);
  background: white;
  background-clip: padding-box; /* Prevents background from showing under border */
}
```

**Use Cases**:
- Glassmorphism designs
- Semi-transparent card borders
- Layered visual effects

---

### 1.2 Multiple Borders (多重边框)

**Problem**: Need multiple borders but CSS only supports one border property.

**Solutions**:

**Approach 1: box-shadow** (supports multiple solid borders)
```css
div {
  background: #b4a078;
  box-shadow:
    0 0 0 10px #E8E2D6,
    0 0 0 20px #E1D9C9,
    0 0 0 30px #D9CFBB,
    0 0 0 40px #D2C6AE;
}
```

**Approach 2: outline + border** (two borders, supports dashed/dotted)
```css
div {
  border: 5px solid #B4A078;
  outline: 1px dashed #B4A078;
  outline-offset: -10px;
}
```

**Key Points**:
- `box-shadow` spreads don't affect layout (don't take up space)
- `box-shadow` doesn't respond to border-radius in older browsers
- `outline` doesn't follow border-radius

**Use Cases**:
- Decorative borders
- Focus indicators with multiple rings
- Emphasis effects

---

### 1.3 Inner Rounding (边框内圆角)

**Problem**: Creating rounded corners on the inside of a border/outline.

**Solution**: Combine `border-radius` with `outline` and `box-shadow`.

```css
div {
  border-radius: 8px;
  outline: 6px solid #b4a078;
  box-shadow: 0 0 0 5px #b4a078;
}
```

**Formula**:
- Minimum box-shadow spread: `(√2 − 1) * r ≈ 0.414r`
- Maximum: outline width

**Use Cases**:
- Rounded buttons with thick borders
- Decorative frames
- Profile avatars with borders

---

### 1.4 Background Position (背景定位)

**Problem**: Position background images relative to edges other than top-left.

**Solutions**:

**Approach 1: Extended background-position syntax** (recommended)
```css
div {
  background: url(code.svg) no-repeat #b4a078;
  background-position: right 29px bottom 28px;
}
```

**Approach 2: background-origin**
```css
div {
  padding: 16px 29px 28px 20px;
  background: url(code.svg) no-repeat bottom right;
  background-origin: content-box;
}
```

**Approach 3: calc()**
```css
div {
  background: url(code.svg) no-repeat #b4a078;
  background-position: calc(100% - 29px) calc(100% - 28px);
}
```

**Use Cases**:
- Logo positioning
- Icon placement in cards
- Decorative background patterns

---

### 1.5 Striped Backgrounds (条纹背景)

**CSS Properties**: `linear-gradient`, `repeating-linear-gradient`, `radial-gradient`

**Pattern 1: Progress bar stripes**
```css
.progress-bg {
  background: repeating-linear-gradient(
    -45deg,
    #D9CFBB 0, #D9CFBB 25%,
    #C3B393 0, #C3B393 50%
  );
  background-size: 16px 16px;
  animation: panoramic 20s linear infinite;
}

@keyframes panoramic {
  to { background-position: 200% 0; }
}
```

**Pattern 2: Vertical stripes**
```css
div {
  background: linear-gradient(
    90deg,
    #D9CFBB 0, #D9CFBB 50%,
    #C3B393 0, #C3B393 100%
  );
  background-size: 40px 100%;
}
```

**Pattern 3: Coupon card with rounded cutouts**
```css
.coupon-card {
  background-image:
    radial-gradient(circle at 100px -8px, transparent 20px, #b4a078 21px),
    radial-gradient(circle at 100px 248px, transparent 20px, #b4a078 21px);
}
```

**Use Cases**:
- Loading progress bars
- Decorative backgrounds
- Coupon/ticket designs
- Diagonal patterns

---

### 1.6 One Pixel Line (1像素线)

**Problem**: Creating true 1px lines on high-DPI screens (2x, 3x displays).

**Solution**: Scale down borders using transform and media queries.

**Approach 1: box-shadow + transform** (all borders)
```css
.one-pixel-line::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  box-shadow: 0 0 0 1px #b4a078;
  transform-origin: 0 bottom;
  transform: scaleY(.5) translateZ(0);
}

@media (min-resolution: 2dppx) {
  .one-pixel-line::after {
    box-shadow: 0 0 0 .5px #b4a078;
  }
}
```

**Approach 2: border + transform** (single edge)
```css
.one-pixel-line::before {
  content: "";
  width: 100%;
  border-top: 1px solid #b4a078;
  transform-origin: 0 top;
}

@media (min-resolution: 2dppx) {
  .one-pixel-line::before {
    width: 200%;
    transform: scale(.5) translateZ(0);
  }
}
```

**Use Cases**:
- Mobile app borders
- Thin dividers on retina displays
- Table borders

---

## 2. Shapes

### 2.1 Ellipse (椭圆)

**CSS Properties**: `border-radius`

**Key Concept**: `border-radius` accepts two values separated by `/` for horizontal and vertical radii.

**Patterns**:
```css
/* Half ellipse (top) */
.half-ellipse-top {
  border-radius: 50% / 100% 100% 0 0;
}

/* Half ellipse (right) */
.half-ellipse-right {
  border-radius: 0 100% 100% 0 / 50%;
}

/* Quarter ellipse */
.quarter-ellipse {
  border-radius: 100% 0 0 0;
}
```

**Use Cases**:
- Decorative shapes
- Modal dialog backgrounds
- Button designs

---

### 2.2 Parallelograms (平行四边形)

**CSS Properties**: `transform: skew()`, `clip-path`

**Approach 1: Nested elements**
```css
.parallelogram {
  transform: skewX(-45deg);
}

.parallelogram > span {
  transform: skewX(45deg); /* Un-skew content */
}
```

**Approach 2: Pseudo-element** (recommended - no markup changes)
```css
.parallelogram {
  position: relative;
}

.parallelogram::before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  background: #b4a078;
  transform: skewX(-45deg);
}
```

**Approach 3: Diamond shape with clip-path**
```css
img {
  clip-path: polygon(50% 0, 100% 50%, 50% 100%, 0 50%);
  transition: clip-path 0.3s;
}

img:hover {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
}
```

**Use Cases**:
- Diagonal buttons
- Dynamic headers
- Image hover effects

---

### 2.3 Cutout Corners (切角效果)

**CSS Properties**: `linear-gradient`, `radial-gradient`, `clip-path`

**Approach 1: Linear gradients** (straight cutouts)
```css
div {
  background:
    linear-gradient(45deg, transparent 12px, #b4a078 13px) bottom left,
    linear-gradient(135deg, transparent 12px, #b4a078 13px) top left,
    linear-gradient(-135deg, transparent 12px, #b4a078 13px) top right,
    linear-gradient(-45deg, transparent 12px, #b4a078 13px) bottom right;
  background-size: 51% 51%;
  background-repeat: no-repeat;
}
```

**Approach 2: Radial gradients** (rounded cutouts)
```css
div {
  background:
    radial-gradient(circle at bottom left, transparent 15px, #b4a078 16px) bottom left,
    radial-gradient(circle at top left, transparent 15px, #b4a078 16px) top left,
    radial-gradient(circle at top right, transparent 15px, #b4a078 16px) top right,
    radial-gradient(circle at bottom right, transparent 15px, #b4a078 16px) bottom right;
  background-size: 51% 51%;
  background-repeat: no-repeat;
}
```

**Approach 3: clip-path** (recommended - most flexible)
```css
div {
  clip-path: polygon(
    20px 0, calc(100% - 20px) 0,
    100% 20px, 100% calc(100% - 20px),
    calc(100% - 20px) 100%, 20px 100%,
    0 calc(100% - 20px), 0 20px
  );
}
```

**Use Cases**:
- Price tags
- Badges
- Special cards/panels

---

### 2.4 Pie Charts (饼图)

**CSS Properties**: `linear-gradient`, `transform: rotate()`, `animation`

**CSS Solution**:
```css
.pie {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background: linear-gradient(to right, transparent 50%, #b4a078 0);
}

.pie::before {
  content: "";
  display: block;
  margin-left: 50%;
  height: 100%;
  border-radius: 0 100% 100% 0 / 0 50% 50% 0;
  background-color: inherit;
  transform-origin: 0 50%;
  transform: rotate(.3turn); /* 30% = 0.3 * 360deg */
}
```

**SVG Solution** (recommended - more flexible)
```html
<svg viewBox="0 0 32 32">
  <circle r="16" cx="16" cy="16"
    fill="#E8E2D6"
    stroke="#b4a078"
    stroke-width="32"
    stroke-dasharray="38 100"
    transform="rotate(-90)"
    transform-origin="center" />
</svg>
```

**Use Cases**:
- Progress indicators
- Data visualization
- Loading spinners

---

### 2.5 Poptip (提示气泡)

**CSS Properties**: `::before`, `::after`, `filter: drop-shadow()`, `transform`

**Dark Theme**:
```css
.poptip::before {
  content: '';
  position: absolute;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-top-color: #b4a078;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
}

.poptip::after {
  content: attr(aria-controls);
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translate(-50%, 6px);
  background: #b4a078;
  color: white;
  padding: 6px 12px;
  border-radius: 2px;
  white-space: nowrap;
  box-shadow: 0 0 3px #b4a078;
}
```

**Light Theme** (using filter for unified shadow)
```css
.poptip::after {
  background: #F7F5F1;
  color: #333;
  filter: drop-shadow(0 0 1px rgba(180,160,120,.9));
}

.poptip::before {
  border-top-color: #F7F5F1;
  filter: drop-shadow(0 1px .5px rgba(180,160,120,.4));
}
```

**Use Cases**:
- Tooltips
- Dropdown menus
- Contextual hints

---

### 2.6 Polygon (多边形)

**CSS Properties**: `border`, `transform`, `::before`, `::after`

**Common Shapes**:

```css
/* Trapezoid (梯形) */
.trapezoid {
  width: 80px;
  height: 0;
  border: 40px solid transparent;
  border-top: 0;
  border-bottom: 80px solid #b4a078;
}

/* Triangle (三角形) */
.triangle {
  width: 0;
  height: 0;
  border: 50px solid transparent;
  border-bottom-color: #b4a078;
  border-top: 0;
}

/* Five-point Star (五角星) */
.star-5-points {
  position: relative;
  width: 0;
  height: 0;
  border: 80px solid transparent;
  border-top: 0;
  border-bottom: 56px solid #b4a078;
  transform: rotateZ(35deg);
}

.star-5-points::before {
  content: '';
  position: absolute;
  height: 0;
  width: 0;
  top: -70px;
  left: -80px;
  border: 80px solid transparent;
  border-top: 0;
  border-bottom: 80px solid #b4a078;
  transform: rotateZ(-35deg);
}

/* Heart (心形) */
.heart {
  position: relative;
}

.heart::before,
.heart::after {
  content: '';
  position: absolute;
  width: 50px;
  height: 80px;
  background: #b4a078;
  border-radius: 50px 50px 0 0;
  transform: rotateZ(-45deg);
  transform-origin: 0 100%;
}

.heart::after {
  left: 50px;
  transform: rotateZ(45deg);
  transform-origin: 100% 100%;
}
```

**Use Cases**:
- Icons without images
- Decorative elements
- Badges and labels

---

## 3. Visual Effects

### 3.1 Common Shadows (常见阴影)

**CSS Properties**: `box-shadow`

**Syntax**: `box-shadow: h-offset v-offset blur spread color [inset];`

**Patterns**:
```css
/* Regular shadow */
div { box-shadow: 0 0 6px rgba(180,160,120,.8); }

/* Single side shadow (bottom) */
div { box-shadow: 0 6px 5px -5px rgba(180,160,120,.6); }

/* Adjacent sides shadow (bottom + right) */
div { box-shadow: 5px 5px 5px -4px rgba(180,160,120,.6); }

/* Two sides shadow (left + right) */
div {
  box-shadow:
    6px 0 5px -5px rgba(180,160,120,.6),
    -6px 0 5px -5px rgba(180,160,120,.6);
}

/* 1px stroke effect */
div { box-shadow: 0 0 0 1px rgba(180,160,120,.6); }
```

**Key Technique**: Use negative spread to control shadow visibility on specific sides.

**Use Cases**:
- Card shadows
- Button depth
- Elevation effects

---

### 3.2 Irregular Shadows (不规则阴影)

**Problem**: `box-shadow` follows the box model, not the actual shape.

**Solution**: Use `filter: drop-shadow()` which respects transparency and shape.

**CSS Properties**: `filter: drop-shadow()`

```css
/* Arrow with shadow */
.arrow-box {
  border-radius: 5px;
  background: #b4a078;
  filter: drop-shadow(2px 2px 2px rgba(180,160,120,.9));
}

.arrow-box::before {
  content: '';
  position: absolute;
  right: -20px;
  border: 22px solid transparent;
  border-left-color: #b4a078;
}

/* Dotted border with shadow */
.dotted-box {
  border: 6px dotted #b4a078;
  background: white;
  filter: drop-shadow(2px 2px 2px rgba(180,160,120,.9));
}

/* Cutout shape with shadow */
.cutout-box {
  background:
    radial-gradient(circle at bottom right, transparent 29px, #b4a078 30px);
  filter: drop-shadow(2px 2px 2px rgba(180,160,120,.9));
}
```

**Use Cases**:
- Speech bubbles
- Complex shaped cards
- Image filters

---

### 3.3 Frosted Glass (毛玻璃效果)

**CSS Properties**: `filter: blur()`, `backdrop-filter`, `background: fixed`

**Approach 1: Pseudo-element blur**
```css
main {
  background: url("./bg.jpg") fixed 0 / cover;
}

.card {
  position: relative;
  background: hsla(0,0%,100%,.5);
  overflow: hidden;
}

.card::before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  background: url("./bg.jpg") fixed 0 / cover;
  filter: blur(10px);
  margin: -30px; /* Eliminate edge blur */
}
```

**Approach 2: backdrop-filter** (modern, better performance)
```css
.card {
  background: hsla(0,0%,100%,.5);
  backdrop-filter: blur(10px);
}
```

**Use Cases**:
- Modal overlays
- Navigation bars
- iOS-style cards

---

### 3.4 Zebra Stripes (斑马条纹)

**Problem**: Add alternating background stripes to text/code blocks.

**Solution**: Use `linear-gradient` with `background-size`.

```css
pre {
  background: #f8f8f8;
  background-image: linear-gradient(
    rgba(18,18,18,.05) 50%,
    transparent 0
  );
  background-size: auto 48px; /* Line height * 2 */
  background-origin: content-box;
  line-height: 24px;
}
```

**Use Cases**:
- Code syntax highlighting
- Table rows
- List backgrounds

---

### 3.5 Text Effects (文字效果)

**CSS Properties**: `text-shadow`, `filter`, `-webkit-text-fill-color`, `-webkit-text-stroke`

**Effect Collection**:

```css
/* Embossed text (凸起) */
.embossed {
  background: hsl(40, 28.57%, 58.82%);
  color: hsl(40, 28.57%, 28.82%);
  text-shadow: 0 .03em .03em hsla(0,0%,100%,.8);
}

/* Engraved text (凹陷) */
.engraved {
  background: hsl(40, 28.57%, 28.82%);
  color: hsl(40, 28.57%, 58.82%);
  text-shadow: 0 .03em .03em black;
}

/* Hollow text (空心字) */
.hollow {
  color: white;
  text-shadow:
    0 0 2px #333, 0 0 2px #333,
    0 0 2px #333, 0 0 2px #333,
    0 0 2px #333, 0 0 2px #333;
}

/* Glowing text (发光字) */
.glow {
  color: white;
  text-shadow: 0 0 .1em, 0 0 .3em;
  animation: blink .8s infinite alternate;
}

@keyframes blink {
  50% { text-shadow: 0 0 .1em, 0 0 .3em; }
  to { text-shadow: 0 0 .1em; }
}

/* Blurry text (模糊字) */
.blur:hover {
  color: transparent;
  text-shadow: 0 0 .1em white, 0 0 .3em white;
}

/* 3D text (立体字) */
.three-d {
  color: white;
  text-shadow:
    1px 1px #333, 2px 2px #333,
    3px 3px #333, 4px 4px #333;
}

/* Gradient text (渐变字) */
.gradient {
  background: linear-gradient(90deg, #b4a078, #333);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
```

**Use Cases**:
- Headings
- Logos
- Call-to-action text

---

### 3.6 Circular Text (环形文字)

**Solution**: Use SVG `textPath`.

```html
<svg viewBox="0 0 100 100">
  <path
    d="M 0,50 a 50,50 0 1,1 0,1 z"
    id="circle"
    fill="none" />
  <text>
    <textPath xlink:href="#circle">
      Circular text goes here •
    </textPath>
  </text>
</svg>
```

```css
svg {
  overflow: visible;
  animation: rotate 5s linear infinite;
}

@keyframes rotate {
  to { transform: rotate(1turn); }
}
```

**Use Cases**:
- Logos
- Badges
- Decorative text

---

### 3.7 Line Breaks (插入换行)

**Problem**: Insert line breaks via CSS without `<br>` tags.

**Solution**: Use `::before` with `\A` (line feed character).

```css
span.break::before {
  content: "\A";
  white-space: pre; /* Preserve the line feed */
}

/* Conditional breaks with commas */
span.item + span.item::before {
  content: ", ";
  font-weight: 500;
  margin-left: -.25em;
}

span.item:last-child::before {
  content: " and ";
}
```

**HTML**:
```html
<p>
  Colors:
  <span class="item">red</span>
  <span class="item">green</span>
  <span class="item">blue</span>
</p>
<!-- Outputs: Colors: red, green and blue -->
```

**Use Cases**:
- Dynamic content formatting
- Form labels
- List separators

---

### 3.8 Image Contrast Widget (图片对比滑块)

**CSS Properties**: `resize`, `overflow: hidden`, `input[type=range]`

**Approach 1: CSS resize property**
```css
.image-slider {
  position: relative;
  width: 600px;
}

.image-slider > div {
  width: 50%;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  overflow: hidden;
  max-width: 100%;
  resize: horizontal;
}

.image-slider > div > img {
  display: block;
  width: 600px; /* Original width */
}

.image-slider > div::before {
  content: "";
  width: 12px;
  height: 12px;
  position: absolute;
  right: 0;
  bottom: 0;
  cursor: ew-resize;
  background: linear-gradient(-45deg, #E8E2D6 50%, transparent 0);
  background-clip: content-box;
}
```

**Approach 2: Range input** (recommended - better UX)
```html
<div class="image-slider">
  <img src="before.jpg">
  <div>
    <img src="after.jpg">
  </div>
  <input type="range" min="0" max="100" value="50">
</div>
```

```css
input[type=range] {
  width: 100%;
  position: absolute;
  left: 0;
  bottom: 10px;
  cursor: ew-resize;
  appearance: none;
  background: transparent;
}
```

```javascript
const slider = document.querySelector('input[type=range]');
const overlay = document.querySelector('.image-slider > div');

slider.addEventListener('input', (e) => {
  overlay.style.width = e.target.value + '%';
});
```

**Use Cases**:
- Before/after comparisons
- Image editing previews
- A/B testing displays

---

## 4. User Experience

### 4.1 Mouse Cursor (鼠标光标)

**CSS Properties**: `cursor`

**Common Values**:
```css
.default { cursor: default; }
.pointer { cursor: pointer; }
.text { cursor: text; }
.move { cursor: move; }
.crosshair { cursor: crosshair; }
.help { cursor: help; }
.wait { cursor: wait; }
.progress { cursor: progress; }

/* Directional resize */
.resize-n { cursor: n-resize; }
.resize-ne { cursor: ne-resize; }
.resize-e { cursor: e-resize; }
.resize-se { cursor: se-resize; }
.resize-s { cursor: s-resize; }
.resize-sw { cursor: sw-resize; }
.resize-w { cursor: w-resize; }
.resize-nw { cursor: nw-resize; }

/* Zoom */
.zoom-in { cursor: zoom-in; }
.zoom-out { cursor: zoom-out; }

/* Grab (webkit only) */
.grab { cursor: -webkit-grab; cursor: grab; }
.grabbing { cursor: -webkit-grabbing; cursor: grabbing; }

/* Custom cursor */
.custom {
  cursor: url('cursor.png'), auto;
}
```

**Use Cases**:
- Interactive elements
- Drag-and-drop interfaces
- Image zoom
- Text selection areas

---

### 4.2 Extend Hit Area (扩大点击区域)

**Problem**: Small buttons/icons are hard to click, especially on mobile.

**Solutions**:

**Approach 1: Transparent border** (simple but affects layout)
```css
.button {
  border: 8px solid transparent;
  background: #b4a078 padding-box;
}
```

**Approach 2: Pseudo-element** (recommended - no layout impact)
```css
.button {
  position: relative;
}

.button::before {
  content: "";
  position: absolute;
  top: -10px;
  right: -10px;
  bottom: -10px;
  left: -10px;
}
```

**Best Practice**: Touch targets should be at least 44x44px (iOS) or 48x48px (Android).

**Use Cases**:
- Mobile buttons
- Icon buttons
- Close buttons
- Checkbox/radio labels

---

### 4.3 Custom Checkboxes (自定义复选框)

**CSS Properties**: `:checked`, `::before`, `::after`, `transform`

```css
/* Hide native checkbox */
input[type="checkbox"] {
  position: absolute;
  clip: rect(0, 0, 0, 0);
}

/* Custom checkbox box */
input[type="checkbox"] + label {
  position: relative;
  cursor: pointer;
  user-select: none;
}

input[type="checkbox"] + label::before {
  content: "";
  display: inline-block;
  width: 16px;
  height: 16px;
  margin-right: 8px;
  border: 2px solid #ccc;
  border-radius: 3px;
  background: white;
  vertical-align: middle;
  transition: all .2s;
}

/* Checkmark */
input[type="checkbox"] + label::after {
  content: "";
  position: absolute;
  left: 5px;
  top: 50%;
  width: 5px;
  height: 10px;
  border: 2px solid white;
  border-top: 0;
  border-left: 0;
  transform: translateY(-50%) rotate(45deg) scale(0);
  transition: transform .2s;
}

/* Checked state */
input[type="checkbox"]:checked + label::before {
  background: #b4a078;
  border-color: #b4a078;
}

input[type="checkbox"]:checked + label::after {
  transform: translateY(-50%) rotate(45deg) scale(1);
}

/* Hover state */
input[type="checkbox"]:not(:disabled) + label:hover::before {
  border-color: #b4a078;
}

/* Disabled state */
input[type="checkbox"]:disabled + label {
  cursor: not-allowed;
  opacity: .5;
}
```

**HTML**:
```html
<input type="checkbox" id="accept" />
<label for="accept">I accept the terms</label>
```

**Use Cases**:
- Forms
- Settings panels
- To-do lists
- Feature toggles

---

### 4.4 Custom Radio Buttons (自定义单选框)

**CSS Properties**: `:checked`, `::before`, `::after`, `transform`

```css
input[type="radio"] {
  position: absolute;
  clip: rect(0, 0, 0, 0);
}

input[type="radio"] + label {
  position: relative;
  cursor: pointer;
  user-select: none;
}

/* Radio circle */
input[type="radio"] + label::before {
  content: "";
  display: inline-block;
  width: 16px;
  height: 16px;
  margin-right: 8px;
  border: 2px solid #ccc;
  border-radius: 50%;
  background: white;
  vertical-align: middle;
  transition: all .2s;
}

/* Inner dot */
input[type="radio"] + label::after {
  content: "";
  position: absolute;
  left: 6px;
  top: 50%;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
  transform: translateY(-50%) scale(0);
  transition: transform .2s;
}

/* Checked state */
input[type="radio"]:checked + label::before {
  background: #b4a078;
  border-color: #b4a078;
}

input[type="radio"]:checked + label::after {
  transform: translateY(-50%) scale(1);
}

/* Hover */
input[type="radio"]:not(:disabled) + label:hover::before {
  border-color: #b4a078;
}
```

**Use Cases**:
- Form selections
- Surveys
- Settings options

---

### 4.5 Custom Switch (自定义开关)

**CSS Properties**: `:checked`, `::before`, `::after`, `transition`

```css
input[type="checkbox"].switch {
  position: absolute;
  clip: rect(0, 0, 0, 0);
}

input[type="checkbox"].switch + label {
  position: relative;
  display: inline-block;
  width: 48px;
  height: 20px;
  background: #ccc;
  border-radius: 10px;
  cursor: pointer;
  transition: background .3s;
}

/* OFF text */
input[type="checkbox"].switch + label::before {
  content: 'OFF';
  position: absolute;
  top: 4px;
  left: 21px;
  color: white;
  font-size: 10px;
  font-weight: bold;
  transition: all .3s;
}

/* Toggle circle */
input[type="checkbox"].switch + label::after {
  content: '';
  position: absolute;
  top: 1px;
  left: 1px;
  width: 18px;
  height: 18px;
  border-radius: 50%;
  background: white;
  box-shadow: 0 2px 4px rgba(0,0,0,.2);
  transition: all .3s;
}

/* Checked state */
input[type="checkbox"].switch:checked + label {
  background: #b4a078;
}

input[type="checkbox"].switch:checked + label::before {
  content: 'ON';
  left: 6px;
}

input[type="checkbox"].switch:checked + label::after {
  left: 29px;
}
```

**HTML**:
```html
<input type="checkbox" class="switch" id="toggle" />
<label for="toggle"></label>
```

**Use Cases**:
- Feature toggles
- Settings panels
- Dark mode switches

---

### 4.6 Input Align (输入框对齐)

**Problem**: Input text and placeholder don't align vertically.

**Solution**: Match `line-height` for placeholder.

```css
input {
  font-size: 14px;
  padding: 8px 12px;
  border: 1px solid #e3e3e3;
  border-radius: 4px;
  line-height: 1.5;
  transition: all .3s;
}

input::placeholder {
  line-height: 1.5; /* Match input line-height */
  color: #999;
}

input:hover {
  border-color: #b4a078;
}

input:focus {
  outline: none;
  border-color: #b4a078;
  box-shadow: 0 0 0 2px rgba(180, 160, 120, 0.2);
}
```

**Use Cases**:
- All form inputs
- Search bars
- Login forms

---

### 4.7 Shadow Weaken Background (阴影弱化背景)

**Problem**: Create modal overlays that dim the background.

**Solutions**:

**Approach 1: Overlay div** (traditional)
```css
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, .8);
  z-index: 999;
}
```

**Approach 2: box-shadow** (no extra markup)
```css
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 999;
  box-shadow: 0 0 0 50vmax rgba(0, 0, 0, .8);
}
```

**Approach 3: ::backdrop** (for `<dialog>` element)
```css
dialog {
  border: none;
  border-radius: 8px;
  padding: 2em;
}

dialog::backdrop {
  background: rgba(0, 0, 0, .8);
  backdrop-filter: blur(3px);
}
```

```javascript
document.querySelector('dialog').showModal();
```

**Use Cases**:
- Modal dialogs
- Image lightboxes
- Confirmation prompts

---

### 4.8 Blur Weaken Background (模糊弱化背景)

**CSS Properties**: `filter: blur()`, `transition`

```css
article {
  transition: filter .6s;
}

article.de-emphasized {
  filter: blur(5px);
}

.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: white;
  padding: 2em;
  border-radius: 8px;
  box-shadow:
    0 .1em .2em rgba(0,0,0,.5),
    0 0 0 50vmax rgba(0,0,0,.3);
  z-index: 999;
}
```

```javascript
// When modal opens
document.querySelector('article').classList.add('de-emphasized');
```

**Use Cases**:
- Focus mode
- Modal overlays
- Attention directing

---

### 4.9 Text Underlines (文字下划线)

**Problem**: `text-decoration: underline` doesn't allow customization.

**Solutions**:

**Approach 1: box-shadow**
```css
a {
  text-decoration: none;
  box-shadow: 0 -1px 0 0 #b4a078 inset;
  transition: box-shadow .3s;
}

a:hover {
  box-shadow: 0 -20px 0 0 #b4a078 inset;
}
```

**Approach 2: linear-gradient** (most flexible)
```css
a {
  text-decoration: none;
  background: linear-gradient(#b4a078, #b4a078) no-repeat;
  background-size: 100% 1px;
  background-position: 0 1em;
  text-shadow:
    .05em 0 white,
    -.05em 0 white; /* Avoid descenders */
}

/* Dashed underline */
a.dashed {
  background: linear-gradient(90deg, #b4a078 66%, transparent 0) repeat-x;
  background-size: .3em 1px;
  background-position: 0 1em;
}

/* Wavy underline */
a.wavy {
  background:
    linear-gradient(45deg, transparent 45%, #b4a078 45%, #b4a078 60%, transparent 0),
    linear-gradient(-45deg, transparent 45%, #b4a078 45%, #b4a078 60%, transparent 0);
  background-repeat: repeat-x;
  background-size: .3em .15em;
  background-position: 0 1em, .2em 1em;
}
```

**Use Cases**:
- Link effects
- Emphasis
- Decorative text

---

### 4.10 Custom Scrollbar (自定义滚动条)

**CSS Properties**: `::-webkit-scrollbar-*` (WebKit/Blink only)

**Note**: Limited browser support. Consider using JavaScript libraries for cross-browser support.

```css
/* Scrollbar width */
.custom-scrollbar::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

/* Track (background) */
.custom-scrollbar::-webkit-scrollbar-track {
  background: rgba(180,160,120,.1);
  border-radius: 4px;
  box-shadow: inset 0 0 1px rgba(180,160,120,.5);
}

/* Thumb (draggable part) */
.custom-scrollbar::-webkit-scrollbar-thumb {
  background: rgba(180,160,120,.8);
  border-radius: 4px;
}

.custom-scrollbar::-webkit-scrollbar-thumb:hover {
  background: rgba(180,160,120,1);
}

/* Corner (where horizontal and vertical meet) */
.custom-scrollbar::-webkit-scrollbar-corner {
  background: rgba(180,160,120,.1);
  border-radius: 4px;
}
```

**Use Cases**:
- Custom themed applications
- Code editors
- Content-heavy sections

---

## 5. Structure & Layout

### 5.1 Full Background, Fixed Content (全屏背景固定内容)

**Problem**: Full-width background with fixed-width centered content.

**Solution**: Use `calc()` for horizontal padding.

```css
body {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

header,
main,
footer {
  padding: 1em calc(50% - 500px); /* 500px = half content width */
  background: white;
}

/* For 1000px max content width:
   Padding = 50% - 500px
   This centers content and extends background full-width
*/
```

**Use Cases**:
- Landing pages
- Full-width sections
- Parallax layouts

---

### 5.2 Sticky Footer (粘性页脚)

**Problem**: Footer should stick to bottom when content is short, but push down when content is tall.

**Solutions**:

**Approach 1: calc()** (simple but requires fixed header/footer heights)
```css
html, body { height: 100%; }

main {
  min-height: calc(100% - 60px - 100px); /* 100% - header - footer */
  box-sizing: border-box;
}
```

**Approach 2: Flexbox** (recommended - no fixed heights needed)
```css
html, body { height: 100%; }

body {
  display: flex;
  flex-direction: column;
}

main {
  flex: 1; /* Takes all available space */
}
```

**Approach 3: Grid**
```css
html, body { height: 100%; }

body {
  display: grid;
  grid-template-rows: auto 1fr auto; /* header main footer */
}
```

**Use Cases**:
- All websites
- Admin dashboards
- Single-page apps

---

### 5.3 Centered (水平垂直居中)

**Six Methods for Centering**:

**Method 1: Flexbox + margin auto** (recommended)
```css
.container {
  display: flex;
}

.centered {
  margin: auto;
}
```

**Method 2: Grid**
```css
.container {
  display: grid;
  place-items: center; /* justify-content + align-items */
}
```

**Method 3: Absolute + translate** (for unknown sizes)
```css
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

**Method 4: Absolute + calc()** (for known sizes)
```css
.centered {
  position: absolute;
  width: 200px;
  height: 100px;
  top: calc(50% - 50px);
  left: calc(50% - 100px);
}
```

**Method 5: Table-cell**
```css
.container {
  display: table;
  width: 100%;
  height: 100%;
}

.table-cell {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}
```

**Method 6: Pseudo-element + vertical-align**
```css
.container {
  text-align: center;
}

.container::after {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
}

.centered {
  display: inline-block;
  vertical-align: middle;
}
```

**Comparison**:
- **Flexbox**: Best overall, works for unknown sizes
- **Grid**: Modern, concise
- **Absolute + translate**: Works everywhere, unknown sizes
- **Absolute + calc()**: Known sizes only
- **Table-cell**: Legacy support
- **Pseudo-element**: Legacy, complex markup

---

### 5.4 Holy Grail Layout (圣杯布局)

**Goal**: Three-column layout with fixed-width sidebars and fluid center column, center column loads first in HTML.

**CSS (Float-based)**:
```css
section {
  padding: 0 150px 0 200px; /* Right sidebar | Left sidebar */
}

section::after {
  content: '';
  display: block;
  clear: both;
}

.left,
.center,
.right {
  float: left;
  position: relative;
}

.left {
  width: 200px;
  right: 200px;
  margin-left: -100%;
}

.center {
  width: 100%;
}

.right {
  width: 150px;
  margin-right: -150px;
}
```

**HTML Order**:
```html
<section>
  <div class="center">Center (loads first)</div>
  <div class="left">Left sidebar</div>
  <div class="right">Right sidebar</div>
</section>
```

**Modern Alternative (Flexbox)**:
```css
section {
  display: flex;
}

.left { width: 200px; order: -1; }
.center { flex: 1; }
.right { width: 150px; }
```

**Use Cases**:
- Blog layouts
- Documentation sites
- Admin dashboards

---

### 5.5 Double Wing Layout (双飞翼布局)

**Similar to Holy Grail but uses margin instead of padding** - simpler implementation.

```css
section::after {
  content: '';
  display: block;
  clear: both;
}

.left,
.center,
.right {
  float: left;
}

.left {
  width: 200px;
  margin-left: -100%;
}

.center {
  width: 100%;
}

.center-inner {
  margin: 0 150px 0 200px; /* Margin instead of container padding */
}

.right {
  width: 150px;
  margin-left: -150px;
}
```

**HTML**:
```html
<section>
  <div class="center">
    <div class="center-inner">Center content</div>
  </div>
  <div class="left">Left sidebar</div>
  <div class="right">Right sidebar</div>
</section>
```

---

### 5.6 Order Layout (类排序布局)

**Goal**: Three columns where center has full height, left/right are vertically centered.

**Modern Solution: Grid** (recommended)
```css
.container {
  display: grid;
  grid-template-columns: 200px 1fr 200px;
  align-items: center;
}

.center {
  align-self: stretch; /* Full height */
}
```

**Flexbox Solution**:
```css
.container {
  display: flex;
  align-items: center;
}

.left, .right {
  width: 200px;
  align-self: center;
}

.center {
  flex: 1;
  align-self: stretch;
}
```

---

### 5.7 Flexbox Layout (Flexbox布局)

**Container Properties**:

```css
.container {
  display: flex;

  /* Direction */
  flex-direction: row | row-reverse | column | column-reverse;

  /* Wrapping */
  flex-wrap: nowrap | wrap | wrap-reverse;

  /* Shorthand */
  flex-flow: <flex-direction> <flex-wrap>;

  /* Main axis alignment */
  justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly;

  /* Cross axis alignment */
  align-items: flex-start | flex-end | center | baseline | stretch;

  /* Multi-line cross axis alignment */
  align-content: flex-start | flex-end | center | space-between | space-around | stretch;
}
```

**Item Properties**:

```css
.item {
  /* Display order */
  order: <integer>; /* Default: 0 */

  /* Growth factor */
  flex-grow: <number>; /* Default: 0 */

  /* Shrink factor */
  flex-shrink: <number>; /* Default: 1 */

  /* Base size */
  flex-basis: <length> | auto; /* Default: auto */

  /* Shorthand */
  flex: none | <flex-grow> <flex-shrink> <flex-basis>;
  /* Common: flex: 1 = flex: 1 1 0% */

  /* Individual cross axis alignment */
  align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```

**Common Patterns**:

```css
/* Equal width columns */
.item { flex: 1; }

/* Specific ratios (1:2:1) */
.item:nth-child(1) { flex: 1; }
.item:nth-child(2) { flex: 2; }
.item:nth-child(3) { flex: 1; }

/* Fixed + fluid */
.sidebar { flex: 0 0 200px; } /* Don't grow/shrink, 200px */
.main { flex: 1; } /* Take remaining space */

/* Center everything */
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

**Use Cases**:
- All modern layouts
- Responsive designs
- Component alignment

---

## 6. Transition & Animations

### 6.1 Bounce (弹跳动画)

**Concept**: Simulate realistic bouncing physics using cubic-bezier timing functions.

```css
.ball {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: radial-gradient(at 30% 30%, #f7f5f1, #b4a078);
  animation: bounce 2s cubic-bezier(.1,.25,1,.25) forwards;
}

@keyframes bounce {
  40%, 60%, 80%, to {
    transform: translateY(380px);
    animation-timing-function: ease-in; /* Falling */
  }
  50% {
    transform: translateY(260px); /* First bounce */
  }
  70% {
    transform: translateY(300px); /* Second bounce */
  }
  90% {
    transform: translateY(360px); /* Third bounce */
  }
}
```

**Physics**:
- Falling: `ease` or `cubic-bezier(.25, .1, .25, 1)` (acceleration)
- Rising: `ease-in` or `cubic-bezier(.1, .25, .1, .25)` (deceleration)

**Use Cases**:
- Loading animations
- Attention grabbers
- Playful interactions

---

### 6.2 Elastic (弹性动画)

**Concept**: Overshoot and bounce back effect.

**Approach 1: Animation**
```css
.popup {
  transform-origin: center;
  animation: elastic-grow .45s;
}

@keyframes elastic-grow {
  from { transform: scale(0); }
  70% {
    transform: scale(1.1);
    animation-timing-function: cubic-bezier(.1, .25, .1, .25);
  }
  to { transform: scale(1); }
}
```

**Approach 2: Transition** (recommended - simpler)
```css
.popup {
  transform: scale(0);
  transition: transform .4s cubic-bezier(.29, .15, .5, 1.46);
}

.popup.active {
  transform: scale(1);
}
```

**Cubic Bezier Curves**:
- Elastic: `cubic-bezier(.29, .15, .5, 1.46)`
- Bounce: `cubic-bezier(.68, -0.55, .265, 1.55)`

**Use Cases**:
- Button clicks
- Modal/tooltip entry
- Notification popups

---

### 6.3 Blink (闪烁动画)

**CSS Properties**: `animation-direction`, `step-end`

```css
/* Normal (0% visible -> 50% transparent -> 100% visible) */
.blink-normal {
  animation: blink-normal 1s infinite step-end;
}

@keyframes blink-normal {
  50% { opacity: 0; }
}

/* Alternate (smoother with direction) */
.blink-alternate {
  animation: blink-alternate .5s infinite alternate;
}

@keyframes blink-alternate {
  to { opacity: 0; }
}

/* Alternate-reverse (starts transparent) */
.blink-reverse {
  animation: blink-alternate .5s infinite alternate-reverse;
}
```

**Use Cases**:
- Error messages
- Alerts
- Cursor simulation
- Attention indicators

---

### 6.4 Typing (打字动画)

**Requirements**: Monospace font, single line, known character count.

```css
.typing {
  display: inline-block;
  width: 21ch; /* 21 characters */
  font: bold 200% Consolas, Monaco, monospace;
  border-right: 2px solid transparent;
  white-space: nowrap;
  overflow: hidden;
  animation:
    typing 3s steps(21),
    caret .5s steps(1) infinite;
}

@keyframes typing {
  from { width: 0; }
}

@keyframes caret {
  50% { border-right-color: currentColor; }
}
```

**Limitations**:
- Must be monospace font
- Fixed width = character count * `1ch`
- Single line only
- Use JavaScript for multi-line or variable content

**Use Cases**:
- Animated headings
- Code demonstrations
- Terminal simulations

---

### 6.5 Shake (抖动动画)

**Style 1: Rotation shake**
```css
.shake-rotate {
  animation: shake-rotate 2s ease infinite;
}

@keyframes shake-rotate {
  4% { transform: rotate(5deg); }
  12.5% { transform: rotate(-5deg); }
  21% { transform: rotate(5deg); }
  29% { transform: rotate(-5deg); }
  37.5% { transform: rotate(5deg); }
  46% { transform: rotate(-5deg); }
  50%, to { transform: rotate(0deg); }
}
```

**Style 2: Translation shake** (more intense)
```css
.shake-hard {
  animation: shake-hard .1s ease-in-out infinite;
}

@keyframes shake-hard {
  2% { transform: translate(0.5px, 2.5px) rotate(1.5deg); }
  4% { transform: translate(0.5px, -1.5px) rotate(0.5deg); }
  6% { transform: translate(1.5px, 1.5px) rotate(1.5deg); }
  8% { transform: translate(2.5px, 1.5px) rotate(0.5deg); }
  /* ... continue pattern */
}
```

**Use Cases**:
- Error validation
- Incorrect password
- Invalid input
- Notification badges

---

### 6.6 Smooth Scroll (平滑滚动)

**Horizontal background scroll**:
```css
.scroll-bg {
  background: url('./landscape.jpg') repeat-x 0 center / auto 100%;
  animation: smooth 10s linear infinite;
}

@keyframes smooth {
  to { background-position: 1970px center; }
}
```

**Infinite scroll effect**:
```css
.marquee {
  display: flex;
  overflow: hidden;
}

.marquee-content {
  display: flex;
  animation: marquee 20s linear infinite;
}

@keyframes marquee {
  to { transform: translateX(-50%); }
}
```

**HTML** (duplicate content for seamless loop):
```html
<div class="marquee">
  <div class="marquee-content">
    <span>Content to scroll</span>
    <span>Content to scroll</span>
  </div>
</div>
```

---

### 6.7 Circular Smooth (环形平滑动画)

**Concept**: Rotate items around a circle while keeping them upright.

```css
.orbit {
  position: relative;
  width: 300px;
  height: 300px;
}

.satellite {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 50px;
  height: 50px;
  margin: -25px 0 0 -25px;
  animation: orbit 7.5s infinite linear;
}

.satellite:nth-child(2) { animation-delay: -1.5s; }
.satellite:nth-child(3) { animation-delay: -3s; }
.satellite:nth-child(4) { animation-delay: -4.5s; }
.satellite:nth-child(5) { animation-delay: -6s; }

@keyframes orbit {
  from {
    transform:
      rotate(0turn)
      translateY(-150px) /* Orbit radius */
      rotate(1turn); /* Counter-rotate to keep upright */
  }
  to {
    transform:
      rotate(1turn)
      translateY(-150px)
      rotate(0turn);
  }
}
```

**Key Technique**:
- First `rotate()`: Rotates the orbit path
- `translateY()`: Moves item outward from center
- Second `rotate()`: Counter-rotates to keep item upright

**Use Cases**:
- Avatar carousels
- Feature showcases
- Loading animations
- Solar system simulations

---

## 7. Other Utilities

### 7.1 Common Snippets (常用代码片段)

**CSS Reset** (modern approach):
```css
@import 'normalize.css';

/* Box-sizing reset */
html {
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}

/* Default reset */
*:not(input, textarea) {
  border: 0;
  margin: 0;
  padding: 0;
}

/* Utility classes */
[hidden] {
  display: none !important;
}

[disabled] {
  opacity: .5;
  pointer-events: none;
}
```

**Clearfix**:
```css
.clearfix::after {
  content: "";
  display: block;
  clear: both;
}
```

**Text Ellipsis**:
```css
.ellipsis {
  display: inline-block;
  max-width: 250px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Multi-line ellipsis */
.ellipsis-multi {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
```

**Accessible Text Hiding**:
```css
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}
```

**Aspect Ratio Box** (before aspect-ratio property):
```css
.aspect-box {
  position: relative;
  padding-top: 56.25%; /* 16:9 ratio */
}

.aspect-box > * {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

**Modern aspect-ratio**:
```css
.aspect-box {
  aspect-ratio: 16 / 9;
}
```

---

### 7.2 Custom Variables (自定义变量)

**CSS Properties**: `--custom-property`, `var()`

**Basic Usage**:
```css
:root {
  --primary-color: #b4a078;
  --secondary-color: #E8E2D6;
  --spacing-unit: 8px;
  --border-radius: 4px;

  /* RGB values for alpha manipulation */
  --primary-rgb: 180, 160, 120;
}

.button {
  background: var(--primary-color);
  padding: calc(var(--spacing-unit) * 2);
  border-radius: var(--border-radius);
  color: white;
}

.button-transparent {
  background: rgba(var(--primary-rgb), 0.5);
}

/* Fallback values */
.text {
  color: var(--text-color, #333);
}
```

**Scoped Variables**:
```css
.card {
  --card-padding: 16px;
  --card-bg: white;

  padding: var(--card-padding);
  background: var(--card-bg);
}

.card.large {
  --card-padding: 32px;
}
```

**Dynamic Theming**:
```css
:root {
  --bg: white;
  --text: #333;
}

[data-theme="dark"] {
  --bg: #1a1a1a;
  --text: #f0f0f0;
}

body {
  background: var(--bg);
  color: var(--text);
  transition: background .3s, color .3s;
}
```

**JavaScript Manipulation**:
```javascript
// Set variable
document.documentElement.style.setProperty('--primary-color', '#ff6b6b');

// Get variable
const color = getComputedStyle(document.documentElement)
  .getPropertyValue('--primary-color');

// Remove variable
document.documentElement.style.removeProperty('--primary-color');
```

**Advanced: Calculated Variables**:
```css
:root {
  --base-size: 16px;
  --scale-ratio: 1.2;
}

h1 {
  font-size: calc(var(--base-size) * var(--scale-ratio) * var(--scale-ratio) * var(--scale-ratio));
}

h2 {
  font-size: calc(var(--base-size) * var(--scale-ratio) * var(--scale-ratio));
}

h3 {
  font-size: calc(var(--base-size) * var(--scale-ratio));
}
```

**Use Cases**:
- Design system tokens
- Theme switching
- Responsive scaling
- Dynamic styling

---

### 7.3 Interesting CSS Projects (有趣的CSS项目)

**Learning Resources**:

1. **NES.css** - Nintendo Entertainment System style CSS framework
   - URL: https://nostalgic-css.github.io/NES.css/
   - Retro 8-bit design system

2. **CSS Doodle** - Web component for drawing patterns with CSS
   - URL: https://css-doodle.com/
   - Generative art with CSS

3. **Animate.css** - Cross-browser CSS animation library
   - URL: https://animate.style/
   - Ready-to-use animations

4. **Epic Spinners** - Pure CSS loading spinners
   - URL: https://epic-spinners.epicmax.co/
   - No JavaScript required

5. **A Single Div** - CSS drawings using only one HTML element
   - URL: https://a.singlediv.com/
   - Advanced CSS art

6. **CSS Grid Generator** - Interactive Grid layout tool
   - URL: https://cssgrid-generator.netlify.app/
   - Visual grid code generation

7. **Gradient Generator** - CSS gradient tools
   - URL: https://cssgradient.io/
   - Visual gradient builder

8. **Clippy** - CSS clip-path maker
   - URL: https://bennettfeely.com/clippy/
   - Interactive clip-path shapes

---

## Best Practices

### Performance

1. **Avoid expensive properties**:
   - Minimize use of `box-shadow`, `border-radius`, `filter` on animations
   - Use `transform` and `opacity` for smooth 60fps animations

2. **Use `will-change` sparingly**:
   ```css
   .animated {
     will-change: transform;
   }

   .animated.complete {
     will-change: auto; /* Remove after animation */
   }
   ```

3. **Debounce expensive operations**:
   - Use `transform: translateZ(0)` or `transform: translate3d(0,0,0)` to force GPU acceleration

### Maintainability

1. **Use CSS custom properties for themes**
2. **Organize with comments and sections**
3. **Follow BEM or consistent naming conventions**
4. **Use relative units (rem, em, %) for better scaling**

### Accessibility

1. **Maintain sufficient color contrast** (WCAG AA: 4.5:1 for text)
2. **Don't rely solely on color** for information
3. **Test with screen readers**
4. **Respect `prefers-reduced-motion`**:
   ```css
   @media (prefers-reduced-motion: reduce) {
     * {
       animation-duration: 0.01ms !important;
       transition-duration: 0.01ms !important;
     }
   }
   ```

### Browser Support

1. **Use autoprefixer** for vendor prefixes
2. **Provide fallbacks** for modern features:
   ```css
   .element {
     background: #b4a078; /* Fallback */
     background: linear-gradient(135deg, #b4a078, #8a7a5a);
   }
   ```
3. **Feature detection** with `@supports`:
   ```css
   @supports (display: grid) {
     .container {
       display: grid;
     }
   }
   ```

---

## Summary

This skill covers **52 CSS tricks** organized into **7 categories**:

1. **Borders & Backgrounds** (6): Translucent borders, multiple borders, inner rounding, background positioning, striped backgrounds, 1px lines
2. **Shapes** (6): Ellipses, parallelograms, cutout corners, pie charts, poptips, polygons
3. **Visual Effects** (9): Shadows, frosted glass, zebra stripes, text effects, circular text, line breaks, image sliders
4. **User Experience** (11): Cursor styles, extended hit areas, custom form controls, input alignment, background weakening, text underlines, custom scrollbars
5. **Structure & Layout** (7): Fixed content, sticky footer, centering methods, holy grail, double wing, flexbox
6. **Animations** (7): Bounce, elastic, blink, typing, shake, smooth scroll, circular motion
7. **Utilities** (3): Common snippets, CSS variables, interesting projects

All techniques are:
- **Production-ready** - Battle-tested patterns
- **Well-documented** - Clear explanations and use cases
- **Modern** - Using latest CSS features with fallbacks
- **Practical** - Solving real-world design problems

---

**Last Updated**: 2026-02-13
**Version**: 1.0.0
**Source**: Based on [You-need-to-know-css](https://github.com/l-hammer/You-need-to-know-css) by l-hammer
