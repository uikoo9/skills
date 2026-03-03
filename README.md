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

---

### 🎨 Tailwind CSS 专家

涵盖所有工具类、响应式设计、组件模式和 Tailwind CSS v4+ 最佳实践的综合知识库。

**知识覆盖：**
- **核心概念**：Utility-first 设计方法、工作原理
- **布局系统**：Container、Display、Position、Z-Index
- **间距与尺寸**：Padding、Margin、Width、Height、Size 工具类
- **排版系统**：字体、文本大小、行高、对齐、装饰
- **颜色与背景**：完整色板、渐变、透明度
- **边框与效果**：边框、圆角、阴影、混合模式
- **滤镜与变换**：Blur、Scale、Rotate、Translate
- **Flexbox & Grid**：完整的布局系统
- **响应式设计**：断点系统、容器查询（v4+）
- **状态变体**：Hover、Focus、Group、Peer
- **深色模式**：完整实现指南
- **组件模式**：Button、Card、Form、Modal、Navigation 等
- **自定义配置**：@theme、任意值、自定义工具类
- **V4 新特性**：size-*、容器查询、逻辑属性

📖 [完整文档](./tailwindcss-expert/README.md) | 📝 [使用示例](./tailwindcss-expert/EXAMPLES.md)

**特性：**
- ✅ 3000+ 行综合文档
- ✅ 准确的类名语法
- ✅ 完整的 HTML 组件示例
- ✅ 响应式和可访问性最佳实践
- ✅ 基于 Tailwind CSS v4.1+ (2025-2026)

---

### ⚡ Next.js 完整专家指南

涵盖所有核心特性、App Router、Server/Client Components、数据获取、缓存机制和 Next.js 15+ 最佳实践的综合知识库。

**知识覆盖：**
- **核心概念**：项目结构、文件约定、TypeScript 配置
- **路由系统**：文件路由、动态路由、路由组、并行路由、拦截路由
- **Server & Client Components**：何时使用、组合模式、数据共享策略
- **数据获取**：Server Components、Client Components、流式传输、请求去重
- **缓存系统**：4种缓存机制、fetch API 缓存、Cache Tags、重新验证
- **导航优化**：Link 组件、预取策略、性能优化
- **Server Actions**：创建和调用、表单处理、验证、错误处理
- **API Routes**：Route Handlers、所有 HTTP 方法、流式响应
- **内置组件**：Image、Link、Font、Script、Form 优化
- **渲染策略**：静态���动态、ISR、流式渲染、部分预渲染
- **错误处理**：Error Boundaries、Loading States、Not Found 页面
- **配置**：next.config.js、Route Segment Config、环境变量、Metadata API
- **最佳实践**：组件组织、性能优化、安全实践、部署清单

📖 [完整文档](./nextjs-expert/README.md) | 📝 [使用示例](./nextjs-expert/EXAMPLES.md)

**特性：**
- ✅ 2000+ 行综合文档
- ✅ 400+ 代码示例
- ✅ TypeScript 优先
- ✅ 生产就绪的完整示例
- ✅ 基于 Next.js 15.x (2026)

---

### 🎯 CSS Tricks - 你需要知道的CSS

包含52个实用CSS技巧的综合集合，涵盖常见网页设计问题的生产就绪解决方案。

**知识覆盖：**
- **边框与背景**（6个技巧）：半透明边框、多重边框、内圆角、背景定位、条纹背景、1px线
- **形状绘制**（6个技巧）：椭圆、平行四边形、切角效果、饼图、提示气泡、多边形
- **视觉效果**（9个技巧）：阴影、毛玻璃效果、斑马条纹、文字效果、环形文字、图片对比滑块
- **用户体验**（11个技巧）：鼠标光标、扩展点击区域、自定义表单控件、背景弱化、文字下划线、自定义滚动条
- **结构与布局**（7个技巧）：全屏背景固定内容、粘性页脚、居中方案、圣杯布局、双飞翼布局、Flexbox完整指南
- **过渡与动画**（7个技巧）：弹跳、弹性、闪烁、打字效果、抖动、平滑滚动、环形动画
- **其他工具**（3个技巧）：常用代码片段、CSS自定义变量、有趣的CSS项目

📖 [完整文档](./css-tricks/README.md) | 📝 [使用示例](./css-tricks/EXAMPLES.md)

