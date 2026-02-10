---
name: Node.js Complete Guide
description: Comprehensive Node.js knowledge base covering all core modules, APIs, async programming, streams, events, file system, networking, and best practices for modern Node.js development.
---

# Node.js Complete Knowledge Base

You are a Node.js expert with comprehensive knowledge of all Node.js features, core modules, APIs, and best practices. Provide accurate, detailed answers with code examples using modern syntax (ESM, async/await).

**Current Node.js Version: v25.6.0 (2026)**

---

## Table of Contents
1. Core Concepts
2. Module System
3. All Core Modules
4. Async Programming & Event Loop
5. Streams
6. File System
7. Networking
8. Process & Child Processes
9. Events & EventEmitter
10. Buffers & Binary Data
11. Cryptography & Security
12. Testing & Debugging
13. Performance & Optimization

---

## 1. CORE CONCEPTS

### What is Node.js?
- JavaScript runtime built on Chrome's V8 engine
- Non-blocking, event-driven architecture
- Single-threaded with event loop
- Ideal for I/O-intensive applications
- Cross-platform (Windows, macOS, Linux)

### Event Loop
The event loop enables Node.js to perform non-blocking I/O operations by offloading operations to the system kernel whenever possible.

**Event Loop Phases:**
1. **Timers** - Executes callbacks scheduled by `setTimeout()` and `setInterval()`
2. **Pending callbacks** - Executes I/O callbacks deferred to the next loop iteration
3. **Idle, prepare** - Internal use only
4. **Poll** - Retrieves new I/O events; executes I/O callbacks
5. **Check** - `setImmediate()` callbacks are invoked here
6. **Close callbacks** - e.g., `socket.on('close', ...)`

**Key Functions:**
```javascript
process.nextTick(callback)  // Executes before next event loop iteration
setImmediate(callback)       // Executes in check phase
setTimeout(callback, 0)      // Executes in timers phase
```

### Libuv
- C library that provides the event loop
- Handles async I/O operations
- Manages thread pool for file system operations

---

## 2. MODULE SYSTEM

### ESM (ECMAScript Modules) - RECOMMENDED
```javascript
// package.json
{
  "type": "module"
}

// Importing
import fs from 'node:fs/promises';
import { readFile } from 'node:fs/promises';
import path from 'node:path';

// Exporting
export const myFunction = () => {};
export default class MyClass {}
```

### CommonJS (Legacy)
```javascript
// Importing
const fs = require('node:fs');
const { readFile } = require('node:fs/promises');

// Exporting
module.exports = { myFunction };
exports.myFunction = () => {};
```

### Module Resolution
```javascript
// Core modules (always use node: prefix)
import fs from 'node:fs';

// Local modules
import utils from './utils.js';      // Relative path
import config from '../config.js';

// npm packages
import express from 'express';

// JSON files
import data from './data.json' assert { type: 'json' };
```

---

## 3. ALL CORE MODULES

### Complete List (use `node:` prefix)

#### File System
- **`node:fs`** - File system operations (sync/callback)
- **`node:fs/promises`** - Promise-based file operations (RECOMMENDED)

#### Networking
- **`node:http`** - HTTP server and client
- **`node:https`** - HTTPS server and client
- **`node:http2`** - HTTP/2 protocol
- **`node:net`** - TCP server and sockets
- **`node:dgram`** - UDP/datagram sockets
- **`node:dns`** - DNS lookups and resolution
- **`node:tls`** - TLS/SSL for secure communication

#### Streams & Data
- **`node:stream`** - Stream interface
- **`node:stream/promises`** - Promise-based stream utilities
- **`node:stream/web`** - Web Streams API
- **`node:buffer`** - Binary data handling
- **`node:string_decoder`** - Buffer to string conversion
- **`node:zlib`** - Compression (gzip, deflate, brotli)

#### Utilities
- **`node:path`** - File path operations
- **`node:os`** - Operating system info
- **`node:util`** - Utility functions
- **`node:url`** - URL parsing and formatting
- **`node:querystring`** - Query string parsing
- **`node:readline`** - Read input line by line

#### Process & Threading
- **`node:process`** - Current process info (global)
- **`node:child_process`** - Spawn child processes
- **`node:cluster`** - Multi-process clustering
- **`node:worker_threads`** - Worker threads for CPU-intensive tasks

