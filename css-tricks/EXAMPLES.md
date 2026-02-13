# CSS Tricks Skill - Usage Examples

This document demonstrates how Claude Code uses the CSS Tricks skill to help with common web development tasks.

---

## Example 1: Creating Custom Checkboxes

**User Question**:
> "I need to style custom checkboxes for my form. They should have smooth animations."

**Claude Code Response** (using the skill):

I'll create custom checkboxes with smooth animations using CSS. Here's a complete solution:

```html
<div class="checkbox-group">
  <input type="checkbox" id="terms" />
  <label for="terms">I agree to the terms and conditions</label>

  <input type="checkbox" id="newsletter" />
  <label for="newsletter">Subscribe to newsletter</label>

  <input type="checkbox" id="updates" disabled />
  <label for="updates">Receive updates (unavailable)</label>
</div>
```

```css
/* Hide native checkbox */
input[type="checkbox"] {
  position: absolute;
  clip: rect(0, 0, 0, 0);
}

/* Style the label */
input[type="checkbox"] + label {
  position: relative;
  cursor: pointer;
  padding-left: 28px;
  user-select: none;
  line-height: 20px;
}

/* Custom checkbox box */
input[type="checkbox"] + label::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 18px;
  height: 18px;
  border: 2px solid #ccc;
  border-radius: 3px;
  background: white;
  transition: all .2s ease-in-out;
}

/* Checkmark */
input[type="checkbox"] + label::after {
  content: "";
  position: absolute;
  left: 6px;
  top: 2px;
  width: 5px;
  height: 10px;
  border: 2px solid white;
  border-top: 0;
  border-left: 0;
  transform: rotate(45deg) scale(0);
  transition: transform .2s ease-in-out;
}

/* Checked state */
input[type="checkbox"]:checked + label::before {
  background: #b4a078;
  border-color: #b4a078;
}

input[type="checkbox"]:checked + label::after {
  transform: rotate(45deg) scale(1);
}

/* Hover effect */
input[type="checkbox"]:not(:disabled) + label:hover::before {
  border-color: #b4a078;
}

/* Disabled state */
input[type="checkbox"]:disabled + label {
  cursor: not-allowed;
  opacity: .5;
}
```

This implementation provides:
- Smooth animations on state changes
- Hover effects for better UX
- Proper disabled state styling
- Accessible markup (label-input association)

---

## Example 2: Implementing Sticky Footer

**User Question**:
> "How do I make my footer stick to the bottom of the page when content is short?"

**Claude Code Response**:

I'll show you three methods to implement a sticky footer. The Flexbox approach is recommended for modern projects:

**Method 1: Flexbox (Recommended)**
```css
html, body {
  height: 100%;
  margin: 0;
}

body {
  display: flex;
  flex-direction: column;
}

main {
  flex: 1; /* Takes all available space */
}

footer {
  /* Footer height is automatic */
}
```

**Method 2: CSS Grid**
```css
html, body {
  height: 100%;
  margin: 0;
}

body {
  display: grid;
  grid-template-rows: auto 1fr auto;
}

/* No additional styling needed for main/footer */
```

**Method 3: calc() (if footer height is fixed)**
```css
html, body {
  height: 100%;
  margin: 0;
}

main {
  min-height: calc(100vh - 60px - 100px);
  /* 100vh - header height - footer height */
}
```

**HTML Structure**:
```html
<!DOCTYPE html>
<html>
<body>
  <header>Header content</header>
  <main>Main content</main>
  <footer>Footer content</footer>
</body>
</html>
```

The Flexbox method is best because:
- No fixed heights required
- Works with dynamic content
- Simple and maintainable
- Excellent browser support

---

## Example 3: Centering Unknown-Size Elements

**User Question**:
> "What's the best way to center a div both horizontally and vertically when I don't know its size?"

**Claude Code Response**:

For centering elements with unknown dimensions, I recommend using Flexbox or CSS Grid. Here are the best approaches:

**Method 1: Flexbox + margin auto (Simplest)**
```css
.container {
  display: flex;
  min-height: 100vh;
}

.centered {
  margin: auto;
}
```

**Method 2: Flexbox alignment**
```css
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
```

**Method 3: CSS Grid**
```css
.container {
  display: grid;
  place-items: center; /* Shorthand for justify + align */
  min-height: 100vh;
}
```

