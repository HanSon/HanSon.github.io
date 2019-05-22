title: 问题解答
layout: vbot/page
---

### error 35: SSL connect error

请检查 PHP 配置中的 curl 模块，把 SSL Version 设置为 OpenSSL 即可

### 显示不出二维码

Linux 下请检查自己终端是否开启 ANSI COLOR ，详情自行 google 解决

### 如何能延长挂机时间？

- 保持服务端网络稳定（若断开超过数分钟就会造成 cookie 过期而断开）
- 定时打开手机客户端（每 8~16 小时打开一次）

### 如何获取唯一ID？

因为 web 的限制，无法获取每个账号的唯一ID。在 **每次登录的 session 中**， 都会存在一个唯一的临时ID : username 。平时如果用于客服等场景，建议通过设置备注确保唯一性。