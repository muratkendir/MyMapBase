<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Frame extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('frame_model');
		$this->userdata->is_logged_in();
	}
	public function create_frame()
	{
		$this->load->model('wms_layer_model');
		$data['wms_layers'] = $this->wms_layer_model->list_wms_layers();
		$data['title'] = 'Create frame';
		$data['main_content'] = 'create_frame';
		$this->load->view('includes/template', $data);
	}
	public function create_frame_helper()
	{
		$this->load->view('includes/create_frame_helper');
	}
	public function create_geometry_helper($frame_id)
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
		
		$this->load->view('includes/create_geometry_helper', $data);
	}
	public function add_frame()
	{
		$this->load->library('form_validation');
	
		$this->load->library('form_validation');
	
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('wms_layer', 'WMS Layer', 'required');
		$this->form_validation->set_rules('width', 'Frame Width', 'required');
		$this->form_validation->set_rules('height', 'Frame Height', 'required');
		$this->form_validation->set_rules('get_center_long', 'Center Point Longitude', 'required|numeric');
		$this->form_validation->set_rules('get_center_lat', 'Center Point Latitude', 'required|numeric');
		$this->form_validation->set_rules('zoom_to_extend', 'Zoom Level', 'required|is_natural|greater_than[0]|less_than[18]');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->create_frame();
		}
		else
		{
			$this->frame_model->insert_frame();
			
			$message = 'Frame created successfuly!';
			$message .= 'Turn back to ';
			$message .= anchor('frame/view_frames', 'View Frames', 'style="color:#F0F0F0;font-style:italic;"');
		
			$data['message'] = $message;
			$data['title'] = 'Frame created';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
		
	}
	
	public function edit_frame($frame_id)
	{
		$this->load->model('wms_layer_model');
		$data['frame_properties'] = $this->frame_model->show_frame($frame_id);
		$data['wms_layers'] = $this->wms_layer_model->list_wms_layers();
		$data['title'] = 'Edit frame';
		$data['main_content'] = 'edit_frame';
		$this->load->view('includes/template', $data);
	}
	
	public function update_frame($frame_id)
	{
		$this->load->library('form_validation');
	
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('wms_layer', 'WMS Layer', 'required');
		$this->form_validation->set_rules('width', 'Frame Width', 'required');
		$this->form_validation->set_rules('height', 'Frame Height', 'required');
		$this->form_validation->set_rules('get_center_long', 'Center Point Longitude', 'required|numeric');		
		$this->form_validation->set_rules('get_center_lat', 'Center Point Latitude', 'required|numeric');
		$this->form_validation->set_rules('zoom_to_extend', 'Zoom Level', 'required|is_natural|greater_than[0]|less_than[18]');
	
		if($this->form_validation->run() == FALSE )
		{
			$this->edit_frame($frame_id);
		}
		else
		{
		$this->frame_model->update_frame($frame_id);
		
		$message = 'Frame (ID: '.$frame_id.') is edited.';
		$message .= 'Turn back to ';
		$message .= anchor('frame/view_frames', 'View Frames', 'style="color:#F0F0F0;font-style:italic;"');
		
		$data['message'] = $message;
		$data['title'] = 'Frame edited';
		$data['main_content'] = 'blank_page';
		$this->load->view('includes/template', $data);
		}
	}
	
	public function view_frames()
	{
		$this->load->library('pagination');
		
		print_r($this->input->post('message'));
		
		$config['base_url'] = base_url().'index.php/frame/view_frames';
		$this->db->where('owner_id', $this->session->userdata('user_id'));
		$config['total_rows'] = $this->db->get('0__frame')->num_rows();
		
		$config['per_page'] = 10;
		$config['num_links'] = 10;
		$this->pagination->initialize($config);
		
		$data['id'] = 'Frame id';
		$data['title'] = 'View your Frames';
		$data['main_content'] = 'view_frames';
		$data['load_template'] = 'template';
		
		$data['frames'] = $this->frame_model->view_frames($config['per_page']);
		$this->load->view('includes/template', $data);
	}
	public function show_frame($frame_id)
	{
		
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Show Frame';
		
		$this->load->view('includes/template', $data);
		 
	}
	/*public function show_share_frame($id)
	{
		$id=$this->uri->segment(3);
		$share_status = $this->frame_model->check_sharing($id);
		if ($share_status == 1 )
		{
			$data = $this->renderframe->render_frame_by_id($id);
			$data['title'] = 'Share Frame';
			$this->load->view('render_share_frame', $data);
		}
		else
		{
			echo '<p class="error">This frame is private, not available for sharing.</p>';
		}
	}*/
	public function show_points_in_frame($frame_id, $render_for_sharing)
	{
		$frame_id=$this->uri->segment(3);
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$data['title'] = 'Show Points in Frame';
		
		$this->load->model('point_model');
		$points_properties = $this->point_model->show_points($frame_id);
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
			$data['message'] = 'There is no point on this frame yet.';
		}
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
	public function show_lines_in_frame($frame_id, $render_for_sharing)
	{
		$frame_id=$this->uri->segment(3);
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$data['title'] = 'Show Lines in Frame';
		
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
			$data['message'] = 'There is no line on this frame yet.';
		}
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
	public function show_polygons_in_frame($frame_id, $render_for_sharing)
	{
		$frame_id=$this->uri->segment(3);
		$data = $this->renderframe->render_frame_by_id($frame_id);
		
		$data['title'] = 'Show Polygons in Frame';
		
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
			$data['message'] = 'There is no polygon on this frame yet.';
		}
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
	public function show_all_geometries($frame_id, $render_for_sharing)
	{
		$frame_id=$this->uri->segment(3);
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Show All Geometries in Frame';
		
		
		$this->load->model('point_model');
		
		$points_properties = $this->point_model->show_points($frame_id);
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
		
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
	
	public function delete_frame($frame_id)
	{
		$this->frame_model->delete_frame($frame_id);
		
		$message = 'Frame (ID: '.$frame_id.') is deleted.';
		$message .= 'Turn back to ';
		$message .= anchor('frame/view_frames', 'View Frames', 'style="color:#F0F0F0;font-style:italic;"');
		
		$data['message'] = $message;
		$data['title'] = 'Frame deleted';
		$data['main_content'] = 'blank_page';
		$this->load->view('includes/template', $data);
	}
	public function share_frame($class, $function, $frame_id)
	{
		$share_status = $this->frame_model->check_sharing($frame_id);
		if ($share_status == 1 )
		{
			$data = $this->renderframe->render_frame_by_id($frame_id);
			$data['frame_height'] = $data['frame_height'] + 20;
			$element_segment = $this->uri->segment(6);
			if ($element_segment != NULL OR $element_segment != 0)
			{
				$element_segment = '/'.$element_segment;
			}
			else
			{
				$element_segment = '';
			}
			echo '<h3>Copy and paste this code inside your html.</h3>';
			echo '<textarea rows="10" cols="30">';
			$render_for_sharing = 1;
			echo htmlentities('<iframe src="'.base_url().'index.php/'.$class.'/'.$function.'/'.$frame_id.$element_segment.'/1" width="'.$data['frame_width'].'" height="'.$data['frame_height'].'"></iframe>');
			echo '</textarea>';
		}
		else
		{
			echo '<p class="error">This frame is private, not available for sharing.</p>';
		}
	}
}
