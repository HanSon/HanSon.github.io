title: 安装
layout: vbot/page
---

## 安装

你可以通过 git 或者 composer（推荐） 去安装 vbot 。

### 环境要求

- PHP >= 7.0.0
- [PHP fileinfo 扩展](http://php.net/manual/en/book.fileinfo.php) 储存文件需要用到
- [PHP gd 扩展](http://php.net/manual/en/book.image.php) 控制台显示二维码
- [PHP SimpleXML 扩展](https://secure.php.net/manual/en/book.simplexml.php) 解析XML

### 安装前提

安装 Vbot 相当简单。然而在安装前，你必须检查电脑中是否已安装 composer：

- [Composer](https://laravel-china.org/topics/4484/composer-mirror-use-help)

### 安装方式

###### composer
``` bash
mkdir vbot
cd vbot
composer require hanson/vbot
```

