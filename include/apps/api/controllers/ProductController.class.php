<?php
// 本类由系统自动生成，仅供测试用途

defined('IN_ECTOUCH') or die('Deny Access');

class ProductController extends CommonController {
	//***************************
	//  获取商品详情信息接口
	//***************************
    public function index(){
		
		$pro_id = intval($_REQUEST['pro_id']);
		
		if (!$pro_id) {
			echo json_encode(array('status'=>0,'err'=>'商品不存在或已下架！'));
			exit();
		}
		$pro = model('Goods')->get_goods_info($pro_id);
		if(!$pro){
			echo json_encode(array('status'=>0,'err'=>'商品不存在或已下架！'.__LINE__));
			exit();
		}
		
		/*$pro['photo_x'] =__DATAURL__.$pro['photo_x'];
		$pro['photo_d'] = __DATAURL__.$pro['photo_d'];
		$pro['brand'] = M('brand')->where('id='.intval($pro['brand_id']))->getField('name');
		$pro['cat_name'] = M('category')->where('id='.intval($pro['cid']))->getField('name');*/

		//图片轮播数组
		/*$img=explode(',',trim($pro['photo_string'],','));
		$b=array();
		if ($pro['photo_string']) {
			foreach ($img as $k => $v) {
				$b[] = __DATAURL__.$v;
			}
		}else{
			$b[] = $pro['photo_d'];
		}
		$pro['img_arr']=$b;*///图片轮播数组
		// 商品相册
        $pro['img_arr']= model('GoodsBase')->get_goods_gallery($pro_id);
		
		//处理产品属性
		/*$catlist=array();
		if($pro['pro_buff']){//如果产品属性有值才进行数据组装
			$pro_buff = explode(',',$pro['pro_buff']);
			$commodityAttr=array();//产品库还剩下的产品规格
			$attrValueList=array();//产品所有的产品规格
			foreach($pro_buff as $key=>$val){
				$attr_name = M('attribute')->where('id='.intval($val))->getField('attr_name');
				$guigelist=M('guige')->where("attr_id=".intval($val).' AND pid='.intval($pro['id']))->field("id,name")->select();
				$ggss = array();
				$gg=array();
				foreach ($guigelist as $k => $v) {
					$gg[$k]['attrKey']=$attr_name;
					$gg[$k]['attrValue']=$v['name'];
					$ggss[] = $v['name'];
				}
				$commodityAttr[$key]['attrValueList'] = $gg;
				$attrValueList[$key]['attrKey']=$attr_name;
				$attrValueList[$key]['attrValueList']=$ggss;
			}
		}*/
		/*$pro['goods_desc'] = preg_replace("/src=\"\//", __HOST__ . '/', $pro['goods_desc']);*/
		$properties = model('Goods')->get_goods_properties($pro_id);
		$content = str_replace('/ectouch', __URL__, $pro['goods_desc']);
		$pro['goods_desc']=html_entity_decode($content, ENT_QUOTES , 'utf-8');
		foreach($properties['spe'] as $key=>$val){
			if($val['values']){
				foreach($val['values'] as $k=>$item){
					if($k == 0){
						$properties['spe'][$key]['values'][$k]['checked'] = true;
					}else{
						$properties['spe'][$key]['values'][$k]['checked'] = false;
					}
				}
			}
		}
		//检测产品是否收藏
		/*$col = M('product_sc')->where('uid='.intval($_REQUEST['uid']).' AND pid='.intval($pro_id))->getField('id');
		$this->model->table('collect_goods')->where('user_id='.intval($_REQUEST['uid']).' AND goods_id='.intval($pro_id))->count();
		if ($col) {
			$pro['collect']= 1;
		}else{
			$pro['collect']= 0;
		}*/
		echo json_encode(array('status'=>1,'pro'=>$pro,'properties'=>$properties));
		exit();

	}

	//***************************
	//  获取商品详情接口
	//***************************
	public function details(){
		header('Content-type:text/html; Charset=utf8');
		$pro_id = intval($_REQUEST['pro_id']);
		$pro = M('product')->where('id='.intval($pro_id).' AND del=0 AND is_down=0')->find();
		if(!$pro){
			echo json_encode(array('status'=>0,'err'=>'商品不存在或已下架！'));
			exit();
		}
		//$content = preg_replace("/width:.+?[\d]+px;/",'',$pro['content']);
		$content = htmlspecialchars_decode($pro['content']);
		echo json_encode(array('status'=>1,'content'=>$content));
		exit();
	}

