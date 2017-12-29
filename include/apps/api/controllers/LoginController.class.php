<?php

defined('IN_ECTOUCH') or die('Deny Access');

class LoginController extends CommonController{

	//***************************
	//  前台登录接口
	//***************************
    public function dologin(){
		/*session_destroy();
		$name = trim($_POST['username']);	//接受“会员账号”
		$pwd  = md5(md5($_POST['pwd']));	//接受“会员密码”
		if (!$name || !$pwd) {
			echo json_encode(array('status'=>0,'err'=>'请输入账号或密码！'));
			exit();
		}

		$user = M('user');
		$where['name'] = $name;
		$where['pwd'] = $pwd;
		$usrNum = $user->where($where)->find();
		///echo $user->_sql();exit;
		if($usrNum){
			@session_start();
			$_COOKIE['sessionid'] = session_id();
			//$_SESSION['sessionid']=session_id();
			$_SESSION['LoginCheck']=md5($name);
			$_SESSION['LoginName']=$name;
			$_SESSION['ID']=$usrNum['id'];
			$_SESSION['photo']=$usrNum['photo'];
			
			echo json_encode(array('status'=>1,'session'=>$_SESSION));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'账号密码错误！'));
			exit();
		}*/
		// 登录处理
        
		$username = I('post.username');
		$password = I('post.password');
		

		// 用户名是邮箱格式
		if (is_email($username)) {
			$where['email'] = $username;
			$username_try = $this->model->table('users')
					->field('user_name')
					->where($where)
					->getOne();
			$username = $username_try ? $username_try : $username;
		}

		// 用户名是手机格式
		if (is_mobile($username)) {
			$where['mobile_phone'] = $username;
			$username_try = $this->model->table('users')
					->field('user_name')
					->where($where)
					->getOne();
			$username = $username_try ? $username_try : $username;
		}

		if (self::$user->login($username, $password, false)) {
			model('Users')->update_user_info();
			model('Users')->recalculate_price();
			$user=array();
			$user['userid'] = $_SESSION['user_id'];
			$user['username'] = $_SESSION['user_name'];
			echo json_encode(array('status'=>1,'user'=>$user));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'账号密码错误！'));
			exit();
		}
        
	}

	//***************************
	//  授权登录接口
	//***************************
	public function authlogin(){
		$openid = $_POST['openid'];
		if (!$openid) {
			echo json_encode(array('status'=>0,'err'=>'授权失败！'.__LINE__));
			exit();
		}
		$con = array();
		$con['openid']=trim($openid);
		$user = $this->model->table('wechat_user')->field('uid,ect_uid')->where($con)->find();
		if ($user['uid']) {
			$err = array();
			$err['ID'] = intval($user['ect_uid']);
			$err['NickName'] = $_POST['NickName'];
			$err['HeadUrl'] = $_POST['HeadUrl'];
			echo json_encode(array('status'=>1,'arr'=>$err));
			exit();
		}else{
			$data = array();
			$data['nickname'] = $_POST['NickName'];
			$data['headimgurl'] = $_POST['HeadUrl'];
			$data['sex'] = $_POST['gender'];
			$data['openid'] = $openid;
			if (!$data['openid']) {
				echo json_encode(array('status'=>0,'err'=>'授权失败！'.__LINE__));
				exit();
			}
			/* 待做 添加会员信息 users */
			$username = 'wx_' . time().mt_rand(1, 99);
            $password = 'ecmoban';
			// 会员注册
			$domain = get_top_domain();
			if ($this->register($username, $password, $username . '@' . $domain, array()) !== false) {
				model('Users')->update_user_info();
			} else {
				echo json_encode(array('status'=>0,'err'=>'授权失败！'.__LINE__));
				exit();
			}
			$data['ect_uid'] = $_SESSION['user_id'];
			$res = model('Base')->model->table('wechat_user')->data($data)->insert();
			if ($res) {
				$err = array();
				$err['ID'] = intval($_SESSION['user_id']);
				$err['NickName'] = $data['nickname'];
				$err['HeadUrl'] = $data['headimgurl'];
				echo json_encode(array('status'=>1,'arr'=>$err));
				exit();
			}else{
				echo json_encode(array('status'=>0,'err'=>'授权失败！'.__LINE__));
				exit();
			}
		}
	}

	function register($username, $password, $email, $other = array()) {
        /* 检查注册是否关闭 */
        $shop_reg_closed = C('shop_reg_closed');
        if (!empty($shop_reg_closed)) {
            return false;
        }
		
        if (!ECTouch::user()->add_user($username, $password, $email)) {
            if (ECTouch::user()->error == ERR_INVALID_USERNAME) {
                ECTouch::err()->add(sprintf(L('username_invalid'), $username));
            } elseif (ECTouch::user()->error == ERR_USERNAME_NOT_ALLOW) {
                ECTouch::err()->add(sprintf(L('username_not_allow'), $username));
            } elseif (ECTouch::user()->error == ERR_USERNAME_EXISTS) {
                ECTouch::err()->add(sprintf(L('username_exist'), $username));
            } elseif (ECTouch::user()->error == ERR_INVALID_EMAIL) {
                ECTouch::err()->add(sprintf(L('email_invalid'), $email));
            } elseif (ECTouch::user()->error == ERR_EMAIL_NOT_ALLOW) {
                ECTouch::err()->add(sprintf(L('email_not_allow'), $email));
            } elseif (ECTouch::user()->error == ERR_EMAIL_EXISTS) {
                ECTouch::err()->add(sprintf(L('email_exist'), $email));
            } else {
                ECTouch::err()->add('UNKNOWN ERROR!');
            }

            //注册失败
            return false;
        } else {
            //注册成功

            /* 设置成登录状态 */
            ECTouch::user()->set_session($username);
            ECTouch::user()->set_cookie($username);

            /* 注册送积分 */
            $register_points = C('register_points');
            if (!empty($register_points)) {
                model('ClipsBase')->log_account_change($_SESSION['user_id'], 0, 0, C('register_points'), C('register_points'), L('register_points'));
            }
            
            model('Users')->update_user_info();      // 更新用户信息
            model('Users')->recalculate_price();     // 重新计算购物车中的商品价格

            return true;
        }
    }
	//***************************
	//  前台注册接口
	//***************************
  	/*public function register(){
	  	$name = trim($_POST['user']);
	  	$pwd  = md5(md5($_POST['pwd']));
	    $pwds = md5(md5($_POST['pwds']));
	   if($pwd!=$pwds) {
			echo json_encode(array('status'=>0,'err'=>'两次输入密码不同！'));
			exit();
		}

		$user=M('user');
		$where = array();
		$where['name']=$name;
		$count=$user->where($where)->count();
		if($count) {
			echo json_encode(array('status'=>0,'err'=>'用户名已被注册了！'));
			exit();
		}

		$check_mob=$user->where('tel='.trim($_POST['tel']))->count();
		if($check_mob) {
			echo json_encode(array('status'=>0,'err'=>'手机号已存在！'));
			exit();
		}
		$data = array();
		$data['name'] = $name;
        $data['qx'] = 6;

		$data['pwd']   = $pwd;
		$data['tel']   = trim($_POST['tel']);
		$data['addtime'] = time();
		$res = $user->add($data);
		if ($res) {
			$_SESSION['LoginName']=$name;
			$_SESSION['ID']=$res;
			$arr =array();
			$arr['status']=1;
			$arr['uid'] = $res;
			$arr['LoginName'] = $name;
			echo json_encode($arr);
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'注册失败！'));
			exit();
		}
	}*/

	//***************************
	//  获取sessionkey 接口
	//***************************
	public function getsessionkey(){
		$wx_config = C('weixin');
    	$appid = $wx_config['appid'];
    	$secret = $wx_config['secret'];
		$code = trim($_POST['code']);
		if (!$code) {
			echo json_encode(array('status'=>0,'err'=>'非法操作！'));
			exit();
		}

		if (!$appid || !$secret) {
			echo json_encode(array('status'=>0,'err'=>'非法操作！'.__LINE__));
			exit();
		}
		
		$get_token_url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$secret.'&js_code='.$code.'&grant_type=authorization_code';
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL,$get_token_url);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		$res = curl_exec($ch);  
		curl_close($ch);
		echo $res;
		exit();
	}
	//***************************
	//  获取sessionkey 接口
	//***************************
	/*public function getsessionkeys(){
		$wx_config = C('weixin');
    	$appid = 'wx5e3dd81af8bf352a';
    	$secret = '30421d00aaee201bc0400994defbeed7';

		$code = trim($_POST['code']);
		if (!$code) {
			echo json_encode(array('status'=>0,'err'=>'非法操作！'));
			exit();
		}

		$get_token_url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$secret.'&js_code='.$code.'&grant_type=authorization_code';
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL,$get_token_url);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		$res = curl_exec($ch);  
		curl_close($ch);  
		echo $res;
		exit();
	}*/

	//***************************
	//  前台退出登录接口
	//***************************
	/*public function logout(){
		unset($_SESSION['uid']);  
		unset($_SESSION['LoginName']);
		session_destroy();
		echo json_encode(array('status'=>1));
		exit();
	}*/
	
}