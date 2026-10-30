---
title: '用 Markdown 写博客'
description: '标题、列表、代码块、引用……个人博客最常用的写法速查'
pubDate: '2026-10-28'
heroImage: '../../assets/blog-placeholder-3.jpg'
---

Markdown 足够写好绝大多数技术博文。下面是常用语法示例。

## 标题

用 `#` 的数量表示层级。一篇文章通常用二级、三级标题就够了。

## 列表

- 无序列表用 `-`
- 也可以嵌套
  - 像这样

1. 有序列表
2. 按数字排列

## 代码

行内代码：`const hello = 'world'`

代码块：

```ts
export function greet(name: string) {
  return `你好，${name}`;
}
```

## 引用与链接

> 好记性不如烂笔头——博客就是自己的第二大脑。

更多 Astro 内容合集说明见官方文档：[Content Collections](https://docs.astro.build/en/guides/content-collections/)。

写完保存，本地 `npm run dev` 预览，满意后再构建部署。