	//***************************
	//  下单信息预处理
	//  处理产品信息，用户地址
	//  uid:uid,pid:pro_id,aid:addr_id,sid:shop_id,buff:buff,num:num,price_yh:price_yh,p_price:p_price,price:z_price,type:pay_type,yunfei:yun_id,cart_id:cart_id,remark:ly
	//***************************
	public function make_order(){
		header('Content-type:text/html; Charset=utf8');
		//产品
		$pro_id = I('request.pro_id');
		//$uid=I('request.uid');
		$uid=1;
		//获得产品信息
		$pro = M('product')->field('id,shop_id,photo_x,name,price,price_yh')->where('id='.intval($pro_id).' AND del=0 AND is_down=0')->find();
		$pro['photo_x']=__DATAURL__.$pro['photo_x'];
		if(!$pro){
			echo json_encode(array('status'=>0,'err'=>'商品不存在或已下架！'));
			exit();
		}
		//获取地址
		$address="";
		$addr=M("address")->where("uid=$uid")->select();
		if($addr){
			foreach($addr as $k=>$v){
				if($v['is_default']==1){
					$address=$address[$k];
				}
			}
			if(!$address){
				$address=$addr[0];
			}
		}

		echo json_encode(array('status'=>1,'pro'=>$pro,'address'=>$address));
		exit();
	}

	//***************************
	//  获取商品详情接口
	//***************************
	public function get_buff(){
		$pro = M('product')->where('id='.intval($_POST['pro_id']).' AND del=0 AND is_down=0')->find();
		if(!$pro){
			echo json_encode(array('status'=>0,'err'=>'商品不存在或已下架！'.__LINE__));
			exit();
		}
		//处理产品属性
		$catlist=array();
		if($pro['pro_buff']){//如果产品属性有值才进行数据组装
			$pro_buff = explode(',',$pro['pro_buff']);
			$buff=array();
			foreach($pro_buff as $key=>$val){
				$attr_name = M('attribute')->where('id='.intval($val))->getField('attr_name');
				$guigelist=M('guige')->where("attr_id=".intval($val).' AND pid='.intval($pro['id']))->field("id,name")->select();
				$gg = array();$ggss = array();
				foreach ($guigelist as $k => $v) {
					$gg['attrKey'] = $attr_name;
					$gg['attr_id'] = $val;
					$gg['attrValue'] = $v['name'];
					$gg['selectedValue'] = $v['id'];
					$ggss[] = $gg;
				}
				$buff['attrValueList']=$ggss;
				$catlist[] = $buff;
			}
			echo json_encode(array('status'=>1,'buff'=>$catlist));
			exit();
		}else{
			echo json_encode(array('status'=>0));
			exit();
		}
	}

	//***************************
	//  获取商品列表接口
	//***************************
   	public function lists(){
 		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		$brand_id = intval($_POST['brand_id']);
 		// $id=44;
		$default_sort_order_type = C('sort_order_type') == '0' ? 'sort_order' : (C('sort_order_type') == '1' ? 'shop_price' : 'last_update');
		$default_sort_order_method = C('sort_order_method') == '0' ? 'DESC' : 'ASC';
 		$sort = (isset($_REQUEST['type']) && in_array(trim(strtolower($_REQUEST['type'])), array(
                'sort_order',
                'shop_price',
                'last_update',
                'click_count',
                'sales_volume'
            ))) ? trim($_REQUEST['type']) : $default_sort_order_type;
		$order = (isset($_REQUEST['order']) && in_array(trim(strtoupper($_REQUEST['order'])), array(
                'ASC',
                'DESC'
            ))) ? trim($_REQUEST['order']) : $default_sort_order_method;
 		$size = 10;
        $page = I('post.page');
 		$keyword=I('post.keyword');
 		
 		//条件
 		$where = "g.is_on_sale = 1 AND g.is_alone_sale = 1 AND " . "g.is_delete = 0 ";
        if ($id !== 0) {
            $where .= "AND(g.cat_id = $id OR " .model('Goods')->get_extension_goods($id) .")";
        }
        if (!empty($brand_id) && $brand_id !== 0) {
            $where .= " AND g.brand_id = '" . $brand_id . "' ";
        }
        if (!empty($keyword)) {
            $where .= $keyword;
        }
        $page = $page > 1 ? ($page - 1) * $size : 0;
        /* 获得商品列表 */
        $sql = 'SELECT g.goods_id, g.goods_name,g.market_price, g.goods_name_style, g.market_price, g.is_new, g.is_best, g.is_hot, g.shop_price AS org_price, ' . "IFNULL(mp.user_price, g.shop_price * '$_SESSION[discount]') AS shop_price, g.promote_price, g.goods_type, g.goods_number, " .
            'g.promote_start_date, g.promote_end_date, g.goods_brief, g.goods_thumb , g.goods_img, xl.sales_volume ' . 'FROM ' . $this->model->pre . 'goods AS g ' . ' LEFT JOIN ' . $this->model->pre . 'touch_goods AS xl ' . ' ON g.goods_id=xl.goods_id ' .
            ' LEFT JOIN ' . $this->model->pre . 'member_price AS mp ' . "ON mp.goods_id = g.goods_id " . "WHERE $where GROUP BY g.goods_id ORDER BY $sort $order LIMIT $page , $size";
        $res = $this->model->query($sql);
        foreach ($res as $key => $val) {
            
			$res[$key]['goods_img'] = get_image_path($val['goods_id'], $val['goods_img']);
			$res[$key]['goods_thumb'] = get_image_path($val['goods_id'], $val['goods_thumb']);
        }
        
		//echo M('product')->_sql();exit;
 		$json = array();$json_arr = array();
 		foreach ($res as $k => $v) {
 			$json['goods_id']=$v['goods_id'];
 			$json['goods_name']=$v['goods_name'];
 			$json['goods_thumb']=$v['goods_thumb'];
 			$json['shop_price']=$v['shop_price'];
 			$json['market_price']=$v['market_price'];
 			$json['sales_count']=model('GoodsBase')->get_sales_count($v['goods_id']);
 			$json['intro']=$v['goods_name_style'];
 			$json_arr[] = $json;
 		}
 		echo json_encode(array('status'=>1,'pro'=>$json_arr));
 		exit();
    }

