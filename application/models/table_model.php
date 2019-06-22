<?php

class Table_model extends CI_Model 
{
	public function create_table()
	{
		$user_id = $this->session->userdata('user_id');
		
		$table_name = $this->input->post('table_name');
		
		$turkce_karakterler =           array("ü", "ö", "ç", "ş", "ğ", "ı", " ", "Ü", "Ö", "Ç", "Ş", "Ğ", "İ");
		$turkce_karakter_karsiliklari = array("u", "o", "c", "s", "g", "i", "_", "U", "O", "C", "S", "G", "I");
		$table_name_ascii = str_replace ($turkce_karakterler, $turkce_karakter_karsiliklari, $table_name);
		$table_name_lower_ascii = strtolower($table_name_ascii);
		
		//--başlangıç-- 0__table tablosuna tablo bilgilerini girme kodları.
		$title = $this->input->post('table_name');
		$public_private = $this->input->post('public_private');
		$exact_name = $table_name_lower_ascii;
		$user_id = $this->input->post('user_id');
		
		$sql = "INSERT INTO 0__table
			(title, public_private, exact_name, owner_id) 
			VALUES (
				'$title',  
				$public_private, 
				'$exact_name', 
				$user_id
			)";
		
		$this->db->query($sql);
		//--bitiş--  0__table tablosuna tablo bilgilerini girme kodları.
		
		$this->dbforge->add_field('id');
		$this->dbforge->create_table($user_id.'__'.$table_name_lower_ascii);
		
		$this->db->select('user_tables');
		$this->db->where('id', $user_id);
		$query = $this->db->get('0__membership');
		$query = $query->row();
		
		if ($query->user_tables == "")
		{
			$data[0] = $user_id.'__'.$table_name_lower_ascii;
			$newusertables = $data[0];
		}
		else
		{
			$usertables = explode( ',' , $query->user_tables);
			foreach ($usertables as $table)
			{
				$data[] = $table;
			}
			$data[] = $user_id.'__'.$table_name_lower_ascii;
			$newusertables = implode(",", $data);
		}
		
		
		$newusertables = array('user_tables' => $newusertables);
		$this->db->where('id', $user_id);
		$this->db->update('0__membership', $newusertables); 
		
		//return $newusertables;
	}
	public function remaining_table_num()
	{
		$user_id = $this->session->userdata('user_id');
		$this->db->select('user_tables, access_level');
		$this->db->where('id', $user_id);
		$query = $this->db->get('0__membership');
		$query = $query->row();
		
		$available_tables = $query->user_tables;
		$available_tables = explode(',', $available_tables);
		$available_table_num = count($available_tables);
		$table_right_num = $query->access_level;
		return($table_right_num - $available_table_num);
	}
	public function drop_table()
	{
		$table_name = $this->input->post('table_name');
		$user_id = $this->session->userdata('user_id');
		$table_name = $user_id.'__'.$table_name;
		$this->db->select('user_tables');
		$this->db->where('id', $user_id);
		$query = $this->db->get('0__membership');
		$query = $query->row();
		$usertables = explode( ',' , $query->user_tables);
		foreach($usertables as $usertable)
		{
			if ($usertable == $table_name)
			{}
			else
			{
				$data[] = $usertable ;
			}
		}
		$usertables = implode(',', $data);
		
		$new_tables = array('user_tables' => $usertables);
		$this->db->where('id', $user_id);
		$this->db->update('0__membership', $new_tables);
		$this->dbforge->drop_table($table_name);
	}
	public function view_tables()
	{
		$user_id = $this->session->userdata('user_id');
		$this->db->select('user_tables');
		$this->db->where('id', $user_id);
		$query = $this->db->get('0__membership');
		$query = $query->row();
		$usertables = explode( ',' , $query->user_tables);
		foreach ($usertables as $table)
			{
				$table = str_replace($user_id.'__', '', $table);
				$data[] = $table;
			}
		return $data;
	}
	public function get_columns($table)
	{
		//echo $table.' modele geldi</br>';
		$sql = $this->db->query('SHOW COLUMNS FROM '.$table);
		$columns = $sql->result();
		return $columns;
		//print_r($columns);
	}
	public function insert_column($table_name, $column_name, $column_type)
	{
		//echo '</br>'.$table_name.'</br>'.$column_name.'</br>'.$column_type;
		if ($column_type == 0) 
		{
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		} 
		elseif ($column_type == 1) 
		{
			$fields = array
			(
				$column_name => array('type' => 'INTEGER')
			);
		} 
		elseif ($column_type == 2) 
		{
			$fields = array
			(
				$column_name => array('type' => 'DOUBLE')
			);
		}
		elseif ($column_type == 3)
		{
			$fields = array
			(
				$column_name => array('type' => 'DATE')
			);
		}
		elseif ($column_type == 4)
		{
			$column_name = 'point';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		elseif ($column_type == 5)
		{
			$column_name = 'linestring';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		elseif ($column_type == 6)
		{
			$column_name = 'polygon';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		elseif ($column_type == 7)
		{
			$column_name = 'video';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		elseif ($column_type == 8)
		{
			$column_name = 'imageURL';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		elseif ($column_type == 9)
		{
			$column_name = 'iframe';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		elseif ($column_type == 10)
		{
			$column_name = 'URL';
			$fields = array
			(
				$column_name => array('type' => 'TEXT')
			);
		}
		
		$this->dbforge->add_column($table_name, $fields);
	}
	public function insert_row($table_name)
	{
		$columns = $this->get_columns($table_name);
		//print_r($columns);
		
		foreach($columns as $column)
		{
			$row_value[$column->Field] = $this->input->post($column->Field);
		}
		//print_r($row_value);
		$this->db->insert($table_name, $row_value); 
	}
	public function get_rows($table)
	{
		$query = $this->db->get($table);
		if ($query->num_rows() > 0)
		{
			foreach ($query->result_array() as $row)
			{
				$data[] = $row;
			}
			return $data;
		}
		else {return NULL;}
	}
	public function get_row($table, $row_id)
	{
		$user_id = $this->session->userdata('user_id');
		$table_full_name = $user_id.'__'.$table;
		
		$this->db->where('id', $row_id);
		$query = $this->db->get($table_full_name);
		
		return $query->row_array();
		
	}
	public function update_row($table, $row_id)
	{
		//echo $table.'<br>';
		//echo $row_id.'<br>';
		$user_id = $this->session->userdata('user_id');
		$this->db->where('id', $row_id);
		$query = $this->db->get($user_id.'__'.$table);
		$query = $query->row_array();
		
		//print_r($query);
		//echo '<br><br>';
		$i=0;
		while(list($ky, $vl) = each ($query))
			{
						
				$row_info['keys'][$i] = $ky ;
				$row_info['values'][$i] = $vl;
				$sorgu = 'SHOW FIELDS FROM '.$user_id.'__'.$table.' where Field ="'.$row_info['keys'][$i].'"';
				$sorgu_sonucu = $this->db->query($sorgu);
				$row_info['type'][$i] = $sorgu_sonucu->result()[0]->Type;

				$i++;
			}
			
			for ($k=0; $k < $i; $k++)
			{
				$input_values[$k] = $this->input->post($row_info['keys'][$k]);
			}			
			
			$set_text = '';
			for ($j=0; $j < $i; $j++)
			{
				
				if ($row_info['type'][$j] == 'text' )
				{
					$set_text = $set_text.'   '.$row_info['keys'][$j].' = \''.$input_values[$j].'\',';
				}
				else
				{
					$set_text = $set_text.'   '.$row_info['keys'][$j].' = '.$input_values[$j].',';
				}
			}
			
			$set_text = substr($set_text, 0, -1);
			
		$sql = "UPDATE ".$user_id."__".$table." 
			SET
				$set_text
			WHERE 
				id = $row_id 
			";
		
		$this->db->query($sql);
		
	}
	function get_points($point_ids)
	{	
		
		$i=0;
		foreach($point_ids as $point_id)
		{
			$point_exp = explode('_', $point_id);
			$point = explode('/', $point_exp[1]);
			$points[$i] = $point[1];
			$i++;
		}
		$point_sql = $points[0];
		$point_order = $points[0];
		for ($j=0 ; $j<$i-1; $j++ )
		{
			$point_sql = $point_sql.' OR id = '.$points[$j+1];
		}
		for ($k=0 ; $k<$i-1; $k++ )
		{
			$point_order = $point_order.', '.$points[$k+1];
		}
		$query = $this->db->query
			('SELECT id, title, frame_id, AsText(point_point) FROM 0__point WHERE id ='.$point_sql.' ORDER BY FIELD (id, '.$point_order.')');
			
		
		if ($query->num_rows() > 0)
		{
			foreach ($query->result_array() as $row)
			{
				$data[] = $row;
			}
			return $data;
			
		}
		else {return NULL;}
	}
	function get_lines($line_ids)
	{	
		
		$i=0;
		foreach($line_ids as $line_id)
		{
			$line_exp = explode('_', $line_id);
			$line = explode('/', $line_exp[1]);
			$lines[$i] = $line[1];
			$i++;
		}
		
		$line_sql = $lines[0];
		$line_order = $lines[0];
		for ($j=0 ; $j<$i-1; $j++ )
		{
			$line_sql = $line_sql.' OR id = '.$lines[$j+1];
		}
		for ($k=0 ; $k<$i-1; $k++ )
		{
			$line_order = $line_order.', '.$lines[$k+1];
		}
		$query = $this->db->query
			('SELECT id, title, frame_id, AsText(line_line) FROM 0__line WHERE id ='.$line_sql.' ORDER BY FIELD (id, '.$line_order.')');
		
		if ($query->num_rows() > 0)
		{
			foreach ($query->result_array() as $row)
			{
				$data[] = $row;
			}
			return $data;
		}
		else {return NULL;}
	}
	function get_polygons($polygon_ids)
	{	
		
		$i=0;
		foreach($polygon_ids as $polygon_id)
		{
			$polygon_exp = explode('_', $polygon_id);
			$polygon = explode('/', $polygon_exp[1]);
			$polygons[$i] = $polygon[1];
			$i++;
		}
		
		$polygon_sql = $polygons[0];
		$polygon_order = $polygons[0];
		for ($j=0 ; $j<$i-1; $j++ )
		{
			$polygon_sql = $polygon_sql.' OR id = '.$polygons[$j+1];
		}
		for ($k=0 ; $k<$i-1; $k++ )
		{
			$polygon_order = $polygon_order.', '.$polygons[$k+1];
		}
		$query = $this->db->query
			('SELECT id, title, frame_id, AsText(polygon_polygon) FROM 0__polygon WHERE id ='.$polygon_sql.' ORDER BY FIELD (id, '.$polygon_order.')');
		
		if ($query->num_rows() > 0)
		{
			foreach ($query->result_array() as $row)
			{
				$data[] = $row;
			}
			return $data;
		}
		else {return NULL;}
	}
	function delete_row($table_name, $row_id)
	{
		$user_id = $this->session->userdata('user_id');
		$table_full_name = $user_id.'__'.$table_name;

		$this->db->where('id', $row_id);
		$this->db->delete($table_full_name);
	}
}
