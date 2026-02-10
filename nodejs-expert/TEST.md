# Skill 测试示例

安装 skill 后，尝试这些问题来测试是否正常工作：

## 测试问题 1: 版本特性
**问**: Node.js 24 LTS 的主要新特性是什么？

**期望回答应包含**:
- Post-Quantum Cryptography (ML-KEM, ML-DSA)
- WebAssembly ESM Integration
- HTTP/HTTPS Proxy Support
- OpenSSL 3.5

---

## 测试问题 2: 代码示例
**问**: 如何使用 Node.js 内置的 test runner 编写测试？

**期望回答应包含**:
- 导入 `node:test` 模块
- 使用 `describe`, `it`, `test`
- 具体代码示例

---

## 测试问题 3: 最佳实践
**问**: 2026 年 Node.js 开发有哪些最佳实践？

**期望回答应包含**:
- 使用 ESM (type: "module")
- node: 前缀导入
- async/await 而非 callback
- Web 标准 API
- 安全配置

---

## 测试问题 4: API 使用
**问**: 如何使用 AbortController 实现请求超时？

**期望回答应包含**:
- AbortController 实例化
- setTimeout 配合
- fetch signal 参数
- 完整代码示例

---

## 验证 Skill 激活

如果 Claude 的回答：
✅ 包含具体的 Node.js 版本号 (24, 25)
✅ 提供代码示例使用现代语法
✅ 引用 SKILL.md 中的信息
✅ 给出详细、准确的技术细节

说明 skill 已成功激活！

## 未激活的症状

如果 Claude 回答：
❌ 信息过于笼统
❌ 版本信息不准确
❌ 缺少 SKILL.md 中的具体特性
❌ 没有提到后量子加密、Web Storage 等新特性

可能需要检查 skill 安装。
