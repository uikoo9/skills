---
name: Dev Wisdom
description: Practical development wisdom and battle-tested patterns. Real-world solutions, debugging strategies, performance tips, architecture decisions, and lessons learned from production experience.
---

# Dev Wisdom - Development Experience Knowledge Base

A curated collection of practical development wisdom, battle-tested patterns, and real-world solutions accumulated from production experience.

**Version**: 1.0.0
**Last Updated**: 2026-03-03

---

## Masonry Grid with Infinite Scroll Implementation

### Overview

Production-ready masonry (waterfall) grid implementation with infinite scroll, used in remotion.cool project. Built with React, Next.js, and `react-masonry-css`.

**Source**: `/Users/vincent/Desktop/presence/remotion`

### Architecture

```
HomePage (page.tsx)
  └─ MainLayout (scrollable container)
      └─ WorksInfiniteScroll (data + infinite scroll)
          ├─ MasonryGrid (CSS-based layout)
          │   └─ VideoCard × N (individual cards)
          └─ Loading/Empty States
```

### Core Components

#### 1. MasonryGrid - Responsive Layout

#### 1. MasonryGrid - Responsive Layout

**File**: `src/components/MasonryGrid.tsx`

Uses `react-masonry-css` for pure CSS-based masonry layout:

```typescript
import Masonry from 'react-masonry-css';

export function MasonryGrid({ children }: MasonryGridProps) {
  const breakpointColumns = {
    default: 5,    // Desktop: 5 columns
    1536: 4,       // 2xl breakpoint
    1280: 3,       // xl breakpoint
    1024: 3,       // lg breakpoint
    768: 2,        // md breakpoint: 2 columns
    640: 1,        // sm breakpoint: 1 column
  };

  return (
    <Masonry
      breakpointCols={breakpointColumns}
      className="masonry-grid"
      columnClassName="masonry-grid-column"
    >
      {children}
    </Masonry>
  );
}
```

**CSS Styling** (`src/styles/masonry.css`):

```css
.masonry-grid {
  display: flex;
  margin-left: -24px; /* gutter size offset */
  width: auto;
}

.masonry-grid-column {
  padding-left: 24px; /* gutter size */
  background-clip: padding-box;
}

.masonry-grid .masonry-grid-column > * {
  margin-bottom: 24px !important;
}
```

---

#### 2. WorksInfiniteScroll - Infinite Scroll Container

**File**: `src/components/WorksInfiniteScroll.tsx`

Manages data fetching, pagination, and infinite scroll logic:

```typescript
export const WorksInfiniteScroll = ({
  initialWorks,
  initialPage = 1,
  pageSize = 20,
}: WorksInfiniteScrollProps) => {
  const [works, setWorks] = useState<Work[]>(initialWorks);
  const [page, setPage] = useState(initialPage);
  const [hasMore, setHasMore] = useState(initialWorks.length === pageSize);
  const [isLoading, setIsLoading] = useState(false);
  const [showLoading, setShowLoading] = useState(false);
  const [scrollContainer, setScrollContainer] = useState<HTMLElement | null>(null);

  // Auto-detect scroll container on mount
  useEffect(() => {
    const findScrollContainer = () => {
      // 1. Look for explicit marker
      let element = document.querySelector('[data-scroll-container="true"]');

      // 2. Fallback: find element with overflow scroll
      if (!element) {
        const candidates = document.querySelectorAll("*");
        for (const el of Array.from(candidates)) {
          const style = window.getComputedStyle(el as Element);
          if (style.overflowY === "auto" || style.overflowY === "scroll") {
            element = el;
            break;
          }
        }
      }
      return element as HTMLElement | null;
    };

    setScrollContainer(findScrollContainer());
  }, []);

  // Load more data
  const loadMore = useCallback(async () => {
    if (isLoading || !hasMore) return;

    setIsLoading(true);

    // Delay showing loading indicator to prevent flickering
    const loadingTimer = setTimeout(() => {
      setShowLoading(true);
    }, 800);

    try {
      const nextPage = page + 1;
      const response = await fetch(
        `/api/works?page=${nextPage}&pageSize=${pageSize}`,
      );

      if (!response.ok) throw new Error("Failed to fetch works");

      const data = await response.json();
      const newWorks = data.works || [];

      // Check if more data exists
      if (newWorks.length < pageSize) {
        setHasMore(false);
      }

      // Append new data
      setWorks((prev) => [...prev, ...newWorks]);
      setPage(nextPage);
    } catch (error) {
      console.error("Error loading more works:", error);
      setHasMore(false);
    } finally {
      clearTimeout(loadingTimer);
      setIsLoading(false);
      setShowLoading(false);
    }
  }, [page, pageSize, isLoading, hasMore]);

  // Attach infinite scroll hook
  useInfiniteScroll({
    onLoadMore: loadMore,
    hasMore,
    isLoading,
    threshold: 300,
    scrollContainer,
  });

  return (
    <>
      <MasonryGrid>
        {works.map((work) => (
          <VideoCard key={work.id} {...work} />
        ))}
      </MasonryGrid>

      {/* Loading State */}
      {showLoading && <LoadingIndicator />}

      {/* No More Data */}
      {!hasMore && works.length > 0 && <NoMoreMessage />}

      {/* Empty State */}
      {works.length === 0 && <EmptyState />}
    </>
  );
};
```

