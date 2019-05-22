title: 监听器
layout: vbot/page
---

在 Vbot 运行的每个阶段，都会触发一个监听器，你可以选择是否进行某些个性化的处理。

### 获取实例:

```php
use Hanson\Vbot\Foundation\Vbot;
use Illuminate\Support\Collection;

// ...

$vbot = new Vbot($config);

// 获取监听器实例
$observer = $vbot->observer;
```

### API列表

##### 二维码监听器

在登录时会出现二维码需要扫码登录。而这个二维码链接也将传到二维码监听器中。
```php
$observer->setQrCodeObserver(function($qrCodeUrl){
    
});
```

##### 登录成功监听器

登录成功时回调。无论是第一次登录还是免扫码登录均会触发。
```php
$observer->setLoginSuccessObserver(function(){
    
});
```

##### 免扫码成功监听器

免扫码登录成功时回调。
```php
$observer->setReLoginSuccessObserver(function(){
    
});
```

##### 程序退出监听器

程序退出时回调。
```php
$observer->setExitObserver(function(){
    
});
```

##### 好友监听器

此回调仅在初始化好友时执行。

变量 $contacts 含有数组下表 'friends','groups','officials','special','members'  
```php
$observer->setFetchContactObserver(function(array $contacts){
    print_r($contacts['friends']);
    print_r($contacts['groups']);
    // ...
});
```

##### 消息处理前监听器

接收消息前回调。
```php
$observer->setBeforeMessageObserver(function(){
    
});
```

##### 异常监听器

当接收消息异常时，当系统判断为太久没从手机端打开微信时，则急需打开，时间过久将断开。
```php
$observer->setNeedActivateObserver(function(){
    
});
```