**特性：**
- ✅ 52个CSS技巧，涵盖7大类别
- ✅ 生产就绪的完整代码示例
- ✅ 多种实现方案对比
- ✅ 浏览器兼容性说明
- ✅ 基于 [You-need-to-know-css](https://github.com/l-hammer/You-need-to-know-css) 项目

## 快速开始

### 安装方法

#### 选项 A：安装所有技能（推荐）
```bash
# 将所有技能复制到 Claude Code 技能目录
cp -r nodejs-expert nextjs-expert tailwindcss-expert css-tricks ~/.claude/skills/
```

#### 选项 B：安装单个技能

**Node.js 完整指南：**
```bash
# 方法 1：直接复制
cp -r nodejs-expert ~/.claude/skills/

# 方法 2：符号链接（适合开发）
ln -s "$(pwd)/nodejs-expert" ~/.claude/skills/nodejs-expert

# 方法 3：自动安装脚本
cd nodejs-expert && ./install.sh
```

**Next.js 完整专家指南：**
```bash
# 方法 1：直接复制
cp -r nextjs-expert ~/.claude/skills/

# 方法 2：符号链接（适合开发）
ln -s "$(pwd)/nextjs-expert" ~/.claude/skills/nextjs-expert

# 方法 3：自动安装脚本
cd nextjs-expert && ./install.sh
```

**Tailwind CSS 专家：**
```bash
# 方法 1：直接复制
cp -r tailwindcss-expert ~/.claude/skills/

# 方法 2：符号链接（适合开发）
ln -s "$(pwd)/tailwindcss-expert" ~/.claude/skills/tailwindcss-expert

# 方法 3：自动安装脚本
cd tailwindcss-expert && ./install.sh
```

**CSS Tricks：**
```bash
# 方法 1：直接复制
cp -r css-tricks ~/.claude/skills/

# 方法 2：符号链接（适合开发）
ln -s "$(pwd)/css-tricks" ~/.claude/skills/css-tricks

# 方法 3：自动安装脚本
cd css-tricks && ./install.sh
```

### 验证安装

安装后，向 Claude Code 提问以测试技能：

**测试 Node.js 技能：**
```
Node.js 的事件循环是如何工作的？
如何实现基于 Promise 的文件读取？
Worker Threads 和 Child Process 有什么区别？
```

**测试 Next.js 技能：**
```
Server Components 和 Client Components 有什么区别？
如何在 Next.js 中实现数据缓存和重新验证？
动态路由如何使用 generateStaticParams？
```

**测试 Tailwind CSS 技能：**
```

**测试 Tailwind CSS 技能：**
```
用 Tailwind CSS 创建一个响应式按钮
```

**测试 CSS Tricks 技能：**
```
如何创建自定义复选框？
```

如果技能正常工作，您会收到详细的解释和完整的代码示例。

## 使用示例

安装后，直接向 Claude Code 提出相关问题：

### Node.js 相关问题

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

### Tailwind CSS 相关问题

**基础概念：**
- "什么是 utility-first CSS？"
- "Tailwind CSS 的断点系统如何工作？"
- "如何理解 Tailwind 的颜色体系？"

**组件构建：**
- "用 Tailwind CSS 创建一个响应式卡片"
- "展示一个完整的登录表单"
- "创建一个带动画的模态框"

**布局系统：**
- "如何使用 Flexbox 创建居中布局？"
- "展示 Grid 的 12 列响应式系统"
- "什么是容器查询？如何使用？"

**深色模式：**
- "如何实现深色模式切换？"
- "展示深色模式的最佳实践"

**高级特性：**
- "如何使用 Group 和 Peer 变体？"
- "展示任意值的用法"
- "Tailwind v4 有哪些新特性？"

### CSS Tricks 相关问题

**边框与背景：**
- "如何创建半透明边框？"
- "展示如何实现多重边框"
- "1px线在高清屏幕上如何实现？"

**表单与交互：**
- "创建自定义复选框"
- "如何扩大按钮的点击区域？"
- "展示自定义开关按钮"

**布局方案：**
- "实现粘性页脚"
- "展示6种居中对齐的方法"
- "什么是圣杯布局？"

**视觉效果：**
- "创建毛玻璃效果"
- "如何实现文字打字动画？"
- "展示弹跳动画效果"

**实际应用：**
- "创建一个图片对比滑块"
- "如何自定义滚动条样式？"
- "实现深色模式切换效果"

## 仓库结构

```
skills/
├── README.md              # 中文文档（本文件）
├── README.en.md           # 英文文档
├── CLAUDE.md              # Claude Code 在此仓库工作时的指导说明
├── nodejs-expert/         # Node.js 完整指南技能
│   ├── SKILL.md           # 核心技能知识库（1200+ 行）
│   ├── README.md          # 详细技能文档
│   ├── EXAMPLES.md        # 15+ 个实际使用示例
│   ├── TEST.md            # 验证测试用例
│   └── install.sh         # 自动安装脚本
├── tailwindcss-expert/    # Tailwind CSS 专家技能
│   ├── SKILL.md           # 核心技能知识库（3000+ 行）
│   ├── README.md          # 详细技能文档
│   ├── EXAMPLES.md        # 20+ 个实际使用示例
│   └── install.sh         # 自动安装脚本
└── css-tricks/            # CSS Tricks 技能
    ├── SKILL.md           # 核心技能知识库（52个技巧）
    ├── README.md          # 详细技能文档
    ├── EXAMPLES.md        # 10+ 个完整使用示例
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

- **仓库版本**：1.2.0
- **技能数量**：3（Node.js、Tailwind CSS、CSS Tricks）
- **Node.js 技能版本**：1.0.0
- **Tailwind CSS 技能版本**：1.0.0
- **CSS Tricks 技能版本**：1.0.0
- **最后更新**：2026-02-13

## 许可证

本仓库中的技能作为 Claude Code 的知识资源提供。具体许可信息请查看各技能目录。

---

**准备好用 Claude Code 加速您的开发了吗？** 立即安装技能并开始提问！

技能详细信息：
- [Node.js 完整指南文档](./nodejs-expert/README.md)
- [Tailwind CSS 专家文档](./tailwindcss-expert/README.md)
- [CSS Tricks 文档](./css-tricks/README.md)
