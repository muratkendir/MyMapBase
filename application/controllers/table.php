<?php
class Table extends CI_Controller 
{
	function __construct()
	{
		parent::__construct();
		$this->userdata->is_logged_in();
		$this->load->dbforge();
		$this->load->model('table_model');
		$this->load->model('point_model');
	}
	function create_table ()
	{
		$remaining_table_num = $this->table_model->remaining_table_num();
		if ($remaining_table_num > 0)
		{
		$user_id = $this->session->userdata('user_id');
		$data['user_id'] = $user_id;
		$data['remaining_table_num'] = $remaining_table_num;
		$data['title'] = 'Create your own table';
		$data['main_content'] = 'create_table';
		$this->load->view('includes/template', $data);
		}
		else
		{
			$data['message'] = 'You do not have right to create more tables.Please contact with admin: muratkendir@gmail.com';
			$data['redirection_link'] = anchor('site/members_area', 'Members Area');
			$data['title'] = 'Error Message';
			$data['main_content'] = 'redirection';
			$this->load->view('includes/template', $data);
		}
	}
	function delete_table ()
	{
		$user_id = $this->session->userdata('user_id');
		$data['user_id'] = $user_id;
		$tables = $this->table_model->view_tables();
		$data['tables'] = $tables ;
		$data['title'] = 'Drop one of your table';
		$data['main_content'] = 'delete_table';
		$this->load->view('includes/template', $data);
	}
	function add_table()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('table_name', 'Table Name', 'trim|required|min_length[3]|max_length[50]');
	
