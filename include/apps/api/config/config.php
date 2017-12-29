<?php

return array(
    'APP_STATE' => 1,
    'APP_NAME' => 'ECTOUCH',
    'APP_VER' => '1.0.2014.0520',
    'APP_AUTHOR' => 'ectouch team',
    'APP_ORIGINAL_PREFIX' => '',
    'APP_TABLES' => '',
	//微信配置参数
    'weixin'=>array(


        'appid' =>'wx6f49948c9a870320',			//微信appid
        'secret'=>'d58e0ce5479420ef2dffba9ba672d24b', //微信secret

        'mchid' => '',
        'key' => '',

        //这里是异步通知页面url，提交到项目的Pay控制器的notifyurl方法；
        'notify_url'=>'https://xxx.xxxx.com/index.php/Api/Wxpay/notify',

    ),
);
