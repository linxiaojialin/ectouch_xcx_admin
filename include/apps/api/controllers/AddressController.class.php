<?php
defined('IN_ECTOUCH') or die('Deny Access');

class AddressController extends CommonController {
	//***************************
	//  获取会员地址数据接口
	//***************************
    public function index(){
        $user_id=intval($_REQUEST['user_id']);
        if (!$user_id){
            echo json_encode(array('status'=>0,'err'=>'网络异常.'.__LINE__));
            exit();
        }

    	//所有地址
    	/*$addressModel = M('address');
		$adds_list=$addressModel->where('uid='.intval($user_id))->order('is_default desc,id desc')->select();*/
    	$consignee_list = model('Users')->get_consignee_list($user_id, 0);
		if ($consignee_list) {
			foreach ($consignee_list as $k => $v) {
				$address = '';
				if ($v['province']) {
					$address .= model('RegionBase')->get_region_name($v['province']);
				}
				if ($v['city']) {
					$address .= model('RegionBase')->get_region_name($v['city']);
				}
				if ($v['district']) {
					$address .= model('RegionBase')->get_region_name($v['district']);
				}
				$consignee_list[$k]['address'] = $address . ' ' . $v['address'];
			}
		}
    	//所有省份
		// $china_city=M("china_city");
  //       $sheng = $china_city->where('tid=0')->field('id,name')->select();

		echo json_encode(array('status'=>1,'adds'=>$consignee_list,'sheng_list'=>$sheng));
		exit();
    }

    //***************************
    //  会员添加地址接口
    //***************************
    public function add_adds(){
        $user_id=intval($_REQUEST['user_id']);
        if (!$user_id){
            echo json_encode(array('status'=>0,'err'=>'网络异常.'.__LINE__));
            exit();
        }

        //接收ajax传过来的数据
        //data:{user_id:uid,receiver:rec,tel:tel,sheng:sheng,city:city,quyu:quyu,adds:address,code:code}
        $data = array();
        $data['consignee'] = trim($_POST['receiver']);
        $data['mobile'] = trim($_POST['tel']);
		$data['province'] = 1;
        $data['province'] = intval($_POST['sheng']);
        $data['city'] = intval($_POST['city']);
        $data['district'] = intval($_POST['quyu']);
		$data['address_id'] = intval($_POST['address_id']);
        $data['address'] = $_POST['adds'];
        //$data['code'] = $_POST['code'];
        $data['user_id'] = intval($user_id);
        if (!$data['consignee'] || !$data['mobile'] || !$data['address']) {
            echo json_encode(array('status'=>0,'err'=>'请先完善信息后再提交.'));
            exit();
        }
        if (!$data['province'] || !$data['city'] || !$data['district']) {
            echo json_encode(array('status'=>0,'err'=>'请选择省市区.'));
            exit();
        }
		
        /*$check_id = M('address')->where($data)->getField('id');
        if ($check_id) {
            echo json_encode(array('status'=>0,'err'=>'该地址已经添加了.'));
            exit();
        }*/
        $province = model('RegionBase')->get_region_name($data['province']);
        $city_name = model('RegionBase')->get_region_name($data['city']);
        $quyu_name = model('RegionBase')->get_region_name($data['district']);
        $address_xq = $province.' '.$city_name.' '.$quyu_name.' '.$data['address'];
        $res = model('Users')->update_address($data);
        if ($res) {
            $arr = array();
            $arr['addr_id'] = $res;
            $arr['rec'] = $data['consignee'];
            $arr['tel'] = $data['mobile'];
            $arr['addr_xq'] = $address_xq;
            echo json_encode(array('status'=>1,'add_arr'=>$arr));
            exit();
        }else{
            echo json_encode(array('status'=>0,'err'=>'操作失败.'));
            exit();
        }
    }

    //***************************
    //  会员获取单个地址接口
    //***************************
    public function details(){
        $addr_id = intval($_REQUEST['addr_id']);
        if (!$addr_id) {
            echo json_encode(array('status'=>0));
            exit();
        }

        $address = M('address')->where('id='.intval($addr_id))->find();
        if (!$address) {
            echo json_encode(array('status'=>0));
            exit();
        }
        $arr=array();
        $arr['status']=1;
        $arr['addr_id']=$address['id'];
        $arr['name'] = $address['name'];
        $arr['tel'] = $address['tel'];
        $arr['addr_xq'] = $address['address_xq'];
        echo json_encode($arr);
        exit();
    }

