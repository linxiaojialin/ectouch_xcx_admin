<?php

defined('IN_ECTOUCH') or die('Deny Access');

class ShoppingController extends CommonController {

	//***************************
	//  会员获取购物车列表接口
	//***************************
	public function index(){
		/*$qz=C('DB_PREFIX');
        $shopping=M("shopping_char");
        $shangchang=M("shangchang");
        $product=M("product");*/
		$user_id = intval($_REQUEST['user_id']);
		if (!$user_id) {
			echo json_encode(array('status'=>0));
			exit();
		}

        /*$shop = $shopping->where(''.$qz.'shopping_char.uid='.intval($user_id))->join('left join __SHANGCHANG__ on __SHANGCHANG__.id = __SHOPPING_CHAR__.shop_id')->distinct(''.$qz.'shopping_char.shop_id')->field(''.$qz.'shangchang.id,'.$qz.'shangchang.name,'.$qz.'shangchang.logo')->select();
		foreach ($shop as $n=>$v){
			$shop[$n]['logo'] = __DATAURL__.$v['logo'];
        	$shop[$n]['slist']=$shopping->where(''.$qz.'shopping_char.uid='.intval($user_id).' and '.$qz.'shopping_char.shop_id='.intval($v['id']))->join('LEFT JOIN __PRODUCT__ ON __SHOPPING_CHAR__.pid = __PRODUCT__.id')->field(''.$qz.'shopping_char.id,'.$qz.'product.id as proid,'.$qz.'product.name,'.$qz.'product.num as pnum,'.$qz.'product.price_yh,'.$qz.'product.photo_x,'.$qz.'shopping_char.num,'.$qz.'shopping_char.buff,'.$qz.'shopping_char.price')->select();
			//获取产品规格名称
			foreach ($shop[$n]['slist'] as $k=>$vl){
        		$key=explode(',', $vl['buff']);
        		foreach ($key as $m=>$val){
        			$buff_text=M('guige')->where('id='.intval($val))->getField('name');
        			$shop[$n]['slist'][$k]['g_name'] .= '&nbsp;'.$buff_text;
        		}

        		$shop[$n]['slist'][$k]['photo_x'] = __DATAURL__.$vl['photo_x'];
        	}
		}*/

		/*$cart = $shopping->where('uid='.intval($user_id))->field('id,uid,pid,price,num')->select();
        foreach ($cart as $k => $v) {
        	$pro_info = $product->where('id='.intval($v['pid']))->field('name,photo_x')->find();
        	$cart[$k]['pro_name']=$pro_info['name'];
        	$cart[$k]['photo_x']=__DATAURL__.$pro_info['photo_x'];
        }*/
		//$flow_type = CART_GENERAL_GOODS;
        // 取得商品列表，计算合计
        $cart = model('Order')->get_cart_goods($user_id);
        //$this->assign('goods_list', $cart_goods ['goods_list']);
        //$this->assign('total', $cart_goods ['total']);
		
        echo json_encode(array('status'=>1,'cart'=>$cart));
		exit();
    }

	//购物车商品删除
	public function delete(){
		//$shopping=M("shopping_char");
		$cart_id=intval($_REQUEST['cart_id']);
		//删除购物车中的商品
        model('Flow')->flow_drop_cart_goods($cart_id);
		/*$check_id = $shopping->where('id='.intval($cart_id))->getField('id');
		if (!$check_id) {
			echo json_encode(array('status'=>1));
			exit();
		}

	    $res = $shopping->where('id ='.intval($cart_id))->delete();*/ // 删除
		/*if($res){
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0));
			exit();
		}*/
	}