---

#### 3. useInfiniteScroll Hook - Scroll Detection

**File**: `src/hooks/useInfiniteScroll.ts`

Custom hook for detecting when user scrolls near bottom:

```typescript
export function useInfiniteScroll({
  onLoadMore,
  hasMore,
  isLoading,
  threshold = 200,
  scrollContainer,
}: UseInfiniteScrollOptions) {
  const lastScrollY = useRef(0);

  useEffect(() => {
    let timeoutId: NodeJS.Timeout;

    // Use custom container or window
    const target = scrollContainer || window;

    const handleScroll = () => {
      // Don't trigger if loading or no more data
      if (isLoading || !hasMore) return;

      let scrollTop: number;
      let scrollHeight: number;
      let clientHeight: number;

      // Get scroll metrics based on target
      if (scrollContainer) {
        scrollTop = scrollContainer.scrollTop;
        scrollHeight = scrollContainer.scrollHeight;
        clientHeight = scrollContainer.clientHeight;
      } else {
        scrollTop = window.scrollY;
        scrollHeight = document.documentElement.scrollHeight;
        clientHeight = window.innerHeight;
      }

      // Only trigger on downward scroll
      if (scrollTop <= lastScrollY.current) {
        lastScrollY.current = scrollTop;
        return;
      }

      lastScrollY.current = scrollTop;

      // Calculate distance to bottom
      const distanceToBottom = scrollHeight - (scrollTop + clientHeight);

      // Trigger load when within threshold (300px from bottom)
      if (distanceToBottom < threshold) {
        onLoadMore();
      }
    };

    // Debounce scroll events
    const debouncedHandleScroll = () => {
      clearTimeout(timeoutId);
      timeoutId = setTimeout(handleScroll, 100);
    };

    // Add listener with passive for better performance
    target.addEventListener("scroll", debouncedHandleScroll, {
      passive: true,
    } as AddEventListenerOptions);

    // Cleanup
    return () => {
      target.removeEventListener("scroll", debouncedHandleScroll);
      clearTimeout(timeoutId);
    };
  }, [onLoadMore, hasMore, isLoading, threshold, scrollContainer]);
}
```

---

#### 4. VideoCard - Individual Card Component

**File**: `src/components/VideoCard.tsx`

Displays video with hover effects and metadata:

