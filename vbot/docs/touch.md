title: 点击
layout: vbot/page
---

点击是机器人在账号在客户端中点击联系人便会触发的消息，很鸡肋。

### type

touch

### 特有属性

没有特有属性

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    if ($message['type'] === 'touch') {
        Text::send($message['from']['ToUserName'], $message['content']);
    }
});
```