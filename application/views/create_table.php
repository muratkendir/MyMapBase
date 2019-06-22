<h1>Create your own table</h1>
	
<fieldset>
	<legend>Table Info</legend>
	
	<?php
	echo form_open('table/add_table');
	
	echo form_hidden('user_id', $user_id);
	
	echo '<div class="helper_text">
		Remaining number for creating table is: '
		.$remaining_table_num.
		'</div>';
	
	echo form_label('Table Name', 'name');
	echo form_input('table_name');
	echo form_error('table_name');
	
	$public_private = array (0 => 'Private', 1 => 'Public');
	echo form_label('Public or Private','public_private');
	echo form_dropdown('public_private', $public_private, 0);
	
	echo form_submit('submit', 'Create Table');
	?>
</fieldset>