```typescript
export function VideoCard({
  id,
  name,
  description,
  author,
  avatarUrl,
  mp4Path,
  width,
  height,
  viewCount,
}: VideoCardProps) {
  return (
    <Box mb={6}>
      <Link href={`/remotions/${id}`}>
        <Box
          bg="white"
          borderRadius="xl"
          overflow="hidden"
          transition="all 0.25s"
          cursor="pointer"
          _hover={{
            shadow: "lg",
            transform: "translateY(-4px)",
          }}
        >
          {/* Video with aspect ratio */}
          <Box
            bg="gray.900"
            position="relative"
            overflow="hidden"
            style={{ aspectRatio: `${width} / ${height}` }}
          >
            <video
              src={mp4Path}
              autoPlay
              muted
              loop
              playsInline
              style={{
                width: "100%",
                height: "100%",
                objectFit: "cover",
              }}
            />
          </Box>

          {/* Metadata */}
          <Box p={4}>
            <Heading size="sm" mb={1} fontWeight="600">
              {name}
            </Heading>
            <Text
              fontSize="xs"
              mb={2}
              css={{
                WebkitLineClamp: 2,
                WebkitBoxOrient: "vertical",
              }}
            >
              {description}
            </Text>
            <Flex gap={2} align="center">
              <Avatar src={avatarUrl} size="sm" />
              <Text fontSize="xs" flex={1}>{author}</Text>
              <Text fontSize="xs" color="gray.400">
                👁 {viewCount.toLocaleString()}
              </Text>
            </Flex>
          </Box>
        </Box>
      </Link>
    </Box>
  );
}
```

---

#### 5. MainLayout - Scrollable Container

**File**: `src/components/MainLayout.tsx`

Provides the scrollable container with explicit marker:

```typescript
<Box
  flex="1"
  bg="gray.50"
  p={{ base: 4, md: 6 }}
  overflowY="auto"
  data-scroll-container="true"  // ← Important for scroll detection
>
  {children}
</Box>
```

---

#### 6. API Endpoint - Paginated Data

**File**: `app/api/works/route.ts`

Backend endpoint for fetching paginated works:

```typescript
export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);

  const page = Math.max(1, parseInt(searchParams.get("page") || "1"));
  const pageSize = Math.min(100, Math.max(1, parseInt(searchParams.get("pageSize") || "20")));
  const offset = (page - 1) * pageSize;

  const { data: works, count } = await supabase
    .from("works")
    .select("*", { count: "exact" })
    .eq("render_status", "completed")
    .eq("is_public", true)
    .order("view_count", { ascending: false })
    .range(offset, offset + pageSize - 1);

  return NextResponse.json({
    works: works || [],
    pagination: {
      page,
      pageSize,
      total: count || 0,
      totalPages: Math.ceil((count || 0) / pageSize),
    },
  });
}
```

---

### Key Features & Optimizations

| Feature | Implementation | Benefit |
|---------|---------------|---------|
| **Pure CSS Layout** | `react-masonry-css` with flexbox | No JS layout calculations, smooth performance |
| **Responsive Design** | 5 breakpoints (5→4→3→2→1 columns) | Works on all screen sizes |
| **Debounced Scroll** | 100ms debounce on scroll events | Reduces CPU usage |
| **Passive Listener** | `{ passive: true }` on scroll | Better scroll performance |
| **Loading Delay** | 800ms before showing spinner | Prevents flickering on fast loads |
| **Direction Check** | Only trigger on downward scroll | Avoids duplicate loads |
| **Distance Threshold** | Load at 300px from bottom | Smooth, predictable loading |
| **Auto Container Detection** | Finds scroll container dynamically | Works with any layout |
| **Video Optimization** | `autoPlay`, `muted`, `loop`, `playsInline` | Auto-play without user interaction |
| **Aspect Ratio** | CSS `aspect-ratio` property | Prevents layout shift |
| **Hover Effects** | Transform + shadow on hover | Better UX feedback |

---

### Dependencies

```json
{
  "react-masonry-css": "^1.0.16",
  "@chakra-ui/react": "^3.31.0",
  "framer-motion": "^11.18.2",
  "next": "^15.1.6"
}
```

---

### Usage Pattern

