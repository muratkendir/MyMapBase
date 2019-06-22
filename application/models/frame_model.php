<?php
class Frame_model extends CI_Model
{
	function insert_frame()
	{
		$user_id = $this->input->post('user_id');
		$title = $this->input->post('title');
		$wms_layer = $this->input->post('wms_layer');
		$wms_layer_ids = implode(",", $wms_layer);
		$public_private = $this->input->post('public_private');
		$width = $this->input->post('width');
		$height = $this->input->post('height');
		$get_center_lat = $this->input->post('get_center_lat');
		$get_center_long = $this->input->post('get_center_long');
		$zoom_to_extend = $this->input->post('zoom_to_extend');
		$get_center_point = $this->input->post('get_center_long')." ".$this->input->post('get_center_lat');

		$sql = "INSERT INTO 0__frame
			(title, wms_layer_ids, public_private, width, height, get_center_lat, get_center_long, zoom_to_extend, get_center_point, owner_id) 
			VALUES (
				'$title', 
				'$wms_layer_ids', 
				$public_private, 
				$width, 
				$height, 
				$get_center_lat, 
				$get_center_long, 
				$zoom_to_extend, 
				GeomFromText('POINT($get_center_point)'), 
				$user_id
			)";
		
		$this->db->query($sql);
	}
	function update_frame($frame_id)
	{
		$user_id = $this->input->post('user_id');
		$title = $this->input->post('title');
		$wms_layer = $this->input->post('wms_layer');
		$wms_layer_ids = implode(",", $wms_layer);
		$public_private = $this->input->post('public_private');
		$width = $this->input->post('width');
		$height = $this->input->post('height');
		$zoom_to_extend = $this->input->post('zoom_to_extend');
		$get_center_point = $this->input->post('get_center_long')." ".$this->input->post('get_center_lat');

		$sql = "UPDATE 0__frame
			SET 
				title = '$title', 
				wms_layer_ids = '$wms_layer_ids', 
				public_private = $public_private, 
				width = $width, 
				height = $height, 
				zoom_to_extend = $zoom_to_extend, 
				get_center_point = GeomFromText('POINT($get_center_point)'), 
				owner_id = $user_id 
			WHERE
				id = $frame_id ";
		
		$this->db->query($sql);
	}
	function view_frames($per_page)
	{
		$this->db->select('id, title, wms_layer_ids, width, height');
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$this->db->order_by('id', 'desc');
		$query = $this->db->get('0__frame', $per_page, $this->uri->segment(3));
		if ($query->num_rows() > 0)
		{
			foreach ($query->result() as $row)
			{
				$data[] = $row;
			}
			return $data;
		}
		else {return NULL;}
	}
	function show_frame($id)
	{	
		//$id=$this->uri->segment(3);
		$sql = "SELECT 
				id, title, wms_layer_ids, public_private, 
				width, height, zoom_to_extend, 
				AsText(get_center_point), 
				owner_id 
			FROM `0__frame` WHERE id =".$id;
		$query= $this->db->query($sql);
		
		$data = $query->row_array();
		
		return $data;
	}	
	function check_sharing($frame_id)
	{
		$this->db->select('public_private');
		$this->db->where('id', $frame_id);
		$query = $this->db->get('0__frame');
		$share_status = $query->row();
		return $share_status->public_private;
	}
	function delete_frame($frame_id)
	{
		$this->db->where('id', $frame_id);
		$this->db->delete('0__frame');
	}
}
