title: 文件
layout: vbot/page
---

文件是资源文件之一，在配置项可配置是否自动下载。

### type

file

### 特有属性

没有特有属性

### API

##### 发送文件

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'file') {
        // 直接传 $message 便能直接发送该 message 的文件
        File::send($message['from']['UserName'], $message);
        // 也可以选择一个文件路径
        File::send($message['from']['UserName'], __DIR__.'/test.xlsx');
    }
});
```

##### 下载文件

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'image') {
        // 下载文件至默认路径
        File::download($message);
    }
});
```

{% note warn 回调下载 %}
尽管文件也支持自定义下载回调，但因为不清楚后缀，所以 **强烈不建议使用**
{% endnote %}