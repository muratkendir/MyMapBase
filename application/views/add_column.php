<h2>Add Column to the table: <?php echo $table_name; ?></h2>
	
<fieldset>
	<legend>Column Information</legend>
	
	<?php
	
	echo form_open('table/insert_column/'.$table_name);
	
	echo form_label('Column Name', 'column_name');
	echo form_input('column_name', set_value('column_name'));
	
	echo form_label('Column Type', 'column_type');
	$column_types = array('0' => 'Text', '1' => 'Integer', '2' => 'Double', '3' => 'Date', '4' => 'Point', '5' => 'Line', '6' => 'Polygon', '7' => 'Video (Youtube)', '8' => 'Image URL', '9'=>'iframe', '10'=>'URL');
	echo form_dropdown('column_type', $column_types);
	
	echo form_submit('submit', 'Add your column');
	?>
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>


