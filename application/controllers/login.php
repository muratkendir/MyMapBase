<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller 
{
	public function index()
	{
		$data['title'] = 'MyMapbase - Spatial Data Management System';
		$data['main_content'] = 'login_form';
		$this->load->view('includes/template', $data);
	}
	
	public function validate_credentials ()
	{
		$this->load->model('membership_model');
		$query = $this->membership_model->validate();
		
		if($query) //if the users credentials validated...
		{
			$query = $this->db->where('user_name', $this->input->post('username'));
			$query = $this->db->get('0__membership');
			foreach ($query->result_array() as $row)
			{
				$user_id = $row['id'];
				$user_name = $row['user_name'];
			}
			$data = array(
				'username' => $this->input->post('username'),
				'user_id' => $user_id,
				'is_logged_in' => true
			);
			$this->session->set_userdata($data);
			redirect('site/members_area');
		}
		
		else{
			$this->index();
		}
	}
	
	public function signup()
	{
		$data['title'] = 'Create an Account';
		$data['main_content'] = 'signup_form';
		$this->load->view('includes/template', $data);
	}

	public function create_member()
	{
		$this->load->library('form_validation');
		//field name, error message, validation rules
	
		$this->form_validation->set_rules('first_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('last_name', 'Last Name', 'trim|required');
		$this->form_validation->set_rules('email_address', 'Email Address', 'trim|required|is_unique[0__membership.email_address]');

		$this->form_validation->set_rules('username', 'Username', 'trim|required|min_lenght[4]|is_unique[0__membership.user_name]');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_lenght[4]|max_lenght[32]');
		$this->form_validation->set_rules('password2', 'Password Confirmation', 'trim|required|matches[password]');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->signup();
		}
		else
		{
			$this->load->model('membership_model');
			if($query = $this->membership_model->create_member())
			{
				$data['title'] = 'Signup successful';
				$data['main_content'] = 'signup_successful';
				$this->load->view('includes/template', $data);
			}
			else
			{
				$this->load->view('signup_form');
			}
		}
	}
	function logout()
	{
		$this->session->sess_destroy();
		redirect('login');
	}
}






























