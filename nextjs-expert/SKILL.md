---
name: Next.js Expert
description: Comprehensive Next.js knowledge base covering all core features, App Router, Server/Client Components, data fetching, caching, routing, and modern development patterns for Next.js 15+.
---

# Next.js Complete Expert Guide

A comprehensive knowledge base covering all Next.js core features, App Router, data fetching, caching, routing, server/client components, and best practices for modern Next.js 15+ development.

**Version**: 1.0.0
**Last Updated**: 2026-03-03
**Next.js Version**: 15.x

---

## Table of Contents

1. [Getting Started & Core Concepts](#1-getting-started--core-concepts)
2. [File-Based Routing System](#2-file-based-routing-system)
3. [Server and Client Components](#3-server-and-client-components)
4. [Data Fetching](#4-data-fetching)
5. [Caching & Revalidation](#5-caching--revalidation)
6. [Navigation & Linking](#6-navigation--linking)
7. [Data Mutation (Server Actions)](#7-data-mutation-server-actions)
8. [API Routes (Route Handlers)](#8-api-routes-route-handlers)
9. [Built-in Components](#9-built-in-components)
10. [Rendering Strategies](#10-rendering-strategies)
11. [Error Handling & Loading States](#11-error-handling--loading-states)
12. [Configuration](#12-configuration)
13. [Best Practices](#13-best-practices)

---

## 1. Getting Started & Core Concepts

### Installation

```bash
# Create new Next.js app (recommended)
npx create-next-app@latest my-app --yes
cd my-app
npm run dev

# Manual installation
npm i next@latest react@latest react-dom@latest
```

**Default setup includes:**
- TypeScript
- ESLint
- Tailwind CSS
- App Router
- Turbopack (default bundler)
- Import alias `@/*`

### System Requirements

- **Node.js**: 20.9+ (minimum)
- **Browsers**: Chrome 111+, Edge 111+, Firefox 111+, Safari 16.4+

### Package.json Scripts

```json
{
  "scripts": {
    "dev": "next dev",          // Development with Turbopack
    "build": "next build",      // Production build
    "start": "next start",      // Production server
    "lint": "eslint",           // Run ESLint
    "lint:fix": "eslint --fix"  // Fix ESLint issues
  }
}
```

### Project Structure

```
my-app/
├── app/                      # App Router (recommended)
│   ├── layout.tsx           # Root layout (required)
│   ├── page.tsx             # Home page
│   ├── loading.tsx          # Loading UI
│   ├── error.tsx            # Error UI
│   ├── not-found.tsx        # 404 page
│   └── blog/
│       ├── layout.tsx       # Nested layout
│       ├── page.tsx         # /blog route
│       └── [slug]/
│           └── page.tsx     # Dynamic route /blog/:slug
├── public/                   # Static assets
├── src/                      # Optional source folder
├── next.config.js           # Next.js configuration
├── package.json
└── tsconfig.json
```

### Root Layout (Required)

Every Next.js app **must** have a root layout with `<html>` and `<body>` tags:

```tsx
// app/layout.tsx
export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
```

---

## 2. File-Based Routing System

### Core Principles

- **Folders define routes**: Each folder represents a URL segment
- **Files make routes public**: Only `page.tsx` or `route.ts` create accessible routes
- **Layouts wrap pages**: `layout.tsx` files wrap their children
- **Colocation is safe**: You can colocate components, utils, etc. in `app/` without making them routes

### Special File Conventions

| File | Purpose | Extension |
|------|---------|-----------|
| `layout.tsx` | Shared UI for a segment and its children | `.js`, `.jsx`, `.tsx` |
| `page.tsx` | Unique UI for a route | `.js`, `.jsx`, `.tsx` |
| `loading.tsx` | Loading UI (Suspense boundary) | `.js`, `.jsx`, `.tsx` |
| `error.tsx` | Error UI (Error boundary) | `.js`, `.jsx`, `.tsx` |
| `not-found.tsx` | 404 UI | `.js`, `.jsx`, `.tsx` |
| `route.ts` | API endpoint | `.js`, `.ts` |
| `template.tsx` | Re-rendered layout | `.js`, `.jsx`, `.tsx` |
| `default.tsx` | Parallel route fallback | `.js`, `.jsx`, `.tsx` |

### Basic Routing Examples

```
app/
├── page.tsx              → /
├── about/
│   └── page.tsx          → /about
├── blog/
│   ├── page.tsx          → /blog
│   └── [slug]/
│       └── page.tsx      → /blog/:slug
└── shop/
    └── [...slug]/
        └── page.tsx      → /shop/* (catch-all)
```

### Dynamic Routes

**Single parameter: `[slug]`**

```tsx
// app/blog/[slug]/page.tsx
export default async function BlogPost({
  params,
}: {
  params: Promise<{ slug: string }>
}) {
  const { slug } = await params
  const post = await getPost(slug)

  return <h1>{post.title}</h1>
}

// Access: /blog/my-first-post
```

**Catch-all: `[...slug]`**

```tsx
// app/shop/[...slug]/page.tsx
export default async function Product({
  params,
}: {
  params: Promise<{ slug: string[] }>
}) {
  const { slug } = await params
  // /shop/clothing → slug = ['clothing']
  // /shop/clothing/shirts → slug = ['clothing', 'shirts']
}
```

**Optional catch-all: `[[...slug]]`**

```tsx
// app/docs/[[...slug]]/page.tsx
// Matches /docs, /docs/intro, /docs/api/reference
```

### Route Groups

Organize routes without affecting URLs using `(groupName)`:

```
app/
├── (marketing)/
│   ├── layout.tsx       # Marketing layout
│   ├── page.tsx         → /
│   └── about/
│       └── page.tsx     → /about
└── (shop)/
    ├── layout.tsx       # Shop layout
    ├── cart/
    │   └── page.tsx     → /cart
    └── checkout/
        └── page.tsx     → /checkout
```

### Private Folders

Prefix folders with `_` to exclude them from routing:

```
app/
├── blog/
│   ├── page.tsx         → /blog (public)
│   ├── _components/     → NOT routable
│   │   └── Post.tsx
│   └── _lib/            → NOT routable
│       └── data.ts
```

### Parallel Routes

Render multiple pages in the same layout using named slots `@folder`:

```
app/
├── layout.tsx
├── @sidebar/
│   └── page.tsx
├── @main/
│   └── page.tsx
└── page.tsx

// app/layout.tsx
export default function Layout({
  children,
  sidebar,
  main,
}: {
  children: React.ReactNode
  sidebar: React.ReactNode
  main: React.ReactNode
}) {
  return (
    <>
      <aside>{sidebar}</aside>
      <main>{main}</main>
      {children}
    </>
  )
}
```

### Intercepting Routes

Show a route in a modal without changing the URL:

- `(.)folder` - intercept same level
- `(..)folder` - intercept parent level
- `(..)(..)folder` - intercept two levels up
- `(...)folder` - intercept from root

```
app/
├── feed/
│   ├── page.tsx         → /feed
│   └── (..)photo/
│       └── [id]/
│           └── page.tsx → Opens /photo/[id] as modal
└── photo/
    └── [id]/
        └── page.tsx     → /photo/[id]
```

---

## 3. Server and Client Components

### When to Use Each

**Use Server Components (default) when:**
- Fetching data from databases or APIs
- Accessing backend resources (API keys, tokens)
- Keeping sensitive logic on server
- Reducing client JavaScript bundle
- Improving SEO and initial page load

**Use Client Components when:**
- Need interactivity (`onClick`, `onChange`)
- Need React hooks (`useState`, `useEffect`, `useContext`)
- Need browser APIs (`localStorage`, `window`, etc.)
- Using event listeners or lifecycle effects

### Creating Client Components

Add `'use client'` directive at the top of the file:

```tsx
'use client'

import { useState } from 'react'

export default function Counter() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>
    </div>
  )
}
```

### Server Components (Default)

```tsx
// app/blog/page.tsx
import { db } from '@/lib/db'

// This is a Server Component by default
export default async function BlogPage() {
  const posts = await db.query('SELECT * FROM posts')

  return (
    <ul>
      {posts.map((post) => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  )
}
```

### Composition Patterns

**Pattern 1: Pass Server Component as Child to Client Component**

```tsx
// app/ui/modal.tsx (Client Component)
'use client'

export default function Modal({ children }: { children: React.ReactNode }) {
  const [isOpen, setIsOpen] = useState(false)

  return (
    <div>
      <button onClick={() => setIsOpen(!isOpen)}>Toggle</button>
      {isOpen && <div>{children}</div>}
    </div>
  )
}

// app/page.tsx (Server Component)
import Modal from './ui/modal'
import Cart from './ui/cart' // Server Component

export default function Page() {
  return (
    <Modal>
      <Cart /> {/* Server Component rendered inside Client Component */}
    </Modal>
  )
}
```

**Pattern 2: Pass Server Data to Client Component**

```tsx
// app/page.tsx (Server Component)
import LikeButton from './ui/like-button' // Client Component
import { getPost } from '@/lib/data'

export default async function Page() {
  const post = await getPost('123')

  return <LikeButton likes={post.likes} />
}

// app/ui/like-button.tsx (Client Component)
'use client'

export default function LikeButton({ likes }: { likes: number }) {
  const [count, setCount] = useState(likes)
  return <button onClick={() => setCount(count + 1)}>{count} likes</button>
}
```

### Context Providers

Create a Client Component provider and use in Server Component:

```tsx
// app/theme-provider.tsx (Client Component)
'use client'

import { createContext } from 'react'

export const ThemeContext = createContext({})

export default function ThemeProvider({ children }: { children: React.ReactNode }) {
  return (
    <ThemeContext.Provider value="dark">
      {children}
    </ThemeContext.Provider>
  )
}

// app/layout.tsx (Server Component)
import ThemeProvider from './theme-provider'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html>
      <body>
        <ThemeProvider>{children}</ThemeProvider>
      </body>
    </html>
  )
}
```

### Sharing Data with React.cache

Use `React.cache` to share data across Server and Client Components:

```ts
// app/lib/user.ts
import { cache } from 'react'

export const getUser = cache(async () => {
  const res = await fetch('https://api.example.com/user')
  return res.json()
})

// app/user-provider.tsx (Client Component)
'use client'

import { createContext, use } from 'react'

export const UserContext = createContext<Promise<User> | null>(null)

export default function UserProvider({
  children,
  userPromise,
}: {
  children: React.ReactNode
  userPromise: Promise<User>
}) {
  return <UserContext value={userPromise}>{children}</UserContext>
}

// app/layout.tsx (Server Component)
import UserProvider from './user-provider'
import { getUser } from './lib/user'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  const userPromise = getUser() // Don't await

  return (
    <html>
      <body>
        <UserProvider userPromise={userPromise}>{children}</UserProvider>
      </body>
    </html>
  )
}
```

### Preventing Environment Poisoning

Use `server-only` package to prevent server code from running on client:

```bash
npm install server-only
```

```ts
// lib/data.ts
import 'server-only'

export async function getData() {
  const res = await fetch('https://external-service.com/data', {
    headers: {
      authorization: process.env.API_KEY, // Safe - won't leak to client
    },
  })
  return res.json()
}
```

Similarly, use `client-only` for client-specific code:

```bash
npm install client-only
```

---

## 4. Data Fetching

### Server Components Data Fetching

**Method 1: fetch API**

```tsx
// app/blog/page.tsx
export default async function Page() {
  const data = await fetch('https://api.vercel.app/blog')
  const posts = await data.json()

  return (
    <ul>
      {posts.map((post) => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  )
}
```

**Method 2: ORM or Database**

```tsx
// app/blog/page.tsx
import { db, posts } from '@/lib/db'

export default async function Page() {
  const allPosts = await db.select().from(posts)

  return (
    <ul>
      {allPosts.map((post) => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  )
}
```

**Method 3: File System (Node.js APIs)**

```tsx
import { readFile } from 'node:fs/promises'

export default async function Page() {
  const data = await readFile('data/config.json', 'utf8')
  const config = JSON.parse(data)

  return <div>{config.title}</div>
}
```

### Client Components Data Fetching

**Method 1: Streaming with `use` API**

```tsx
// app/blog/page.tsx (Server Component)
import Posts from '@/app/ui/posts'
import { Suspense } from 'react'

export default function Page() {
  const posts = getPosts() // Don't await

  return (
    <Suspense fallback={<div>Loading...</div>}>
      <Posts posts={posts} />
    </Suspense>
  )
}

// app/ui/posts.tsx (Client Component)
'use client'

import { use } from 'react'

export default function Posts({ posts }: { posts: Promise<Post[]> }) {
  const allPosts = use(posts)

  return (
    <ul>
      {allPosts.map((post) => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  )
}
```

**Method 2: SWR or React Query**

```tsx
'use client'

import useSWR from 'swr'

const fetcher = (url) => fetch(url).then((r) => r.json())

export default function BlogPage() {
  const { data, error, isLoading } = useSWR(
    'https://api.vercel.app/blog',
    fetcher
  )

  if (isLoading) return <div>Loading...</div>
  if (error) return <div>Error: {error.message}</div>

  return (
    <ul>
      {data.map((post) => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  )
}
```

### Request Deduplication with React.cache

Deduplicate database queries across components:

```ts
// app/lib/data.ts
import { cache } from 'react'
import { db, posts, eq } from '@/lib/db'

export const getPost = cache(async (id: string) => {
  const post = await db.query.posts.findFirst({
    where: eq(posts.id, parseInt(id)),
  })
  return post
})
```

### Parallel Data Fetching

```tsx
// app/artist/[username]/page.tsx
import { getArtist, getAlbums } from '@/lib/data'

export default async function Page({
  params,
}: {
  params: Promise<{ username: string }>
}) {
  const { username } = await params

  // Start both requests in parallel
  const artistData = getArtist(username)
  const albumsData = getAlbums(username)

  // Wait for both
  const [artist, albums] = await Promise.all([artistData, albumsData])

  return (
    <>
      <h1>{artist.name}</h1>
      <Albums list={albums} />
    </>
  )
}
```

### Sequential Data Fetching

When one request depends on another:

```tsx
export default async function Page({
  params,
}: {
  params: Promise<{ username: string }>
}) {
  const { username } = await params
  const artist = await getArtist(username)

  return (
    <>
      <h1>{artist.name}</h1>
      <Suspense fallback={<div>Loading playlists...</div>}>
        <Playlists artistID={artist.id} />
      </Suspense>
    </>
  )
}

async function Playlists({ artistID }: { artistID: string }) {
  const playlists = await getArtistPlaylists(artistID)

  return (
    <ul>
      {playlists.map((playlist) => (
        <li key={playlist.id}>{playlist.name}</li>
      ))}
    </ul>
  )
}
```

### Preloading Data

```tsx
import { getItem } from '@/lib/data'

// Preload function
const preload = (id: string) => {
  void getItem(id)
}

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params
  preload(id) // Start loading early

  const isAvailable = await checkIsAvailable()

  return isAvailable ? <Item id={id} /> : null
}

async function Item({ id }: { id: string }) {
  const result = await getItem(id) // Already preloaded
  return <div>{result.name}</div>
}
```

---

## 5. Caching & Revalidation

### Caching Mechanisms Overview

| Mechanism | What | Where | Purpose | Duration |
|-----------|------|-------|---------|----------|
| Request Memoization | Function results | Server | Dedupe in component tree | Per-request |
| Data Cache | Data | Server | Store across requests | Persistent (revalidatable) |
| Full Route Cache | HTML + RSC Payload | Server | Reduce rendering cost | Persistent (revalidatable) |
| Router Cache | RSC Payload | Client | Reduce server requests | Session or time-based |

### fetch API Caching

By default, `fetch` requests are **not cached**. Opt into caching:

```tsx
// Cache indefinitely
const data = await fetch('https://api.example.com/data', {
  cache: 'force-cache'
})

// Revalidate every hour
const data = await fetch('https://api.example.com/data', {
  next: { revalidate: 3600 }
})

// Never cache
const data = await fetch('https://api.example.com/data', {
  cache: 'no-store'
})
```

### Cache Tags

Tag fetch requests for on-demand revalidation:

```tsx
// app/lib/data.ts
export async function getUser(id: string) {
  const data = await fetch(`https://api.example.com/user/${id}`, {
    next: {
      tags: ['user', `user-${id}`],
    },
  })
  return data.json()
}
```

### cacheTag (for Cache Components)

Use with the `use cache` directive to cache any computation:

```tsx
// app/lib/data.ts
import { cacheTag } from 'next/cache'

export async function getProducts() {
  'use cache'
  cacheTag('products')

  const products = await db.query('SELECT * FROM products')
  return products
}
```

### revalidateTag

Revalidate cache entries by tag:

```tsx
// app/lib/actions.ts
'use server'

import { revalidateTag } from 'next/cache'

export async function updateUser(id: string) {
  // Update user in database
  await db.user.update({ id, ...data })

  // Revalidate with stale-while-revalidate
  revalidateTag('user', 'max')  // Recommended
  revalidateTag(`user-${id}`, 'max')
}
```

### updateTag

Immediately expire cache (for Server Actions only):

```tsx
'use server'

import { updateTag } from 'next/cache'
import { redirect } from 'next/navigation'

export async function createPost(formData: FormData) {
  const post = await db.post.create({
    data: {
      title: formData.get('title'),
      content: formData.get('content'),
    },
  })

  // Immediately expire cache
  updateTag('posts')
  updateTag(`post-${post.id}`)

  redirect(`/posts/${post.id}`)
}
```

### revalidatePath

Revalidate all data for a specific path:

```tsx
'use server'

import { revalidatePath } from 'next/cache'

export async function updatePost(id: string) {
  // Update post
  await db.post.update({ id, ...data })

  // Revalidate the blog page
  revalidatePath('/blog')

  // Revalidate all blog posts
  revalidatePath('/blog', 'layout')
}
```

### unstable_cache (Legacy)

```tsx
import { unstable_cache } from 'next/cache'
import { getUserById } from '@/lib/data'

const getCachedUser = unstable_cache(
  async (userId: string) => {
    return getUserById(userId)
  },
  ['user'], // Cache key
  {
    tags: ['user'],
    revalidate: 3600,
  }
)
```

### Time-Based Revalidation

```tsx
// Revalidate every hour
fetch('https://api.example.com/data', {
  next: { revalidate: 3600 }
})

// Or via Route Segment Config
export const revalidate = 3600 // seconds
```

### On-Demand Revalidation Workflow

1. Tag your cached data:
```tsx
fetch('https://api.example.com/posts', {
  next: { tags: ['posts'] }
})
```

2. Trigger revalidation in Server Action or Route Handler:
```tsx
'use server'

import { revalidateTag } from 'next/cache'

export async function createPost() {
  // Create post...

  revalidateTag('posts', 'max')
}
```

---

## 6. Navigation & Linking

### Link Component

The primary way to navigate between routes:

```tsx
import Link from 'next/link'

export default function Navigation() {
  return (
    <nav>
      <Link href="/">Home</Link>
      <Link href="/about">About</Link>
      <Link href="/blog">Blog</Link>

      {/* Dynamic route */}
      <Link href={`/blog/${post.slug}`}>{post.title}</Link>

      {/* Disable prefetching */}
      <Link href="/large-page" prefetch={false}>
        Large Page
      </Link>

      {/* Scroll to top (default behavior) */}
      <Link href="/about" scroll={true}>About</Link>
    </nav>
  )
}
```

### Prefetching Behavior

- **Static routes**: Full route prefetched when `<Link>` enters viewport
- **Dynamic routes**: Partial prefetch if `loading.tsx` exists, otherwise skipped
- **Control prefetching**: Use `prefetch` prop

```tsx
// Prefetch on hover instead of viewport
'use client'

import Link from 'next/link'
import { useState } from 'react'

function HoverPrefetchLink({ href, children }) {
  const [active, setActive] = useState(false)

  return (
    <Link
      href={href}
      prefetch={active ? null : false}
      onMouseEnter={() => setActive(true)}
    >
      {children}
    </Link>
  )
}
```

### useRouter Hook

For programmatic navigation in Client Components:

```tsx
'use client'

import { useRouter } from 'next/navigation'

export default function Page() {
  const router = useRouter()

  return (
    <button onClick={() => router.push('/dashboard')}>
      Go to Dashboard
    </button>
  )
}
```

**useRouter methods:**
- `router.push(href, { scroll: false })` - Navigate and add to history
- `router.replace(href)` - Navigate and replace history
- `router.refresh()` - Refresh current route
- `router.prefetch(href)` - Prefetch a route
- `router.back()` - Navigate back
- `router.forward()` - Navigate forward

### usePathname and useSearchParams

```tsx
'use client'

import { usePathname, useSearchParams } from 'next/navigation'

export default function Page() {
  const pathname = usePathname() // e.g., '/blog/my-post'
  const searchParams = useSearchParams() // e.g., ?sort=asc

  const sort = searchParams.get('sort') // 'asc'

  return <div>Current path: {pathname}</div>
}
```

### Server Component searchParams

```tsx
// app/shop/page.tsx
export default async function Page({
  searchParams,
}: {
  searchParams: Promise<{ [key: string]: string | string[] | undefined }>
}) {
  const params = await searchParams
  const filters = params.filters

  return <div>Filters: {filters}</div>
}
```

### Native History API

Use browser APIs for URL updates without reloading:

```tsx
'use client'

import { useSearchParams } from 'next/navigation'

export default function SortProducts() {
  const searchParams = useSearchParams()

  function updateSorting(sortOrder: string) {
    const params = new URLSearchParams(searchParams.toString())
    params.set('sort', sortOrder)

    // Add to history
    window.history.pushState(null, '', `?${params.toString()}`)

    // Or replace current entry
    // window.history.replaceState(null, '', `?${params.toString()}`)
  }

  return (
    <>
      <button onClick={() => updateSorting('asc')}>Sort Ascending</button>
      <button onClick={() => updateSorting('desc')}>Sort Descending</button>
    </>
  )
}
```

### useLinkStatus Hook

Show loading feedback during navigation:

```tsx
'use client'

import { useLinkStatus } from 'next/link'

export default function LoadingIndicator() {
  const { pending } = useLinkStatus()

  return (
    <span
      aria-hidden
      className={`loading-indicator ${pending ? 'is-pending' : ''}`}
    />
  )
}
```

CSS example with debounce:

```css
.loading-indicator {
  opacity: 0;
  transition: opacity 0.3s;
  animation-delay: 100ms; /* Only show after 100ms */
}

.loading-indicator.is-pending {
  opacity: 1;
}
```

### Optimizing Navigation Performance

**1. Add loading.tsx for dynamic routes:**

```tsx
// app/blog/[slug]/loading.tsx
export default function Loading() {
  return <ArticleSkeleton />
}
```

**2. Use generateStaticParams:**

```tsx
// app/blog/[slug]/page.tsx
export async function generateStaticParams() {
  const posts = await fetch('https://api.example.com/posts').then(res => res.json())

  return posts.map((post) => ({
    slug: post.slug,
  }))
}
```

**3. Reduce client bundle:**

```tsx
// Use bundle analyzer
npm install @next/bundle-analyzer

// Move logic to server components
// Use dynamic imports for heavy components
import dynamic from 'next/dynamic'

const HeavyComponent = dynamic(() => import('./HeavyComponent'))
```

---

## 7. Data Mutation (Server Actions)

### Creating Server Functions

**Method 1: Inline in Server Component**

```tsx
// app/page.tsx
export default function Page() {
  async function createPost(formData: FormData) {
    'use server'

    const title = formData.get('title')
    const content = formData.get('content')

    await db.post.create({ data: { title, content } })
  }

  return (
    <form action={createPost}>
      <input type="text" name="title" />
      <textarea name="content" />
      <button type="submit">Create</button>
    </form>
  )
}
```

**Method 2: Separate File**

```ts
// app/actions.ts
'use server'

export async function createPost(formData: FormData) {
  const title = formData.get('title')
  const content = formData.get('content')

  await db.post.create({ data: { title, content } })
}

export async function deletePost(formData: FormData) {
  const id = formData.get('id')
  await db.post.delete({ where: { id } })
}
```

```tsx
// app/ui/form.tsx
import { createPost } from '@/app/actions'

export function Form() {
  return (
    <form action={createPost}>
      <input type="text" name="title" />
      <button type="submit">Create</button>
    </form>
  )
}
```

### Using in Client Components

```tsx
// app/ui/button.tsx
'use client'

import { createPost } from '@/app/actions'

export function Button() {
  return <button formAction={createPost}>Create</button>
}
```

### Invoking Methods

**1. With Forms (Progressive Enhancement)**

```tsx
import { createPost } from '@/app/actions'

export function Form() {
  return (
    <form action={createPost}>
      <input type="text" name="title" required />
      <button type="submit">Submit</button>
    </form>
  )
}
```

**2. With Event Handlers**

```tsx
'use client'

import { incrementLike } from './actions'
import { useState } from 'react'

export default function LikeButton({ initialLikes }: { initialLikes: number }) {
  const [likes, setLikes] = useState(initialLikes)

  return (
    <button
      onClick={async () => {
        const updatedLikes = await incrementLike()
        setLikes(updatedLikes)
      }}
    >
      {likes} likes
    </button>
  )
}
```

**3. With useEffect**

```tsx
'use client'

import { incrementViews } from './actions'
import { useState, useEffect, useTransition } from 'react'

export default function ViewCount({ initialViews }: { initialViews: number }) {
  const [views, setViews] = useState(initialViews)
  const [isPending, startTransition] = useTransition()

  useEffect(() => {
    startTransition(async () => {
      const updatedViews = await incrementViews()
      setViews(updatedViews)
    })
  }, [])

  return <p>Total Views: {views}</p>
}
```

### Showing Pending State

```tsx
'use client'

import { useActionState, startTransition } from 'react'
import { createPost } from '@/app/actions'

export function SubmitButton() {
  const [state, action, pending] = useActionState(createPost, false)

  return (
    <button onClick={() => startTransition(action)} disabled={pending}>
      {pending ? 'Submitting...' : 'Submit'}
    </button>
  )
}
```

### Revalidation After Mutation

```tsx
'use server'

import { revalidatePath, revalidateTag } from 'next/cache'

export async function createPost(formData: FormData) {
  // Create post
  await db.post.create({ data: { ...formData } })

  // Revalidate the posts page
  revalidatePath('/posts')

  // Or revalidate by tag
  revalidateTag('posts', 'max')
}
```

### Redirecting After Mutation

```tsx
'use server'

import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'

export async function createPost(formData: FormData) {
  const post = await db.post.create({ data: { ...formData } })

  // Revalidate first, then redirect
  revalidatePath('/posts')
  redirect(`/posts/${post.id}`)
}
```

### Refreshing the Page

```tsx
'use server'

import { refresh } from 'next/cache'

export async function updatePost(formData: FormData) {
  // Update post
  await db.post.update({ ...formData })

  // Refresh the current page
  refresh()
}
```

### Working with Cookies

```tsx
'use server'

import { cookies } from 'next/headers'

export async function exampleAction() {
  const cookieStore = await cookies()

  // Get cookie
  const token = cookieStore.get('token')?.value

  // Set cookie
  cookieStore.set('name', 'John')

  // Delete cookie
  cookieStore.delete('session')
}
```

### Validation and Error Handling

```tsx
'use server'

import { z } from 'zod'
import { redirect } from 'next/navigation'

const schema = z.object({
  title: z.string().min(1).max(100),
  content: z.string().min(10),
})

export async function createPost(formData: FormData) {
  // Validate
  const result = schema.safeParse({
    title: formData.get('title'),
    content: formData.get('content'),
  })

  if (!result.success) {
    return { error: result.error.flatten() }
  }

  // Create post
  const post = await db.post.create({ data: result.data })

  revalidatePath('/posts')
  redirect(`/posts/${post.id}`)
}
```

---

## 8. API Routes (Route Handlers)

### Basic Route Handler

```ts
// app/api/hello/route.ts
export async function GET() {
  return Response.json({ message: 'Hello World' })
}
```

### All HTTP Methods

```ts
// app/api/posts/route.ts
export async function GET(request: Request) {
  const posts = await db.post.findMany()
  return Response.json(posts)
}

export async function POST(request: Request) {
  const body = await request.json()
  const post = await db.post.create({ data: body })
  return Response.json(post, { status: 201 })
}

export async function PUT(request: Request) {
  const body = await request.json()
  const post = await db.post.update({ where: { id: body.id }, data: body })
  return Response.json(post)
}

export async function DELETE(request: Request) {
  const { searchParams } = new URL(request.url)
  const id = searchParams.get('id')
  await db.post.delete({ where: { id } })
  return new Response(null, { status: 204 })
}
```

### Dynamic Routes

```ts
// app/api/posts/[id]/route.ts
export async function GET(
  request: Request,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params
  const post = await db.post.findUnique({ where: { id } })

  if (!post) {
    return new Response('Not Found', { status: 404 })
  }

  return Response.json(post)
}
```

### Request Object (NextRequest)

```ts
import type { NextRequest } from 'next/server'

export async function GET(request: NextRequest) {
  // URL and search params
  const searchParams = request.nextUrl.searchParams
  const query = searchParams.get('query')

  // Cookies
  const token = request.cookies.get('token')

  // Headers
  const authorization = request.headers.get('authorization')

  return Response.json({ query })
}
```

### Response with Headers

```ts
export async function GET() {
  return new Response('Hello', {
    status: 200,
    headers: {
      'Content-Type': 'text/plain',
      'Cache-Control': 'public, max-age=3600',
      'Set-Cookie': 'token=abc123; Path=/; HttpOnly',
    },
  })
}
```

### Cookies in Route Handlers

```ts
import { cookies } from 'next/headers'

export async function GET(request: NextRequest) {
  const cookieStore = await cookies()

  // Get cookie
  const token = cookieStore.get('token')

  // Set cookie
  cookieStore.set('user', 'john')

  // Delete cookie
  cookieStore.delete('session')

  return Response.json({ success: true })
}
```

### CORS Headers

```ts
export async function GET(request: Request) {
  return Response.json(
    { message: 'Hello' },
    {
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      },
    }
  )
}

export async function OPTIONS(request: Request) {
  return new Response(null, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    },
  })
}
```

### Streaming Responses

```ts
export async function GET() {
  const encoder = new TextEncoder()

  const stream = new ReadableStream({
    async start(controller) {
      controller.enqueue(encoder.encode('data: {"message": "Hello"}\n\n'))

      await new Promise(resolve => setTimeout(resolve, 1000))

      controller.enqueue(encoder.encode('data: {"message": "World"}\n\n'))
      controller.close()
    },
  })

  return new Response(stream, {
    headers: {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      Connection: 'keep-alive',
    },
  })
}
```

### Webhooks

```ts
import { headers } from 'next/headers'

export async function POST(request: Request) {
  const headersList = await headers()
  const signature = headersList.get('x-signature')

  // Verify signature
  const body = await request.text()
  const isValid = verifySignature(body, signature)

  if (!isValid) {
    return new Response('Unauthorized', { status: 401 })
  }

  const event = JSON.parse(body)

  // Process webhook
  await processWebhook(event)

  return new Response('OK', { status: 200 })
}
```

### Edge Runtime

```ts
export const runtime = 'edge'

export async function GET(request: Request) {
  return Response.json({ message: 'Running on Edge' })
}
```

---

## 9. Built-in Components

### Image Component

Automatic image optimization with lazy loading:

```tsx
import Image from 'next/image'

export default function Page() {
  return (
    <>
      {/* Static import */}
      <Image
        src="/profile.png"
        alt="Profile picture"
        width={500}
        height={500}
        quality={80}
        priority // Preload for above-the-fold images
      />

      {/* External image (requires remotePatterns config) */}
      <Image
        src="https://example.com/image.jpg"
        alt="Remote image"
        width={800}
        height={600}
      />

      {/* Fill container */}
      <div style={{ position: 'relative', width: '100%', height: '400px' }}>
        <Image
          src="/hero.jpg"
          alt="Hero"
          fill
          style={{ objectFit: 'cover' }}
        />
      </div>

      {/* Responsive */}
      <Image
        src="/responsive.jpg"
        alt="Responsive"
        width={1200}
        height={800}
        sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
      />

      {/* Placeholder blur */}
      <Image
        src="/photo.jpg"
        alt="Photo"
        width={600}
        height={400}
        placeholder="blur"
        blurDataURL="data:image/jpeg;base64,/9j/4AAQSkZJRg..."
      />
    </>
  )
}
```

**Configure remote images:**

```js
// next.config.js
module.exports = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'example.com',
        port: '',
        pathname: '/images/**',
      },
    ],
  },
}
```

### Link Component

```tsx
import Link from 'next/link'

export default function Navigation() {
  return (
    <>
      {/* Basic link */}
      <Link href="/about">About</Link>

      {/* Dynamic link */}
      <Link href={`/posts/${post.id}`}>{post.title}</Link>

      {/* Disable prefetch */}
      <Link href="/blog" prefetch={false}>Blog</Link>

      {/* Replace history */}
      <Link href="/login" replace>Login</Link>

      {/* Scroll control */}
      <Link href="/top" scroll={false}>Stay at position</Link>

      {/* With custom component */}
      <Link href="/about" legacyBehavior>
        <a className="custom-link">About Us</a>
      </Link>
    </>
  )
}
```

### Font Optimization

```tsx
// app/layout.tsx
import { Inter, Roboto_Mono } from 'next/font/google'

const inter = Inter({
  subsets: ['latin'],
  display: 'swap',
})

const robotoMono = Roboto_Mono({
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-roboto-mono',
})

export default function RootLayout({ children }) {
  return (
    <html lang="en" className={`${inter.className} ${robotoMono.variable}`}>
      <body>{children}</body>
    </html>
  )
}
```

**Local fonts:**

```tsx
import localFont from 'next/font/local'

const myFont = localFont({
  src: './my-font.woff2',
  display: 'swap',
})

export default function Layout({ children }) {
  return (
    <html lang="en" className={myFont.className}>
      <body>{children}</body>
    </html>
  )
}
```

### Script Component

```tsx
import Script from 'next/script'

export default function Page() {
  return (
    <>
      {/* After page is interactive */}
      <Script src="https://example.com/analytics.js" strategy="afterInteractive" />

      {/* Before page is interactive */}
      <Script src="https://example.com/polyfill.js" strategy="beforeInteractive" />

      {/* Lazy load */}
      <Script src="https://example.com/chat.js" strategy="lazyOnload" />

      {/* Inline script */}
      <Script id="analytics">
        {`
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
        `}
      </Script>

      {/* With callback */}
      <Script
        src="https://example.com/sdk.js"
        onLoad={() => {
          console.log('Script loaded')
        }}
      />
    </>
  )
}
```

### Form Component

Enhanced `<form>` with prefetching:

```tsx
import Form from 'next/form'

export default function Page() {
  return (
    <Form action="/search">
      {/* Prefetches /search when form is in viewport */}
      <input name="query" />
      <button type="submit">Search</button>
    </Form>
  )
}
```

---

## 10. Rendering Strategies

### Static Rendering (Default)

Routes are rendered at **build time** or after revalidation:

```tsx
// app/blog/page.tsx
export default async function BlogPage() {
  const posts = await fetch('https://api.example.com/posts', {
    next: { revalidate: 3600 } // Revalidate every hour
  }).then(res => res.json())

  return (
    <ul>
      {posts.map(post => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  )
}
```

**Configure via Route Segment Config:**

```tsx
export const revalidate = 3600 // Revalidate every hour

export default async function Page() {
  // ...
}
```

### Dynamic Rendering

Routes are rendered at **request time** when using:

- `cookies()`
- `headers()`
- `connection()`
- `searchParams` prop
- `unstable_noStore()`
- `fetch` with `cache: 'no-store'`

```tsx
import { cookies } from 'next/headers'

export default async function Page() {
  const cookieStore = await cookies()
  const theme = cookieStore.get('theme')

  // This route is now dynamically rendered
  return <div>Theme: {theme?.value}</div>
}
```

**Force dynamic rendering:**

```tsx
export const dynamic = 'force-dynamic'

export default async function Page() {
  // Always dynamically rendered
}
```

### Partial Prerendering (Experimental)

Combine static and dynamic rendering:

```tsx
// next.config.js
module.exports = {
  experimental: {
    ppr: true,
  },
}

// app/page.tsx
import { Suspense } from 'react'

export default function Page() {
  return (
    <>
      {/* Static shell */}
      <header>
        <h1>Welcome</h1>
      </header>

      {/* Dynamic content */}
      <Suspense fallback={<div>Loading...</div>}>
        <DynamicComponent />
      </Suspense>

      {/* Static footer */}
      <footer>© 2026</footer>
    </>
  )
}
```

### ISR (Incremental Static Regeneration)

Generate static pages on-demand:

```tsx
// app/blog/[slug]/page.tsx
export const revalidate = 60 // Revalidate every 60 seconds

export async function generateStaticParams() {
  // Generate top 100 posts at build time
  const posts = await fetch('https://api.example.com/posts?limit=100')
    .then(res => res.json())

  return posts.map((post) => ({
    slug: post.slug,
  }))
}

export default async function Post({
  params,
}: {
  params: Promise<{ slug: string }>
}) {
  const { slug } = await params
  const post = await getPost(slug)

  return <article>{post.content}</article>
}
```

### Streaming with Suspense

```tsx
import { Suspense } from 'react'

export default function Page() {
  return (
    <>
      {/* Rendered immediately */}
      <h1>Products</h1>

      {/* Streamed when ready */}
      <Suspense fallback={<ProductListSkeleton />}>
        <ProductList />
      </Suspense>
    </>
  )
}

async function ProductList() {
  const products = await fetchProducts() // Slow query

  return (
    <ul>
      {products.map(product => (
        <li key={product.id}>{product.name}</li>
      ))}
    </ul>
  )
}
```

---

## 11. Error Handling & Loading States

### Error Boundaries

```tsx
// app/blog/error.tsx
'use client'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <div>
      <h2>Something went wrong!</h2>
      <p>{error.message}</p>
      <button onClick={() => reset()}>Try again</button>
    </div>
  )
}
```

**Global error:**

```tsx
// app/global-error.tsx
'use client'

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <html>
      <body>
        <h2>Application Error</h2>
        <p>{error.message}</p>
        <button onClick={() => reset()}>Try again</button>
      </body>
    </html>
  )
}
```

### Loading UI

```tsx
// app/blog/loading.tsx
export default function Loading() {
  return (
    <div>
      <h2>Loading...</h2>
      <Skeleton />
    </div>
  )
}
```

**With Suspense for granular control:**

```tsx
import { Suspense } from 'react'

export default function Page() {
  return (
    <>
      <h1>Dashboard</h1>

      <Suspense fallback={<RevenueSkeleton />}>
        <RevenueChart />
      </Suspense>

      <Suspense fallback={<OrdersSkeleton />}>
        <RecentOrders />
      </Suspense>
    </>
  )
}
```

### Not Found

```tsx
// app/blog/not-found.tsx
export default function NotFound() {
  return (
    <div>
      <h2>404 - Post Not Found</h2>
      <p>Could not find the requested blog post.</p>
      <Link href="/blog">Back to Blog</Link>
    </div>
  )
}
```

**Trigger not-found:**

```tsx
import { notFound } from 'next/navigation'

export default async function Post({
  params,
}: {
  params: Promise<{ slug: string }>
}) {
  const { slug } = await params
  const post = await getPost(slug)

  if (!post) {
    notFound() // Shows not-found.tsx
  }

  return <article>{post.content}</article>
}
```

### Forbidden & Unauthorized

```tsx
// app/admin/forbidden.tsx
export default function Forbidden() {
  return <h1>403 - Access Denied</h1>
}

// app/api/users/unauthorized.tsx
export default function Unauthorized() {
  return <h1>401 - Please log in</h1>
}
```

**Trigger:**

```tsx
import { forbidden, unauthorized } from 'next/navigation'

export default async function AdminPage() {
  const session = await getSession()

  if (!session) {
    unauthorized() // Shows unauthorized.tsx
  }

  if (session.role !== 'admin') {
    forbidden() // Shows forbidden.tsx
  }

  return <div>Admin Dashboard</div>
}
```

---

## 12. Configuration

### next.config.js Essentials

```js
// next.config.js
const nextConfig = {
  // Enable React Strict Mode
  reactStrictMode: true,

  // TypeScript configuration
  typescript: {
    ignoreBuildErrors: false,
  },

  // ESLint configuration
  eslint: {
    ignoreDuringBuilds: false,
  },

  // Image optimization
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'example.com',
        port: '',
        pathname: '/images/**',
      },
    ],
    formats: ['image/avif', 'image/webp'],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
  },

  // Redirects
  async redirects() {
    return [
      {
        source: '/old-blog/:slug',
        destination: '/blog/:slug',
        permanent: true,
      },
    ]
  },

  // Rewrites
  async rewrites() {
    return [
      {
        source: '/api/:path*',
        destination: 'https://api.example.com/:path*',
      },
    ]
  },

  // Headers
  async headers() {
    return [
      {
        source: '/api/:path*',
        headers: [
          { key: 'Access-Control-Allow-Origin', value: '*' },
          { key: 'Access-Control-Allow-Methods', value: 'GET,POST,PUT,DELETE' },
        ],
      },
    ]
  },

  // Environment variables
  env: {
    CUSTOM_KEY: 'value',
  },

  // Base path (for subdirectory deployments)
  basePath: '/docs',

  // Asset prefix (for CDN)
  assetPrefix: 'https://cdn.example.com',

  // Trailing slash
  trailingSlash: false,

  // Page extensions
  pageExtensions: ['ts', 'tsx', 'js', 'jsx', 'md', 'mdx'],

  // Webpack configuration
  webpack: (config, { isServer }) => {
    // Custom webpack config
    return config
  },

  // Experimental features
  experimental: {
    ppr: true, // Partial Prerendering
    reactCompiler: true, // React Compiler
  },
}

