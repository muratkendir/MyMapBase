<h1>Edit Row</h1>
<fieldset>
	<legend>Row Data</legend>
	
	<?php
	
	$table = $this->uri->segment(3);;
	echo form_open('table/update_row/'.$table.'/'.$row_properties['id']);
	
	echo form_hidden('id', $row_properties['id']);
	
	$substracted_row_array = array_diff ($row_properties, array('id'=>$row_properties['id']));
	$i = 1;
	
	if (array_key_exists('point', $row_properties) == true)
	{
		echo form_label('Select Point', 'point');
		echo form_dropdown( 'point', $points, $row_properties['point'] );
		$substracted_row_array = array_diff ($substracted_row_array, array('point'=>$row_properties['point']));
		$i++;
	}
	if (array_key_exists('linestring', $row_properties) == true)
	{
		echo form_label('Select Line', 'line');
		echo form_dropdown( 'linestring', $lines, $row_properties['linestring'] );
		$substracted_row_array = array_diff ($substracted_row_array, array('linestring'=>$row_properties['linestring']));
		$i++;
	}
	if (array_key_exists('polygon', $row_properties) == true)
	{
		echo form_label('Select Polygon', 'polygon');
		echo form_dropdown( 'polygon', $polygons, $row_properties['polygon'] );
		$substracted_row_array = array_diff ($substracted_row_array, array('polygon'=>$row_properties['polygon']));
		$i++;
	}
	
	while (list ($key, $val) = each ($substracted_row_array)) 
	{
		echo form_label($key, $key);
		echo form_input($key, set_value($key, $val));
	}
	
	echo form_submit('submit', 'Submit Row');
	
	echo validation_errors('<p class="error">');
	?>
</fieldset>


