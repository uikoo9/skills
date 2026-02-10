# Node.js Complete Guide Skill 使用说明

## Skill 简介

这是一个**完整的 Node.js 知识库 skill**，涵盖 Node.js 的所有核心特性、模块、API 和最佳实践，不仅仅是版本更新，而是一个全方位的 Node.js 参考指南。

## 完整知识覆盖

### 1. 核心概念
- Node.js 架构和工作原理
- 事件循环（Event Loop）完整解析
- 6 个事件循环阶段详解
- Libuv 和线程池
- 单线程非阻塞模型

### 2. 模块系统
- ESM (ECMAScript Modules) 完整指南
- CommonJS 模块系统
- 模块解析机制
- `node:` 前缀最佳实践

### 3. 所有核心模块（30+ 模块）
#### 文件系统
- `node:fs` - 同步/回调式文件操作
- `node:fs/promises` - Promise 式文件操作

#### 网络编程
- `node:http` / `node:https` - HTTP(S) 服务器和客户端
- `node:http2` - HTTP/2 协议
- `node:net` - TCP 服务器和 Socket
- `node:dgram` - UDP/数据报
- `node:dns` - DNS 查询和解析
- `node:tls` - TLS/SSL 加密通信

#### 流和数据处理
- `node:stream` - 流接口（Readable, Writable, Duplex, Transform）
- `node:stream/promises` - Promise 式流工具
- `node:stream/web` - Web Streams API
- `node:buffer` - 二进制数据处理
- `node:zlib` - 压缩（gzip, deflate, brotli）

#### 进程和线程
- `node:process` - 当前进程信息（全局）
- `node:child_process` - 子进程管理
- `node:cluster` - 多进程集群
- `node:worker_threads` - Worker 线程（CPU 密集任务）

#### 加密和安全
- `node:crypto` - 加密操作（哈希、加密、HMAC、随机数）
- 后量子密码学支持（ML-KEM, ML-DSA）

#### 测试和调试
- `node:test` - 内置测试运行器
- `node:assert` - 断言测试
- `node:inspector` - 调试器集成

#### 性能监控
- `node:perf_hooks` - 性能测量
- `node:v8` - V8 引擎 API

#### 更多模块
- `node:path` - 路径操作
- `node:os` - 操作系统信息
- `node:events` - EventEmitter 事件系统
- `node:util` - 工具函数
- `node:url` - URL 解析
- 以及更多...

### 4. 异步编程完整指南
- Callbacks（回调函数）
- Promises（Promise）
- Async/Await（推荐）
- 并行操作（Promise.all, Promise.race, Promise.allSettled）
- 错误处理最佳实践
- 未处理的 Promise 拒绝处理

### 5. Streams（流）深度解析
- 4 种流类型（Readable, Writable, Duplex, Transform）
- 流事件详解
- 管道（Piping）和 Pipeline
- 背压（Backpressure）处理
- 实际应用示例

### 6. 文件系统操作
- 读写文件（Promise API）
- 流式处理大文件
- 目录操作
- 文件监听（Watch）
- 文件状态查询

### 7. 网络编程
- HTTP/HTTPS 服务器创建
- Fetch API（全局可用）
- TCP 服务器和客户端
- DNS 查询和反向 DNS
- 超时和 AbortController

### 8. 进程管理
- 环境变量
- 命令行参数
- 子进程（exec, spawn, execFile）
- Worker Threads（多线程）
- Cluster（多进程）

### 9. 事件系统
- EventEmitter 类详解
- 事件注册和触发
- 一次性监听器
- 错误事件处理

### 10. Buffer 和二进制数据
- Buffer 创建和操作
- 编码转换（utf8, base64, hex 等）
- Buffer 比较和拼接

### 11. 加密和安全
- 哈希算法（SHA-256, MD5 等）
- 对称加密（AES）
- HMAC 消息认证
- 随机数生成
- 后量子密码学（Node.js 24+）

### 12. 测试和调试
- node:test 内置测试框架
- 断言（assert）
- Mocking（模拟）
- Chrome DevTools 调试
- 性能分析

### 13. 性能优化
- 性能测量（perf_hooks）
- 内存管理
- Cluster 多核利用
- 最佳实践清单

### 额外内容
- **常用模式**：读写 JSON、环境变量、优雅关闭、限流
- **错误处理**：自定义错误类、错误优先回调
- **使用场景指南**：何时使用 Streams vs Buffers、Sync vs Async 等
- **安全检查清单**：输入验证、SQL 注入防护、HTTPS 等
- **快速参考**：常用代码片段

## 安装方法

### 方法 1: 复制到 Claude Code skills 目录（推荐）
```bash
cp -r nodejs-expert ~/.claude/skills/
```