module.exports = nextConfig
```

### Route Segment Config

```tsx
// app/blog/page.tsx

// Rendering strategy
export const dynamic = 'auto' // 'auto' | 'force-dynamic' | 'force-static'

// Revalidation interval (seconds)
export const revalidate = 3600 // false | 0 | number

// Cache configuration
export const fetchCache = 'auto' // 'auto' | 'default-cache' | 'only-cache' | 'force-cache' | 'force-no-store' | 'default-no-store' | 'only-no-store'

// Runtime
export const runtime = 'nodejs' // 'nodejs' | 'edge'

// Preferred region
export const preferredRegion = 'auto' // 'auto' | string | string[]

// Maximum duration
export const maxDuration = 5 // seconds

// Dynamic params
export const dynamicParams = true // true | false

export default function Page() {
  return <div>Blog</div>
}
```

### Environment Variables

```bash
# .env.local (not committed to git)
DATABASE_URL=postgres://user:pass@localhost:5432/db
API_KEY=secret_key_123

# .env (committed to git for defaults)
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXT_PUBLIC_API_URL=https://api.example.com
```

```tsx
// Use in Server Components or API Routes
const databaseUrl = process.env.DATABASE_URL
const apiKey = process.env.API_KEY

// Use in Client Components (must have NEXT_PUBLIC_ prefix)
const appUrl = process.env.NEXT_PUBLIC_APP_URL
```

### TypeScript Configuration

```json
// tsconfig.json
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./src/*"],
      "@/components/*": ["./src/components/*"],
      "@/lib/*": ["./src/lib/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
```

### Metadata API

```tsx
// app/layout.tsx or app/page.tsx
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'My App',
  description: 'My app description',
  keywords: ['Next.js', 'React', 'TypeScript'],
  authors: [{ name: 'John Doe', url: 'https://example.com' }],
  openGraph: {
    title: 'My App',
    description: 'My app description',
    url: 'https://example.com',
    siteName: 'My App',
    images: [
      {
        url: 'https://example.com/og.png',
        width: 1200,
        height: 630,
      },
    ],
    locale: 'en_US',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'My App',
    description: 'My app description',
    images: ['https://example.com/og.png'],
  },
  robots: {
    index: true,
    follow: true,
  },
}
```

**Dynamic metadata:**

```tsx
export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>
}): Promise<Metadata> {
  const { slug } = await params
  const post = await getPost(slug)

  return {
    title: post.title,
    description: post.excerpt,
    openGraph: {
      title: post.title,
      description: post.excerpt,
      images: [post.coverImage],
    },
  }
}
```

---

## 13. Best Practices

### Component Organization

```
app/
├── (routes)/
│   ├── blog/
│   │   ├── page.tsx           # Route
│   │   ├── loading.tsx        # Loading state
│   │   ├── error.tsx          # Error boundary
│   │   └── _components/       # Route-specific components
│   │       ├── PostList.tsx
│   │       └── PostCard.tsx
│   └── about/
│       └── page.tsx
├── _components/               # Shared components
│   ├── Header.tsx
│   ├── Footer.tsx
│   └── ui/
│       ├── Button.tsx
│       ├── Card.tsx
│       └── Input.tsx
├── _lib/                      # Utilities
│   ├── db.ts
│   ├── auth.ts
│   └── utils.ts
└── layout.tsx
```

### Data Fetching Best Practices

**1. Fetch data where you need it:**

```tsx
// ✅ Good - Fetch in component that uses it
async function ProductList() {
  const products = await getProducts()
  return <ul>{products.map(p => <li>{p.name}</li>)}</ul>
}

// ❌ Avoid - Prop drilling from parent
```

**2. Use parallel fetching:**

```tsx
// ✅ Good - Parallel
const [user, posts] = await Promise.all([
  getUser(),
  getPosts()
])

// ❌ Avoid - Sequential
const user = await getUser()
const posts = await getPosts()
```

**3. Deduplicate with React.cache:**

```ts
// lib/data.ts
import { cache } from 'react'

export const getUser = cache(async (id: string) => {
  return db.user.findUnique({ where: { id } })
})
```

### Caching Strategy

**1. Use appropriate cache duration:**

```tsx
// Rarely changes - Cache for 1 day
fetch('https://api.example.com/config', {
  next: { revalidate: 86400 }
})

// Changes frequently - Cache for 1 minute
fetch('https://api.example.com/stats', {
  next: { revalidate: 60 }
})

// Always fresh - No cache
fetch('https://api.example.com/user', {
  cache: 'no-store'
})
```

**2. Tag related data:**

```tsx
// Tag all product-related requests
fetch('https://api.example.com/products', {
  next: { tags: ['products'] }
})

// Revalidate all product data at once
revalidateTag('products', 'max')
```

### Performance Optimization

**1. Use Suspense for better UX:**

```tsx
export default function Page() {
  return (
    <>
      <Header /> {/* Renders immediately */}

      <Suspense fallback={<Skeleton />}>
        <SlowComponent /> {/* Streams when ready */}
      </Suspense>
    </>
  )
}
```

**2. Optimize images:**

```tsx
// Use priority for above-the-fold images
<Image src="/hero.jpg" priority />

