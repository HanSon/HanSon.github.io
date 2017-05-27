title: 文本
layout: vbot/page
---
### type

text

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
isAt | bool | 是否 @ 自己
pure | string | 去掉 @ 人的文本

##### content vs pure

- pure. pure 是过滤掉 @ 以及昵称后的文本，不仅过滤 @ 自己，还能过滤 @ 别人，但仅过滤一次，也就是无法处理多个 @ 的情况。
- content. 与 pureText 相反，你在微信客户端看到什么内容就是什么内容。

### API

##### 发送文本

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    // 收到消息时自动回复文字消息
    Text::send($message['from']['UserName'], 'Hi! I'm Vbot');
    
    // @我自动回复
    if($message['isAt']){
      Text::send($message['from']['UserName'], 'I was @');
    }
});
```