```typescript
// 1. Server Component (page.tsx)
export default async function HomePage() {
  const initialWorks = await getInitialWorks();

  return (
    <MainLayout>
      <WorksInfiniteScroll
        initialWorks={initialWorks}
        initialPage={1}
        pageSize={20}
      />
    </MainLayout>
  );
}

// 2. Client Component handles infinite scroll
// 3. API route provides paginated data
// 4. MasonryGrid renders responsive layout
```

---

### Production Lessons

1. **800ms Loading Delay**: Prevents spinner flickering on fast networks
2. **Scroll Direction Check**: Avoids loading when scrolling up
3. **Auto Container Detection**: Makes component reusable across layouts
4. **Passive Scroll Listener**: Critical for 60fps scroll performance
5. **Explicit Scroll Marker**: `data-scroll-container="true"` makes debugging easier
6. **Pure CSS Masonry**: Much faster than JS-based layout calculations
7. **Video `playsInline`**: Required for iOS auto-play support

---

## Next.js Internationalization (i18n) with next-intl

### Overview

Production-ready internationalization implementation using `next-intl` for Next.js App Router. Features cookie-based locale persistence, server/client component support, and SEO optimization.

**Source**: `/Users/vincent/Desktop/webcc.dev`

### Architecture

```
Request → Cookie (locale) → Server Config → Load Messages → Provider → Components
```

**Supported Languages**: English (`en`), Chinese (`zh`)

---

### 1. Installation & Configuration

#### Dependencies

```json
{
  "dependencies": {
    "next-intl": "^4.8.2"
  }
}
```

#### Next.js Configuration

**File**: `next.config.js`

```javascript
const withNextIntl = require('next-intl/plugin')();

const nextConfig = {
  reactStrictMode: true,
  output: 'standalone',
};

module.exports = withNextIntl(nextConfig);
```

---

### 2. Translation Files Structure

**Directory**: `messages/`

```
messages/
├── en.json  # English translations
└── zh.json  # Chinese translations
```

#### English Translations (`en.json`)

```json
{
  "login": "Login",
  "heroTitle": "claude code\neverywhere",
  "heroSubtitle": "Use Claude Code directly in your web browser",
  "ctaButton": "Try Now",
  "signInWithGithub": "Sign in with GitHub",
  "accessTokens": "Access Tokens",
  "copiedToClipboard": "Copied to clipboard!",
  "cancel": "Cancel",
  "confirm": "Confirm"
}
```

#### Chinese Translations (`zh.json`)

```json
{
  "login": "登录",
  "heroTitle": "随时随地\nClaude Code",
  "heroSubtitle": "直接在浏览器中使用 Claude Code",
  "ctaButton": "立即试用",
  "signInWithGithub": "使用 GitHub 登录",
  "accessTokens": "访问令牌",
  "copiedToClipboard": "已复制到剪贴板！",
  "cancel": "取消",
  "confirm": "确认"
}
```

**Features**:
- Flat key-value structure for simplicity
- Multi-line string support (with `\n`)
- Preserves brand names across languages

---

### 3. Configuration Files

#### Locale Configuration

**File**: `src/i18n/index.ts`

```typescript
export const locales = ['en', 'zh'];
export const defaultLocale = 'en';
```

#### Message Loading

**File**: `src/i18n/request.ts`

```typescript
import { getRequestConfig } from 'next-intl/server';
import { cookies } from 'next/headers';

export default getRequestConfig(async () => {
  // Read locale from cookie, default to 'en'
  const cookieStore = await cookies();
  const locale = cookieStore.get('locale')?.value || 'en';

  return {
    locale,
    messages: (await import(`../../messages/${locale}.json`)).default,
  };
});
```

**Mechanism**:
1. Reads `locale` from server-side cookie
2. Dynamically imports corresponding JSON file
3. Returns locale and messages to i18n context
4. Falls back to `en` if no cookie exists

---

### 4. Root Layout Setup

**File**: `src/app/layout.tsx`