    //*******************************
	//  商品列表页面 获取更多接口
	//*******************************
    public function get_more(){
 		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		// $id=44;
 		$type=I('post.type');//排序类型

 		$page= intval($_POST['page']);
 		if (!$page) {
 			$page=1;
 		}
 		$limit = intval($page*8)-8;

 		$keyword=I('post.keyword');
 		//排序
 		$order="addtime desc";//默认按添加时间排序
 		if($type=='ids'){
 			$order="id desc";
 		}elseif($type=='sale'){
 			$order="shiyong desc";
 		}elseif($type=='price'){
 			$order="price_yh desc";
 		}elseif($type=='hot'){
 			$order="renqi desc";
 		}
 		//条件
 		$where="1=1 AND pro_type=1 AND del=0 AND is_down=0";
 		if(intval($id)){
 			$where.=" AND cid=".intval($id);
 		}

 		if($keyword) {
            $where.=' AND name LIKE "%'.$keyword.'%"';
        }
        if (isset($_REQUEST['ptype']) && $_REQUEST['ptype']=='new') {
        	$where .=' AND is_show=1'; 
        }
        if (isset($_REQUEST['ptype']) && $_REQUEST['ptype']=='hot') {
        	$where .=' AND is_hot=1'; 
        }
        if (isset($_REQUEST['ptype']) && $_REQUEST['ptype']=='zk') {
        	$where .=' AND is_sale=1'; 
        }

 		$product=M('product')->where($where)->order($order)->limit($limit.',8')->select();
 		//echo M('product')->_sql();exit;
 		$json = array();$json_arr = array();
 		foreach ($product as $k => $v) {
 			$json['id']=$v['id'];
 			$json['name']=$v['name'];
 			$json['photo_x']=__DATAURL__.$v['photo_x'];
 			$json['price']=$v['price'];
 			$json['price_yh']=$v['price_yh'];
 			$json['shiyong']=$v['shiyong'];
 			$json['intro']=$v['intro'];
 			$json_arr[] = $json;
 		}
 		$cat_name=M('category')->where("id=".intval($id))->getField('name');
 		echo json_encode(array('pro'=>$json_arr,'cat_name'=>$cat_name));
 		exit();
    }

	//***************************
	//  获取商品属性价格接口
	//***************************
	public function jiage(){
		$buff = trim($_POST['buff'],',');
		$buff_arr = trim($_POST['buff_arr'],',');
		$pid = intval($_POST['pid']);
		$pro_info = M('product')->where('id='.intval($pid))->find();
		if ($buff_arr && $pro_info) {
			$arr = explode(',', $buff_arr);
			$str = 0;
			foreach ($arr as $k => $v) {
				$price[] = M('guige')->where('id='.intval($v))->getField('price');
				$stock[] = M('guige')->where('id='.intval($v))->getField('stock');
			}

			rsort($price);
			sort($stock);
			//$price = implode(',', $price);
			echo json_encode(array('status'=>1,'price'=>$price[0],'stock'=>$stock[0]));
			exit();	
		}

		echo json_encode(array('status'=>0));
		exit();	
	}

