<?php
class Share_model extends CI_Model
{
	public function __construct() 
	{
		parent::__construct();
	}
	public function control_sharing_status($frame_id)
	{
		$this->db->select('public_private');
		$this->db->where('id', $frame_id);
		$query = $this->db->get('0__frame');
		$share_status = $query->row();
		return $share_status->public_private;
	}
	public function control_sharing_status_for_point($point_id)
	{
		$this->db->select('public_private');
		$this->db->where('id', $point_id);
		$query = $this->db->get('0__point');
		$share_status = $query->row();
		return $share_status->public_private;
	}
	public function control_sharing_status_for_line($line_id)
	{
		$this->db->select('public_private');
		$this->db->where('id', $line_id);
		$query = $this->db->get('0__line');
		$share_status = $query->row();
		return $share_status->public_private;
	}
	public function control_sharing_status_for_polygon($polygon_id)
	{
		$this->db->select('public_private');
		$this->db->where('id', $polygon_id);
		$query = $this->db->get('0__polygon');
		$share_status = $query->row();
		return $share_status->public_private;
	}
	public function control_sharing_status_for_table($table_name)
	{
		$this->db->select('public_private');
		$this->db->where('exact_name', $table_name);
		$query = $this->db->get('0__table');
		$share_status = $query->row();
		return $share_status->public_private;
	}
}