**Method 4: Absolute + translate (for positioned elements)**
```css
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

**Complete Example**:
```html
<div class="container">
  <div class="centered">
    <h1>I'm centered!</h1>
    <p>No matter my size.</p>
  </div>
</div>
```

```css
.container {
  display: flex;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.centered {
  margin: auto;
  padding: 2em;
  background: white;
  border-radius: 8px;
  box-shadow: 0 10px 40px rgba(0,0,0,.2);
}
```

---

## Example 4: Frosted Glass Modal

**User Question**:
> "Create a modal dialog with a frosted glass background effect"

**Claude Code Response**:

I'll create a frosted glass modal using backdrop-filter (with fallback):

```html
<button id="openModal">Open Modal</button>

<div class="modal" id="modal">
  <div class="modal-content">
    <h2>Modal Title</h2>
    <p>This is a frosted glass modal dialog.</p>
    <button id="closeModal">Close</button>
  </div>
</div>
```

```css
/* Modal overlay */
.modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, .3);
  backdrop-filter: blur(10px);
  opacity: 0;
  pointer-events: none;
  transition: opacity .3s;
}

.modal.active {
  opacity: 1;
  pointer-events: all;
}

/* Modal content */
.modal-content {
  background: rgba(255, 255, 255, .85);
  backdrop-filter: blur(20px);
  padding: 2em;
  border-radius: 12px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, .1);
  max-width: 500px;
  width: 90%;
  transform: scale(0.9);
  transition: transform .3s;
}

.modal.active .modal-content {
  transform: scale(1);
}

/* Fallback for browsers without backdrop-filter */
@supports not (backdrop-filter: blur(10px)) {
  .modal {
    background: rgba(0, 0, 0, .7);
  }

  .modal-content {
    background: rgba(255, 255, 255, .95);
  }
}
```

```javascript
const modal = document.getElementById('modal');
const openBtn = document.getElementById('openModal');
const closeBtn = document.getElementById('closeModal');

openBtn.addEventListener('click', () => {
  modal.classList.add('active');
});

closeBtn.addEventListener('click', () => {
  modal.classList.remove('active');
});

// Close on outside click
modal.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.classList.remove('active');
  }
});
```

Features:
- Modern backdrop-filter for true frosted glass
- Fallback for older browsers
- Smooth entrance animation
- Click-outside-to-close functionality

---

## Example 5: Extending Button Click Area

**User Question**:
> "My icon buttons are too small on mobile. How can I make them easier to tap without changing their visual size?"

**Claude Code Response**:

I'll use a pseudo-element to extend the clickable area without affecting the visual appearance:

```html
<button class="icon-btn" aria-label="Close">
  ×
</button>
```

```css
.icon-btn {
  position: relative;
  width: 24px;
  height: 24px;
  padding: 0;
  border: none;
  background: transparent;
  font-size: 20px;
  cursor: pointer;
}

/* Extend the clickable area */
.icon-btn::before {
  content: "";
  position: absolute;
  top: -12px;
  right: -12px;
  bottom: -12px;
  left: -12px;
  /* This creates a 48x48px hit area (24px + 12px * 2) */
}

/* Visual feedback on hover/tap */
.icon-btn::after {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  border-radius: 50%;
  background: rgba(0, 0, 0, .1);
  transform: translate(-50%, -50%);
  transition: width .3s, height .3s;
}

.icon-btn:hover::after,
.icon-btn:active::after {
  width: 40px;
  height: 40px;
}
```

This technique:
- Extends hit area to 48x48px (recommended minimum for mobile)
- Doesn't affect visual size (24x24px)
- Adds visual feedback on interaction
- Uses accessible ARIA labels
- Works on all devices

---

## Example 6: Custom Range Slider with Value Display

**User Question**:
> "Create a styled range slider that shows its current value"

**Claude Code Response**:

I'll create a custom range slider with dynamic value display:

```html
<div class="slider-container">
  <label for="volume">Volume</label>
  <input type="range" id="volume" min="0" max="100" value="50" />
  <output for="volume">50</output>
</div>
```

```css
.slider-container {
  padding: 2em;
}

input[type="range"] {
  -webkit-appearance: none;
  appearance: none;
  width: 100%;
  height: 6px;
  border-radius: 3px;
  background: linear-gradient(
    to right,
    #b4a078 0%,
    #b4a078 50%,
    #e0e0e0 50%,
    #e0e0e0 100%
  );
  outline: none;
  transition: background .2s;
}

