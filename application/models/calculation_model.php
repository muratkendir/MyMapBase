<?php
class Calculation_model extends CI_Model
{
	public function __construct() 
	{
		parent::__construct();
	}
	public function list_points()
	{
		$this->db->select('id, title');
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$query = $this->db->get('0__point');
		if ($query->num_rows() > 0)
		{
			$dropdown_points = array();
			foreach($query->result() as $row)
			{
				$dropdown_points[$row->id] = $row->title;
			}
			return $dropdown_points;
		}
		else {return NULL;}
	}
	public function points_to_distance()
	{
		$point_to_distance['1'] = $this->input->post('dropdown_point1');
		$point_to_distance['2'] = $this->input->post('dropdown_point2'); 
		$this->db->select('id, title, frame_id, AsText(point_point)');
		$this->db->where('id', $point_to_distance['1']);
		$this->db->or_where('id', $point_to_distance['2']);
		$query = $this->db->get('0__point');
		$i=0;
		foreach($query->result_array() as $row)
		{
			$data[$i] = $row;
			$i++;
		}
		return $data;
	}
}