	//***************************
	//  会员商品收藏接口
	//***************************
	public function col(){
		$uid = intval($_REQUEST['uid']);
		$pid = intval($_REQUEST['pid']);
		if (!$uid || !$pid) {
			echo json_encode(array('status'=>0,'err'=>'系统错误，请稍后再试.'));
			exit();
		}

		$check = M('product_sc')->where('uid='.intval($uid).' AND pid='.intval($pid))->getField('id');
		if ($check) {
			$res = M('product_sc')->where('id='.intval($check))->delete();
		}else{
			$data = array();
			$data['uid'] = intval($uid);
			$data['pid'] = intval($pid);
			$res = M('product_sc')->add($data);
		}
		
		if ($res) {
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'网络错误..'));
			exit();
		}
	}

	//***************************
	//  获取抢购商品接口
	//***************************
	public function panic(){
		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		// $id=44;
 		$type=I('post.type');//排序类型

 		$keyword=I('post.keyword');
 		//排序
 		$order="addtime desc";//默认按添加时间排序
 		//条件
 		$where="1=1 AND pro_type=2 AND del=0 AND is_down=0";
 		if(intval($id)){
 			$where.=" AND cid=".intval($id);
 		}

 		if($keyword) {
            $where.=' AND name LIKE "%'.$keyword.'%"';
        }

 		$product=M('product')->where($where)->order($order)->limit(10)->select();
 		//echo M('product')->_sql();exit;
 		$json = array();$json_arr = array();
 		foreach ($product as $k => $v) {
 			$json['id']=$v['id'];
 			$json['name']=$v['name'];
 			$json['photo_x']=__DATAURL__.$v['photo_x'];
 			$json['price']=$v['price'];
 			$json['price_yh']=$v['price_yh'];
 			$json['shiyong']=$v['shiyong'];
 			//$json['intro']=$v['intro'];
 			if ($v['start_time']>time()) {
 				$json['state'] = 1;
 				if ($v['start_time']<=strtotime(date("Y-m-d 23:59:59"))) {
 					$json['desc'] = date("H:i",$v['start_time']).'开启';
 				}else{
 					$json['desc'] = date("n月j日",$v['start_time']).'开启';
 				}
 			}elseif ($v['end_time']<time()) {
 				$json['state'] = 2;
 				$json['desc'] = '已结束';
 			}elseif (intval($v['num'])<1) {
 				$json['state'] = 3;
 				$json['desc'] = '已抢完';
 			}else{
 				$json['state'] = 4;
 				$json['desc'] = '立即抢购';
 			}
 			$json_arr[] = $json;
 		}

 		echo json_encode(array('status'=>1,'pro'=>$json_arr));
 		exit();
	}

	//***************************
	//  获取抢购商品接口
	//***************************
	public function getmorepanic(){
		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		// $id=44;
 		$type=I('post.type');//排序类型

 		$page= intval($_POST['page']);
 		if (!$page) {
 			$page=1;
 		}
 		$limit = intval($page*10)-10;

 		$keyword=I('post.keyword');
 		//排序
 		$order="addtime desc";//默认按添加时间排序
 		//条件
 		$where="1=1 AND pro_type=2 AND del=0 AND is_down=0";
 		if(intval($id)){
 			$where.=" AND cid=".intval($id);
 		}

 		if($keyword) {
            $where.=' AND name LIKE "%'.$keyword.'%"';
        }

 		$product=M('product')->where($where)->order($order)->limit($limit.',10')->select();
 		//echo M('product')->_sql();exit;
 		$json = array();$json_arr = array();
 		foreach ($product as $k => $v) {
 			$json['id']=$v['id'];
 			$json['name']=$v['name'];
 			$json['photo_x']=__DATAURL__.$v['photo_x'];
 			$json['price']=$v['price'];
 			$json['price_yh']=$v['price_yh'];
 			$json['shiyong']=$v['shiyong'];
 			//$json['intro']=$v['intro'];
 			if ($v['start_time']>time()) {
 				$json['state'] = 1;
 				if ($v['start_time']<=strtotime(date("Y-m-d 23:59:59"))) {
 					$json['desc'] = date("H:i",$v['start_time']).'开启';
 				}else{
 					$json['desc'] = date("n月j日",$v['start_time']).'开启';
 				}
 			}elseif ($v['end_time']<time()) {
 				$json['state'] = 2;
 				$json['desc'] = '已结束';
 			}elseif (intval($v['num'])<1) {
 				$json['state'] = 3;
 				$json['desc'] = '已抢完';
 			}else{
 				$json['state'] = 4;
 				$json['desc'] = '立即抢购';
 			}
 			$json_arr[] = $json;
 		}

 		echo json_encode(array('status'=>1,'pro'=>$json_arr));
 		exit();
	}

}