/* Thumb styles */
input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: #b4a078;
  cursor: pointer;
  box-shadow: 0 2px 6px rgba(0, 0, 0, .2);
  transition: transform .2s;
}

input[type="range"]::-webkit-slider-thumb:hover {
  transform: scale(1.2);
}

input[type="range"]::-moz-range-thumb {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: #b4a078;
  cursor: pointer;
  border: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, .2);
}

output {
  display: inline-block;
  margin-top: 1em;
  padding: .5em 1em;
  background: #b4a078;
  color: white;
  border-radius: 4px;
  font-weight: bold;
}
```

```javascript
const slider = document.getElementById('volume');
const output = document.querySelector('output');

function updateSlider() {
  const value = slider.value;
  const percentage = (value / slider.max) * 100;

  // Update output
  output.textContent = value;

  // Update background gradient
  slider.style.background = `linear-gradient(
    to right,
    #b4a078 0%,
    #b4a078 ${percentage}%,
    #e0e0e0 ${percentage}%,
    #e0e0e0 100%
  )`;
}

slider.addEventListener('input', updateSlider);
updateSlider(); // Initialize
```

Features:
- Custom styled slider
- Dynamic background fill
- Smooth animations
- Value display
- Cross-browser compatible

---

## Example 7: Typing Animation Effect

**User Question**:
> "Add a typing animation to my hero heading"

**Claude Code Response**:

I'll create a typing animation effect. Note: This works best with monospace fonts and single-line text:

```html
<h1 class="typing">Welcome to My Website</h1>
```

```css
.typing {
  display: inline-block;
  width: 23ch; /* 23 characters */
  font-family: 'Courier New', Courier, monospace;
  font-size: 2em;
  font-weight: bold;
  color: #333;
  white-space: nowrap;
  overflow: hidden;
  border-right: 3px solid;
  animation:
    typing 3.5s steps(23) 1s forwards,
    caret .75s step-end infinite;
}

@keyframes typing {
  from {
    width: 0;
  }
  to {
    width: 23ch;
  }
}

@keyframes caret {
  50% {
    border-right-color: transparent;
  }
}

/* Remove caret after animation completes */
.typing.complete {
  border-right-color: transparent;
}
```

```javascript
// Remove caret when typing completes
const typingElement = document.querySelector('.typing');

typingElement.addEventListener('animationend', (e) => {
  if (e.animationName === 'typing') {
    typingElement.classList.add('complete');
  }
});
```

**For multi-line or variable content, use a JavaScript library like:**
- Typed.js
- TypeIt
- React-Type-Animation

---

## Example 8: Responsive Card Grid with Hover Effects

**User Question**:
> "Create a responsive card grid with nice hover effects"

**Claude Code Response**:

I'll create a responsive card grid using CSS Grid with elevation hover effects:

```html
<div class="card-grid">
  <div class="card">
    <img src="image1.jpg" alt="Card 1">
    <div class="card-content">
      <h3>Card Title 1</h3>
      <p>Card description goes here.</p>
      <button>Learn More</button>
    </div>
  </div>
  <!-- More cards... -->
</div>
```

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  padding: 2rem;
}

.card {
  background: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .1);
  transition: transform .3s, box-shadow .3s;
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, .15);
}

.card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  display: block;
}

.card-content {
  padding: 1.5rem;
}

.card-content h3 {
  margin: 0 0 .5rem 0;
  color: #333;
}

.card-content p {
  margin: 0 0 1rem 0;
  color: #666;
  line-height: 1.6;
}

.card-content button {
  background: #b4a078;
  color: white;
  border: none;
  padding: .75rem 1.5rem;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 500;
  transition: background .3s;
}

.card-content button:hover {
  background: #9a8a66;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .card-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
    padding: 1rem;
  }
}
```

Features:
- Responsive with `auto-fit` and `minmax`
- Smooth elevation on hover
- Mobile-friendly single column
- Consistent spacing with `gap`

---

## Example 9: Parallax Scrolling Section

**User Question**:
> "Add a parallax effect to my hero section"

**Claude Code Response**:

I'll create a pure CSS parallax effect using `background-attachment: fixed`:

```html
<section class="parallax-section">
  <div class="parallax-content">
    <h1>Welcome</h1>
    <p>Scroll down to see the parallax effect</p>
  </div>
</section>

<section class="content">
  <h2>Regular Content</h2>
  <p>Lorem ipsum dolor sit amet...</p>
</section>
```