// Use proper sizes for responsive images
<Image
  src="/product.jpg"
  sizes="(max-width: 768px) 100vw, 50vw"
/>

// Use blur placeholder for perceived performance
<Image
  src="/photo.jpg"
  placeholder="blur"
  blurDataURL="data:image/..."
/>
```

**3. Prefetch critical routes:**

```tsx
// Prefetch important routes
<Link href="/checkout" prefetch={true}>
  Checkout
</Link>

// Disable prefetch for less important routes
<Link href="/terms" prefetch={false}>
  Terms
</Link>
```

### Security Best Practices

**1. Use server-only for sensitive code:**

```ts
import 'server-only'

export async function getSecretData() {
  const apiKey = process.env.SECRET_API_KEY
  // ...
}
```

**2. Validate user input:**

```tsx
'use server'

import { z } from 'zod'

const schema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
})

export async function createUser(formData: FormData) {
  const result = schema.safeParse({
    email: formData.get('email'),
    password: formData.get('password'),
  })

  if (!result.success) {
    return { error: result.error.flatten() }
  }

  // Proceed with validated data
}
```

**3. Use environment variables correctly:**

```bash
# ❌ Don't expose secrets to client
NEXT_PUBLIC_API_KEY=secret

# ✅ Keep secrets on server
API_KEY=secret