#### Events & Async
- **`node:events`** - EventEmitter class
- **`node:async_hooks`** - Track async resources
- **`node:timers`** - setTimeout, setInterval
- **`node:timers/promises`** - Promise-based timers

#### Cryptography & Security
- **`node:crypto`** - Cryptographic operations
- **`node:tls`** - TLS/SSL encryption

#### Testing & Debugging
- **`node:test`** - Built-in test runner
- **`node:assert`** - Assertion testing
- **`node:inspector`** - Debugger integration
- **`node:diagnostics_channel`** - Diagnostic data
- **`node:trace_events`** - Trace event categories

#### Performance
- **`node:perf_hooks`** - Performance measurement
- **`node:v8`** - V8 engine APIs

#### Advanced
- **`node:vm`** - Run code in V8 virtual machine context
- **`node:repl`** - Read-Eval-Print-Loop
- **`node:console`** - Console output (global)
- **`node:module`** - Module system APIs
- **`node:wasi`** - WebAssembly System Interface

---

## 4. ASYNC PROGRAMMING & EVENT LOOP

### Callbacks (Legacy - Avoid)
```javascript
import fs from 'node:fs';

fs.readFile('file.txt', 'utf8', (err, data) => {
  if (err) throw err;
  console.log(data);
});
```

### Promises
```javascript
import { readFile } from 'node:fs/promises';

readFile('file.txt', 'utf8')
  .then(data => console.log(data))
  .catch(err => console.error(err));
```

### Async/Await (RECOMMENDED)
```javascript
import { readFile } from 'node:fs/promises';

async function loadFile() {
  try {
    const data = await readFile('file.txt', 'utf8');
    console.log(data);
  } catch (err) {
    console.error('Error:', err);
  }
}
```

### Parallel Operations
```javascript
// Run multiple async operations in parallel
const [file1, file2, file3] = await Promise.all([
  readFile('file1.txt', 'utf8'),
  readFile('file2.txt', 'utf8'),
  readFile('file3.txt', 'utf8')
]);

// Return first resolved promise
const fastest = await Promise.race([
  fetch('https://api1.example.com'),
  fetch('https://api2.example.com')
]);

// Run all, even if some fail
const results = await Promise.allSettled([
  fetchUser(1),
  fetchUser(2),
  fetchUser(3)
]);
```

### Error Handling
```javascript
// Async function error handling
async function getData() {
  try {
    const response = await fetch('https://api.example.com');
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch:', error.message);
    throw error;
  }
}

// Unhandled promise rejection
process.on('unhandledRejection', (reason, promise) => {
  console.error('Unhandled Rejection at:', promise, 'reason:', reason);
  process.exit(1);
});

// Uncaught exception
process.on('uncaughtException', (error) => {
  console.error('Uncaught Exception:', error);
  process.exit(1);
});
```

---

## 5. STREAMS

### What are Streams?
Streams let you process data piece by piece (chunks) without loading everything into memory. Perfect for large files, network data, or real-time processing.

### Four Types of Streams

#### 1. Readable Stream
Read data from a source.

```javascript
import { createReadStream } from 'node:fs';

const readable = createReadStream('large-file.txt', {
  encoding: 'utf8',
  highWaterMark: 16384  // Buffer size: 16KB
});

// Event-based reading
readable.on('data', (chunk) => {
  console.log('Received:', chunk.length, 'bytes');
});

readable.on('end', () => {
  console.log('Reading complete');
});

readable.on('error', (err) => {
  console.error('Error:', err);
});
```

#### 2. Writable Stream
Write data to a destination.

```javascript
import { createWriteStream } from 'node:fs';

const writable = createWriteStream('output.txt');

writable.write('Hello, ');
writable.write('World!\n');
writable.end(); // Signal completion

writable.on('finish', () => {
  console.log('Writing complete');
});
```

#### 3. Duplex Stream
Both readable and writable (e.g., TCP socket).

```javascript
import { Duplex } from 'node:stream';

const duplex = new Duplex({
  read(size) {
    this.push('data');
    this.push(null); // End
  },
  write(chunk, encoding, callback) {
    console.log('Writing:', chunk.toString());
    callback();
  }
});
```

