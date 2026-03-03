# Next.js Expert Skill - Usage Examples

This document provides real-world examples of how to use the Next.js Expert Skill with Claude Code.

## Example 1: Creating a Blog with Dynamic Routes

**Question:**
> "Create a complete blog page with dynamic routes that fetches posts from an API, includes proper caching, and shows a loading state"

**Claude Code will provide:**

```tsx
// app/blog/page.tsx
import Link from 'next/link'

export default async function BlogPage() {
  const posts = await fetch('https://api.example.com/posts', {
    next: { revalidate: 3600 } // Cache for 1 hour
  }).then(res => res.json())

  return (
    <div>
      <h1>Blog Posts</h1>
      <ul>
        {posts.map((post) => (
          <li key={post.id}>
            <Link href={`/blog/${post.slug}`}>
              {post.title}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  )
}

// app/blog/[slug]/page.tsx
import { notFound } from 'next/navigation'

export async function generateStaticParams() {
  const posts = await fetch('https://api.example.com/posts')
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
  const post = await fetch(`https://api.example.com/posts/${slug}`, {
    next: { tags: ['posts'] }
  }).then(res => res.json())

  if (!post) {
    notFound()
  }

  return (
    <article>
      <h1>{post.title}</h1>
      <div>{post.content}</div>
    </article>
  )
}

// app/blog/[slug]/loading.tsx
export default function Loading() {
  return (
    <div>
      <div className="animate-pulse">
        <div className="h-8 bg-gray-200 rounded w-3/4 mb-4"></div>
        <div className="h-4 bg-gray-200 rounded w-full mb-2"></div>
        <div className="h-4 bg-gray-200 rounded w-5/6"></div>
      </div>
    </div>
  )
}

// app/blog/[slug]/not-found.tsx
export default function NotFound() {
  return (
    <div>
      <h2>Post Not Found</h2>
      <p>Could not find the requested blog post.</p>
      <Link href="/blog">Back to Blog</Link>
    </div>
  )
}
```

---

## Example 2: Server Actions with Form Validation

**Question:**
> "Create a contact form that uses Server Actions with Zod validation, shows pending state, and handles errors gracefully"

**Claude Code will provide:**

```tsx
// app/contact/page.tsx
import ContactForm from './contact-form'

export default function ContactPage() {
  return (
    <div>
      <h1>Contact Us</h1>
      <ContactForm />
    </div>
  )
}

// app/contact/contact-form.tsx
'use client'

import { useActionState } from 'react'
import { submitContact } from './actions'

export default function ContactForm() {
  const [state, action, pending] = useActionState(submitContact, null)

  return (
    <form action={action}>
      <div>
        <label htmlFor="name">Name</label>
        <input
          type="text"
          id="name"
          name="name"
          required
        />
        {state?.errors?.name && (
          <p className="text-red-500">{state.errors.name[0]}</p>
        )}
      </div>

      <div>
        <label htmlFor="email">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          required
        />
        {state?.errors?.email && (
          <p className="text-red-500">{state.errors.email[0]}</p>
        )}
      </div>

      <div>
        <label htmlFor="message">Message</label>
        <textarea
          id="message"
          name="message"
          rows={5}
          required
        />
        {state?.errors?.message && (
          <p className="text-red-500">{state.errors.message[0]}</p>
        )}
      </div>

      <button type="submit" disabled={pending}>
        {pending ? 'Sending...' : 'Send Message'}
      </button>

      {state?.success && (
        <p className="text-green-500">Message sent successfully!</p>
      )}
    </form>
  )
}

// app/contact/actions.ts
'use server'

import { z } from 'zod'

const schema = z.object({
  name: z.string().min(2, 'Name must be at least 2 characters'),
  email: z.string().email('Invalid email address'),
  message: z.string().min(10, 'Message must be at least 10 characters'),
})

export async function submitContact(prevState: any, formData: FormData) {
  const result = schema.safeParse({
    name: formData.get('name'),
    email: formData.get('email'),
    message: formData.get('message'),
  })

  if (!result.success) {
    return {
      errors: result.error.flatten().fieldErrors,
      success: false,
    }
  }

  try {
    // Send email or save to database
    await sendEmail(result.data)

    return {
      success: true,
      errors: null,
    }
  } catch (error) {
    return {
      errors: { _form: ['Failed to send message. Please try again.'] },
      success: false,
    }
  }
}
```

---

## Example 3: E-commerce Product Page with Streaming

**Question:**
> "Build a product page that streams different sections (product details, reviews, recommendations) independently with Suspense"

**Claude Code will provide:**

```tsx
// app/products/[id]/page.tsx
import { Suspense } from 'react'
import ProductDetails from './product-details'
import ProductReviews from './product-reviews'
import RelatedProducts from './related-products'

