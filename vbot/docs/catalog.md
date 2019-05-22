title: 目录
layout: vbot/page
---

在配置中设置了 path 之后，便会生成一系列的文件夹

### 缓存目录

``` plain
tmp
├── cache
|   └── 8d （缓存文件）
├── cookies
|   └── vbot （cookie文件）
├── emoticons （表情库）
├── log （日志）
|   └── 3361479329 （uin日志目录）
|      ├── message.log （消息日志）
|      └── vbot.log （系统日志）
└── users （用户资源目录）
    └── 3361479329 
       ├── emoticon
       ├── image
       ├── video
       ├── voice
       └── file
```

在 Vbot 的 example 中，Vbot 自带了一个比较标准化文件结构，方便整理不同的业务和不同类型消息时的处理

### 建议结构

``` plain
.
├── Vbot.php 执行实例
├── Observer.php 监听器
├── MessageHandler.php 消息处理器
├── Handler 细分消息处理器
    ├── Contact 联系人维度的处理器
    └── Type 消息类型维度的处理器
```