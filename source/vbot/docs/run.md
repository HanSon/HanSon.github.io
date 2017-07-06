title: 运行
layout: vbot/page
---

在配置完后，我们终于可以来执行玩耍了（摩拳擦掌壮）

## 撸码

接上安装和配置的步骤，简单来说就是

```php
mkdir vbot
cd vbot
composer require hanson/vbot
```

然后新建一个叫 run.php 的文件

```php
# run.php

require_once __DIR__.'/vendor/autoload.php';

$path = __DIR__.'/tmp/';

$options = [
   'path'     => $path,
   /*
    * swoole 配置项（执行主动发消息命令必须要开启，且必须安装 swoole 插件）
    */
   'swoole'  => [
       'status' => true,
       'ip'     => '127.0.0.1',
       'port'   => '8866',
   ],
   /*
    * 下载配置项
    */
   'download' => [
       'image'         => true,
       'voice'         => true,
       'video'         => true,
       'emoticon'      => true,
       'file'          => true,
       'emoticon_path' => $path.'emoticons', // 表情库路径（PS：表情库为过滤后不重复的表情文件夹）
   ],
   /*
    * 输出配置项
    */
   'console' => [
       'output'  => true, // 是否输出
       'message' => true, // 是否输出接收消息 （若上面为 false 此处无效）
   ],
   /*
    * 日志配置项
    */
   'log'      => [
       'level'         => 'debug',
       'permission'    => 0777,
       'system'        => $path.'log', // 系统报错日志
       'message'       => $path.'log', // 消息日志
   ],
   /*
    * 缓存配置项
    */
   'cache' => [
       'default' => 'redis', // 缓存设置 （支持 redis 或 file）
       'stores'  => [
           'file' => [
               'driver' => 'file',
               'path'   => $path.'cache',
           ],
           'redis' => [
               'driver'     => 'redis',
               'connection' => 'default',
           ],
       ],
   ],
   /*
    * 拓展配置
    * ==============================
    * 如果加载拓展则必须加载此配置项
    */
   'extension' => [
       // 管理员配置（必选），优先加载 remark_name
       'admin' => [
           'remark'   => '',
           'nickname' => '',
       ],
   ],
];

$vbot = new Hanson\Vbot\Foundation\Vbot($options);

$vbot->messageHandler->setHandler(function ($message) {
    Hanson\Vbot\Message\Text::send($message['from']['UserName'], 'Hi, I\'m Vbot!');
});

$vbot->server->serve();
```

新建完毕后，便可执行 php run.php {--session=自定义} , {} 内为选填项，不设置时框架默认设置一个随机6位字母的 session 值。

执行

```php
php run.php --session=vbot
```

或者你可以直接参考当前 Vbot 正在运行的例子： https://github.com/HanSon/my-vbot

PS:如果没有出现二维码请查看 terminal 的 ANSI color 设置