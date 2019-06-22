<?php
class Site extends CI_Controller 
{
	function __construct()
	{
		parent::__construct();
		$this->userdata->is_logged_in();
	}
	function members_area ()
	{
		$this->load->model('table_model');
		$tables = $this->table_model->view_tables();
		$data['tables'] = $tables;
		$data['title'] = 'Members Area';
		$data['main_content'] = 'members_area';
		$this->load->view('includes/template', $data);
	}
	function changelog()
	{
		$data['title'] = 'Changelog';
		$data['main_content'] = 'changelog';
		$this->load->view('includes/template', $data);
	}
	function comment()
	{
		$this->load->library('pagination');
		
		$config['base_url'] = base_url().'index.php/site/comment';
		$config['total_rows'] = $this->db->get('0__comment')->num_rows();
		
		$config['per_page'] = 20;
		$config['num_links'] = 20;
		$this->pagination->initialize($config);
		
		$data['title'] = 'Comments';
		$data['main_content'] = 'view_comments';
		$this->load->model('site_model');
		$data['comments'] = $this->site_model->view_comments($config['per_page']);
		$this->load->view('includes/template', $data);
	}
	function add_comment()
	{
		$data['title'] = 'Add your comment';
		$data['main_content'] = 'add_comment';
		$this->load->view('includes/template', $data);
	}
	function post_comment()
	{
		$this->load->library('form_validation');
		//field name, error message, validation rules
		$this->form_validation->set_rules('email_address', 'Email Address', 'trim|required');
		$this->form_validation->set_rules('comment', 'Comment', 'trim|required');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->comment();
		}
		else
		{
			$this->load->model('site_model');
			if($query = $this->site_model->insert_comment())
			{
				
				$data['title'] = 'Comment posted succesfully';
				$data['message'] = 'Comment posted succesfully!';
				$this->comment();
			}
			else
			{
				$this->comment();
			}
		}
	}
}
