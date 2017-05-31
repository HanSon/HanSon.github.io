title: 运行
layout: vbot/page
---

在配置完后，我们终于可以来执行玩耍了（摩拳擦掌壮）

## 正常执行

在写完脚本如 run.php ，可直接执行 `php run.php` ，此时系统会自动生成一个6位数的 **英文字母** 组成的session，根据此 session 修改代码后可以免扫码登录。

## 带 session 运行

```php
php run.php --session=session
```

session 为你所设置的 session 值，建议以微信号划分

## 运行示例

假若你是以 clone 的形式下载，你也可以执行 example/run.php 中的示例代码