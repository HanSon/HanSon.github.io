title: 视频
layout: vbot/page
---

视频是资源文件之一，在配置项可配置是否自动下载。

{% note warn 下载失败 %}
微信网页端并非全部视频都能打开，所以，当你看到 download file failed 的时候别惊讶，那不是 Vbot 的bug
{% endnote %}

### type

video

### 特有属性

没有特有属性

### API

##### 发送视频

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'video') {
        // 直接传 $message 便能直接发送该 message 的视频
        Video::send($message['from']['UserName'], $message);
        // 也可以选择一个视频路径
        Video::send($message['from']['UserName'], __DIR__.'/test.mp4');
    }
});
```

##### 下载视频

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'video') {
        // 下载视频至默认路径
        Video::download($message);
        // 下载视频到自定义路径或自定义处理
        Video::download($message, function ($resource) {
            file_put_contents(__DIR__.'/test.mp4', $resource);
        });
    }
});
```