# 惠美陶瓷博客（Astro）

域名：**huimei-ceramic.ltd**  
服务器 IP：**43.142.19.45**

基于 [Astro Blog 官方模板](https://github.com/withastro/astro/tree/main/examples/blog)，用 Markdown 写文章，构建为静态站点后部署到云服务器。

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

## 域名解析

在域名服务商后台添加（详见 `deploy/dns.md`）：

| 类型 | 主机记录 | 记录值 |
|------|----------|--------|
| A | `@` | `43.142.19.45` |
| A | `www` | `43.142.19.45` |

安全组放行 **80 / 443**。

## 部署到云服务器

### 方式 A：Nginx + 上传静态文件（推荐）

1. 服务器安装 Nginx：`sudo apt update && sudo apt install -y nginx`
2. 本机构建并上传：

```bash
npm run build
# 默认上传到 root@43.142.19.45:/var/www/blog
# 若登录用户不是 root：export DEPLOY_HOST=ubuntu@43.142.19.45
./deploy/upload.sh
```

3. 把 `deploy/nginx.conf` 拷到服务器并启用：

```bash
sudo cp deploy/nginx.conf /etc/nginx/sites-available/blog
sudo ln -sf /etc/nginx/sites-available/blog /etc/nginx/sites-enabled/blog
sudo nginx -t && sudo systemctl reload nginx
```

4. 申请 HTTPS：

```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d huimei-ceramic.ltd -d www.huimei-ceramic.ltd
```

完成后访问：https://huimei-ceramic.ltd

### 方式 B：Docker Compose

在服务器项目目录执行：

```bash
docker compose up -d --build
```

默认 `http://43.142.19.45:8080`。可把端口改为 `80:80`，或前面再挂 Nginx + Certbot。

## 项目结构

```text
├── deploy/           # Nginx、DNS 说明、上传脚本
├── public/
├── src/
│   ├── content/blog/ # Markdown 文章
│   └── pages/
├── Dockerfile
├── docker-compose.yml
└── astro.config.mjs
```

## 说明

主题源自 [Bear Blog](https://github.com/HermanMartinus/bearblog/) 风格的 Astro 官方 Blog 模板。
