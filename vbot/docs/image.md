title: 图片
layout: vbot/page
---

图片是资源文件之一，在配置项可配置是否自动下载。

### type

image

### 特有属性

没有特有属性

### API

##### 发送图片

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'image') {
        // 直接传 $message 便能直接发送该 message 的图片
        Image::send($message['from']['UserName'], $message);
        // 也可以选择一个图片路径
        Image::send($message['from']['UserName'], __DIR__.'/test.jpg');
    }
});
```

##### 下载图片

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'image') {
        // 下载图片至默认路径
        Image::download($message);
        // 下载图片到自定义路径或自定义处理
        Image::download($message, function ($resource) {
            file_put_contents(__DIR__.'/test.jpg', $resource);
        });
    }
});
```