```typescript
import { getMessages, getLocale, getTranslations } from 'next-intl/server';
import { NextIntlClientProvider } from 'next-intl';
import type { Metadata } from 'next';

export async function generateMetadata(): Promise<Metadata> {
  const locale = await getLocale();
  const t = await getTranslations();

  const title = locale === 'zh' 
    ? 'webcc.dev - Claude Code 网页界面' 
    : 'webcc.dev - Claude Code Web Interface';

  const description = locale === 'zh'
    ? '直接在浏览器中使用 Claude Code'
    : 'Use Claude Code directly in your web browser';

  return {
    metadataBase: new URL('https://webcc.dev'),
    title,
    description,
    alternates: {
      canonical: '/',
      languages: {
        'en': '/en',
        'zh': '/zh',
        'en-US': '/en',
        'zh-CN': '/zh',
      },
    },
    openGraph: {
      locale: locale === 'zh' ? 'zh_CN' : 'en_US',
      alternateLocale: locale === 'zh' ? 'en_US' : 'zh_CN',
    },
  };
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const locale = await getLocale();
  const messages = await getMessages();

  return (
    <html lang={locale} suppressHydrationWarning key={locale}>
      <body suppressHydrationWarning>
        <NextIntlClientProvider messages={messages} locale={locale}>
          <Providers key={locale}>{children}</Providers>
        </NextIntlClientProvider>
      </body>
    </html>
  );
}
```

**Key Points**:
- Uses `getLocale()` to fetch current language
- Uses `getTranslations()` for server-side translations in metadata
- Uses `getMessages()` to load all messages
- Wraps app with `NextIntlClientProvider` for client components
- Sets correct `lang` attribute and SEO tags

---

### 5. Using Translations in Components

#### Server Component Usage

```typescript
import { getTranslations } from 'next-intl/server';

export default async function ServerPage() {
  const t = await getTranslations();

  return (
    <div>
      <h1>{t('heroTitle')}</h1>
      <p>{t('heroSubtitle')}</p>
    </div>
  );
}
```

#### Client Component Usage

**File**: `src/components/Hero.tsx`

```typescript
'use client';

import { useTranslations } from 'next-intl';

export function Hero() {
  const t = useTranslations();

  return (
    <div className="hero">
      <h1>{t('heroTitle')}</h1>
      <p>{t('heroSubtitle')}</p>
      <button className="btn">{t('ctaButton')}</button>
    </div>
  );
}
```

#### Advanced Usage with Dynamic Content

**File**: `src/components/Steps.tsx`

```typescript
'use client';

import { useTranslations } from 'next-intl';

function Step({ titleKey, descriptionKey }: StepProps) {
  const t = useTranslations();

  // Post-process translation with regex
  const renderDescription = () => {
    const description = t(descriptionKey);
    const urlPattern = /(http:\/\/localhost:\d+)/;
    const parts = description.split(urlPattern);

    return (
      <p>
        {parts.map((part, index) => {
          if (part.match(urlPattern)) {
            return (
              <a key={index} href={part} target="_blank">
                {part}
              </a>
            );
          }
          return part;
        })}
      </p>
    );
  };

  return (
    <div className="step-card">
      <h3>{t(titleKey)}</h3>
      {renderDescription()}
    </div>
  );
}
```

---

### 6. Language Switcher Implementation

#### Language Switcher Component

**File**: `src/components/LanguageSwitcher.tsx`

```typescript
'use client';

import { useLocale } from 'next-intl';
import { setLocale } from '@/actions/locale';
import { useTransition } from 'react';

export function LanguageSwitcher() {
  const locale = useLocale();
  const [isPending, startTransition] = useTransition();

  const handleLanguageChange = async () => {
    const newLocale = locale === 'en' ? 'zh' : 'en';
    
    startTransition(async () => {
      await setLocale(newLocale);
      
      // Clear hash to prevent auto-scroll
      if (window.location.hash) {
        window.history.replaceState(null, '', window.location.pathname);
      }
      
      window.location.reload();
    });
  };

  return (
    <button 
      className="lang-switcher" 
      onClick={handleLanguageChange} 
      disabled={isPending}
    >
      {isPending ? '...' : locale === 'en' ? '中文' : 'EN'}
    </button>
  );
}
```