# ✅ Public values can be prefixed
NEXT_PUBLIC_APP_URL=https://myapp.com
```

### Error Handling

**1. Use error boundaries appropriately:**

```tsx
// app/blog/error.tsx - Catches errors in blog routes
// app/error.tsx - Catches errors in all routes
// app/global-error.tsx - Catches errors everywhere including layout
```

**2. Handle not-found gracefully:**

```tsx
import { notFound } from 'next/navigation'

export default async function Page({ params }) {
  const post = await getPost(params.id)

  if (!post) {
    notFound() // Shows app/blog/not-found.tsx
  }

  return <article>{post.content}</article>
}
```

### Testing

```tsx
// __tests__/page.test.tsx
import { render, screen } from '@testing-library/react'
import Page from '@/app/page'

describe('Home Page', () => {
  it('renders a heading', () => {
    render(<Page />)
    const heading = screen.getByRole('heading', { level: 1 })
    expect(heading).toBeInTheDocument()
  })
})
```

### Deployment Checklist

- [ ] Enable `reactStrictMode`
- [ ] Configure proper `revalidate` times
- [ ] Set up proper environment variables
- [ ] Configure image optimization with `remotePatterns`
- [ ] Add proper metadata for SEO
- [ ] Set up error tracking (Sentry, etc.)
- [ ] Configure analytics
- [ ] Test with `next build` before deploying
- [ ] Set up proper caching headers
- [ ] Enable gzip/brotli compression
- [ ] Configure CDN if needed

---

## Common Patterns & Examples

### Authentication Pattern

```tsx
// lib/auth.ts
import { cookies } from 'next/headers'

