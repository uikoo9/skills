#!/bin/bash

# Node.js Complete Guide Skill 安装脚本

echo "================================"
echo "Node.js Complete Guide Skill"
echo "安装程序"
echo "================================"
echo ""

# 检查 .claude/skills 目录是否存在
SKILLS_DIR="$HOME/.claude/skills"

if [ ! -d "$SKILLS_DIR" ]; then
    echo "创建 skills 目录: $SKILLS_DIR"
    mkdir -p "$SKILLS_DIR"
fi

# 获取当前脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="nodejs-complete-guide"

# 检查是否已安装
if [ -d "$SKILLS_DIR/$SKILL_NAME" ] || [ -L "$SKILLS_DIR/$SKILL_NAME" ]; then
    echo "⚠️  检测到已安装的 skill"
    read -p "是否覆盖安装? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "取消安装"
        exit 0
    fi
    rm -rf "$SKILLS_DIR/$SKILL_NAME"
fi

# 询问安装方式
echo ""
echo "请选择安装方式:"
echo "1) 复制文件（推荐，适合正式使用）"
echo "2) 创建符号链接（适合开发和调试）"
echo ""
read -p "请输入选项 (1 或 2): " -n 1 -r INSTALL_TYPE
echo ""

if [ "$INSTALL_TYPE" = "1" ]; then
    # 复制安装
    echo "复制 skill 文件到 $SKILLS_DIR/$SKILL_NAME"
    cp -r "$SCRIPT_DIR" "$SKILLS_DIR/$SKILL_NAME"
    echo "✅ 安装成功 (复制模式)"
elif [ "$INSTALL_TYPE" = "2" ]; then
    # 符号链接安装
    echo "创建符号链接: $SKILLS_DIR/$SKILL_NAME -> $SCRIPT_DIR"
    ln -s "$SCRIPT_DIR" "$SKILLS_DIR/$SKILL_NAME"
    echo "✅ 安装成功 (符号链接模式)"
else
    echo "❌ 无效的选项"
    exit 1
fi

echo ""
echo "================================"
echo "安装完成！"
echo "================================"
echo ""
echo "现在可以开始使用 Node.js Complete Guide skill 了！"
echo ""
echo "测试方法："
echo "1. 打开 Claude Code"
echo "2. 提问: 'Node.js 的事件循环有哪些阶段？'"
echo "3. 如果 skill 正常工作，Claude 会提供详细的事件循环解析"
echo ""
echo "更多信息请查看 README.md"
echo ""