```css
.parallax-section {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;

  /* Parallax background */
  background-image: url('background.jpg');
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Overlay for better text readability */
.parallax-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, .4);
}

.parallax-content {
  position: relative;
  z-index: 1;
  text-align: center;
  color: white;
}

.parallax-content h1 {
  font-size: clamp(2rem, 5vw, 4rem);
  margin: 0 0 1rem 0;
  text-shadow: 0 2px 10px rgba(0, 0, 0, .5);
}

.content {
  padding: 4rem 2rem;
  background: white;
}

/* Mobile: Disable parallax (performance) */
@media (max-width: 768px) {
  .parallax-section {
    background-attachment: scroll;
  }
}
```

**For more advanced parallax with depth layers**, consider using a library like:
- Rellax.js
- Parallax.js
- GSAP ScrollTrigger

---

## Example 10: Accessible Dark Mode Toggle

**User Question**:
> "Implement a dark mode toggle that remembers user preference"

**Claude Code Response**:

I'll create an accessible dark mode toggle with localStorage persistence:

```html
<button
  id="theme-toggle"
  class="theme-toggle"
  aria-label="Toggle dark mode"
  aria-pressed="false">
  <svg class="sun" viewBox="0 0 24 24" width="20" height="20">
    <circle cx="12" cy="12" r="5" fill="currentColor"/>
    <line x1="12" y1="1" x2="12" y2="3" stroke="currentColor" stroke-width="2"/>
    <!-- More sun rays... -->
  </svg>
  <svg class="moon" viewBox="0 0 24 24" width="20" height="20">
    <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" fill="currentColor"/>
  </svg>
</button>
```

```css
:root {
  --bg: white;
  --text: #333;
  --card-bg: #f5f5f5;
  --border: #e0e0e0;
}

[data-theme="dark"] {
  --bg: #1a1a1a;
  --text: #f0f0f0;
  --card-bg: #2a2a2a;
  --border: #404040;
}

body {
  background: var(--bg);
  color: var(--text);
  transition: background .3s, color .3s;
}

.theme-toggle {
  position: relative;
  width: 50px;
  height: 50px;
  border: 2px solid var(--border);
  border-radius: 50%;
  background: var(--card-bg);
  cursor: pointer;
  transition: all .3s;
}

.theme-toggle:hover {
  transform: scale(1.1);
}

.theme-toggle svg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  transition: opacity .3s, transform .3s;
}

.sun {
  opacity: 1;
  transform: translate(-50%, -50%) rotate(0deg);
}

.moon {
  opacity: 0;
  transform: translate(-50%, -50%) rotate(90deg);
}

[data-theme="dark"] .sun {
  opacity: 0;
  transform: translate(-50%, -50%) rotate(-90deg);
}

[data-theme="dark"] .moon {
  opacity: 1;
  transform: translate(-50%, -50%) rotate(0deg);
}
```

```javascript
const toggle = document.getElementById('theme-toggle');
const html = document.documentElement;

// Initialize from localStorage or system preference
const savedTheme = localStorage.getItem('theme');
const systemPreference = window.matchMedia('(prefers-color-scheme: dark)').matches
  ? 'dark'
  : 'light';
const currentTheme = savedTheme || systemPreference;

// Apply initial theme
html.setAttribute('data-theme', currentTheme);
toggle.setAttribute('aria-pressed', currentTheme === 'dark');

// Toggle function
function toggleTheme() {
  const current = html.getAttribute('data-theme');
  const next = current === 'dark' ? 'light' : 'dark';

  html.setAttribute('data-theme', next);
  toggle.setAttribute('aria-pressed', next === 'dark');
  localStorage.setItem('theme', next);
}

toggle.addEventListener('click', toggleTheme);

// Listen for system preference changes
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
  if (!localStorage.getItem('theme')) {
    html.setAttribute('data-theme', e.matches ? 'dark' : 'light');
  }
});
```

Features:
- Respects system preference
- Remembers user choice
- Accessible (ARIA attributes)
- Smooth transitions
- Icon rotation animation

---

## Summary

These examples demonstrate how the CSS Tricks skill helps Claude Code provide:

1. **Complete solutions** - Not just snippets, but full implementations
2. **Best practices** - Accessibility, performance, browser support
3. **Multiple approaches** - Showing alternatives when applicable
4. **Production-ready code** - Tested patterns ready to use
5. **Explanations** - Why solutions work, not just how

The skill enables Claude Code to quickly solve common CSS challenges with proven, modern techniques.
