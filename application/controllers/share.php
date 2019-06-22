<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Share extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('share_model');
		$this->load->model('point_model');
		$this->load->model('line_model');
		$this->load->model('polygon_model');
		$this->load->model('table_model');
	}
	public function frame($frame_id)
	{
		//frame control for public sharing.
		$frame_sharing = $this->share_model->control_sharing_status($frame_id);
		if ($frame_sharing == 1)
		{
			echo '<h2>Copy the following code and paste in to your web page.</h2>';
			echo '<textarea rows="5" cols="50">';
			echo '<iframe src="';
			echo base_url();
			echo 'index.php/share/show_frame/'.$frame_id.'" width="800" height="600"></iframe>';
			echo '</textarea>';
		}
		else
		{
			echo '<p class="error">This frame is private, not available for sharing.</p>';
		}
	}
	public function show_frame($frame_id)
	{
			$data = $this->renderframe->render_frame_by_id($frame_id);
			$data['title'] = 'Share Frame';
			$this->load->view('render_share_frame', $data);
			
	}
	public function point($frame_id, $point_id)
	{
		
		$point_sharing = $this->share_model->control_sharing_status_for_point($point_id);
		
		if ($point_sharing == 1)
		{
			echo '<h2>Copy the following code and paste in to your web page.</h2>';
			echo '<textarea rows="5" cols="50">';
			echo '<iframe src="';
			echo base_url();
			echo 'index.php/share/show_point/'.$frame_id.'/'.$point_id.'" width="800" height="600"></iframe>';
			echo '</textarea>';
		}
		else
		{
			echo '<p class="error">This point is private, not available for sharing.</p>';
		}
	}
	public function show_point($frame_id, $point_id)
	{
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Shared Point';
		
		$point_properties = $this->point_model->show_point($point_id);
		
		$data['point_id'] = $point_properties['id'];		
		$data['point_title'] = $point_properties['title'];	
		$data['frame_of_point_id'] = $point_properties['frame_id'];
		$data['geometry'] = $point_properties['AsText(point_point)'];
		
		$this->load->view('render_share_frame', $data);
	}
		public function line($frame_id, $line_id)
	{
		
		$line_sharing = $this->share_model->control_sharing_status_for_line($line_id);
		
		if ($line_sharing == 1)
		{
			echo '<h2>Copy the following code and paste in to your web page.</h2>';
			echo '<textarea rows="5" cols="50">';
			echo '<iframe src="';
			echo base_url();
			echo 'index.php/share/show_line/'.$frame_id.'/'.$line_id.'" width="800" height="600"></iframe>';
			echo '</textarea>';
		}
		else
		{
			echo '<p class="error">This line is private, not available for sharing.</p>';
		}
	}
	public function show_line($frame_id, $line_id)
	{
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Shared Line';
		
		$line_properties = $this->line_model->show_line($line_id);
		
		$data['line_id'] = $line_properties['id'];		
		$data['line_title'] = $line_properties['title'];	
		$data['frame_of_line_id'] = $line_properties['frame_id'];
		$data['geometry'] = $line_properties['AsText(line_line)'];
		
		$this->load->view('render_share_frame', $data);
	}
	public function polygon($frame_id, $polygon_id)
	{
		
		$polygon_sharing = $this->share_model->control_sharing_status_for_polygon($polygon_id);
		
		if ($polygon_sharing == 1)
		{
			echo '<h2>Copy the following code and paste in to your web page.</h2>';
			echo '<textarea rows="5" cols="50">';
			echo '<iframe src="';
			echo base_url();
			echo 'index.php/share/show_polygon/'.$frame_id.'/'.$polygon_id.'" width="800" height="600"></iframe>';
			echo '</textarea>';
		}
		else
		{
			echo '<p class="error">This polygon is private, not available for sharing.</p>';
		}
	}
	public function show_polygon($frame_id, $polygon_id)
	{
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Shared Polygon';
		
		$polygon_properties = $this->polygon_model->show_polygon($polygon_id);
		
		$data['polygon_id'] = $polygon_properties['id'];		
		$data['polygon_title'] = $polygon_properties['title'];	
		$data['frame_of_polygon_id'] = $polygon_properties['frame_id'];
		$data['geometry'] = $polygon_properties['AsText(polygon_polygon)'];
		
		$this->load->view('render_share_frame', $data);
	}
	public function table($frame_id, $table_name)
	{
		$user_id = $this->session->userdata('user_id');
		$table_sharing = $this->share_model->control_sharing_status_for_table($table_name);
		
		if ($table_sharing == 1)
		{
			echo '<h2>Copy the following code and paste in to your web page.</h2>';
			echo '<textarea rows="5" cols="50">';
			echo '<iframe src="';
			echo base_url();
			echo 'index.php/share/show_table/'.$frame_id.'/'.$table_name.'/'.$user_id.'" width="800" height="600"></iframe>';
			echo '</textarea>';
		}
		else
		{
			echo '<p class="error">This table is private, not available for sharing.</p>';
		}
	}
	public function show_table($frame_id, $table_name, $user_id)
	{
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Shared Table';
		
		
		/*$table_properties = $this->table_model->show_table($table_id);
		
		$data['table_id'] = $table_properties['id'];		
		$data['table_title'] = $table_properties['title'];	
		$data['frame_of_table_id'] = $table_properties['frame_id'];
		$data['geometry'] = $table_properties['AsText(polygon_polygon)'];
		
		$this->load->view('render_share_frame', $data);*/
		
		$table_full_name = $user_id . '__' . $table_name ;
		
		$geometries=$this->table_model->get_rows($table_full_name);
		
		$i = 1;
		$j= 1;
		$k=1;
		$point_elements = array();
		$line_elements = array();
		$polygon_elements = array();
		
		foreach($geometries as $geometry)
		{
			if (isset($geometry['point']) AND $geometry['point'] != NULL)
			{
				$point_elements[$i] = $geometry;
				$point_ids[$i] = $geometry['point'];
				$i++;
			}
		}
		
		foreach($geometries as $geometry)
		{
			if (isset($geometry['linestring']) AND $geometry['linestring'] != NULL )
			{
				$line_elements[$j] = $geometry;
				$line_ids[$j] = $geometry['linestring'];
				$j++;
			}
		}
		foreach($geometries as $geometry)
		{
			if (isset($geometry['polygon']) AND $geometry['polygon'] != NULL )
			{
				$polygon_elements[$k] = $geometry;
				$polygon_ids[$k] = $geometry['polygon'];
				$k++;
			}
		}
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Show All rows in selected frame';
		
		
		if(isset($point_ids))
		{
		$points_properties = $this->table_model->get_points($point_ids);
		}
		if (isset($points_properties))
		{
			$i=0;
			foreach ($points_properties as $row)
			{	
				$point[] = $row;
				$i++;
			}
			$j=0;
			foreach ($point_elements as $info)
			{
					$k = 0;
					while(list($ky, $vl) = each ($info))
					{
						
						$point_info[$j]['keys'][$k] = $ky ;
						$point_info[$j]['values'][$k] = $vl;
						$k++;
					}
					$j++;
			}
			
			$data['point_info'] = $point_info;
			$num_point_infos = $k;
			$data['num_point_infos'] = $num_point_infos;
			$data['point'] = $point;
			$num_points =$i;
			$data['num_points'] = $num_points;
		}
		else
		{
			$num_points = 0;
		}
		
		
		if (isset($line_ids))
		{
			$lines_properties = $this->table_model->get_lines($line_ids);
		}
		else{}
		if (isset($lines_properties))
		{
			$i=0;
			foreach ($lines_properties as $row)
			{	
				$line[] = $row;
				$i++;
			}
			$j=0;
			foreach ($line_elements as $info)
			{
					$k = 0;
					while(list($ky, $vl) = each ($info))
					{
						
						$line_info[$j]['keys'][$k] = $ky ;
						$line_info[$j]['values'][$k] = $vl;
						$k++;
					}
					$j++;
			}
			
			$data['line_info'] = $line_info;
			$num_line_infos = $k;
			$data['num_line_infos'] = $num_line_infos;
			$data['line'] = $line;
			$num_lines =$i;
			$data['num_lines'] = $num_lines;
		}
		else
		{
			$num_lines = 0;
		}
		
		if (isset($polygon_ids))
		{
			$polygons_properties = $this->table_model->get_polygons($polygon_ids);
		}
		if (isset($polygons_properties))
		{
			$i=0;
			foreach ($polygons_properties as $row)
			{	
				$polygon[] = $row;
				$i++;
			}
			$j=0;
			foreach ($polygon_elements as $info)
			{
					$k = 0;
					while(list($ky, $vl) = each ($info))
					{
						
						$polygon_info[$j]['keys'][$k] = $ky ;
						$polygon_info[$j]['values'][$k] = $vl;
						$k++;
					}
					$j++;
			}
			$data['polygon_info'] = $polygon_info;
			$num_polygon_infos = $k;
			$data['num_polygon_infos'] = $num_polygon_infos;
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
			$data['message'] = 'There are '.$num_points.' point(s), '.$num_lines.' line(s) and '.$num_polygons.' polygon(s) on this table.';
		}
		
		$data['main_content'] = 'render_mymapbase';
		
		$this->load->view('render_share_mymapbase', $data);
		
	}
}
