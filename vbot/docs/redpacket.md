title: 红包
layout: vbot/page
---
### type

red_packet

### 特有属性

没有特有属性

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'red_packet') {
        Text::send($message['from']['UserName'], $message['content']);
    }
});
```
