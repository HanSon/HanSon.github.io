title: 好友请求
layout: vbot/page
---
### type

request_friend

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
info | array | 请求好友信息
avatar | string | 头像（需下载）

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...
    
    // 获取好友实例
    $friends = vbot('friends');

    if ($message['type'] === 'request_friend') {
        if ($message['info']['Content'] === 'echo') {
            // 同意添加好友
            $friends->approve($message);
        }
    }
});
```