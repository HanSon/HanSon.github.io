title: 位置
layout: vbot/page
---
### type

location

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
url | string | 位置链接（腾讯地图）（共享位置时为空）

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'location') {
        Text::send($message['from']['UserName'], $message['content']);
    }
});
```

{% note warn content 值 %}
Location 的 content 值有两种情况。

发送位置：地址文字信息
共享位置：[共享位置]
{% endnote %}