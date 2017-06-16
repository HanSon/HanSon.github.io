title: 扩展开发
layout: vbot/page
---

在学习扩展开发前，请确保你已经对 Vbot 了如指掌，并且对扩展有了一定的认识。

## 开发一个属于自己的扩展！

接下来以开发一个 Hello-World 扩展为例

功能为 收到 hello 时 回复 world

若水平不错可直接跳过前面步骤，直接看 [撸码](extensiondevelop.html#撸码)

### Github 创建项目

![file](https://dn-phphub.qbox.me/uploads/images/201706/16/4486/PVACofmfMw.png)

### git clone

然后按步骤去初始化 git 和 composer

![file](https://dn-phphub.qbox.me/uploads/images/201706/16/4486/bySHbkDz5t.png)

最终composer.json 可参考 https://github.com/phpvbot/guess-number/blob/master/composer.json

在文件`.gitignore`中记得排除掉 composer.lock 以及 .idea （如果没有此文件可自行在项目根目录自行创建）

![file](https://dn-phphub.qbox.me/uploads/images/201706/16/4486/emNgO8ji4d.png)

### 撸码

在项目根目录新建一个 src 文件夹，新建 HelloWorld 的类，并继承 AbstractMessageHandler 

结构如图：

![file](https://dn-phphub.qbox.me/uploads/images/201706/16/4486/Bf994ghr2c.png)

#### 属性

属性都必须填写

- name 扩展的英文名称（多单词以下划线划分）
- zhName 扩展的中文名称
- author 作者名称
- version 版本号，默认为 1.0 （以后需跟随 github release 版本做变动）

#### 方法

扩展提供了两个必须实现的方法

- register 在系统对扩展进行注册时，会执行一遍且仅执行一遍
- handler 如 消息处理器 的setHandler方法一样，传入的是消息数组

最终实现结果：

```php
public function handler(Collection $collection)
{
    if ($collection['type'] === 'text' && $collection['content'] === 'hello') {
        if (($collection['fromType'] === 'Group' && $collection['isAt']) || $collection['fromType'] === 'Friend') {
            Text::send($collection['from']['UserName'], 'world');
        }
    }
}
```

### 发布

发布只需要提交代码到github并且发布 release 版本，详情可看 [如何创建一个自己的 Composer 库](https://laravel-china.org/articles/4982/how-do-i-create-my-own-composer-library)

## 加入官方扩展组

开发完毕后，可以把机器人拉入 Vbot 体验群 中进行测试，功能测试以及代码检测都过关，可以发邮件到 h@hanc.cc 进行申请，或者 QQ 群上申请均可以。

