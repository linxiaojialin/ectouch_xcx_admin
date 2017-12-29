<?php
defined('IN_ECTOUCH') or die('Deny Access');

class CategoryController extends CommonController {
	//***************************
	// 产品分类
	//***************************
    public function index(){
    	
		$list = $this->model->table('category')->where('parent_id = 0 AND is_show = 1 ')->field('cat_id,parent_id,cat_name')->select();
		$catList = $this->model->table('category')->where('parent_id = '.intval($list[0]['cat_id']) . ' AND is_show = 1')->field('cat_id,parent_id,cat_name')->select();
		foreach($catList as $key=>$v){
			$v['cat_img'] =  model('CategoryBase')->get_cat_goods_img($v['cat_id']);
			$catList[$key]['cat_img'] = __URL__ . '/' . $v['cat_img'];
		}
    	//json加密输出
		//dump($json);
		echo json_encode(array('status'=>1,'list'=>$list,'catList'=>$catList));
        exit();
    }

    //***************************
    // 产品分类
    //***************************
    public function getcat(){
        $catid = intval($_REQUEST['cat_id']);
        if (!$catid) {
            echo json_encode(array('status'=>0,'err'=>'没有找到产品数据.'));
            exit();
        }

        $catList = $this->model->table('category')->where('parent_id = '.intval($catid) . ' AND is_show = 1')->field('cat_id,parent_id,cat_name')->select();
		foreach($catList as $key=>$v){
			$v['cat_img'] =  model('CategoryBase')->get_cat_goods_img($v['cat_id']);
			$catList[$key]['cat_img'] = __URL__ . '/' . $v['cat_img'];
		}
        //json加密输出
        //dump($json);
        echo json_encode(array('status'=>1,'catList'=>$catList));
        exit();
    }

}