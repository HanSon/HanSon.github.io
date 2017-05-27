title: 联系人
layout: vbot/page
---

联系人中所有类均继承 [Collection](http://d.laravel-china.org/docs/5.4/collections) 进行存储（除了 Myself），更多相关用法可参考 [Collection 的用法](http://d.laravel-china.org/docs/5.4/collections)

### collection 的结构

你可以把 collection 理解为一个数组，这个数组包含着多个联系人，每个联系人的键名为 UserName 的值。


### 联系人 属性

```plain
Uin	        :	0
UserName	:	@2a2e7be886a215a698d1eaec204e9ca0f5d6213c5ead54d0e4a11bc4634a7e4a
NickName	:	HanSon
HeadImgUrl	:	/cgi-bin/mmwebwx-bin/webwxgetheadimg?seq=627494574&username=@@2a2e7be886a215a698d1eaec204e9ca0f5d6213c5ead54d0e4a11bc4634a7e4a&skey=@crypt_afd548f0_16e95af5ca8196715cb2fa2247b220eb
ContactFlag	:	3
MemberCount	:	0
MemberList	:	[]
RemarkName	:	
HideInputBarFlag:	0
Sex      	:	0
Signature	:	
VerifyFlag	:	0
OwnerUin	:	0
PYInitial	:	VBOTTYQ
PYQuanPin	:	Vbottiyanqun
RemarkPYInitial	:	
RemarkPYQuanPin	:	
StarFriend	:	0
AppAccountFlag	:	0
Statues     	:	1
AttrStatus	:	0
Province	:	
City	        :	
Alias	        :	
SnsFlag	        :	0
UniFriend	:	0
DisplayName	:	
ChatRoomId	:	@0a8781cccb0a6138c42f496c0cdb6728
KeyWord       	:	
EncryChatRoomId	:	
IsOwner     	:	1
```

### myself 属性

- $nickname 昵称
- $username 当前 session ID
- $uin 唯一的ID
- $sex 性别

### 获取实例

```php
// 好友实例
$friends = vbot('friends');

// 群实例
$groups = vbot('groups');

// 群成员实例
$members = vbot('members');

// 公众号实例
$officials = vbot('officials');

// 特殊账号实例
$specials = vbot('specials');

// 获取自己实例
$myself = vbot('myself');
```

### API

#### 通用注解

- $blur 是否模糊搜索

#### 通用API

这里指每个实例都能调用的通用方法，下面用 $friends 作为范例

##### 根据昵称获取对象

```php
$friends->getUsernameByNickname($nickname, $blur = false);
```

##### 根据备注获取对象

```php
$friends->getUsernameByRemarkName($remark, $blur = false);
```

##### 搜索出 UserName

search 为搜索的词，key 为要搜索的键

```php
$friends->getUsername($search, $key, $blur = false);
```

##### 搜索出 联系人

search 为搜索的词，key 为要搜索的键

```php
$friends->getUsername($search, $key, $blur = false);
```

##### 根据 UserName 获取联系人

当你无法得知该 username 所属时可使用 

```php
$friends->getAccount($username);
```

一般建议根据类型选择，如

```php
$groups->get($username);
```

##### 获取头像

```php
$data = $groups->getAvatar($username);
file_put_content('avatar.jpg', $data);
```

#### 好友 API

##### 设置备注

```php
$friends->setRemarkName($username, $remarkName);
```

##### 设置备注

$isStick 为 true 为置顶，否则相反

```php
$friends->setStick($username, $isStick = true);
```

##### 添加好友

仅能根据 username 添加好友，换言之，只能添加群成员为好友，content 为添加好友申请说明

```php
$friends->add($username, $content = null);
```

##### 同意添加好友

$message 为 message handler 接收到的 friend_request 消息，直接扔进来此处即可

```php
$friends->approve($message);
```

#### 群 API

##### 根据昵称获取群联系人

等同于 `$groups->getObject($nickname, 'NickName', $blur);`

```php
$groups->getGroupsByNickname($nickname, $blur = false);
```

##### 根据昵称搜索群成员

```php
$groups->getMembersByNickname($groupUsername, $memberNickname, $blur = false)
```

##### 创建群聊天

联系人的 username 数组

```php
$groups->create(array $contacts)
```

##### 删除群成员

移除群成员， $members 可以为单个 username 或者 数组

```php
$groups->deleteMember($groupUsername, $members)
```

##### 增加群成员

```php
$groups->addMember($groupUsername, $members)
```

##### 设置群名称

```php
$groups->setGroupName($group, $name)
```

