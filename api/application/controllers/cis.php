<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class cis extends CI_Controller {
	public function __construct(){
		parent::__construct();
			$this->load->model('cis_model');
	}
	public function index(){
		echo json_encode(array('status' => 'error', 'result' => 'no method called.'));
	}
	public function save_manufaturer(){
		$params = json_decode(file_get_contents('php://input'), true);
		$id = $this->cis_model->save_manufacturer($params);
		if((int)$id){
			echo json_encode(array('status'=> 'success', 'message'=> 'manufacturer created', 'result'=> $id));
		}else{
			echo json_encode(array('status'=> 'danger', 'message'=> 'Duplicate Manufacturer', 'result'=> 0));
		}
	}
	public function save_model(){
		$params = json_decode($_REQUEST['post'], true);
		$file = $_FILES['p'];
		$dir = dirname(dirname(dirname(dirname(__file__))));
		$dir .= "/img/";
		$f = [];
		foreach($file['name'] as $k=>$e){
			$params['file'][] = $e;
			move_uploaded_file($file['tmp_name'][$k], $dir.$e);
		}
		$mname = $params['manufacturer']['name'];
		$id = $this->cis_model->save_model($params);
		if((int)$id){
			echo json_encode(array('status'=> 'success', 'message'=> $mname.' model created', 'result'=> $id));
		}else{
			echo json_encode(array('status'=> 'danger', 'message'=> 'Duplicate Registration Number.', 'result'=> 0));
		}
	}
	public function get_manufactures(){
		$result = $this->cis_model->get_manufacturer();
		echo json_encode($result);
	}
	public function get_models(){
		$result = $this->cis_model->get_models();
		echo json_encode($result);
	}
	public function get_model(){
		$model = $_REQUEST['model'];
		$result = $this->cis_model->get_model($model);
		foreach($result as $k=>$e){
			$result[$k]['model_pic'] = explode(',', $result[$k]['model_pic']);
			$result[$k]['model_pic'] = array_unique($result[$k]['model_pic']);
		}
		echo json_encode($result);
	}
	public function remove_model(){
		$id = $_REQUEST['id'];
		echo $result = $this->cis_model->remove_model($id);
		echo json_encode(array('status'=> 'success', 'message'=> 'model deleted.', 'result'=> $id));
	}
}

function pre($a){
	echo "<pre>";
	print_r($a);
	echo "</pre>";
}
