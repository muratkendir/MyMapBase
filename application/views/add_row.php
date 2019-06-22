<h2>Add row to your table: (<?php echo $table_name; ?>)</h2>
	
<fieldset>
	<legend>Row Information</legend>
	
	<?php
	
	echo form_open('table/insert_row/'.$table_name);
	
	//print_r($columns);
	//echo '</br>';
	foreach($columns as $column)
	{
		if ($column->Extra == 'auto_increment')
		{
		}
		elseif($column->Field == 'point')
		{
			echo form_label($column->Field, $column->Field);
			echo form_dropdown( $column->Field, $points );
		}
		elseif($column->Field == 'linestring')
		{
			echo form_label($column->Field, $column->Field);
			echo form_dropdown( $column->Field, $lines );
		}
		elseif($column->Field == 'polygon')
		{
			echo form_label($column->Field, $column->Field);
			echo form_dropdown( $column->Field, $polygons );
		}
		elseif($column->Type == 'text')
		{
			echo form_label($column->Field, $column->Field);
			echo form_input( $column->Field );
		}
		elseif($column->Type == 'int(11)')
		{
			echo form_label($column->Field, $column->Field);
			echo form_input( $column->Field );
		}
		elseif($column->Type == 'double')
		{
			echo form_label($column->Field, $column->Field);
			echo form_input( $column->Field );
		}
		elseif($column->Type == 'date')
		{
			echo form_label($column->Field, $column->Field);
			echo form_input( $column->Field );
		}
		
		else{}
	}
	
	echo form_submit('submit', 'Add row');
	?>
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
