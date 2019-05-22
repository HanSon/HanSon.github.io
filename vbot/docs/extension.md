title: 扩展
layout: vbot/page
---

在新版本 2.0.1 开始，Vbot 开始以扩展的形式去增加业务上的处理，也让开发者们更加简单方便的去扩展自己的机器人功能

## 什么是扩展？

扩展是为了方便 Vbot 的使用者能够更加得心应手的增加一些业务上的功能，通过监听消息去实现不同的业务功能代码，并且以扩展的形式能够非常轻松的进行引入、安装。

## 扩展的分类

扩展分为官方扩展以及第三方扩展

官方扩展是指由官方人员经过审核、建议、测试后，功能正常、内容健康，并且经过开发者同意后并入官方扩展，安装官方扩展会有绝对的保障。

第三方扩展是指开发者自行开发，并没有经过官方审核的一些扩展。

简单来说，官方扩展就相当于 Google play， Apple store 里面的应用。

所有官方扩展都会在 github 中： https://github.com/phpvbot (请确保你要安装的扩展已经有release版本号，不然则为开发中) 

### 配置

在配置项，新增加了 extension 作为扩展的配置，消息扩展需要填写一个

```php
$config = [
    'log'      => ...
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
```

每个扩展都需要加载一个用户作为管理员，可以根据填写的 备注 或者 昵称 进行搜索，备注优先。 

### 使用

```php
use Hanson\Vbot\Foundation\Vbot;

// $option = [];

$vbot = new Vbot($option);

$vbot->messageExtension->load([
    // some extensions
]);

$vbot->server->serve();
```

`$vbot->messageExtension->load()` 负责接收一个扩展的数组

### 例子

我们用 guess-number 来举例

先在 vbot 根目录上进行安装

``` 
composer require vbot/guess-number
```

安装完毕后使用实例去读取

```
use Vbot\GuessNumber\GuessNumber;

$vbot->messageExtension->load([
    GuessNumber::class,
]);
```

### 指令

指令是指 **扩展管理员**或者**机器人本身** 在对机器人所在的群发送相关的指令消息，机器人会返回一定的信息或操作

![file](https://dn-phphub.qbox.me/uploads/images/201706/16/4486/8n7fO95MlX.png)

每个扩展都有一个英文的名称，如 猜数字 的名称为 `guess_number`

以下指令用 `extension` 代替，具体需根据每个扩展的名称进行发送

#### 查询扩展状态

`extension info`

#### 更改扩展状态

`extension on/off`