title: 消息处理器
layout: vbot/page
---

消息处理器是处理消息的关键，也是 Vbot 的核心。

每次 Vbot 收到消息（聊天消息、系统消息等），都会回调消息处理器的方法，在消息处理器的方法内，你可以选择自行处理一些触发或回复的事项（如：插入数据库，触发邮件通知或回复消息等等）。

处理器中接受到的是一个 Illuminate\Support\Collection 类型的消息，你可以通过 `$message['type']` 等判断再进行不同的处理，更多消息详情可查阅 [消息](message.html)

{% note warn 注意 %}
在消息处理器中，请切勿执行一些非常耗时的工作或者长期 sleep，以免 cookie 过期导致掉线。
{% endnote %}

### 基本使用:

```php
use Hanson\Vbot\Foundation\Vbot;
use Illuminate\Support\Collection;

// ...

$vbot = new Vbot($config);

// 获取消息处理器实例
$messageHandler = $vbot->messageHandler;

// 收到消息时触发
$messageHandler->setHandler(function(Collection $message){
    Text::send($message['from']['UserName'], 'Hi! I'm Vbot');
});

// 一直触发
$messageHandler->setCustomHandler(function(){
    if (date('H') == 12) {
        Text::send('filehelper', '12 点');
    }
});
```

### setHandler Vs setCustomHandler

setHandler 为收到消息时触发

setCustomHandler 为当 Vbot 向微信服务器请求查询是否有最新消息时，无论是否有新消息都会触发，触发周期最长为 35 秒一次。