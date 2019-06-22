<?php

class Site_model extends CI_Model 
{
	public function insert_comment()
	{
		if ($this->session->userdata('user_id')!= NULL)
		{
			$user_id = $this->session->userdata('user_id');
		}
		else
		{
			$user_id = NULL;
		}
		$new_comment = array(
			'first_name' => $this->input->post('first_name'),
			'last_name' => $this->input->post('last_name'),
			'email_address' => $this->input->post('email_address'),
			'title' => $this->input->post('title'),
			'comment' => $this->input->post('comment'),
			'user_id' => $user_id,
			'time' => $this->input->post('time')
			
		);
		
		$insert = $this->db->insert('0__comment', $new_comment);
		return $insert;
	}
	public function view_comments($per_page)
	{
		$this->db->select('id, title, comment, first_name, last_name');
		$query = $this->db->get('0__comment', $per_page, $this->uri->segment(3));
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
}