#### 4. Transform Stream
Modify data as it passes through (duplex stream that transforms data).

```javascript
import { Transform } from 'node:stream';

const upperCaseTransform = new Transform({
  transform(chunk, encoding, callback) {
    this.push(chunk.toString().toUpperCase());
    callback();
  }
});

process.stdin
  .pipe(upperCaseTransform)
  .pipe(process.stdout);
```

### Stream Piping
```javascript
import { createReadStream, createWriteStream } from 'node:fs';
import { createGzip } from 'node:zlib';
import { pipeline } from 'node:stream/promises';

// Using pipeline (handles errors and cleanup)
await pipeline(
  createReadStream('input.txt'),
  createGzip(),
  createWriteStream('input.txt.gz')
);

// Legacy pipe method
createReadStream('input.txt')
  .pipe(createGzip())
  .pipe(createWriteStream('input.txt.gz'));
```

### Stream Events
- **Readable**: `data`, `end`, `error`, `close`, `readable`, `pause`, `resume`
- **Writable**: `drain`, `finish`, `error`, `close`, `pipe`, `unpipe`

### Backpressure
Handle slow consumers:

```javascript
const writable = createWriteStream('output.txt');

function write(data) {
  const canContinue = writable.write(data);

  if (!canContinue) {
    // Writable buffer is full, wait for drain
    writable.once('drain', () => {
      console.log('Can write more data');
    });
  }
}
```

---

## 6. FILE SYSTEM (node:fs)

### Promise-based API (RECOMMENDED)
```javascript
import {
  readFile,
  writeFile,
  appendFile,
  readdir,
  mkdir,
  rm,
  stat,
  access,
  copyFile,
  rename
} from 'node:fs/promises';

// Read file
const content = await readFile('file.txt', 'utf8');

// Write file (overwrites)
await writeFile('file.txt', 'Hello, World!', 'utf8');

// Append to file
await appendFile('log.txt', 'New log entry\n', 'utf8');

// Check if file exists
try {
  await access('file.txt');
  console.log('File exists');
} catch {
  console.log('File does not exist');
}

// Get file stats
const stats = await stat('file.txt');
console.log('Size:', stats.size, 'bytes');
console.log('Is file:', stats.isFile());
console.log('Is directory:', stats.isDirectory());

// List directory
const files = await readdir('./', { withFileTypes: true });
for (const file of files) {
  console.log(file.name, file.isDirectory() ? '(dir)' : '');
}

// Create directory (recursive)
await mkdir('path/to/nested/dir', { recursive: true });

// Delete file or directory
await rm('file.txt');
await rm('directory', { recursive: true, force: true });

// Copy file
await copyFile('source.txt', 'destination.txt');

// Rename/move file
await rename('old-name.txt', 'new-name.txt');
```

### Streaming Large Files
```javascript
import { createReadStream, createWriteStream } from 'node:fs';

// Read large file in chunks
const stream = createReadStream('large-file.log', 'utf8');

for await (const chunk of stream) {
  console.log('Chunk:', chunk.length);
}
```

### Watch Files
```javascript
import { watch } from 'node:fs/promises';

const watcher = watch('watched-file.txt');

for await (const event of watcher) {
  console.log('Event:', event.eventType, 'Filename:', event.filename);
}
```

---

## 7. NETWORKING

### HTTP Server
```javascript
import { createServer } from 'node:http';

const server = createServer((req, res) => {
  // Request info
  console.log(req.method, req.url);
  console.log('Headers:', req.headers);

  // Read request body
  let body = '';
  req.on('data', chunk => body += chunk);
  req.on('end', () => {
    console.log('Body:', body);

    // Send response
    res.statusCode = 200;
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify({ message: 'Hello, World!' }));
  });
});

server.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});
```

### HTTPS Server
```javascript
import { createServer } from 'node:https';
import { readFileSync } from 'node:fs';

const options = {
  key: readFileSync('private-key.pem'),
  cert: readFileSync('certificate.pem')
};

const server = createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('Secure connection');
});

server.listen(443);
```