	//***************************
	//  会员修改购物车数量接口
	//***************************
	public function up_cart(){
		//$shopping=M("shopping_char");
		$uid = intval($_REQUEST['user_id']);
		$cart_id = intval($_REQUEST['cart_id']);
		$num=intval($_REQUEST['num']);

		if (!$uid || !$cart_id || !$num) {
			echo json_encode(array('status'=>0,'err'=>'网络异常.'.__LINE__));
			exit();
		}
		$key = $cart_id;
		$val = $num;
		
		// 查询：
		$condition = " rec_id='$key' AND user_id='" . $uid . "'";
		$goods = $this->model->table('cart')->field('goods_id,goods_attr_id,product_id,extension_code')->where($condition)->find();

		$sql = "SELECT g.goods_name,g.goods_number " . "FROM " . $this->model->pre . "goods AS g, " . $this->model->pre . "cart AS c " . "WHERE g.goods_id =c.goods_id AND c.rec_id = '$key'";
		$res = $this->model->query($sql);
		$row = $res[0];
		// 查询：系统启用了库存，检查输入的商品数量是否有效
		if (intval(C('use_storage')) > 0 && $goods ['extension_code'] != 'package_buy') {
			if ($row ['goods_number'] < $val) {
				$result ['message'] = sprintf(L('stock_insufficiency'), $row ['goods_name'], $row ['goods_number'], $row ['goods_number']);
				echo json_encode(array('status'=>0,'err'=>$result ['message']));
				exit();
			}
			/* 是货品 */
			$goods ['product_id'] = trim($goods ['product_id']);
			if (!empty($goods ['product_id'])) {
				$condition = " goods_id = '" . $goods ['goods_id'] . "' AND product_id = '" . $goods ['product_id'] . "'";
				$product_number = $this->model->table('products')->field('product_number')->where($condition)->getOne();
				if ($product_number < $val) {
					
					$result ['message'] = sprintf(L('stock_insufficiency'), $row ['goods_name'], $product_number, $product_number);
					echo json_encode(array('status'=>0,'err'=>$result ['message']));
					exit();
				}
			}
		} elseif (intval(C('use_storage')) > 0 && $goods ['extension_code'] == 'package_buy') {
			if (model('Order')->judge_package_stock($goods ['goods_id'], $val)) {
				
				$result ['message'] = L('package_stock_insufficiency');
				echo json_encode(array('status'=>0,'err'=>$result ['message']));
				exit();
			}
		}
		/* 查询：检查该项是否为基本件 以及是否存在配件 */
		/* 此处配件是指添加商品时附加的并且是设置了优惠价格的配件 此类配件都有parent_idgoods_number为1 */
		$sql = "SELECT b.goods_number,b.rec_id
		FROM " . $this->model->pre . "cart a, " . $this->model->pre . "cart b
			WHERE a.rec_id = '$key'
			AND a.user_id = '" . $uid . "'
		AND a.extension_code <>'package_buy'
		AND b.parent_id = a.goods_id
		AND b.user_id = '" . $uid . "'";

		$offers_accessories_res = $this->model->query($sql);

		// 订货数量大于0
		if ($val > 0) {
			/* 判断是否为超出数量的优惠价格的配件 删除 */
			$row_num = 1;
			foreach ($offers_accessories_res as $offers_accessories_row) {
				if ($row_num > $val) {
					$sql = "DELETE FROM" . $this->model->pre . "cart WHERE user_id = '" . $uid . "' " . " AND rec_id ='" . $offers_accessories_row ['rec_id'] . "' LIMIT 1";
					$this->model->query($sql);
				}

				$row_num++;
			}

			/* 处理超值礼包 */
			if ($goods ['extension_code'] == 'package_buy') {
				// 更新购物车中的商品数量
				$sql = "UPDATE " . $this->model->pre . "cart SET goods_number= '$val' WHERE rec_id='$key' AND user_id = '" . $uid . "'";
			} /* 处理普通商品或非优惠的配件 */ else {
				$attr_id = empty($goods ['goods_attr_id']) ? array() : explode(',', $goods ['goods_attr_id']);
				$goods_price = model('GoodsBase')->get_final_price($goods ['goods_id'], $val, true, $attr_id);

				// 更新购物车中的商品数量
				$sql = "UPDATE " . $this->model->pre . "cart SET goods_number= '$val', goods_price = '$goods_price' WHERE rec_id='$key' AND user_id = '" . $uid . "'";
			}
		}  // 订货数量等于0
		else {
			/* 如果是基本件并且有优惠价格的配件则删除优惠价格的配件 */
			foreach ($offers_accessories_res as $offers_accessories_row) {
				$sql = "DELETE FROM " . $this->model->pre . "cart WHERE user_id = '" . $uid . "' " . "AND rec_id ='" . $offers_accessories_row ['rec_id'] . "' LIMIT 1";
				$this->model->query($sql);
			}

			$sql = "DELETE FROM " . $this->model->pre . "cart WHERE rec_id='$key' AND user_id = '" . $uid . "'";
		}

		$res = $this->model->query($sql);
		/* 删除所有赠品 */
		$sql = "DELETE FROM " . $this->model->pre . "cart WHERE user_id = '" . $uid . "' AND is_gift <> 0";
		$this->model->query($sql);

		/*$check = $shopping->where('id='.intval($cart_id))->find();
		if (!$check) {
			echo json_encode(array('status'=>0,'err'=>'购物车信息错误！'));
			exit();
		}

		//检测库存
		$pro_num = M('product')->where('id='.intval($check['pid']))->getField('num');
		if($num>intval($pro_num)){
			echo json_encode(array('status'=>0,'err'=>'库存不足！'));
			exit();
		}
		
		$data=array();
		$data['num']=$num;

		$res = $shopping->where('id ='.intval($cart_id).' AND uid='.intval($uid))->save($data);*/
		if ($res) {
			echo json_encode(array('status'=>1,'succ'=>'操作成功!'));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'操作失败.'));
			exit();
		}
		
	}

	//多个购物车商品删除
	public function qdelete(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'网络异常，请稍后再试.'));
			exit();
		}
		$shopping=M("shopping_char");
		$cart_id=trim($_REQUEST['cart_id'],',');
		if (!$cart_id) {
			echo json_encode(array('status'=>0,'err'=>'网络错误，请稍后再试.'));
			exit();
		}

	    $res = $shopping->where('id in ('.$cart_id.') AND uid='.intval($uid))->delete(); // 删除
		if($res){
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'操作失败.'));
			exit();
		}
	}


	//添加购物车
	public function add(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'登录状态异常.'));
			exit();
		}

		$goods_id = intval($_REQUEST['goods_id']);
		$number = intval($_REQUEST['number']);
		if (!intval($goods_id) || !intval($number)) {
			echo json_encode(array('status'=>0,'err'=>'参数错误.'));
			exit();
		}
		$product_spec = explode(',',trim($_REQUEST['spec']));
		$parent = 0;
		// 查询：系统启用了库存，检查输入的商品数量是否有效
        // 查询
        $arrGoods = $this->model->table('goods')->field('goods_name,goods_number,extension_code')->where('goods_id =' . $goods_id)->find();
        $goodsnmber = model('Users')->get_goods_number($goods_id);
        $goodsnmber+=$number;
		if (intval(C('use_storage')) > 0 && $arrGoods ['extension_code'] != 'package_buy') {
            if ($arrGoods ['goods_number'] < $goodsnmber) {
                $result['message'] = sprintf(L('stock_insufficiency'), $arrGoods ['goods_name'], $arrGoods ['goods_number'], $arrGoods ['goods_number']);
                if (C('use_how_oos') == 1){
                    $result['message'] =L('oos_tips');
                }
                echo json_encode(array('status'=>0,'err'=>$result['message']));
            }
        }
		// 检查：商品数量是否合法
        if (!is_numeric($number) || intval($number) <= 0) {
            $result ['message'] = L('invalid_number');
        } else {
            // 更新：添加到购物车
            $res = model('Order')->addto_cart($uid,$goods_id, $number, $product_spec, $parent);
                
        }
		
		if($res['suc']){
			echo json_encode(array('status'=>1)); //该商品已成功加入您的购物车
			exit;
		}else{
			echo json_encode(array('status'=>0,'err'=>$res['content']));
			exit;
		}
	}


	//***************************
	//  会员立即购买下单接口
	//***************************
	public function check_shop(){
		$cart_id = trim($_REQUEST['cart_id'],',');
		$id=explode(',',$cart_id);
		if (!$cart_id) {
			echo json_encode(array('status'=>0));
			exit();
		}

		foreach ($id as $k=>$v){
			$shoop[$k]=M("shopping_char")->where('id ='.intval($v))->field('shop_id,pid')->find();
        }

		foreach($shoop as $key => $value){
			$result[$key] = M("product")->where('id='.intval($value['pid']))->field('id,price,price_yh')->select();
			$price[] = i_array_column($result[$key], 'price_yh');
		}
		//dump($price);exit;
		foreach($price as $keys => $va){
			$str .= implode(",", $va).",";
		}
		$str = trim($str, ",");
		$parr = explode(",", $str);
		if(array_sum($parr) && in_array("0", $parr)){
			echo json_encode(array('status'=>0));
			exit();
		}
		
		$names = i_array_column($shoop, 'shop_id');
		
		$arr=array_unique($names);
		$val= sizeof($arr);
		if($val=='1'){
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>2));
			exit();
		}	 
	}

	//购物车添加。删除检测公共方法
	public function check_cart($pid){
		//检查产品是否存在或删除
		$check_info = M('product')->where('id='.intval($pid).' AND del=0 AND is_down=0')->find();
		if (!$check_info) {
			return array('status'=>0,'err'=>'商品不存在或已下架.');
		}

		return array('status'=>1);
	}   

    /*
       去除HTNL标签
    */
    public function html_entity($array){
    	foreach ($array as $key => $value) {
        	$array[$key]['content'] = strip_tags(html_entity_decode($value['content']));
        }
        return $array;
    }

}