export async function getSession() {
  const cookieStore = await cookies()
  const session = cookieStore.get('session')?.value

  if (!session) return null

  // Verify and decode session
  return verifySession(session)
}

// middleware.ts
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

export function middleware(request: NextRequest) {
  const session = request.cookies.get('session')

  if (!session && request.nextUrl.pathname.startsWith('/dashboard')) {
    return NextResponse.redirect(new URL('/login', request.url))
  }

  return NextResponse.next()
}

export const config = {
  matcher: '/dashboard/:path*',
}
```

### Pagination Pattern

```tsx
// app/blog/page.tsx
export default async function BlogPage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string }>
}) {
  const params = await searchParams
  const page = Number(params.page) || 1
  const limit = 10

  const posts = await getPosts({ page, limit })
  const totalPages = await getTotalPages(limit)

  return (
    <>
      <PostList posts={posts} />
      <Pagination currentPage={page} totalPages={totalPages} />
    </>
  )
}
```

### Infinite Scroll Pattern

```tsx
'use client'

import { useEffect, useRef, useState } from 'react'

export default function InfiniteList({ initialPosts }) {
  const [posts, setPosts] = useState(initialPosts)
  const [page, setPage] = useState(1)
  const [loading, setLoading] = useState(false)
  const observerRef = useRef(null)

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && !loading) {
          loadMore()
        }
      },
      { threshold: 1.0 }
    )

    if (observerRef.current) {
      observer.observe(observerRef.current)
    }

    return () => observer.disconnect()
  }, [loading])

  async function loadMore() {
    setLoading(true)
    const newPosts = await fetchPosts(page + 1)
    setPosts([...posts, ...newPosts])
    setPage(page + 1)
    setLoading(false)
  }

  return (
    <>
      {posts.map(post => (
        <PostCard key={post.id} post={post} />
      ))}
      <div ref={observerRef}>{loading && 'Loading...'}</div>
    </>
  )
}
```

### Search with Debounce Pattern

```tsx
'use client'

