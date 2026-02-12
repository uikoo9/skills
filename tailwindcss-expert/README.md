# Tailwind CSS Expert Skill 使用说明

## Skill 简介

这是一个**完整的 Tailwind CSS 知识库 skill**，涵盖 Tailwind CSS v4+ 的所有工具类、响应式设计、组件模式和最佳实践，是一个全方位的 Tailwind CSS 参考指南。

## 完整知识覆盖

### 1. 核心概念与哲学
- Utility-first 设计方法
- Tailwind 的工作原理和优势
- 与传统 CSS 的对比
- 何时使用 Tailwind

### 2. 布局系统
- Container（容器）
- Display（显示类型）
- Position（定位）
- Z-Index（层级控制）
- Overflow（溢出处理）

### 3. 间距与尺寸
- **Padding & Margin** - 完整的间距体系（p-, m-, px-, py- 等）
- **Width & Height** - 固定尺寸、分数、视口单位
- **Min/Max 尺寸** - 最小/最大宽高控制
- **Size 工具类** - v4 新特性：`size-*`（同时设置宽高）
- **Space Between** - 子元素间距（space-x-, space-y-）

### 4. 排版系统
- **Font Family** - Sans、Serif、Mono
- **Font Size** - 从 xs 到 9xl 的完整尺寸
- **Font Weight** - 从 thin (100) 到 black (900)
- **Text Alignment** - 对齐方式
- **Text Decoration** - 下划线、删除线
- **Text Transform** - 大小写转换
- **Line Height** - 行高控制
- **Letter Spacing** - 字间距
- **Text Overflow** - 文本溢出和换行

### 5. 颜色与背景
- **Text Color** - 完整的颜色色板（slate, gray, red, blue 等）
- **Background Color** - 背景颜色和透明度
- **Gradients** - 渐变方向和多色停靠点
- **Opacity** - 透明度控制
- **Color Opacity** - 颜色透明度修饰符

### 6. 边框与效果
- **Borders** - 边框宽度、颜色、样式
- **Border Radius** - 圆角（从 rounded-sm 到 rounded-full）
- **Shadows** - 阴影效果（shadow-sm 到 shadow-2xl）
- **Mix Blend Mode** - 混合模式

### 7. 滤镜与变换
- **Filters** - Blur、Brightness、Contrast、Grayscale、Sepia 等
- **Transforms** - Scale、Rotate、Translate、Skew
- **Transform Origin** - 变换原点

### 8. Flexbox & Grid
- **Flexbox 完整指南**
  - Flex direction、wrap、grow、shrink
  - Justify content、align items、align self
  - Gap 和 order
- **Grid 完整指南**
  - Grid columns 和 rows
  - Column/row span
  - Grid gap
  - Justify 和 align

### 9. 响应式设计
- **断点系统** - sm (640px)、md (768px)、lg (1024px)、xl (1280px)、2xl (1536px)
- **Mobile-first 方法**
- **容器查询** (v4+) - `@container` 和命名容器
- **响应式组件模式**

### 10. 状态变体
- **伪类** - hover、focus、active、focus-visible、focus-within
- **表单状态** - checked、disabled、required、invalid、placeholder-shown
- **Group & Peer** - 组和兄弟元素状态
- **子元素选择器** - first、last、odd、even、empty

### 11. 深色模式
- Media query 策略
- Class 策略
- 深色模式工具类
- 深色模式切换实现
- 保存用户偏好

### 12. 组件模式
预构建的常用组件模式（包含完整 HTML）：
- **Button** - 主要、次要、轮廓、图标按钮
- **Card** - 带图片、标题、内容、标签的卡片
- **Form** - 输入框、标签、验证、复选框
- **Modal** - 模态框和遮罩层
- **Navigation** - 导航栏和移动菜单
- **Alert/Banner** - 成功、错误提示
- **Badge** - 徽章和状态标识

### 13. 自定义与配置
- **CSS 配置** (v4) - `@theme` 自定义主题
- **Arbitrary Values** - 任意值语法 `[347px]`
- **Custom Utilities** - 自定义工具类
- **Custom Variants** - 自定义变体
- **Plugins** (v3) - 插件系统

### 14. 最佳实践
- 性能优化
- 代码组织
- 可访问性
- 常用模式
- 命名约定

### 15. V4 新特性
- `size-*` 工具类（同时设置宽高）
- 容器查询 `@container`
- 逻辑属性（`pbs-*`、`mbs-*`、`inset-s-*` 等）
- 文本换行（`text-balance`、`text-pretty`）
- 改进的渐变控制
- 字体特性设置 `font-features-*`

## 安装方法

### 方法 1: 复制到 Claude Code skills 目录（推荐）
```bash
cp -r tailwindcss-expert ~/.claude/skills/
```

### 方法 2: 创建符号链接（开发模式）
```bash
ln -s "$(pwd)/tailwindcss-expert" ~/.claude/skills/tailwindcss-expert
```

### 方法 3: 使用安装脚本
```bash
cd tailwindcss-expert
./install.sh
```

### 方法 4: 打包为 ZIP（Claude Desktop/Web）
```bash
cd tailwindcss-expert
zip -r tailwindcss-expert.zip .
```
然后拖拽到 Claude Desktop 或 Web 界面。