### HTTP Client (fetch - Global)
```javascript
// GET request
const response = await fetch('https://api.example.com/users');
const data = await response.json();

// POST request
const response = await fetch('https://api.example.com/users', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({ name: 'John', email: 'john@example.com' })
});

// With timeout using AbortController
const controller = new AbortController();
const timeoutId = setTimeout(() => controller.abort(), 5000);

try {
  const response = await fetch('https://api.example.com', {
    signal: controller.signal
  });
  clearTimeout(timeoutId);
} catch (error) {
  if (error.name === 'AbortError') {
    console.log('Request timed out');
  }
}
```

### TCP Server (net)
```javascript
import { createServer } from 'node:net';

const server = createServer((socket) => {
  console.log('Client connected');

  socket.on('data', (data) => {
    console.log('Received:', data.toString());
    socket.write('Echo: ' + data);
  });

  socket.on('end', () => {
    console.log('Client disconnected');
  });
});

server.listen(8080);
```

### DNS Lookup
```javascript
import { lookup, resolve4, reverse } from 'node:dns/promises';

// Resolve hostname to IP
const { address, family } = await lookup('example.com');
console.log('IP:', address, 'IPv' + family);

// Get all A records
const addresses = await resolve4('example.com');

// Reverse DNS
const hostnames = await reverse('8.8.8.8');
```

---

## 8. PROCESS & CHILD PROCESSES

### Process (Global)
```javascript
// Environment variables
console.log(process.env.NODE_ENV);
process.env.API_KEY = 'secret';

// Command line arguments
console.log(process.argv); // ['node', 'script.js', 'arg1', 'arg2']

// Current directory
console.log(process.cwd());

// Change directory
process.chdir('/tmp');

// Platform info
console.log(process.platform); // 'linux', 'darwin', 'win32'
console.log(process.arch);      // 'x64', 'arm64'

// Exit
process.exit(0);  // Success
process.exit(1);  // Error

// Memory usage
console.log(process.memoryUsage());

// CPU usage
console.log(process.cpuUsage());
```

### Child Processes
```javascript
import { exec, spawn, execFile } from 'node:child_process';
import { promisify } from 'node:util';

const execAsync = promisify(exec);

// Execute shell command
const { stdout, stderr } = await execAsync('ls -la');
console.log(stdout);

// Spawn process (streaming)
const child = spawn('find', ['.', '-name', '*.js']);

child.stdout.on('data', (data) => {
  console.log(`Output: ${data}`);
});

child.stderr.on('data', (data) => {
  console.error(`Error: ${data}`);
});

child.on('close', (code) => {
  console.log(`Process exited with code ${code}`);
});

// Execute file
execFile('node', ['script.js'], (error, stdout, stderr) => {
  if (error) throw error;
  console.log(stdout);
});
```

### Worker Threads (CPU-intensive tasks)
```javascript
import { Worker, isMainThread, parentPort, workerData } from 'node:worker_threads';

if (isMainThread) {
  // Main thread
  const worker = new Worker('./worker.js', {
    workerData: { value: 42 }
  });

  worker.on('message', (result) => {
    console.log('Result from worker:', result);
  });

  worker.postMessage('Start processing');
} else {
  // Worker thread
  console.log('Worker data:', workerData);

  parentPort.on('message', (msg) => {
    // CPU-intensive work
    const result = heavyComputation();
    parentPort.postMessage(result);
  });
}
```

---

## 9. EVENTS & EVENTEMITTER

### EventEmitter
```javascript
import { EventEmitter } from 'node:events';

class MyEmitter extends EventEmitter {}

const emitter = new MyEmitter();

// Register listener
emitter.on('event', (arg1, arg2) => {
  console.log('Event fired:', arg1, arg2);
});

// One-time listener
emitter.once('event', () => {
  console.log('This will only fire once');
});

// Emit event
emitter.emit('event', 'arg1', 'arg2');

// Remove listener
const listener = () => console.log('Event');
emitter.on('event', listener);
emitter.off('event', listener);

// Remove all listeners
emitter.removeAllListeners('event');

// Error handling
emitter.on('error', (err) => {
  console.error('Error event:', err);
});
```

### Built-in Event Patterns
```javascript
import { createReadStream } from 'node:fs';

const stream = createReadStream('file.txt');

// Streams are EventEmitters
stream.on('open', () => console.log('File opened'));
stream.on('data', (chunk) => console.log('Data:', chunk));
stream.on('end', () => console.log('Reading complete'));
stream.on('close', () => console.log('Stream closed'));
stream.on('error', (err) => console.error('Error:', err));
```

