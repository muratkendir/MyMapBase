<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Calculation extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('calculation_model');
		//$this->load->model('frame_model');
		$this->userdata->is_logged_in();
	}
	public function select_points_to_distance()
	{
		$data['dropdown_points'] = $this->calculation_model->list_points();
		$data['title'] = 'Select Points';
		$data['main_content'] = 'calc_points_distance';
		$this->load->view('includes/template', $data);
	}
	public function calc_between_points()
	{
		$points_to_distance = $this->calculation_model->points_to_distance();
		
		$frame_id = $points_to_distance['0']['frame_id'];
		$render_for_sharing = 0;
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Distance between two points';
		
		$this->load->model('query_model');
		$point1 = $this->query_model->replace_geometry_string($points_to_distance['0']['AsText(point_point)']);
		$point2 = $this->query_model->replace_geometry_string($points_to_distance['1']['AsText(point_point)']);
		$point1e = explode(" ", $point1);
		$lon1 = $point1e[0];
		$lat1 = $point1e[1];
		
		$point2e = explode(" ", $point2);
		$lon2 = $point2e[0];
		$lat2 = $point2e[1];
		
		$this->load->library('geocalc');
		$distance = round($this->geocalc->gcdistance($lat1, $lon1, $lat2, $lon2), 2);
		
		$i=0;
		foreach ($points_to_distance as $row)
		{	
			$point[$i] = $row;
			$i++;
		}
		$data['point'] = $point;
		$num_points = $i;
		$data['num_points'] = $num_points;
		
		$distance_line = array('id' => '9999', 'title' => 'Temporary line', 'frame_id' => $frame_id, 'AsText(line_line)' => 'LINESTRING('.$point1.', '.$point2.')');
		
		$line = array( '0' => $distance_line);
		$data['line'] = $line;
		$num_lines = 1;
		$data['num_lines'] = $num_lines;
		
		$data['message'] = 'Distance between two point is calculated: '.$distance.' m<br><h6 style="margin:0;">Attention: This is an approximately value and calculated on spherical surface with help of <a href="http://www.movable-type.co.uk/scripts/latlong.html" style="color:white;">Haversine Formula</a>.(R is assumed as 6,378,137 m)</h6>';
		
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
		public function transform_to_cartesian() {
			$this->load->model('point_model');
			$data['dropdown'] = $this->point_model->list_editable_frames();
			$data['title'] = 'SELECT FRAME to choose geometries and transform it(they) to cartesian coordinate system';
			$data['main_content'] = 'select_frame_to_transform';
			$this->load->view('includes/template', $data);
		}
		public function view_geometries_to_transform(){
		
			$user_id = $this->input->post('user_id');
			$frame_id = $this->input->post('editable_frames');
			
			$data = $this->renderframe->render_frame_by_id_for_transform($frame_id);
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
		
			$this->load->view('includes/template', $data);
		
		
		}
}
