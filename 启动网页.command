#!/bin/zsh
set -e

cd -- "${0:A:h}"

port=8000
url="http://127.0.0.1:${port}/index.html"

python3 -m http.server "$port" --bind 127.0.0.1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT INT TERM

sleep 0.5
open "$url"

echo "KVPO 网页已打开：$url"
echo "请保持此窗口运行；关闭窗口或按 Control-C 即可停止服务。"
wait "$server_pid"
