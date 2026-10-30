# 个人博客（Astro）

基于 [Astro Blog 官方模板](https://github.com/withastro/astro/tree/main/examples/blog) 的中文个人博客脚手架。用 Markdown 写文章，构建为静态站点，可部署到自己的云服务器并绑定域名。

## 本地开发

```bash
npm install
npm run dev
```

浏览器打开 http://localhost:4321

```bash
npm run build    # 输出到 dist/
npm run preview  # 本地预览构建结果
```

## 快速定制

| 想改什么 | 改哪里 |
|----------|--------|
| 站点名称 / 简介 / 作者 | `src/consts.ts` |
| 网站域名（sitemap、RSS） | `astro.config.mjs` 的 `site` |
| 导航与页脚 | `src/components/Header.astro`、`Footer.astro` |
| 关于页 | `src/pages/about.astro` |
| 写新文章 | 在 `src/content/blog/` 新建 `.md` 文件 |
| 主题色 | `src/styles/global.css` 的 CSS 变量 |

新文章示例：

```markdown
---
title: '文章标题'
description: '一句话简介'
pubDate: '2026-10-30'
heroImage: '../../assets/blog-placeholder-1.jpg'
---

正文……
```

## 部署到云服务器

### 方式 A：Nginx + 上传静态文件（推荐起步）

1. 服务器安装 Nginx：`sudo apt update && sudo apt install -y nginx`
2. 本机构建并上传（或用脚本）：

```bash
npm run build
# 把 dist/ 内容拷到服务器 /var/www/blog
export DEPLOY_HOST=root@你的服务器IP
export DEPLOY_PATH=/var/www/blog
chmod +x deploy/upload.sh && ./deploy/upload.sh
```

3. 复制 `deploy/nginx.conf` 到服务器，替换域名后启用站点并 `nginx -t && systemctl reload nginx`
4. 域名 DNS：`A` 记录指向服务器公网 IP（`@` 和 `www`）
5. HTTPS：

```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

记得在云厂商安全组放行 **80 / 443**。

### 方式 B：Docker Compose

在服务器项目目录执行：

```bash
docker compose up -d --build
```

默认访问 `http://服务器IP:8080`。可把 `docker-compose.yml` 里端口改为 `80:80`，或前面再挂一层反向代理 + HTTPS。

## 项目结构

```text
├── deploy/           # Nginx 配置与上传脚本
├── public/           # 静态资源
├── src/
│   ├── assets/       # 图片与字体
│   ├── components/   # 页头、页脚等
│   ├── content/blog/ # Markdown / MDX 文章
│   ├── layouts/
│   └── pages/        # 路由页面
├── Dockerfile
├── docker-compose.yml
└── astro.config.mjs
```

## 常用命令

| 命令 | 作用 |
|------|------|
| `npm run dev` | 本地开发 |
| `npm run build` | 生产构建 |
| `npm run preview` | 预览构建结果 |
| `docker compose up -d --build` | 容器部署 |

## 说明

主题源自 [Bear Blog](https://github.com/HermanMartinus/bearblog/) 风格的 Astro 官方 Blog 模板。