#### Server Action for Setting Locale

**File**: `src/actions/locale.ts`

```typescript
'use server';

import { cookies } from 'next/headers';

export async function setLocale(locale: string) {
  const cookieStore = await cookies();
  cookieStore.set('locale', locale, {
    path: '/',
    maxAge: 365 * 24 * 60 * 60, // 1 year
  });
}
```

**Flow**:
1. User clicks language switcher
2. Calls server action `setLocale()`
3. Updates cookie with new locale
4. Reloads page to apply changes
5. Next request reads new locale from cookie

---

### 7. Avoiding Hydration Errors

**File**: `src/components/Header.tsx`

```typescript
'use client';

import { useState, useEffect } from 'react';
import { useTranslations } from 'next-intl';
import { useAuth } from '@/contexts/AuthContext';

export function Header() {
  const [mounted, setMounted] = useState(false);
  const { user, loading } = useAuth();
  const t = useTranslations();

  // Track client-side mount to avoid hydration mismatch
  useEffect(() => {
    setMounted(true);
  }, []);

  return (
    <header>
      {!mounted || loading ? (
        // Show placeholder during SSR
        <div className="header-loading-placeholder" />
      ) : user ? (
        // Logged in: show user menu
        <UserMenu user={user} />
      ) : (
        // Not logged in: show login button
        <button onClick={() => setLoginOpen(true)}>
          {t('login')}
        </button>
      )}
    </header>
  );
}
```

**Best Practice**:
- Ensure same initial HTML structure on server and client
- Show dynamic content only after client mount
- Prevents hydration errors from conditional rendering

---

### 8. SEO Optimization

#### Metadata with hreflang

```typescript
export async function generateMetadata(): Promise<Metadata> {
  const locale = await getLocale();

  return {
    metadataBase: new URL('https://webcc.dev'),
    alternates: {
      canonical: '/',
      languages: {
        'en': '/en',
        'zh': '/zh',
        'en-US': '/en',
        'zh-CN': '/zh',
      },
    },
    openGraph: {
      locale: locale === 'zh' ? 'zh_CN' : 'en_US',
      alternateLocale: locale === 'zh' ? 'en_US' : 'zh_CN',
    },
  };
}
```

**Benefits**:
- Search engines understand language variants
- Proper Open Graph tags for social sharing
- Canonical URLs prevent duplicate content issues

---

### 9. Complete User Flow

#### Language Switch Flow

```
1. User clicks language switcher
   ↓
2. LanguageSwitcher.tsx calls setLocale('zh')
   ↓
3. Server Action updates cookie: locale=zh, maxAge=1 year
   ↓
4. Page reloads with window.location.reload()
   ↓
5. Next request: request.ts reads cookie → locale='zh'
   ↓
6. Dynamic import: import('messages/zh.json')
   ↓
7. Root layout receives Chinese messages
   ↓
8. All components now display Chinese text via t('key')
```

#### Translation Access Flow

```
Server Components:
  const t = await getTranslations();
  return <h1>{t('title')}</h1>;

Client Components:
  const t = useTranslations();
  return <button>{t('submit')}</button>;

Current Locale:
  Server: const locale = await getLocale();
  Client: const locale = useLocale();
```

---

### 10. Best Practices & Patterns

#### ✅ Do's

```typescript
// ✅ Use translation keys as props
function MyComponent({ titleKey }: { titleKey: string }) {
  const t = useTranslations();
  return <h1>{t(titleKey)}</h1>;
}

// ✅ Process translations for dynamic content
const description = t('description');
const withLinks = description.replace(/(https?:\/\/[^\s]+)/g, '<a href="$1">$1</a>');

// ✅ Provide loading states during language switch
{isPending ? 'Loading...' : t('buttonText')}

// ✅ Set long cookie expiry for persistence
cookieStore.set('locale', locale, { maxAge: 365 * 24 * 60 * 60 });

// ✅ Use key attribute on layout when locale changes
<Providers key={locale}>{children}</Providers>
```

