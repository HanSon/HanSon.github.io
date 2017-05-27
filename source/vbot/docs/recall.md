title: 撤回
layout: vbot/page
---
### type

recall

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
origin | array | 撤回的消息
nickname | string | 上一条撤回消息者的昵称

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'recall') {
        Text::send($message['from']['UserName'], $message['content'].' : '.$message['origin']['content']);
        if ($message['origin']['type'] === 'image') {
            Image::send($message['from']['UserName'], $message['origin']);
        } elseif ($message['origin']['type'] === 'emoticon') {
            Emoticon::send($message['from']['UserName'], $message['origin']);
        } elseif ($message['origin']['type'] === 'video') {
            Video::send($message['from']['UserName'], $message['origin']);
        } elseif ($message['origin']['type'] === 'voice') {
            Voice::send($message['from']['UserName'], $message['origin']);
        }
    }
});
```