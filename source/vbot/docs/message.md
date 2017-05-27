title: 消息
layout: vbot/page
---

Vbot 的内置处理使消息变得多种多样，也更便于程序的灵活处理。

所有消息类都继承于 Illuminate\Support\Collection，Collection 实现了 ArrayAccess 接口，你把消息当成数组即可，取出属性时只需把属性名称当作数组下标 [如何获取属性值？](#如何获取属性值？)。

每种消息都可能含有各自独特的属性，但它们都含有[基础属性](#基础属性)。

{% note %}
每次接受到的消息都会存入缓存中，两分钟后过期，方便取出撤回消息。
{% endnote %}

### 基础属性

参数 | 类型 | 描述
--- | --- | ---
type | string | 消息类型（每种消息都对应一个 type 类型）
from | array | 消息来源
sender | array | 群消息发送者
content | string | 经过处理显示在控制台的消息
message | string | 转格式后的消息
time | Carbon | 发送时间
fromType | string | 消息发送者类型
raw | array | 消息原始数据（完全不经处理的原始数据）

##### message vs content vs raw ?

- raw. 是微信返回的原始数据，其中夹杂着大量无用的数据， Vbot 在处理 raw 时会取出有用的数据作为消息的属性
- message. message 是经过 raw 处理而来的，例如对 <br>标签、XML 的转移
- content. content 是为了处理不便于在控制台展示的数据。如 [表情] [视频] [分享] 等等

##### fromType

消息发送者的类型

- System 系统消息
- Self 自己发送的消息
- Group 群组消息
- Contact 联系人消息
- Official 公众号消息
- Special 特殊账号消息
- Unknown 未知消息

##### from & sender

这个结构可参考 [好友](friends.html) 以及 [群成员](members.html)

##### 如何获取属性值？

举例：

- 消息类型： `$message['type']`
- 消息来源昵称： `$message['from']['NickName']` (更多详情可查阅 [联系人](contacts.html))