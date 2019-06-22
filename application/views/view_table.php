<style> @import url('<?php echo base_url() ?>application/views/css/tables.css'); </style>

<div id="table_container">
	
<?php 
if (isset($table)){
$i = 0;
$j=0;

?>

<div id="tables">
	<div id="table_name">
		
		<?php 
		$table_name = explode('__', $table);
		echo $table_name[1]; 
		?>
		  <a href="http://www.mymapbase.com/cms/index.php/en/how-to#5-5-step-design-your-own-table" target="_blank">
				<span class="hint--rounded" data-hint="If you dont know how to design your table structure, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
				</a>
		<div class="controller_links">
			<?php echo anchor('table/add_column/'.$table, '+ Add Column', 'title="Add column"'); ?>
		</div>
	</div>
	<div id="column_titles">
	<?php 
	$column_number = count($columns[$i]);
	$column_width = 849 / $column_number;
	$column_width = floor($column_width);
	
	foreach ($columns[$i] as $column)
	{
		echo '<div id="column_name" style="width:'.$column_width.'px;">';
		if ($column->Field == 'id')
		{
			echo $column->Field;
		}
		elseif ($column->Field == 'point')
		{
			
			echo $column->Field;
			echo '<a title="Point" style="cursor:pointer;"> *</a>';
			echo '<div id="drop_column">'.anchor('table/drop_column/'.$table.'/'.$column->Field, '-', 'title="Drop Column"').'</div>';
		}
		elseif($column->Field == 'linestring')
		{
			echo $column->Field;
			echo '<a title="Line" style="cursor:pointer;"> *</a>';
			echo '<div id="drop_column">'.anchor('table/drop_column/'.$table.'/'.$column->Field, '-', 'title="Drop Column"').'</div>';
		}
		elseif($column->Field == 'polygon')
		{
			echo $column->Field;
			echo '<a title="Polygon" style="cursor:pointer;"> *</a>';
			echo '<div id="drop_column">'.anchor('table/drop_column/'.$table.'/'.$column->Field, '-', 'title="Drop Column"').'</div>';
		}
		elseif($column->Field == 'video')
		{
			echo $column->Field;
			echo '<a title="Video on Youtube" style="cursor:pointer;"> *</a>';
			echo '<div id="drop_column">'.anchor('table/drop_column/'.$table.'/'.$column->Field, '-', 'title="Drop Column"').'</div>';
		}
		else
		{
			echo $column->Field;
			echo '<a title="'.$column->Type.'" style="cursor:pointer;"> *</a>';
			echo '<div id="drop_column">'.anchor('table/drop_column/'.$table.'/'.$column->Field, '-', 'title="Drop Column"').'</div>';
		}
		echo '</div>';
	}
	$i++; 
	 ?>

	<div id="point_edit" class="column_title">Edit</div>
	<div id="point_delete" class="column_title">Delete</div>
	</div>
	
	<?php
	
	if($rows[0] != NULL)
	{
	$k = 1;
	foreach ($rows[$j] as $row)
	{
		echo '<div id="point_row" class="row">';
		echo '<div class="row_num">'.$k.'</div>';
		foreach ($row as $ro)
		{
			echo '<div class="row_value" style="width:'.$column_width.'px;">';
			if (strstr($ro, 'PNT_'))
			{
				$ro = str_replace('PNT_', '', $ro);
				$point_arr = explode("/", $ro);
				$frame_id = $point_arr[0];
				$point_id = $point_arr[1];
				echo anchor('point/show_point/'.$frame_id.'/'.$point_id.'/0', $point_id, 'title="View in map"');
			}
			elseif (strstr($ro, 'LNS_'))
			{
				$ro = str_replace('LNS_', '', $ro);
				$line_arr = explode("/", $ro);
				$frame_id = $line_arr[0];
				$line_id = $line_arr[1];
				echo anchor('line/show_line/'.$frame_id.'/'.$line_id.'/0', $line_id, 'title="View in map"');
			}
			elseif (strstr($ro, 'PLY_'))
			{
				$ro = str_replace('PLY_', '', $ro);
				$polygon_arr = explode("/", $ro);
				$frame_id = $polygon_arr[0];
				$polygon_id = $polygon_arr[1];
				echo anchor('polygon/show_polygon/'.$frame_id.'/'.$polygon_id.'/0', $polygon_id, 'title="View in map"');
			}
			elseif (strstr($ro, 'youtube'))
			{
				echo '<a title="Video on Youtube" target="_blank" href="'.$ro.'">'.$ro.'</a>';
			}
			else
			{
				echo $ro;
			}
			echo '</div>';
		}
		
	
		echo '<div id="point_edit">';
			
			echo form_open('table/edit_row/'.$table_name[1].'/'.$row['id']);
			echo form_submit('submit', '', 'id="submit_edit" title="Edit Row"'); 
			echo form_close();
		echo '</div>';
		echo '<div id="point_delete">';
			
			echo form_open('table/delete_row/'.$table_name[1].'/'.$row['id']);
			echo form_submit('submit', '', 'id="submit_delete" title="Delete Row"'); 
			echo form_close();
		echo '</div>';
		
		echo '</div>';
		$k++;
	}
	}
	else{echo 'Your table is empty.';}
	?>
	<div class="add_row">
	<?php echo anchor('table/add_row/'.$table, '+', 'title="Add row"'); ?>
	</div>
</div>
<?php 
$j++;
}
else {echo 'There is no tables available!';}
?>
</div>
<div style="margin:10px auto;text-align:center;width:450px;">
<?php 
	echo form_open('table/show_mymapbase/'.$table_name[1]);
	echo form_label('Available Frames', 'frames');
	echo form_dropdown('editable_frames', $dropdown);
	echo form_hidden('table_full_name', $table);
	echo form_submit('submit', 'Show MyMapBase', 'class="submit_button"');
	echo form_close();
?>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>	

<script type="text/javascript" charset="utf-8">
	$('.row:odd').css('background', '#e3e3e3');
	
	document.getElementById("tables").style.height = ((<?php echo $k; ?>-1)*30)+84 + "px";
</script>

