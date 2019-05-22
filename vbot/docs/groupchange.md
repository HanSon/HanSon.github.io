title: 群组变动
layout: vbot/page
---
### type

group_change

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
action | string | ADD-增加成员 REMOVE-移除成员 RENAME-更改群名称 INVITE-被邀请进群 BE_REMOVE-被踢出群
inviter | string | 邀请者昵称（仅 ADD 时存在）
invited | string | 被邀请者昵称（仅 ADD 时存在）

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'group_change') {
        Text::send($message['from']['UserName'], '欢迎新人 '.$message['invited'].PHP_EOL.'邀请人：'.$message['inviter']);
    }
});
```