		if($this->form_validation->run() == FALSE )
		{
			
			$this->create_table();
		}
		else
		{
			$query = $this->table_model->create_table();
			redirect('site/members_area');
		}
	}
	function drop_table()
	{
		$this->table_model->drop_table();
		redirect('site/members_area');
	}
	function view_table($table)
	{
		
		$user_id = $this->session->userdata('user_id');
		$table = $user_id.'__'.$table ;
		
		$columns = $this->table_model->get_columns($table);
		$column_arr[] = $columns;
		
		$rows = $this->table_model->get_rows($table);
		$row_arr[] = $rows;
		
		$data['dropdown'] = $this->point_model->list_editable_frames();
		
		$data['columns'] = $column_arr;
		$data['rows'] = $row_arr;
		$data['table'] = $table;
		$data['title'] = 'View your tables';
		$data['main_content'] = 'view_table';
		$this->load->view('includes/template', $data);
	}
	function add_column($table_name)
	{
		$user_id = $this->session->userdata('user_id');
		$data['user_id'] = $user_id;
		$data['table_name'] = $table_name;
		$data['title'] = 'Add Column to the table '.$table_name ;
		$data['main_content'] = 'add_column';
		$this->load->view('includes/template', $data);
	}
	function insert_column($table_name)
	{
		$user_id = $this->session->userdata('user_id');
		$column_type = $this->input->post('column_type');
		$column_name = $this->input->post('column_name');
		
		$this->load->library('form_validation');
		$this->form_validation->set_rules('column_name', 'Column Name', 'required|alpha_dash|xss_clean');
		
		if($this->form_validation->run() == FALSE)
		{
			$this->add_column($table_name);
		}
		else
		{
		$this->table_model->insert_column($table_name, $column_name, $column_type);
		$table_name = str_replace($user_id.'__', '', $table_name);
		redirect('table/view_table/'.$table_name);
		}
	}
	function drop_column($table_name, $column_name)
	{
		$user_id = $this->session->userdata('user_id');
		$this->dbforge->drop_column($table_name, $column_name);
		$table_name = str_replace($user_id.'__', '', $table_name);
		redirect('table/view_table/'.$table_name);
	}
	function add_row($table_name)
	{
		$user_id = $this->session->userdata('user_id');
		$columns = $this->table_model->get_columns($table_name);
		foreach ($columns as $column)
		{
			if ($column->Field == 'point')
			{
				$this->load->model('point_model');
				$points = $this->point_model->list_all_points_of_user($user_id);
				foreach ($points as $point)
				{
					$point_list['PNT_'.$point->frame_id.'/'.$point->id] = $point->title;
				}
				$data['points'] = $point_list;
			}
			if ($column->Field == 'linestring')
			{
				$this->load->model('line_model');
				$lines = $this->line_model->list_all_lines_of_user($user_id);
				foreach ($lines as $line)
				{
					$line_list['LNS_'.$line->frame_id.'/'.$line->id] = $line->title;
				}
				$data['lines'] = $line_list;
			}
			if ($column->Field == 'polygon')
			{
				$this->load->model('polygon_model');
				$polygons = $this->polygon_model->list_all_polygons_of_user($user_id);
				foreach ($polygons as $polygon)
				{
					$polygon_list['PLY_'.$polygon->frame_id.'/'.$polygon->id] = $polygon->title;
				}
				$data['polygons'] = $polygon_list;
			}
		}
		$data['table_name'] = $table_name;
		$data['columns'] = $columns;
		$data['title'] = 'Add row to your table ('.$table_name.')' ;
		$data['main_content'] = 'add_row';
		$this->load->view('includes/template', $data);
	}
	function insert_row($table_name)
	{
		$this->table_model->insert_row($table_name);
		$user_id = $this->session->userdata('user_id');
		$table_name = str_replace($user_id.'__', '', $table_name);
		redirect('table/view_table/'.$table_name);
	}
	public function edit_row($table_name, $row_id)
	{
		$user_id = $this->session->userdata('user_id');
		$data['row_properties'] = $this->table_model->get_row($table_name, $row_id);
		//print_r($data['row_properties']);
		
		$this->load->model('point_model');
		$points = $this->point_model->list_all_points_of_user($user_id);
		foreach ($points as $point)
		{
			$point_list['PNT_'.$point->frame_id.'/'.$point->id] = $point->title;
		}
		$data['points'] = $point_list;
		
		$this->load->model('line_model');
		$lines = $this->line_model->list_all_lines_of_user($user_id);
		
		foreach ($lines as $line)
		{
			$line_list['LNS_'.$line->frame_id.'/'.$line->id] = $line->title;
		}
		$data['lines'] = $line_list;
		
		$this->load->model('polygon_model');
		$polygons = $this->polygon_model->list_all_polygons_of_user($user_id);
		foreach ($polygons as $polygon)
		{
			$polygon_list['PLY_'.$polygon->frame_id.'/'.$polygon->id] = $polygon->title;
		}
		$data['polygons'] = $polygon_list;
		
		$data['title'] = 'Edit Row';
		$data['main_content'] = 'edit_row';
		$this->load->view('includes/template', $data);
	}
	public function update_row($table, $row_id)
	{
		$row_properties = $this->table_model->get_row($table, $row_id);
		
		$this->load->library('form_validation');
		
		$substracted_row_array = array_diff ($row_properties, array('id'=>$row_properties['id']));
		
		$i = 1;
		
		if (array_key_exists('point', $row_properties) == true)
		{
			$this->form_validation->set_rules('point', 'Point', 'required');
			$substracted_row_array = array_diff ($substracted_row_array, array('point'=>$row_properties['point']));
			$i++;
		}
		if (array_key_exists('linestring', $row_properties) == true)
		{
			$this->form_validation->set_rules('linestring', 'Linestring', 'required');
			$substracted_row_array = array_diff ($substracted_row_array, array('linestring'=>$row_properties['linestring']));
			
			$i++;
		}
		if (array_key_exists('polygon', $row_properties) == true)
		{
			$this->form_validation->set_rules('polygon', 'Polygon', 'required');
			$substracted_row_array = array_diff ($substracted_row_array, array('polygon'=>$row_properties['polygon']));
			$i++;
		}
	
		while (list ($key, $val) = each ($substracted_row_array)) 
		{
			$this->form_validation->set_rules($key, $key, 'required');
		}
		
		
		
		
		
		if($this->form_validation->run() == FALSE )
		{
			$this->edit_row($table, $row_id);
		}
		else
		{
			$this->table_model->update_row($table, $row_id);
			
			$message = 'Point (ID: '.$row_id.') is edited.';
			$message .= 'Turn back to ';
			$message .= anchor('table/view_table/'.$table, 'View Table', 'style="color:#F0F0F0;font-style:italic;"');
			
			$data['message'] = $message;
			$data['title'] = 'Row edited';
			$data['main_content'] = 'blank_page';
			$this->load->view('includes/template', $data);
		}
	}
	
	public function delete_row($table_name, $row_id)
	{
		$this->table_model->delete_row($table_name, $row_id);
		
		$message = 'Row (ID: '.$row_id.') is deleted.';
		$message .= 'Turn back to ';
		$message .= anchor('table/view_table/'.$table_name, 'View Table', 'style="color:#F0F0F0;font-style:italic;"');
		
		$data['message'] = $message;
		$data['title'] = 'Selected Row deleted';
		$data['main_content'] = 'blank_page';
		$this->load->view('includes/template', $data);
	}
	public function show_mymapbase($table_id)
	{
		$table_full_name = $this->input->post('table_full_name');
		$frame_id = $this->input->post('editable_frames');
		
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
		if(!isset($render_for_sharing) or $render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
}
