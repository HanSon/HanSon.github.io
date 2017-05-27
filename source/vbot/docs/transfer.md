title: 转账
layout: vbot/page
---
### type

transfer

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
fee | string | 转账金额（单位：元）
transcationId | string | 转账ID
memo | string | 转账备注

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'transfer') {
        Text::send($message['from']['UserName'], $message['content'].' 转账金额： '.$message['fee'].' 转账流水号：'.$message['transaction_id'].' 备注：'.$message['memo']);
    }
});
```