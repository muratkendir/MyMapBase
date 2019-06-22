<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Userdata 
{
	public function is_logged_in()
	{
		$CI =& get_instance();
		$is_logged_in = $CI->session->userdata('is_logged_in');
		
		if(!isset($is_logged_in) || $is_logged_in != true)
		{
			echo 'You don\'t have permission to access this page.</hr> <a href="../login">Login</a>';
			die();
		}
	}
	public function access_level()
	{
		$CI =& get_instance();
		$CI->load->model('membership_model');
		$access_level = $CI->membership_model->get_access_level();
		return $access_level;
	}
}
