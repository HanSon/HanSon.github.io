title: 表情
layout: vbot/page
---

表情是资源文件之一，在配置项可配置是否自动下载。

{% note warn 下载失败 %}
有时会出现下载表情失败的情况，那是因为表情商城的表情需添加后才可发送。
{% endnote %}

### type

emoticon

### 特有属性

没有特有属性

### API

##### 发送表情

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'emoticon') {
        // 直接传 $message 便能直接发送该 message 的表情
        Emoticon::send($message['from']['UserName'], $message);
        // 也可以选择一个表情路径
        Emoticon::send($message['from']['UserName'], __DIR__.'/test.gif');
        // 或者从表情库随机抽取一个进行发送
        Emoticon::sendRandom($message['from']['UserName']);
    }
});
```

##### 下载表情

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'emoticon') {
        // 下载表情至默认路径
        Emoticon::download($message);
        // 下载表情到自定义路径或自定义处理
        Emoticon::download($message, function ($resource) {
            file_put_contents(__DIR__.'/test.gif', $resource);
        });
    }
});
```