import { useState, useEffect } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'

export default function SearchBar() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [query, setQuery] = useState(searchParams.get('q') || '')

  useEffect(() => {
    const timer = setTimeout(() => {
      const params = new URLSearchParams(searchParams)
      if (query) {
        params.set('q', query)
      } else {
        params.delete('q')
      }
      router.push(`/search?${params.toString()}`)
    }, 300)

    return () => clearTimeout(timer)
  }, [query])

  return (
    <input
      type="search"
      value={query}
      onChange={(e) => setQuery(e.target.value)}
      placeholder="Search..."
    />
  )
}
```

---

## Troubleshooting

### Common Issues

**1. Hydration Errors:**

```tsx
// ❌ Problem: Different content on server vs client
export default function Component() {
  return <div>{Date.now()}</div>
}

// ✅ Solution: Use useEffect or suppressHydrationWarning
'use client'

import { useEffect, useState } from 'react'

export default function Component() {
  const [time, setTime] = useState(null)

  useEffect(() => {
    setTime(Date.now())
  }, [])

  return <div>{time || 'Loading...'}</div>
}
```

**2. Can't use hooks in Server Component:**

```tsx
// ❌ Problem
export default function Page() {
  const [count, setCount] = useState(0) // Error!
  return <div>{count}</div>
}

// ✅ Solution: Add 'use client'
'use client'

import { useState } from 'react'

export default function Page() {
  const [count, setCount] = useState(0)
  return <div>{count}</div>
}
```

**3. Headers already sent:**

```tsx
// ❌ Problem: Can't set cookies after reading searchParams
export default async function Page({ searchParams }) {
  const params = await searchParams
  const cookieStore = await cookies() // Error!
  cookieStore.set('theme', 'dark')
}

// ✅ Solution: Use Server Action
export default async function Page({ searchParams }) {
  const params = await searchParams

  async function updateTheme() {
    'use server'
    const cookieStore = await cookies()
    cookieStore.set('theme', 'dark')
  }

  return <form action={updateTheme}>...</form>
}
```

---

This comprehensive guide covers all major Next.js features and best practices. Refer to specific sections as needed for detailed implementation patterns and examples.