---

## 10. BUFFERS & BINARY DATA

### Buffer Basics
```javascript
// Create buffers
const buf1 = Buffer.alloc(10);           // 10 bytes of zeros
const buf2 = Buffer.allocUnsafe(10);     // Uninitialized (faster)
const buf3 = Buffer.from('Hello');       // From string
const buf4 = Buffer.from([0x48, 0x69]);  // From array

// Write to buffer
buf1.write('Hello', 'utf8');
buf1.writeInt32BE(42, 0);  // Write 32-bit integer at position 0

// Read from buffer
const str = buf1.toString('utf8');
const num = buf1.readInt32BE(0);

// Buffer properties
console.log(buf1.length);     // Size in bytes
console.log(buf1.byteLength); // Same as length

// Compare buffers
const equal = Buffer.compare(buf1, buf2) === 0;

// Concatenate buffers
const combined = Buffer.concat([buf1, buf2, buf3]);

// Slice buffer (creates view, not copy)
const slice = buf1.subarray(0, 5);

// Copy buffer
const copy = Buffer.from(buf1);
```

### Encodings
Supported: `utf8`, `utf16le`, `latin1`, `base64`, `base64url`, `hex`, `ascii`, `binary`

```javascript
const buf = Buffer.from('Hello, 世界', 'utf8');
console.log(buf.toString('hex'));
console.log(buf.toString('base64'));
```

---

## 11. CRYPTOGRAPHY & SECURITY

### Hashing
```javascript
import { createHash } from 'node:crypto';

// SHA-256 hash
const hash = createHash('sha256');
hash.update('Hello, World!');
const digest = hash.digest('hex');

// One-liner
const hash2 = createHash('md5').update('data').digest('hex');

// Stream hashing
import { createReadStream } from 'node:fs';
const stream = createReadStream('large-file.bin');
const hash3 = createHash('sha512');
stream.pipe(hash3).on('finish', () => {
  console.log('Hash:', hash3.digest('hex'));
});
```

### Encryption (AES)
```javascript
import { createCipheriv, createDecipheriv, randomBytes, scryptSync } from 'node:crypto';

const algorithm = 'aes-256-gcm';
const password = 'my-secret-password';

// Derive key from password
const key = scryptSync(password, 'salt', 32);
const iv = randomBytes(16);

// Encrypt
const cipher = createCipheriv(algorithm, key, iv);
let encrypted = cipher.update('Secret data', 'utf8', 'hex');
encrypted += cipher.final('hex');
const authTag = cipher.getAuthTag();

// Decrypt
const decipher = createDecipheriv(algorithm, key, iv);
decipher.setAuthTag(authTag);
let decrypted = decipher.update(encrypted, 'hex', 'utf8');
decrypted += decipher.final('utf8');
```

### HMAC (Message Authentication)
```javascript
import { createHmac } from 'node:crypto';

const secret = 'my-secret-key';
const hmac = createHmac('sha256', secret);
hmac.update('Important message');
const signature = hmac.digest('hex');

// Verify
const verify = createHmac('sha256', secret)
  .update('Important message')
  .digest('hex') === signature;
```

### Random Values
```javascript
import { randomBytes, randomInt, randomUUID } from 'node:crypto';

// Random bytes
const bytes = randomBytes(32);
const token = randomBytes(32).toString('hex');

// Random integer
const num = randomInt(1, 100);  // 1 to 99

// UUID v4
const uuid = randomUUID();
```

### Post-Quantum Cryptography (Node.js 24+)
```javascript
import { encapsulate, decapsulate } from 'node:crypto';

// ML-KEM (quantum-resistant key encapsulation)
const { ciphertext, sharedSecret: senderSecret } = encapsulate('ML-KEM-768', publicKey);
const receiverSecret = decapsulate('ML-KEM-768', ciphertext, privateKey);
```

---

## 12. TESTING & DEBUGGING

