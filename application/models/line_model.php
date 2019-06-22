<?php
class Line_model extends CI_Model
{
	public function __construct() 
	{
		parent::__construct();
	}
	function insert_line()
	{
		$title = $this->input->post('title');
		$frame_to_add = $this->input->post('editable_frames');
		$public_private = $this->input->post('public_private');
		$line_points = $this->input->post('line_points');
		$user_id = $this->input->post('user_id');

		$sql = "INSERT INTO 0__line
			(title, frame_id, public_private, line_line, owner_id) 
			VALUES (
				'$title', 
				$frame_to_add, 
				$public_private, 
				GeomFromText('$line_points'), 
				$user_id
			)";
		
		$this->db->query($sql);
	}
	function update_line($line_id)
	{
		$title = $this->input->post('title');
		$frame_to_add = $this->input->post('editable_frames');
		$public_private = $this->input->post('public_private');
		$line_line = $this->input->post('line_points');
		$user_id = $this->input->post('user_id');

		$sql = "UPDATE 0__line 
			SET
				title = '$title', 
				frame_id = $frame_to_add, 
				public_private = $public_private, 
				line_line = GeomFromText('LINESTRING($line_line)'), 
				owner_id = $user_id 
			WHERE 
				id = $line_id 
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
	public function view_lines($per_page)
	{
		$this->db->select('id, title, frame_id, AsText(line_line)');
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$this->db->order_by('id', 'desc');
		$query = $this->db->get('0__line', $per_page, $this->uri->segment(3));
		if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else {return NULL;}
	}
	public function show_line($line_id)
	{	
		
		$query = $this->db->query('SELECT id, title, frame_id, public_private, AsText(line_line) FROM 0__line WHERE id ='.$line_id);
		
		return $query->row_array();
	}
	function show_lines($frame_id)
	{	
		$query = $this->db->query
			('SELECT id, title, frame_id, AsText(line_line) FROM 0__line WHERE frame_id ='.$frame_id);
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
	function list_all_lines_of_user($user_id)
	{
		$this->db->select('id, title, frame_id');
		$this->db->where('owner_id', $user_id);
		$query = $this->db->get('0__line');
		return $query->result();
	}
	function delete_line($line_id)
	{
		$this->db->where('id', $line_id);
		$this->db->delete('0__line');
	}
}
