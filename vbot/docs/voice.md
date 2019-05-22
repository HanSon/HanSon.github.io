title: 语音
layout: vbot/page
---

语音是资源文件之一，在配置项可配置是否自动下载。语音也能发送，只是以文件的形式发送。

### type

voice

### 特有属性

没有特有属性

### API

##### 发送语音

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'voice') {
        // 直接传 $message 便能直接发送该 message 的语音
        Voice::send($message['from']['UserName'], $message);
        // 也可以选择一个语音路径
        Voice::send($message['from']['UserName'], __DIR__.'/test.mp3');
    }
});
```

##### 下载语音

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'voice') {
        // 下载语音至默认路径
        Voice::download($message);
        // 下载语音到自定义路径或自定义处理
        Voice::download($message, function ($resource) {
            file_put_contents(__DIR__.'/test.mp3', $resource);
        });
    }
});
```