### Built-in Test Runner (node:test)
```javascript
import { test, describe, it, before, after, beforeEach, afterEach } from 'node:test';
import assert from 'node:assert/strict';

describe('Math operations', () => {
  before(() => console.log('Setup'));
  after(() => console.log('Teardown'));

  it('should add numbers', () => {
    assert.strictEqual(2 + 2, 4);
  });

  it('should multiply numbers', () => {
    assert.strictEqual(3 * 4, 12);
  });

  test('async test', async () => {
    const result = await fetchData();
    assert.ok(result);
  });
});

// Run with: node --test
// Or: node --test-reporter=spec
```

### Assertions
```javascript
import assert from 'node:assert/strict';

// Equality
assert.strictEqual(actual, expected);
assert.deepStrictEqual(obj1, obj2);

// Truthiness
assert.ok(value);
assert.equal(value, true);

// Throws
assert.throws(() => {
  throw new Error('Oops');
}, /Oops/);

// Async throws
await assert.rejects(async () => {
  throw new Error('Async error');
}, /Async error/);

// Does not throw
assert.doesNotThrow(() => {
  return 42;
});
```

### Mocking
```javascript
import { mock } from 'node:test';

test('mock function', () => {
  const fn = mock.fn((x) => x * 2);

  fn(5);
  fn(10);

  assert.strictEqual(fn.mock.calls.length, 2);
  assert.deepStrictEqual(fn.mock.calls[0].arguments, [5]);
  assert.strictEqual(fn.mock.calls[0].result, 10);
});
```

### Debugging
```bash
# Start with debugger
node --inspect script.js

# Break on first line
node --inspect-brk script.js

# Open Chrome DevTools: chrome://inspect
```

```javascript
// Add breakpoint in code
debugger;

// Console debugging
console.log('Value:', value);
console.error('Error:', error);
console.table([{ name: 'Alice', age: 30 }, { name: 'Bob', age: 25 }]);
console.time('operation');
// ... code ...
console.timeEnd('operation');
```

---

## 13. PERFORMANCE & OPTIMIZATION

### Performance Measurement
```javascript
import { performance, PerformanceObserver } from 'node:perf_hooks';

// Measure time
const start = performance.now();
await heavyOperation();
const duration = performance.now() - start;
console.log(`Took ${duration}ms`);

// Performance marks
performance.mark('start-operation');
await operation();
performance.mark('end-operation');
performance.measure('operation', 'start-operation', 'end-operation');

// Observer
const obs = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  entries.forEach((entry) => {
    console.log(`${entry.name}: ${entry.duration}ms`);
  });
});
obs.observe({ entryTypes: ['measure'] });
```

### Memory Management
```javascript
// Check memory usage
const usage = process.memoryUsage();
console.log('Heap used:', (usage.heapUsed / 1024 / 1024).toFixed(2), 'MB');

// Trigger garbage collection (requires --expose-gc flag)
if (global.gc) {
  global.gc();
}
```

### Cluster for Multi-core
```javascript
import cluster from 'node:cluster';
import { cpus } from 'node:os';
import { createServer } from 'node:http';

if (cluster.isPrimary) {
  // Fork workers
  const numCPUs = cpus().length;
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`Worker ${worker.process.pid} died`);
    cluster.fork(); // Restart
  });
} else {
  // Worker process
  const server = createServer((req, res) => {
    res.writeHead(200);
    res.end('Hello from worker ' + process.pid);
  });

  server.listen(3000);
}
```

### Best Practices
1. **Use async/await** consistently
2. **Stream large data** instead of loading into memory
3. **Cache frequently accessed data**
4. **Use worker threads** for CPU-intensive tasks
5. **Enable compression** for HTTP responses
6. **Use connection pooling** for databases
7. **Monitor event loop lag**
8. **Avoid blocking operations** in the event loop
9. **Use `node:` prefix** for core modules
10. **Keep dependencies updated**

---

## COMMON PATTERNS

### Reading JSON File
```javascript
import { readFile } from 'node:fs/promises';

const data = JSON.parse(await readFile('config.json', 'utf8'));
```

### Writing JSON File
```javascript
import { writeFile } from 'node:fs/promises';

await writeFile('output.json', JSON.stringify(data, null, 2));
```

### Environment Variables
```javascript
import { config } from 'dotenv';  // npm package
config(); // Load from .env file

const apiKey = process.env.API_KEY || 'default-key';
const port = parseInt(process.env.PORT || '3000', 10);
```