export default async function ProductPage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params

  return (
    <div className="grid grid-cols-1 gap-8">
      {/* Fast: Product details load first */}
      <Suspense fallback={<ProductDetailsSkeleton />}>
        <ProductDetails id={id} />
      </Suspense>

      {/* Medium: Reviews stream in after */}
      <Suspense fallback={<ReviewsSkeleton />}>
        <ProductReviews id={id} />
      </Suspense>

      {/* Slow: Recommendations stream last */}
      <Suspense fallback={<RelatedProductsSkeleton />}>
        <RelatedProducts id={id} />
      </Suspense>
    </div>
  )
}

// app/products/[id]/product-details.tsx
import Image from 'next/image'
import AddToCartButton from './add-to-cart-button'

export default async function ProductDetails({ id }: { id: string }) {
  const product = await fetch(`https://api.example.com/products/${id}`, {
    next: { tags: ['product', `product-${id}`] }
  }).then(res => res.json())

  return (
    <div className="grid grid-cols-2 gap-6">
      <Image
        src={product.image}
        alt={product.name}
        width={600}
        height={600}
        priority
      />
      <div>
        <h1>{product.name}</h1>
        <p className="text-2xl font-bold">${product.price}</p>
        <p>{product.description}</p>
        <AddToCartButton productId={id} />
      </div>
    </div>
  )
}

// app/products/[id]/product-reviews.tsx
export default async function ProductReviews({ id }: { id: string }) {
  // Simulate slow query
  await new Promise(resolve => setTimeout(resolve, 2000))

  const reviews = await fetch(`https://api.example.com/products/${id}/reviews`)
    .then(res => res.json())

  return (
    <div>
      <h2>Customer Reviews</h2>
      {reviews.map((review) => (
        <div key={review.id} className="border-b py-4">
          <div className="flex items-center gap-2">
            <span className="font-semibold">{review.author}</span>
            <span>{'★'.repeat(review.rating)}</span>
          </div>
          <p>{review.comment}</p>
        </div>
      ))}
    </div>
  )
}

// app/products/[id]/related-products.tsx
import Link from 'next/link'
import Image from 'next/image'

export default async function RelatedProducts({ id }: { id: string }) {
  // Simulate very slow recommendation algorithm
  await new Promise(resolve => setTimeout(resolve, 3000))

  const related = await fetch(`https://api.example.com/products/${id}/related`)
    .then(res => res.json())

  return (
    <div>
      <h2>You May Also Like</h2>
      <div className="grid grid-cols-4 gap-4">
        {related.map((product) => (
          <Link key={product.id} href={`/products/${product.id}`}>
            <Image
              src={product.image}
              alt={product.name}
              width={200}
              height={200}
            />
            <p>{product.name}</p>
            <p>${product.price}</p>
          </Link>
        ))}
      </div>
    </div>
  )
}

function ProductDetailsSkeleton() {
  return <div className="h-96 bg-gray-200 animate-pulse rounded" />
}

function ReviewsSkeleton() {
  return <div className="h-64 bg-gray-200 animate-pulse rounded" />
}

function RelatedProductsSkeleton() {
  return <div className="h-48 bg-gray-200 animate-pulse rounded" />
}
```

---

## Example 4: Authentication with Middleware

**Question:**
> "Implement authentication with protected routes using middleware and session management"

**Claude Code will provide:**

```ts
// middleware.ts
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'
import { verifySession } from '@/lib/auth'

export async function middleware(request: NextRequest) {
  const session = request.cookies.get('session')?.value

  // Protected routes
  if (request.nextUrl.pathname.startsWith('/dashboard')) {
    if (!session) {
      return NextResponse.redirect(new URL('/login', request.url))
    }

    const verified = await verifySession(session)
    if (!verified) {
      return NextResponse.redirect(new URL('/login', request.url))
    }
  }

  // Redirect logged-in users away from auth pages
  if (request.nextUrl.pathname.startsWith('/login') && session) {
    return NextResponse.redirect(new URL('/dashboard', request.url))
  }

  return NextResponse.next()
}

export const config = {
  matcher: ['/dashboard/:path*', '/login', '/signup'],
}

