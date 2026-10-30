---
title: '把博客部署到云服务器'
description: '域名解析、Nginx、HTTPS，以及 Docker 一键部署的完整步骤'
pubDate: '2026-10-29'
heroImage: '../../assets/blog-placeholder-2.jpg'
---

假设你已经有一台 Ubuntu 云服务器，以及一个已备案（如需）的域名。

## 方案一：Nginx 直接托管（最常见）

1. 本机或 CI 构建：`npm run build`
2. 把 `dist/` 上传到服务器，例如 `/var/www/blog`
3. 配置 Nginx 指向该目录
4. DNS 的 A 记录指向服务器公网 IP
5. `certbot --nginx` 申请证书

项目里的 `deploy/nginx.conf` 可以直接参考。

## 方案二：Docker（更省事）

服务器上执行：

```bash
docker compose up -d --build
```

会自动构建静态站并用 Nginx 提供服务，默认映射到主机的 `8080` 端口。前面再挂一层反向代理或改端口为 `80` 即可。

## DNS 怎么配？

| 类型 | 主机记录 | 值 |
|------|----------|-----|
| A | `@` | 服务器公网 IP |
| A / CNAME | `www` | 同 IP，或指向主域名 |

解析生效后，浏览器打开你的域名就能看到博客。
