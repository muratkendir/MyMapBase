<h1>Delete one of your table</h1>
	
<fieldset>
	<legend>Table Info</legend>
	
	<?php
	echo form_open('table/drop_table');
	
	echo form_hidden('user_id', $user_id);
	foreach($tables as $table)
	{
		$data[$table] = $table;
	}
	
	echo form_label('Table Name', 'name');
	echo form_dropdown('table_name', $data);
	echo form_error('table_name');
	
	echo form_submit('submit', 'Delete Table');
	?>
</fieldset>