// lib/auth.ts
import { SignJWT, jwtVerify } from 'jose'
import { cookies } from 'next/headers'

const secret = new TextEncoder().encode(process.env.JWT_SECRET)

export async function createSession(userId: string) {
  const token = await new SignJWT({ userId })
    .setProtectedHeader({ alg: 'HS256' })
    .setExpirationTime('24h')
    .sign(secret)

  const cookieStore = await cookies()
  cookieStore.set('session', token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    maxAge: 60 * 60 * 24, // 24 hours
  })
}

export async function verifySession(token: string) {
  try {
    const { payload } = await jwtVerify(token, secret)
    return payload.userId as string
  } catch {
    return null
  }
}

export async function getSession() {
  const cookieStore = await cookies()
  const session = cookieStore.get('session')?.value

  if (!session) return null

  return verifySession(session)
}

export async function destroySession() {
  const cookieStore = await cookies()
  cookieStore.delete('session')
}

// app/login/page.tsx
import LoginForm from './login-form'

export default function LoginPage() {
  return (
    <div>
      <h1>Login</h1>
      <LoginForm />
    </div>
  )
}

// app/login/login-form.tsx
'use client'

import { useActionState } from 'react'
import { login } from './actions'

export default function LoginForm() {
  const [state, action, pending] = useActionState(login, null)

  return (
    <form action={action}>
      <div>
        <label htmlFor="email">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          required
        />
      </div>

      <div>
        <label htmlFor="password">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          required
        />
      </div>

      {state?.error && (
        <p className="text-red-500">{state.error}</p>
      )}

      <button type="submit" disabled={pending}>
        {pending ? 'Logging in...' : 'Login'}
      </button>
    </form>
  )
}

// app/login/actions.ts
'use server'

import { redirect } from 'next/navigation'
import { createSession } from '@/lib/auth'
import { verifyPassword } from '@/lib/password'

export async function login(prevState: any, formData: FormData) {
  const email = formData.get('email') as string
  const password = formData.get('password') as string

  // Verify credentials
  const user = await db.user.findUnique({ where: { email } })

  if (!user || !(await verifyPassword(password, user.password))) {
    return { error: 'Invalid email or password' }
  }

  // Create session
  await createSession(user.id)

  redirect('/dashboard')
}

// app/logout/actions.ts
'use server'

import { redirect } from 'next/navigation'
import { destroySession } from '@/lib/auth'

export async function logout() {
  await destroySession()
  redirect('/login')
}

// app/dashboard/page.tsx
import { getSession } from '@/lib/auth'
import { redirect } from 'next/navigation'

export default async function DashboardPage() {
  const userId = await getSession()

  if (!userId) {
    redirect('/login')
  }

  const user = await db.user.findUnique({ where: { id: userId } })

  return (
    <div>
      <h1>Welcome, {user.name}!</h1>
      <form action={logout}>
        <button type="submit">Logout</button>
      </form>
    </div>
  )
}
```

---

## Example 5: API Routes with Authentication

**Question:**
> "Create REST API endpoints for a blog with authentication, pagination, and proper error handling"

**Claude Code will provide:**

```ts
// app/api/posts/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { verifyToken } from '@/lib/auth'
import { z } from 'zod'

const createPostSchema = z.object({
  title: z.string().min(1).max(100),
  content: z.string().min(10),
  published: z.boolean().optional(),
})

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const page = Number(searchParams.get('page')) || 1
    const limit = Number(searchParams.get('limit')) || 10
    const search = searchParams.get('search') || ''

    const skip = (page - 1) * limit

    const [posts, total] = await Promise.all([
      db.post.findMany({
        where: {
          OR: [
            { title: { contains: search, mode: 'insensitive' } },
            { content: { contains: search, mode: 'insensitive' } },
          ],
        },
        skip,
        take: limit,
        orderBy: { createdAt: 'desc' },
      }),
      db.post.count({
        where: {
          OR: [
            { title: { contains: search, mode: 'insensitive' } },
            { content: { contains: search, mode: 'insensitive' } },
          ],
        },
      }),
    ])

    return NextResponse.json({
      posts,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
      },
    })
  } catch (error) {
    console.error('Error fetching posts:', error)
    return NextResponse.json(
      { error: 'Failed to fetch posts' },
      { status: 500 }
    )
  }
}