#### ❌ Don'ts

```typescript
// ❌ Don't hardcode text
return <button>Submit</button>;

// ❌ Don't use useTranslations in server components
export default async function Page() {
  const t = useTranslations(); // Error!
}

// ❌ Don't forget to handle hydration
return user ? <UserMenu /> : <LoginButton />;  // May cause mismatch

// ❌ Don't use short cookie expiry
cookieStore.set('locale', locale, { maxAge: 3600 });  // Too short
```

---

### 11. File Structure Summary

```
project/
├── src/
│   ├── app/
│   │   └── layout.tsx              # i18n initialization
│   ├── i18n/
│   │   ├── index.ts                # Locale config
│   │   └── request.ts              # Message loading
│   ├── actions/
│   │   └── locale.ts               # Server action: setLocale
│   └── components/
│       ├── LanguageSwitcher.tsx    # Language toggle
│       ├── Header.tsx              # Using translations
│       └── Hero.tsx                # Using translations
├── messages/
│   ├── en.json                     # English
│   └── zh.json                     # Chinese
├── next.config.js                  # withNextIntl wrapper
└── package.json                    # next-intl dependency
```

---

### 12. API Reference

| Function | Type | Usage |
|----------|------|-------|
| `getLocale()` | Server | Get current locale in server components |
| `getTranslations()` | Server | Get translation function in server components |
| `getMessages()` | Server | Get all messages for current locale |
| `useLocale()` | Client | Get current locale in client components |
| `useTranslations()` | Client | Get translation function in client components |
| `setLocale(locale)` | Server Action | Update locale cookie |

---

### 13. Key Features

| Feature | Implementation | Benefit |
|---------|---------------|---------|
| **Cookie-based** | Stores locale in cookie (1 year) | Persists across sessions |
| **Server/Client Support** | Different APIs for SSR/CSR | Works in any component type |
| **SEO Optimized** | hreflang tags, Open Graph | Better search rankings |
| **Type Safe** | Full TypeScript support | Catch errors at compile time |
| **Dynamic Loading** | Import messages on demand | Smaller bundle size |
| **Flat Structure** | Simple key-value JSON | Easy to manage |
| **Hydration Safe** | Mounting state tracking | Prevents React errors |

---

### 14. Production Lessons

1. **Cookie Expiry**: Set long expiry (1 year) so users don't lose preference
2. **Page Reload**: Sometimes necessary to fully apply language changes
3. **Hydration Safety**: Always check `mounted` state before conditional rendering
4. **Key Prop**: Use `key={locale}` on providers to force remount on language change
5. **Hash Clearing**: Remove URL hash before reload to prevent unwanted scrolling
6. **Loading States**: Show spinner during language switch for better UX
7. **Flat Keys**: Avoid nested translation keys for simpler maintenance

---

### 15. Common Pitfalls

```typescript
// ❌ Pitfall 1: Hydration mismatch
export function Component() {
  const { user } = useAuth();
  return user ? <Profile /> : <Login />;  // Different on server/client!
}

// ✅ Solution: Track mount state
export function Component() {
  const [mounted, setMounted] = useState(false);
  const { user } = useAuth();

  useEffect(() => setMounted(true), []);

  if (!mounted) return <Skeleton />;
  return user ? <Profile /> : <Login />;
}

// ❌ Pitfall 2: Using client hooks in server components
export default async function Page() {
  const t = useTranslations();  // Error!
}

// ✅ Solution: Use server API
export default async function Page() {
  const t = await getTranslations();  // Correct!
}

// ❌ Pitfall 3: Forgetting to pass messages
export default function Layout({ children }) {
  return <html>{children}</html>;  // No translations available!
}

// ✅ Solution: Wrap with provider
export default async function Layout({ children }) {
  const messages = await getMessages();
  return (
    <html>
      <NextIntlClientProvider messages={messages}>
        {children}
      </NextIntlClientProvider>
    </html>
  );
}
```

