<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class cis_model extends CI_Model{
	function __construct(){
		$this->tbl_prefix = 'cis_';
		$this->tbl_manufacturer = $this->tbl_prefix.'manufaturer';
		$this->tbl_model = $this->tbl_prefix.'model';
		$this->now = date('Y-m-d H:i:s');
		$this->fees = 10000;
	}
	function save_manufacturer($data){
		$data = array(
	        'manufacturer_name' => $data['name']
	    );
	    $this->db->insert($this->tbl_manufacturer, $data);
		$err = $this->db->error();
		if($err['code']){
			return $err['message'];
		}
	    $id = $this->db->insert_id();
		return $id;
	}
	function save_model($data){
		$data = array(
	        'manufacturer_id' => $data['manufacturer']['id'],
	        'model_name' => $data['name'],
	        'model_color' => $data['color'],
	        'manufacturing_year' => $data['year'],
	        'registration_number' => $data['registration'],
	        'model_description' => $data['note'],
	        'model_pic' => implode(',',$data['file']),
	        'created_dt' => $this->now
	    );
	    $this->db->insert($this->tbl_model, $data);
		$err = $this->db->error();
		if($err['code']){
			return $err['message'];
		}
	    $id = $this->db->insert_id();
		return $id;
	}
	function get_manufacturer(){
		$this->db->select('manufacturer_id id, manufacturer_name name');
		$this->db->from($this->tbl_manufacturer);
		$query = $this->db->get();
		return $query->result_array();
	}
	function remove_model($id){
		$this->db->where('id', $id);
		return $this->db->delete($this->tbl_model);
	}
	function get_models(){
		$sql = "select m1.manufacturer_name, M2.model_name, count(id) as cnt 
				from {$this->tbl_model} M2 
				right join {$this->tbl_manufacturer} M1 on M1.manufacturer_id = M2.manufacturer_id
				group by M1.manufacturer_name, M2.model_name
				order by M1.manufacturer_name";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	function get_model($id){
		$this->db->select('*');
		$this->db->from($this->tbl_model);
		$this->db->where('model_name', $id);
		$query = $this->db->get();
		return $query->result_array();
	}
	
}


?>