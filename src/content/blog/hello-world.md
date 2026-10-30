---
title: '你好，世界'
description: '第一篇博客：为什么选择静态站点来写个人博客'
pubDate: '2026-10-30'
heroImage: '../../assets/blog-placeholder-1.jpg'
---

这是博客的第一篇文章。

我选择用 **Astro** 搭建个人博客，主要有三点原因：

1. **写文章简单**：直接用 Markdown，不需要数据库
2. **访问快、成本低**：构建成静态 HTML，一台小云服务器就能跑
3. **可控性强**：域名、HTTPS、备份都掌握在自己手里

## 怎么发布新文章？

在 `src/content/blog/` 目录新建一个 `.md` 文件，写好 frontmatter：

```markdown
---
title: '文章标题'
description: '一句话简介'
pubDate: '2026-10-30'
heroImage: '../../assets/blog-placeholder-2.jpg'
---

正文从这里开始……
```

然后执行：

```bash
npm run build
```

把生成的 `dist/` 目录部署到服务器即可。

## 下一步

- 改掉站点名称和关于页内容
- 绑定自己的域名
- 用 Certbot 开启 HTTPS

写博客没有标准答案，把想说的话记下来就很好。
