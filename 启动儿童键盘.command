#!/bin/bash
# 一键启动儿童键盘（Chrome 全屏模式，无地址栏、无标签栏）
# 家长退出方式：Command + Q

DIR="$(cd "$(dirname "$0")" && pwd)"
PAGE="$DIR/keyboard-kids.html"

if [ ! -f "$PAGE" ]; then
  echo "找不到 keyboard-kids.html，请确认脚本和网页在同一个文件夹里。"
  read -n 1 -s -r -p "按任意键关闭..."
  exit 1
fi

if [ -d "/Applications/Google Chrome.app" ]; then
  open -na "Google Chrome.app" --args --kiosk --autoplay-policy=no-user-gesture-required --allow-file-access-from-files "file://$PAGE"
else
  # 没装 Chrome 时退回默认浏览器
  open "$PAGE"
fi
