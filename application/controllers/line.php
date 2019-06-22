<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Line extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('line_model');
		$this->userdata->is_logged_in();
	}
	public function create_line()
	{
		$data['dropdown'] = $this->line_model->list_editable_frames();
		$data['title'] = 'Create point';
		$data['main_content'] = 'create_line';
		$this->load->view('includes/template', $data);
	}
	public function add_line()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('line_points', 'Line Points', 'required');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->create_line();
		}
		else
		{
			$this->line_model->insert_line();
			
			$message = 'Line created successfuly!';
			$message .= 'Turn back to ';
			$message .= anchor('line/view_lines', 'View Lines', 'style="color:#F0F0F0;font-style:italic;"');
		
			$data['message'] = $message;
			$data['title'] = 'Line created';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
		
	}
	
		public function edit_line($line_id)
	{
		$data['dropdown'] = $this->line_model->list_editable_frames();
		$data['line_properties'] = $this->line_model->show_line($line_id);
		$data['title'] = 'Edit Line';
		$data['main_content'] = 'edit_line';
		$this->load->view('includes/template', $data);
	}
	public function update_line($line_id)
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('line_points', 'Line Points', 'required');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->edit_line($line_id);
		}
		else
		{
			$this->line_model->update_line($line_id);
		
			$message = 'Line (ID: '.$line_id.') is edited.';
			$message .= 'Turn back to ';
			$message .= anchor('line/view_lines', 'View Lines', 'style="color:#F0F0F0;font-style:italic;"');
		
			$data['message'] = $message;
			$data['title'] = 'Line edited';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
	}
	
	public function view_lines()
	{
		$this->load->library('pagination');
		
		
		$config['base_url'] = base_url().'index.php/line/view_lines';
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$config['total_rows'] = $this->db->get('0__line')->num_rows();
		
		$config['per_page'] = 10;
		$config['num_links'] = 10;
		$this->pagination->initialize($config);
		
		$data['title'] = 'View your Lines';
		$data['main_content'] = 'view_lines';
		$data['lines'] = $this->line_model->view_lines($config['per_page']);
		
		$this->load->view('includes/template', $data);
	}
	
	
	public function show_line($frame_id, $line_id)
	{	
		
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$data['title'] = 'Show Line';
		$line_properties = $this->line_model->show_line($line_id);
		
		$data['line_id'] = $line_properties['id'];
		$data['line_title'] = $line_properties['title'];
		$data['frame_of_line_id'] = $line_properties['frame_id'];
		$data['geometry'] = $line_properties['AsText(line_line)'];
		
		$this->load->view('includes/template', $data);
		
	}
	
	public function delete_line($line_id)
	{
		$this->line_model->delete_line($line_id);
		
		$message = 'Line (ID: '.$line_id.') is deleted.';
		$message .= 'Turn back to ';
		$message .= anchor('line/view_lines', 'View Lines', 'style="color:#F0F0F0;font-style:italic;"');
		
		$data['message'] = $message;
		$data['title'] = 'Line deleted';
		$data['main_content'] = 'blank_page';
		$this->load->view('includes/template', $data);
	}
	
	public function create_line_geometry_helper($frame_id)
	{
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$this->load->model('point_model');
		$points_properties = $this->point_model->show_points($frame_id);
		//print_r($points_properties);
		if ($points_properties != NULL)
		{
			$i=0;
			foreach ($points_properties as $row)
			{	
				$point[] = $row;
				$i++;
			}
			$data['point'] = $point;
			$num_points =$i;
			$data['num_points'] = $num_points;
		}
		else
		{
			$num_points = 0;
		}
		
		
		$lines_properties = $this->line_model->show_lines($frame_id);
		if ($lines_properties != NULL)
		{
			$i=0;
			foreach ($lines_properties as $row)
			{	
				$line[] = $row;
				$i++;
			}
			$data['line'] = $line;
			$num_lines =$i;
			$data['num_lines'] = $num_lines;
		}
		else
		{
			$num_lines = 0;
		}
		
		$this->load->model('polygon_model');
		$polygons_properties = $this->polygon_model->show_polygons($frame_id);
		
		if ($polygons_properties != NULL)
		{
			$i=0;
			foreach ($polygons_properties as $row)
			{	
				$polygon[] = $row;
				$i++;
			}
			$data['polygon'] = $polygon;
			$num_polygons =$i;
			$data['num_polygons'] = $num_polygons;
		}
		else
		{
			$num_polygons = 0;
		}
		if ($num_polygons == 0 AND $num_lines == 0 AND $num_points == 0)
		{
			$data['message'] = 'There is no any geometry on this frame yet.';
		}
		else
		{
			$data['message'] = 'There are '.$num_points.' point(s), '.$num_lines.' line(s) and '.$num_polygons.' polygon(s) on this frame.';
		}
		
		$this->load->view('includes/create_line_geometry_helper', $data);
	}
}
