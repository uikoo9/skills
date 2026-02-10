# Claude Code 技能集合

[English](./README.en.md) | 简体中文

为 [Claude Code](https://claude.ai/code) 精心打造的专业技能集合 - Anthropic 官方 CLI 工具，将 Claude 的 AI 能力直接带入您的开发工作流。

## 什么是 Claude Code 技能？

技能（Skills）是增强 Claude Code 在特定领域能力的知识包。当您提出与技能领域相关的问题时，Claude 会自动访问该知识库，提供更准确、详细和具有针对性的答案。

## 可用技能

### 🚀 Node.js 完整指南

涵盖所有核心特性、模块、API 和现代 Node.js 开发最佳实践的综合知识库。

**知识覆盖：**
- **核心概念**：事件循环、Libuv、Node.js 架构
- **模块系统**：ESM vs CommonJS、模块解析机制
- **30+ 核心模块**：fs、http、crypto、streams、worker_threads 等
- **异步编程**：回调、Promise、async/await、错误处理
- **流（Streams）**：四种类型（Readable、Writable、Duplex、Transform）
- **文件系统**：基于 Promise 的 API、流式处理、文件监听
- **网络编程**：HTTP/HTTPS 服务器、TCP、DNS、Fetch API
- **进程管理**：子进程、Worker Threads、Cluster
- **事件系统**：EventEmitter、事件模式
- **加密技术**：哈希、加密、后量子密码学
- **测试与调试**：node:test、断言、模拟
- **性能优化**：优化技术和最佳实践

📖 [完整文档](./nodejs-expert/README.md) | 📝 [使用示例](./nodejs-expert/EXAMPLES.md) | 🧪 [测试用例](./nodejs-expert/TEST.md)

**特性：**
- ✅ 1200+ 行综合文档
- ✅ 现代语法（ESM、async/await）
- ✅ 完整、可运行的代码示例
- ✅ 安全和性能最佳实践
- ✅ 基于 Node.js v25.6.0 (2026)

## 快速开始

### 安装方法

#### 方法 1：直接复制（推荐）
```bash
# 将 nodejs-expert 技能复制到 Claude Code 技能目录
cp -r nodejs-expert ~/.claude/skills/
```

#### 方法 2：符号链接（适合开发）
```bash
# 创建符号链接以便于更新
ln -s "$(pwd)/nodejs-expert" ~/.claude/skills/nodejs-expert
```

#### 方法 3：自动安装
```bash
# 使用内置安装脚本
cd nodejs-expert
./install.sh
```

#### 方法 4：Claude Desktop/Web
```bash
# 创建 ZIP 文件并拖拽到 Claude Desktop 或 Web 界面
cd nodejs-expert
zip -r nodejs-complete-guide.zip .
```

### 验证安装

安装后，向 Claude Code 提问以测试技能：

```
Node.js 的事件循环是如何工作的？
```

或者

```
如何使用现代语法创建 HTTP 服务器？
```

如果技能正常工作，您会收到详细的解释和完整的代码示例。

## 使用示例

安装后，直接向 Claude Code 提出任何 Node.js 相关问题：

**基础概念：**
- "解释 Node.js 事件循环的各个阶段"
- "ESM 和 CommonJS 有什么区别？"
- "Libuv 是如何工作的？"

**实际任务：**
- "展示如何使用 fs/promises 读取文件"
- "创建一个带错误处理的 REST API 服务器"
- "如何使用 Worker Threads 处理 CPU 密集型任务？"

**流和高级主题：**
- "Node.js 中有哪 4 种类型的流？"
- "展示如何处理流中的背压（backpressure）"
- "如何实现优雅关闭？"

**最佳实践：**
- "Node.js 的安全最佳实践有哪些？"
- "如何优化 Node.js 性能？"
- "展示如何使用内置测试运行器"

## 仓库结构

```
skills/
├── README.md              # 英文文档
├── README.zh-CN.md        # 中文文档（本文件）
├── CLAUDE.md              # Claude Code 在此仓库工作时的指导说明
└── nodejs-expert/         # Node.js 完整指南技能
    ├── SKILL.md           # 核心技能知识库（1200+ 行）
    ├── README.md          # 详细技能文档
    ├── EXAMPLES.md        # 15+ 个实际使用示例
    ├── TEST.md            # 验证测试用例
    └── install.sh         # 自动安装脚本
```

## 为什么使用技能？

**不使用技能：**
- 基于训练数据的通用回答
- 可能遗漏较新的 API 或最佳实践
- 专业主题的深度有限

**使用技能：**
- 领域特定的专业知识
- 最新知识（Node.js v25.6.0）
- 全面覆盖所有 API
- 生产就绪的代码示例
- 安全和性能指导

## 技能特性

### 🎯 全面覆盖
记录了每个主要的 Node.js 特性、模块和 API，并附带示例。

### 💻 现代语法
所有代码示例使用：
- ESM（ECMAScript 模块）和 `node:` 前缀
- `async/await` 而非回调函数
- 最新的 Node.js API 和特性

### 🔒 注重安全
每个主题都包含内置的安全考虑和最佳实践。

### ⚡ 性能意识
包含优化技巧和性能测量技术。

### 📚 教育性
不仅告诉你"如何做"，还解释"为什么这样做" - 理解最佳实践背后的原理。

### ✅ 生产就绪
所有示例都包含适当的错误处理，可直接用于实际应用。

## 贡献

本仓库设计为可扩展的。添加新技能的步骤：

1. 创建新的技能目录
2. 添加包含知识库的 `SKILL.md` 文件
3. 包含安装和使用说明的 `README.md`
4. 可选添加 `EXAMPLES.md` 和 `TEST.md`
5. 更新主 README.md 以列出新技能

详细开发指南请参阅 [CLAUDE.md](./CLAUDE.md)。

## 系统要求

- **Claude Code**：0.4.0 或更高版本
- **Node.js**：v18+（用于运行示例）
- **操作系统**：macOS、Linux 或 Windows

## 资源链接

- [Claude Code 文档](https://claude.ai/code)
- [Node.js 官方文档](https://nodejs.org/api/)
- [Node.js 最佳实践](https://github.com/goldbergyoni/nodebestpractices)

## 版本信息

- **仓库版本**：1.0.0
- **Node.js 技能版本**：1.0.0
- **目标 Node.js 版本**：v25.6.0 (2026)
- **最后更新**：2026-02-10

## 许可证

本仓库中的技能作为 Claude Code 的知识资源提供。具体许可信息请查看各技能目录。

---

**准备好用 Claude Code 加速您的 Node.js 开发了吗？** 立即安装技能并开始提问！

有关 Node.js 技能的详细信息，请参阅 [Node.js 专家文档](./nodejs-expert/README.md)。
