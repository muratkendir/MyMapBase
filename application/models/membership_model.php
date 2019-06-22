<?php

class Membership_model extends CI_Model 
{
	function validate()
	{
		$this->db->where('user_name', $this->input->post('username'));
		$this->db->where('password', md5($this->input->post('password')));
		$query = $this->db->get('0__membership');

		if($query->num_rows == 1 )
		{
			if ($query->result_array()[0]['approval'] == 1)
				{
					return true;
				}
			else
			{
				echo '<div id="message" class="error">';
				echo 'Your account has not yet approved. Please contact to <a href="mailto:muratkendir@gmail.com" style="color:yellow;">muratkendir@gmail.com</a>';
				echo '</div>';
			}
		}
		else
		{
				echo '<div id="message" class="error">';
				echo 'Username or password is/are mismatched. Please check your account.';
				echo '</div>';
		}
	}
	
	function create_member()
	{
		$new_member_insert_data = array(
			'first_name' => $this->input->post('first_name'),
			'last_name' => $this->input->post('last_name'),
			'profession' => $this->input->post('profession'),
			'email_address' => $this->input->post('email_address'),
			'user_name' => $this->input->post('username'),
			'password' => md5($this->input->post('password')),
			'access_level' => 2,
			'approval' => 1
		);
		
		$insert = $this->db->insert('0__membership', $new_member_insert_data);
		return $insert;
	}
	function get_access_level()
	{
		$this->db->select('access_level');
		$this->db->where('id', $this->session->userdata('user_id'));
		$query = $this->db->get('0__membership');
		$access_level = $query->row();
		return $access_level->access_level;
	}
}
