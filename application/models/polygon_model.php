<?php
class Polygon_model extends CI_Model
{
	public function __construct() 
	{
		parent::__construct();
	}
	function insert_polygon()
	{
		$title = $this->input->post('title');
		$frame_to_add = $this->input->post('editable_frames');
		$public_private = $this->input->post('public_private');
		$polygon_points = $this->input->post('polygon_points');
		$user_id = $this->input->post('user_id');

		$sql = "INSERT INTO 0__polygon
			(title, frame_id, public_private, polygon_polygon, owner_id) 
			VALUES (
				'$title', 
				$frame_to_add, 
				$public_private, 
				GeomFromText('$polygon_points'), 
				$user_id
			)";
		
		$this->db->query($sql);
	}
	
	function update_polygon($polygon_id)
	{
		$title = $this->input->post('title');
		$frame_to_add = $this->input->post('editable_frames');
		$public_private = $this->input->post('public_private');
		$polygon_polygon = $this->input->post('polygon_points');
		$user_id = $this->input->post('user_id');

		$sql = "UPDATE 0__polygon 
			SET
				title = '$title', 
				frame_id = $frame_to_add, 
				public_private = $public_private, 
				polygon_polygon = GeomFromText('POLYGON($polygon_polygon)'), 
				owner_id = $user_id 
			WHERE 
				id = $polygon_id 
			";
		
		$this->db->query($sql);
	}
	
	public function list_editable_frames() 
	{
		$user_id = $this->session->userdata('user_id');
		$result = $this->db->query
			('SELECT id, title FROM `0__frame` WHERE owner_id = '.$user_id)
			->result_array();
		$dropdown = array();
		foreach($result as $row)
		{
			$dropdown[$row['id']] = $row['title'];
		}
		return $dropdown;
	}
	public function view_polygons($per_page)
	{
		$this->db->select('id, title, frame_id, AsText(polygon_polygon)');
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$this->db->order_by('id', 'desc');
		$query = $this->db->get('0__polygon', $per_page, $this->uri->segment(3));
		if ($query->num_rows() > 0)
		{
			foreach ($query->result_array() as $row)
			{
				$data[] = $row;	
			}
			return $data;
		}
		else{return NULL;}
	}
	
	public function show_polygon($polygon_id)
	{	
		
		$query = $this->db->query('SELECT id, title, frame_id, public_private, AsText(polygon_polygon) FROM 0__polygon WHERE id ='.$polygon_id);
		
		return $query->row_array();
	}
	function show_polygons($frame_id)
	{	
		$query = $this->db->query
			('SELECT id, title, frame_id, AsText(polygon_polygon) FROM 0__polygon WHERE frame_id ='.$frame_id);
		if ($query->num_rows > 0)
		{
			foreach ($query->result_array() as $row)
			{
				$data[] = $row;
			}
			
			return $data;
		}
		else{}
	}
	function list_all_polygons_of_user($user_id)
	{
		$this->db->select('id, title, frame_id');
		$this->db->where('owner_id', $user_id);
		$query = $this->db->get('0__polygon');
		return $query->result();
	}
	function delete_polygon($polygon_id)
	{
		$this->db->where('id', $polygon_id);
		$this->db->delete('0__polygon');
	}
}
