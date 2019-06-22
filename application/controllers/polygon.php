<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Polygon extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('polygon_model');
		$this->userdata->is_logged_in();
	}
	public function create_polygon()
	{
		$data['dropdown'] = $this->polygon_model->list_editable_frames();
		$data['title'] = 'Create polygon';
		$data['main_content'] = 'create_polygon';
		$this->load->view('includes/template', $data);
	}
	public function add_polygon()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('polygon_points', 'Polygon Points', 'required');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->create_polygon();
		}
		else
		{
			$this->polygon_model->insert_polygon();
			
			$message = 'Polygon created successfuly!';
			$message .= 'Turn back to ';
			$message .= anchor('polygon/view_polygons', 'View Polygons', 'style="color:#F0F0F0;font-style:italic;"');
			
			$data['message'] = $message;
			$data['title'] = 'polygon created';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
		
	}
	
	public function edit_polygon($polygon_id)
	{
		$data['dropdown'] = $this->polygon_model->list_editable_frames();
		$data['polygon_properties'] = $this->polygon_model->show_polygon($polygon_id);
		$data['title'] = 'Edit Polygon';
		$data['main_content'] = 'edit_polygon';
		$this->load->view('includes/template', $data);
	}
	
	public function update_polygon($polygon_id)
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('polygon_points', 'Polygon Points', 'required');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->edit_polygon($polygon_id);
		}
		else
		{
			$this->polygon_model->update_polygon($polygon_id);
			
			$message = 'Polygon (ID: '.$polygon_id.') is edited.';
			$message .= 'Turn back to ';
			$message .= anchor('polygon/view_polygons', 'View Polygons', 'style="color:#F0F0F0;font-style:italic;"');
			
			$data['message'] = $message;
			$data['title'] = 'polygon edited';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
	}
	
	public function view_polygons()
	{
		$this->load->library('pagination');
		
		$config['base_url'] = base_url().'index.php/polygon/view_polygons';
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$config['total_rows'] = $this->db->get('0__polygon')->num_rows();
		
		$config['per_page'] = 10;
		$config['num_links'] = 20;
		$this->pagination->initialize($config);
		
		$data['title'] = 'View your Polygons';
		$data['main_content'] = 'view_polygons';
		$data['polygons'] = $this->polygon_model->view_polygons($config['per_page']);
		$this->load->view('includes/template', $data);
	}
	
	
	public function show_polygon($frame_id, $polygon_id, $render_for_sharing)
	{	
		$frame_id=$this->uri->segment(3);
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$data['title'] = 'Show Polygon';
		$polygon_properties = $this->polygon_model->show_polygon($polygon_id);
		
		$data['polygon_id'] = $polygon_properties['id'];
		$data['polygon_title'] = $polygon_properties['title'];
		$data['frame_of_polygon_id'] = $polygon_properties['frame_id'];
		$data['geometry'] = $polygon_properties['AsText(polygon_polygon)'];
		
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
	
	public function delete_polygon($polygon_id)
	{
		$this->polygon_model->delete_polygon($polygon_id);
		
		$message = 'Polygon (ID: '.$polygon_id.') is deleted.';
		$message .= 'Turn back to ';
		$message .= anchor('polygon/view_polygons', 'View polygons', 'style="color:#F0F0F0;font-style:italic;"');
		
		$data['message'] = $message;
		$data['title'] = 'Polygon deleted';
		$data['main_content'] = 'blank_page';
		$this->load->view('includes/template', $data);
	}
	
	public function create_polygon_geometry_helper($frame_id)
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
		
		$this->load->view('includes/create_polygon_geometry_helper', $data);
	}
}