export async function POST(request: NextRequest) {
  try {
    // Verify authentication
    const token = request.headers.get('authorization')?.split(' ')[1]
    if (!token) {
      return NextResponse.json(
        { error: 'Unauthorized' },
        { status: 401 }
      )
    }

    const userId = await verifyToken(token)
    if (!userId) {
      return NextResponse.json(
        { error: 'Invalid token' },
        { status: 401 }
      )
    }

    // Parse and validate body
    const body = await request.json()
    const result = createPostSchema.safeParse(body)

    if (!result.success) {
      return NextResponse.json(
        { error: result.error.flatten() },
        { status: 400 }
      )
    }

    // Create post
    const post = await db.post.create({
      data: {
        ...result.data,
        authorId: userId,
      },
    })

    return NextResponse.json(post, { status: 201 })
  } catch (error) {
    console.error('Error creating post:', error)
    return NextResponse.json(
      { error: 'Failed to create post' },
      { status: 500 }
    )
  }
}

// app/api/posts/[id]/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { verifyToken } from '@/lib/auth'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const post = await db.post.findUnique({
      where: { id },
      include: {
        author: {
          select: {
            id: true,
            name: true,
            email: true,
          },
        },
      },
    })

    if (!post) {
      return NextResponse.json(
        { error: 'Post not found' },
        { status: 404 }
      )
    }

    return NextResponse.json(post)
  } catch (error) {
    console.error('Error fetching post:', error)
    return NextResponse.json(
      { error: 'Failed to fetch post' },
      { status: 500 }
    )
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    // Verify authentication
    const token = request.headers.get('authorization')?.split(' ')[1]
    if (!token) {
      return NextResponse.json(
        { error: 'Unauthorized' },
        { status: 401 }
      )
    }

    const userId = await verifyToken(token)
    if (!userId) {
      return NextResponse.json(
        { error: 'Invalid token' },
        { status: 401 }
      )
    }

    // Check ownership
    const post = await db.post.findUnique({ where: { id } })
    if (!post) {
      return NextResponse.json(
        { error: 'Post not found' },
        { status: 404 }
      )
    }

    if (post.authorId !== userId) {
      return NextResponse.json(
        { error: 'Forbidden' },
        { status: 403 }
      )
    }

    // Update post
    const body = await request.json()
    const updated = await db.post.update({
      where: { id },
      data: body,
    })

    return NextResponse.json(updated)
  } catch (error) {
    console.error('Error updating post:', error)
    return NextResponse.json(
      { error: 'Failed to update post' },
      { status: 500 }
    )
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    // Verify authentication
    const token = request.headers.get('authorization')?.split(' ')[1]
    if (!token) {
      return NextResponse.json(
        { error: 'Unauthorized' },
        { status: 401 }
      )
    }

    const userId = await verifyToken(token)
    if (!userId) {
      return NextResponse.json(
        { error: 'Invalid token' },
        { status: 401 }
      )
    }

    // Check ownership
    const post = await db.post.findUnique({ where: { id } })
    if (!post) {
      return NextResponse.json(
        { error: 'Post not found' },
        { status: 404 }
      )
    }

    if (post.authorId !== userId) {
      return NextResponse.json(
        { error: 'Forbidden' },
        { status: 403 }
      )
    }

    // Delete post
    await db.post.delete({ where: { id } })

    return new NextResponse(null, { status: 204 })
  } catch (error) {
    console.error('Error deleting post:', error)
    return NextResponse.json(
      { error: 'Failed to delete post' },
      { status: 500 }
    )
  }
}
```

---

## More Examples

For additional examples, ask Claude Code:

- "Create an image gallery with infinite scroll"
- "Build a real-time chat with Server-Sent Events"
- "Implement file upload with progress tracking"
- "Create a dashboard with multiple data sources"
- "Build a search page with filters and sorting"
- "Implement optimistic updates with Server Actions"
- "Create a multi-step form with validation"
- "Build a commenting system with nested replies"

## Tips for Best Results

1. **Be specific** - Provide details about your use case
2. **Mention constraints** - Tell Claude about authentication, database, etc.
3. **Request modern patterns** - Claude will use App Router and Server Components by default
4. **Ask for explanations** - Request comments or explanations in the code
5. **Request error handling** - Ask for proper validation and error boundaries
6. **Specify TypeScript** - Claude will provide fully typed code

## Testing the Skill

To verify the skill is working:

```bash
# Start a conversation with Claude Code
# Ask: "What's the difference between Server and Client Components in Next.js?"

# Claude should provide detailed explanation from the skill
# Try more questions to test different sections
```
