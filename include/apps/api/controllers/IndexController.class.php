<?php
defined('IN_ECTOUCH') or die('Deny Access');

class IndexController extends CommonController {
	//***************************
	//  首页数据接口
	//***************************
    public function index(){
    	//如果缓存首页没有数据，那么就读取数据库
    	/***********获取首页顶部轮播图************/
		$time = gmtime();
		$aid = 255;
    	$ggtop = $this->model->table('ad')->where("enabled = 1 AND start_time <= $time AND end_time >= $time AND position_id = $aid")->order('ad_id asc')->field('ad_id,ad_name,ad_code')->limit(10)->select();
		foreach ($ggtop as $k => $v) {
			$v['ad_code'] = (strpos($v['ad_code'], 'http://') === false && strpos($v['ad_code'], 'https://') === false) ?
                    get_data_path($v['ad_code'], 'afficheimg') : $v['ad_code'];
			$ggtop[$k]['photo']= $v['ad_code'];
			$ggtop[$k]['name']=urlencode($v['ad_name']);
		}
    	/***********获取首页顶部轮播图 end************/

        //======================
        //首页推荐品牌 20个
        //======================
        /*$brand = M('brand')->where('1=1')->field('id,name,photo')->limit(20)->select();
        foreach ($brand as $k => $v) {
            $brand[$k]['photo'] = __DATAURL__.$v['photo'];
        }*/
		//$cat_rec = model('Index')->get_recommend_res(10,4);
        
		//======================
        //首页培训课程
        //======================
        /*$course = M('course')->where('del=0')->order('id desc')->field('id,title,intro,photo')->select();
        foreach ($course as $k => $v) {
            $course[$k]['photo'] = __DATAURL__.$v['photo'];
        }*/

    	//======================
    	//首页推荐产品
    	//======================
    	/*$pro_list = M('product')->where('del=0 AND pro_type=1 AND is_down=0 AND type=1')->order('sort desc,id desc')->field('id,name,intro,photo_x,price_yh,price,shiyong')->limit(8)->select();
    	foreach ($pro_list as $k => $v) {
    		$pro_list[$k]['photo_x'] = __DATAURL__.$v['photo_x'];
    	}*/
		$best_good = model('Index')->goods_list('best', C('page_size'));
        //======================
        //首页分类 自己组建数组
        //======================
        /*$indeximg = M('indeximg')->where('1=1')->order('id asc')->field('photo')->select();
        $procat = array();
        $procat[0]['name'] = '新闻资讯';
        $procat[0]['imgs'] = __DATAURL__.$indeximg[0]['photo'];
        $procat[0]['link'] = 'other';
        $procat[0]['ptype'] = 'news';

        $procat[1]['name'] = '教学优势';
        $procat[1]['imgs'] = __DATAURL__.$indeximg[1]['photo'];
        $procat[1]['link'] = 'other';
        $procat[1]['ptype'] = 'jxys';

        $procat[2]['name'] = '学员风采';
        $procat[2]['imgs'] = __DATAURL__.$indeximg[2]['photo'];
        $procat[2]['link'] = 'other';
        $procat[2]['ptype'] = 'xyfc';

        $procat[3]['name'] = '关于我们';
        $procat[3]['imgs'] = __DATAURL__.$indeximg[3]['photo'];
        $procat[3]['link'] = 'other';
        $procat[3]['ptype'] = 'gywm';*/

    	echo json_encode(array('ggtop'=>$ggtop,'procat'=>$procat,'prolist'=>$best_good,'brand'=>$brand,'course'=>$course));
    	exit();
    }

    //***************************
    //  首页产品 分页
    //***************************
    public function getlist(){
        $page = intval($_REQUEST['page']);
        $best_good = model('Index')->goods_list('best', C('page_size'),$page);
        echo json_encode(array('prolist'=>$best_good));
        exit();
    }

    public function ceshi(){
        $str = null;
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max = strlen($strPol)-1;

        for($i=0;$i<32;$i++){
            $str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
        }

        echo $str;
    }

}