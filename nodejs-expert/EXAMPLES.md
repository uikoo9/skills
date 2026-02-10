# Node.js Complete Guide Skill - 使用示例

安装 skill 后，以下是一些实际使用示例。

## 示例 1: 理解事件循环

**提问:**
```
Node.js 的事件循环是如何工作的？请详细解释每个阶段。
```

**期望回答包含:**
- 事件循环的 6 个阶段（Timers, Pending callbacks, Poll, Check, Close callbacks）
- 每个阶段的作用
- process.nextTick() 和 setImmediate() 的区别
- Libuv 的角色

---

## 示例 2: 文件操作

**提问:**
```
如何使用现代 Node.js API 读取和写入文件？
```

**期望回答包含:**
- 使用 `node:fs/promises` 的完整示例
- async/await 语法
- 错误处理
- 读取、写入、追加文件的方法

---

## 示例 3: 创建 HTTP 服务器

**提问:**
```
展示如何创建一个处理 JSON 请求的 HTTP 服务器
```

**期望回答包含:**
- 使用 `node:http` 创建服务器
- 解析请求体
- 设置响应头
- 发送 JSON 响应
- 完整可运行的代码

---

## 示例 4: Streams 深度学习

**提问:**
```
什么是 Transform Stream？如何创建一个将文本转换为大写的 Transform Stream？
```

**期望回答包含:**
- Transform Stream 的定义
- 4 种流类型的说明
- 完整的代码示例
- 如何使用 pipe() 连接流

---

## 示例 5: 加密操作

**提问:**
```
如何使用 crypto 模块进行 AES-256-GCM 加密？
```

**期望回答包含:**
- 完整的加密和解密示例
- 密钥派生（scryptSync）
- IV（初始化向量）生成
- Auth Tag 处理
- 安全注意事项

---

## 示例 6: 异步编程模式

**提问:**
```
展示如何并行执行多个异步操作，并处理部分失败的情况
```

**期望回答包含:**
- Promise.all() 的使用
- Promise.allSettled() 的使用
- Promise.race() 的使用
- 错误处理策略
- 实际代码示例

---

## 示例 7: Worker Threads

**提问:**
```
如何使用 Worker Threads 执行 CPU 密集型任务？
```

**期望回答包含:**
- Worker Threads 的使用场景
- 主线程和工作线程的代码
- 消息传递机制
- workerData 的使用
- 完整示例

---

## 示例 8: 错误处理

**提问:**
```
Node.js 中处理未捕获异常的最佳实践是什么？
```

**期望回答包含:**
- uncaughtException 事件处理
- unhandledRejection 事件处理
- try/catch 与 async/await
- 自定义错误类
- 优雅关闭的建议

---

## 示例 9: 性能优化

**提问:**
```
如何测量和优化 Node.js 应用的性能？
```

**期望回答包含:**
- performance.now() 的使用
- perf_hooks 模块
- PerformanceObserver
- 内存使用监控
- Cluster 模块用于多核利用
- 实际优化建议

---

## 示例 10: Buffer 操作

**提问:**
```
如何在 Node.js 中处理二进制数据？展示 Buffer 的常见操作。
```

**期望回答包含:**
- Buffer 创建方法
- 读写操作
- 编码转换（utf8, base64, hex）
- Buffer 拼接和比较
- 使用场景

---

## 示例 11: TCP 服务器

**提问:**
```
如何创建一个简单的 TCP echo 服务器？
```

**期望回答包含:**
- 使用 `node:net` 模块
- Socket 事件处理
- 数据接收和发送
- 连接管理
- 完整代码

---

## 示例 12: 测试编写

**提问:**
```
如何使用 Node.js 内置的 test runner 编写测试？
```

**期望回答包含:**
- `node:test` 模块的使用
- describe 和 it 函数
- before/after 钩子
- assert 断言
- 异步测试
- Mock 函数

---

## 示例 13: DNS 查询

**提问:**
```
如何进行 DNS 查询和反向 DNS 查询？
```

**期望回答包含:**
- `node:dns/promises` 的使用
- lookup() 方法
- resolve4() 方法
- reverse() 方法
- 完整示例

---

## 示例 14: 子进程管理

**提问:**
```
exec、spawn 和 execFile 有什么区别？何时使用哪个？
```

**期望回答包含:**
- 三种方法的区别
- 使用场景
- 代码示例
- 优缺点对比
- 最佳实践

---

## 示例 15: Cluster 多进程

**提问:**
```
如何使用 Cluster 模块利用多核 CPU？
```

**期望回答包含:**
- Cluster 的工作原理
- 主进程和工作进程
- 负载均衡
- 进程重启策略
- 完整示例代码

---

## 验证 Skill 是否正常工作

如果 Claude 的回答：

✅ **包含详细的解释**，不仅告诉"如何做"，还解释"为什么"
✅ **提供完整的代码示例**，使用现代语法（ESM、async/await）
✅ **使用 `node:` 前缀**导入核心模块
✅ **包含错误处理**
✅ **提到安全考虑**（如果相关）
✅ **给出最佳实践建议**
✅ **代码可以直接运行**

说明 skill 正常工作！

---

## 高级使用

### 对比不同方法
```
对比 Callbacks、Promises 和 Async/Await，各有什么优缺点？
```

### 深入理解
```
深入解释 Node.js 的单线程模型为什么能处理高并发？
```

### 实际问题
```
如何实现一个支持断点续传的文件上传服务？
```

### 最佳实践
```
生产环境部署 Node.js 应用的最佳实践有哪些？
```

### 性能调优
```
如何诊断和解决 Node.js 应用的内存泄漏？
```

---

## 提示

1. **具体问题** - 越具体的问题，得到的答案越精确
2. **要求代码** - 可以明确要求"展示代码示例"
3. **现代语法** - Skill 默认使用 ESM 和 async/await
4. **完整示例** - Skill 倾向于提供完整、可运行的代码
5. **安全意识** - Skill 会主动提醒安全相关的问题

---

**开始探索 Node.js 的强大功能吧！** 🚀