### 方法 2: 创建符号链接（开发模式）
```bash
ln -s "$(pwd)/nodejs-expert" ~/.claude/skills/nodejs-expert
```

### 方法 3: 打包为 ZIP（Claude Desktop/Web）
```bash
cd nodejs-expert
zip -r nodejs-complete-guide.zip .
```
然后拖拽到 Claude Desktop 或 Web 界面。

## 使用示例

安装后，向 Claude Code 提问任何 Node.js 相关问题，skill 会自动激活：

### 基础概念
- "Node.js 的事件循环是如何工作的？"
- "什么是 Libuv？"
- "ESM 和 CommonJS 有什么区别？"

### 模块使用
- "如何使用 fs/promises 读取文件？"
- "展示如何创建一个 HTTP 服务器"
- "如何使用 crypto 模块进行加密？"

### Streams
- "什么是 Node.js 的 4 种流类型？"
- "如何使用 Transform Stream？"
- "展示如何处理背压（backpressure）"

### 高级主题
- "如何使用 Worker Threads 处理 CPU 密集任务？"
- "Cluster 模块如何利用多核 CPU？"
- "如何实现优雅关闭？"

### 最佳实践
- "Node.js 开发的最佳实践有哪些？"
- "如何进行性能优化？"
- "有哪些安全注意事项？"

### 具体问题
- "如何实现文件上传？"
- "如何创建一个 TCP 服务器？"
- "如何使用内置的 test runner？"
- "如何处理未捕获的异常？"

## Skill 特点

✅ **全面覆盖** - 涵盖所有 Node.js 核心模块和概念
✅ **现代语法** - 所有示例使用 ESM 和 async/await
✅ **可运行代码** - 提供完整的、可直接运行的代码示例
✅ **最佳实践** - 每个主题都包含推荐的做法
✅ **详细解释** - 不仅告诉"如何做"，更解释"为什么"
✅ **安全意识** - 强调安全考虑和常见陷阱
✅ **性能优化** - 包含性能优化建议
✅ **错误处理** - 所有示例包含适当的错误处理

## 目录结构

```
nodejs-expert/
├── SKILL.md       # 完整的 Node.js 知识库（1200+ 行）
├── README.md      # 本使用说明
└── TEST.md        # 测试示例
```

## 与官方文档的关系

这个 skill 是对官方文档的补充和增强：

- **官方文档**：详尽的 API 参考，适合查阅具体函数签名
- **这个 skill**：结构化的知识体系，包含实用示例、最佳实践和常见模式

建议：
1. 使用这个 skill 快速理解概念和获取代码示例
2. 需要详细 API 说明时参考官方文档：https://nodejs.org/api/

## 适用场景

1. **学习 Node.js** - 系统学习所有核心特性
2. **日常开发** - 快速查找 API 使用方法和代码示例
3. **代码审查** - 验证是否遵循最佳实践
4. **问题排查** - 理解 Node.js 内部工作原理
5. **性能优化** - 获取优化建议和技巧
6. **安全加固** - 检查安全清单

## 知识来源

本 skill 基于以下权威来源：

- [Node.js 官方文档 v25.6.0](https://nodejs.org/api/)
- [Node.js 事件循环官方指南](https://nodejs.org/en/learn/asynchronous-work/event-loop-timers-and-nexttick)
- [Node.js Streams 完整指南](https://nodejs.org/en/learn/modules/how-to-use-streams)
- [Better Stack - Node.js Streams 指南](https://betterstack.com/community/guides/scaling-nodejs/nodejs-streams/)
- [Node.js 核心模块参考](https://www.programming-books.io/essential/nodejs/core-modules-eb37c8a33cb244b89600c37da703aeb5)

## 版本信息

- **当前 Node.js 版本**：v25.6.0 (2026)
- **Skill 版本**：1.0.0
- **最后更新**：2026-02-10

## 更新和维护

随着 Node.js 新版本发布，您可以更新 SKILL.md：

```bash
# 编辑 skill 文件
code nodejs-expert/SKILL.md

# 添加新特性、修正错误或改进示例
```

## 问题反馈

如果您发现：
- 代码示例有误
- 信息过时
- 缺少重要特性
- 需要更多示例

可以直接编辑 `SKILL.md` 文件进行改进。

## 快速开始

1. **安装 skill**
   ```bash
   cp -r nodejs-expert ~/.claude/skills/
   ```

2. **验证安装**
   向 Claude Code 提问："Node.js 的事件循环有哪些阶段？"

3. **开始使用**
   提出任何 Node.js 相关问题，获取详细解答和代码示例！

---

**享受使用这个全面的 Node.js 知识库！** 🚀

有了这个 skill，Claude Code 将成为您的 Node.js 专家助手，随时为您提供准确、详细、实用的指导。