    //***************************
    //  会员删除地址接口
    //***************************
    public function del_adds(){
        $user_id=intval($_REQUEST['user_id']);
        if (!$user_id){
            echo json_encode(array('status'=>0,'err'=>'网络异常.'.__LINE__));
            exit();
        }

        $id_arr = intval($_POST['id_arr']);
        if ($id_arr) {
            $res = model('Users')->drop_consignee($id_arr,$user_id);
            if ($res) {
                echo json_encode(array('status'=>1));
                exit();
            }else{
                echo json_encode(array('status'=>0,'err'=>'操作失败.'));
                exit();
            }
        }else{
            echo json_encode(array('status'=>0,'err'=>'没有找到要删除的数据.'));
            exit();
        }
    }

    //***************************
    //  获取省份数据接口
    //***************************
    public function get_province(){
        //所有省份
        /*$china_city=M("china_city");
        $list = $china_city->where('tid=0')->field('id,name')->select();*/
		$list = model('RegionBase')->get_regions(1, 1);
        echo json_encode(array('status'=>1,'list'=>$list));
        exit();
    }

    //***************************
    //  获取城市数据接口
    //***************************
    public function get_city(){
        $sheng=intval($_REQUEST['sheng']);
        if (!$sheng){
            echo json_encode(array('status'=>0,'err'=>'请选择省份.'.__LINE__));
            exit();
        }
        //所有省份
        /*$china_city=M("china_city");
        $list = $china_city->where('tid=0')->field('id,name')->select();
        $city = $china_city->where('tid='.intval($list[$sheng-1]['id']))->field('id,name')->select();*/
		$city = model('RegionBase')->get_regions(2,$sheng);
		echo json_encode(array('status'=>1,'city_list'=>$city));
        exit();
    }

    //***************************
    //  获取区域数据接口
    //***************************
    public function get_area(){
        $city=intval($_REQUEST['city']);
        if (!$city){
            echo json_encode(array('status'=>0,'err'=>'请选择城市.'.__LINE__));
            exit();
        }
        
        //所有省份
        /*$china_city=M("china_city");
        $list = $china_city->where('tid='.intval($_REQUEST['sheng']))->field('id,name')->select();
        $area = $china_city->where('tid='.intval($list[$city-1]['id']))->field('id,name')->select();*/
		$area = model('RegionBase')->get_regions(3,$city);
        echo json_encode(array('status'=>1,'area_list'=>$area));
        exit();
    }

    //***************************
    //  获取邮政编号接口
    //***************************
    public function get_code(){
        $quyu=intval($_REQUEST['quyu']);
        
        //所有省份
        $china_city=M("china_city");
        $list = $china_city->where('tid='.intval($_REQUEST['city']))->field('id,name')->select();
        $code = $china_city->where('id='.intval($list[$quyu-1]['id']))->getField('code');
        echo json_encode(array('status'=>1,'code'=>$code,'area'=>intval($list[$quyu-1]['id'])));
        exit();
    }

    //***************************
    //  设置默认地址
    //***************************
    public function set_default(){
        $uid=intval($_REQUEST['uid']);
        if (!$uid){
            echo json_encode(array('status'=>0,'err'=>'登录状态异常.'));
            exit();
        }

        $addr_id = intval($_REQUEST['addr_id']);
        if (!$addr_id) {
            echo json_encode(array('status'=>0,'err'=>'地址信息错误.'));
            exit();
        }
        //修改默认状态
        $check = M('address')->where('uid='.intval($uid).' AND is_default=1')->find();
        if ($check) {
            $up1= M('address')->where('uid='.intval($uid))->save(array('is_default'=>0));
            if (!$up1) {
                echo json_encode(array('status'=>0,'err'=>'设置失败.'.__LINE__));
                exit();
            }
        }
        
        $up2 = M('address')->where('id='.intval($addr_id).' AND uid='.intval($uid))->save(array('is_default'=>1));
        if ($up2) {
            echo json_encode(array('status'=>1));
            exit();
        }else{
            echo json_encode(array('status'=>0,'err'=>'设置失败.'.__LINE__));
            exit();
        }
    }

}