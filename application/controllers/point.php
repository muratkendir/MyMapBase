<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Point extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('point_model');
		$this->userdata->is_logged_in();
	}
	public function create_point()
	{
		$data['dropdown'] = $this->point_model->list_editable_frames();
		$data['title'] = 'Create point';
		$data['main_content'] = 'create_point';
		$this->load->view('includes/template', $data);
	}
	public function add_point()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('point_lonlat', 'Point Longitude', 'required');
		
		if($this->form_validation->run() == FALSE )
		{
			$this->create_point();
		}
		else
		{
			$this->point_model->insert_point();
			
			$message = 'Point created successfuly!';
			$message .= 'Turn back to ';
			$message .= anchor('point/view_points', 'View Points', 'style="color:#F0F0F0;font-style:italic;"');
			
			$data['message'] = $message;
			$data['title'] = 'Point created';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
		
	}
	
	public function edit_point($point_id)
	{
		$data['dropdown'] = $this->point_model->list_editable_frames();
		$data['point_properties'] = $this->point_model->show_point($point_id);
		$data['title'] = 'Edit Point';
		$data['main_content'] = 'edit_point';
		$this->load->view('includes/template', $data);
	}
	public function update_point($point_id)
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('point_long', 'Point Longitude', 'required|numeric');		
		$this->form_validation->set_rules('point_lat', 'Point Latitude', 'required|numeric');
		
		if($this->form_validation->run() == FALSE )
		{
			$this->edit_point($point_id);
		}
		else
		{
			$this->point_model->update_point($point_id);
			
			$message = 'Point (ID: '.$point_id.') is edited.';
			$message .= 'Turn back to ';
			$message .= anchor('point/view_points', 'View Points', 'style="color:#F0F0F0;font-style:italic;"');
			
			$data['message'] = $message;
			$data['title'] = 'Point edited';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
	}
	
	public function view_points()
	{
		$this->load->library('pagination');
		
		
		$config['base_url'] = base_url().'index.php/point/view_points';
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$config['total_rows'] = $this->db->get('0__point')->num_rows();
		
		$config['per_page'] = 10;
		$config['num_links'] = 10;
		$this->pagination->initialize($config);
		
		$data['title'] = 'View your Points';
		$data['main_content'] = 'view_points';
		$data['points'] = $this->point_model->view_points($config['per_page']);
		$this->load->view('includes/template', $data);
	}
	public function show_point($frame_id, $point_id)
	{
		
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$data['title'] = 'Show Point';
		$point_properties = $this->point_model->show_point($point_id);
		
		$data['point_id'] = $point_properties['id'];
		
		$data['point_title'] = $point_properties['title'];	
		$data['frame_of_point_id'] = $point_properties['frame_id'];
		$data['geometry'] = $point_properties['AsText(point_point)'];
		
		$this->load->view('includes/template', $data);
		
		
	}
	
	public function delete_point($point_id)
	{
		$this->point_model->delete_point($point_id);
		
		$message = 'Point (ID: '.$point_id.') is deleted.';
		$message .= 'Turn back to ';
		$message .= anchor('point/view_points', 'View Points', 'style="color:#F0F0F0;font-style:italic;"');
		
		$data['message'] = $message;
		$data['title'] = 'Point deleted';
		$data['main_content'] = 'blank_page';
		$this->load->view('includes/template', $data);
	}
	
	public function create_point_geometry_helper($frame_id)
	{
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
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
		
		$this->load->model('line_model');
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
		
		$this->load->view('includes/create_point_geometry_helper', $data);
	}
	
}