### Graceful Shutdown
```javascript
const server = createServer(handler);

process.on('SIGTERM', async () => {
  console.log('SIGTERM received, shutting down gracefully');
  server.close(() => {
    console.log('Server closed');
    process.exit(0);
  });

  // Force shutdown after 10 seconds
  setTimeout(() => {
    console.error('Forced shutdown');
    process.exit(1);
  }, 10000);
});
```

### Rate Limiting
```javascript
const requests = new Map();

function rateLimit(ip, limit = 100, window = 60000) {
  const now = Date.now();
  const record = requests.get(ip) || { count: 0, resetTime: now + window };

  if (now > record.resetTime) {
    record.count = 0;
    record.resetTime = now + window;
  }

  record.count++;
  requests.set(ip, record);

  return record.count <= limit;
}
```

---

## ERROR HANDLING

### Custom Error Classes
```javascript
class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = 'ValidationError';
  }
}

class DatabaseError extends Error {
  constructor(message, code) {
    super(message);
    this.name = 'DatabaseError';
    this.code = code;
  }
}

// Usage
try {
  if (!isValid(data)) {
    throw new ValidationError('Invalid input');
  }
} catch (error) {
  if (error instanceof ValidationError) {
    // Handle validation error
  }
}
```

### Error-first Callbacks (Legacy)
```javascript
function readConfig(callback) {
  fs.readFile('config.json', (err, data) => {
    if (err) return callback(err);
    callback(null, JSON.parse(data));
  });
}

readConfig((err, config) => {
  if (err) {
    console.error('Failed to read config:', err);
    return;
  }
  console.log('Config:', config);
});
```

---

## WHEN TO USE WHAT

### Streams vs. Buffers
- **Streams**: Large files, network data, real-time processing
- **Buffers**: Small binary data, crypto operations, encoding

### Sync vs. Async
- **Sync**: Startup configuration, CLI tools, build scripts
- **Async**: Server requests, I/O operations, production code

### Worker Threads vs. Child Processes
- **Worker Threads**: CPU-intensive JavaScript (image processing, crypto)
- **Child Processes**: Run external programs, separate Node.js instances

### HTTP vs. HTTP2
- **HTTP**: Simple APIs, backward compatibility
- **HTTP2**: High-performance, multiplexing, server push

---

## SECURITY CHECKLIST

- ✅ Validate and sanitize all user input
- ✅ Use parameterized queries (prevent SQL injection)
- ✅ Set secure HTTP headers (helmet package)
- ✅ Use HTTPS in production
- ✅ Keep dependencies updated (`npm audit`)
- ✅ Don't expose stack traces to users
- ✅ Use environment variables for secrets
- ✅ Implement rate limiting
- ✅ Enable CORS properly
- ✅ Use CSP (Content Security Policy)
- ✅ Hash passwords (bcrypt, argon2)
- ✅ Use secure session management

---

## QUICK REFERENCE

### Import Core Modules (Always use node: prefix)
```javascript
import fs from 'node:fs/promises';
import http from 'node:http';
import path from 'node:path';
import crypto from 'node:crypto';
import { EventEmitter } from 'node:events';
```

### Read File
```javascript
const data = await readFile('file.txt', 'utf8');
```

### Write File
```javascript
await writeFile('file.txt', 'content', 'utf8');
```

### HTTP Server
```javascript
createServer((req, res) => {
  res.end('Hello');
}).listen(3000);
```

### Fetch API
```javascript
const res = await fetch('https://api.example.com');
const data = await res.json();
```

### Stream File
```javascript
createReadStream('input.txt')
  .pipe(transform)
  .pipe(createWriteStream('output.txt'));
```

---

## ANSWERING GUIDELINES

When answering questions:

1. **Always use modern syntax**: ESM imports, async/await, `node:` prefix
2. **Provide complete code examples** that can run as-is
3. **Explain the "why"**, not just the "how"
4. **Include error handling** in examples
5. **Mention relevant Node.js version** if feature is recent
6. **Suggest best practices** and common pitfalls
7. **Reference official docs** when appropriate: https://nodejs.org/api/
8. **Consider performance implications**
9. **Highlight security concerns** when relevant

This skill provides comprehensive Node.js knowledge. For any Node.js question, draw from this knowledge base to give accurate, practical, and modern answers with working code examples.
