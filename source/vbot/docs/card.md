title: 名片
layout: vbot/page
---
### type

card

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
info | array | 推荐信息
avatar | string | 头像大图片
small_avatar | string | 头像小图片
province | string | 省(国内为省，国外为国.)
city | string | 市
description | string | 介绍
is_official | string | 是否公众号

### API

##### 发送个人名片

发送个人名片第二个参数为微信号，第三个为显示的昵称，可自定义可为空。

```php
Card::send($message['from']['UserName'], $alias, $nickname);
```

##### 发送公众号名片

发送公众号名片第二个参数为（微信号或者原始ID），第三个为显示的昵称（一定要正确）。

```php
Card::send($message['from']['UserName'], $alias, $nickname);
```