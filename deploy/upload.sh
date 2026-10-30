#!/usr/bin/env bash
# 用法：
#   export DEPLOY_HOST=root@你的服务器IP
#   export DEPLOY_PATH=/var/www/blog
#   ./deploy/upload.sh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEPLOY_HOST="${DEPLOY_HOST:?请设置 DEPLOY_HOST，例如 root@1.2.3.4}"
DEPLOY_PATH="${DEPLOY_PATH:-/var/www/blog}"

cd "$ROOT_DIR"
npm run build

echo ">>> 上传 dist/ 到 ${DEPLOY_HOST}:${DEPLOY_PATH}"
ssh "$DEPLOY_HOST" "mkdir -p '${DEPLOY_PATH}'"
rsync -avz --delete "${ROOT_DIR}/dist/" "${DEPLOY_HOST}:${DEPLOY_PATH}/"
echo ">>> 部署完成"