## 使用示例

安装后，向 Claude Code 提问任何 Tailwind CSS 相关问题，skill 会自动激活：

### 基础概念
- "什么是 utility-first CSS？"
- "Tailwind CSS 的优势是什么？"
- "如何理解 Tailwind 的响应式设计？"

### 布局与间距
- "如何使用 Flexbox 创建居中布局？"
- "Grid 布局的 12 列系统怎么实现？"
- "展示所有的间距工具类"

### 组件构建
- "用 Tailwind 创建一个按钮"
- "如何构建一个响应式卡片组件？"
- "展示一个完整的表单示例"
- "创建一个模态框"

### 响应式设计
- "如何实现移动端和桌面端不同的布局？"
- "什么是容器查询？如何使用？"
- "展示响应式导航栏"

### 深色模式
- "如何实现深色模式切换？"
- "展示深色模式的最佳实践"
- "如何保存用户的主题偏好？"

### 高级特性
- "如何使用 Group 和 Peer 变体？"
- "展示渐变的高级用法"
- "如何使用任意值？"
- "V4 有哪些新特性？"

### 最佳实践
- "Tailwind CSS 的最佳实践有哪些？"
- "如何组织 Tailwind 类名？"
- "性能优化建议"

## Skill 特点

✅ **全面覆盖** - 涵盖所有 Tailwind CSS v4+ 工具类和特性
✅ **实际可用** - 提供完整的、可直接使用的 HTML 示例
✅ **准确语法** - 所有类名和语法都经过验证
✅ **组件模式** - 包含常用组件的完整实现
✅ **最新特性** - 包含 v4 的最新功能（容器查询、size 工具类等）
✅ **最佳实践** - 包含性能、可访问性和组织的建议
✅ **响应式优先** - 深入讲解 mobile-first 方法
✅ **深色模式** - 完整的深色模式实现指南

## 目录结构

```
tailwindcss-expert/
├── SKILL.md       # 完整的 Tailwind CSS 知识库（3000+ 行）
├── README.md      # 本使用说明
├── EXAMPLES.md    # 实际使用示例
└── install.sh     # 安装脚本
```

## 与官方文档的关系

这个 skill 是对官方文档的补充和增强：

- **官方文档**：详尽的在线参考，适合查阅具体工具类
- **这个 skill**：结构化的知识体系，包含完整示例、组件模式和最佳实践

建议：
1. 使用这个 skill 快速获取完整的 HTML 示例和代码模式
2. 需要详细说明时参考官方文档：https://tailwindcss.com

## 适用场景

1. **学习 Tailwind CSS** - 系统学习所有工具类和概念
2. **日常开发** - 快速查找类名和语法
3. **组件开发** - 获取常用组件的完整实现
4. **响应式设计** - 理解断点系统和响应式模式
5. **代码审查** - 验证 Tailwind 用法是否正确
6. **重构** - 从传统 CSS 迁移到 Tailwind

## 知识来源

本 skill 基于以下权威来源：

- [Tailwind CSS 官方文档 v4](https://tailwindcss.com)
- [Tailwind CSS GitHub 仓库](https://github.com/tailwindlabs/tailwindcss)
- [Tailwind CSS v4 变更日志](https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md)
- 社区最佳实践和常用模式

## 版本信息

- **当前 Tailwind CSS 版本**：v4.1+ (2025-2026)
- **Skill 版本**：1.0.0
- **最后更新**：2026-02-12

## 准确性保证

本 skill 特别注重 Tailwind CSS 语法的准确性：

1. **完整类名** - 使用完整的类名（如 `bg-blue-500` 而非 `bg-blue`）
2. **正确的变体语法** - `hover:bg-blue-700` 而非 `bg-blue-700:hover`
3. **断点前缀** - `md:text-lg` 而非 `md-text-lg`
4. **验证过的示例** - 所有 HTML 示例都可以直接使用
5. **最新特性** - 包含 v4 的最新功能和语法

## 常见问题

### Q: 这个 skill 支持 Tailwind CSS v3 吗？
A: 主要针对 v4，但也兼容 v3。大部分工具类在两个版本中都可用。v4 特有的特性会明确标注。

### Q: 如何验证 skill 是否正常工作？
A: 向 Claude Code 提问："展示一个使用 Tailwind CSS 的按钮示例"，应该会收到包含完整 HTML 和准确类名的回答。

### Q: Skill 包含组件库吗？
A: 包含常用组件的实现模式（button、card、form、modal 等），但不是完整的组件库。这些是模式和示例，你可以根据需要调整。

### Q: 如何获取最新的 Tailwind CSS 特性？
A: 定期更新 SKILL.md 文件以包含最新的工具类和特性。

## 快速开始

1. **安装 skill**
   ```bash
   cp -r tailwindcss-expert ~/.claude/skills/
   ```

2. **验证安装**
   向 Claude Code 提问："用 Tailwind CSS 创建一个卡片组件"

3. **开始使用**
   提出任何 Tailwind CSS 相关问题，获取准确的类名和完整的示例！

---

**享受使用这个全面的 Tailwind CSS 知识库！** 🎨

有了这个 skill，Claude Code 将成为您的 Tailwind CSS 专家助手，提供准确的类名、完整的组件示例和最佳实践指导。
