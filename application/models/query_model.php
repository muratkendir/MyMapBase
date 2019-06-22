<?php
class Query_model extends CI_Model
{
	public function __construct() 
	{
		parent::__construct();
	}
	public function list_lines()
	{
		$this->db->select('id, title');
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$query = $this->db->get('0__line');
		if ($query->num_rows() > 0)
		{
			$dropdown_lines = array();
			foreach($query->result() as $row)
			{
				$dropdown_lines[$row->id] = $row->title;
			}
			return $dropdown_lines;
		}
		else {return NULL;}
	}
	public function envelope_lines()
	{
		$lines_to_envelope = $this->input->post('dropdown_lines');
		
		$time = microtime(true);

		$this->db->select('id, title, frame_id, AsText(Envelope(line_line))');
		$this->db->where('id', $lines_to_envelope);
		$query = $this->db->get('0__line');
		
		
		foreach($query->row() as $row)
		{
			$data[] = $row;
			
		}
		
		$execute_time = microtime(true) - $time ;
		$data['execute_time'] = $execute_time;
		return $data;
	}
	public function replace_geometry_string($geometry)
	{
		$search = array ('POLYGON', 'POINT', '(', ')');
		$replace = array ('', '', '', '');
		$geometry = str_replace($search, $replace, $geometry);
		return $geometry;
	}
	
}
