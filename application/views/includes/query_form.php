
<fieldset>
	<legend>Create new Polygon from Envelope Query</legend>
	
	<?php
	echo form_open('polygon/add_polygon');
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	
	echo form_label('Polygon Title', 'title');
	echo form_input('title');
	
	echo form_dropdown('editable_frames', $dropdown);
	
	$public_private = array (0 => 'Public', 1 => 'Private');
	echo form_label('Public or Private','public_private');
	echo form_dropdown('public_private', $public_private, 0);
	
	echo form_hidden('polygon_points', $polygon_points);
	
	echo form_submit('submit', 'Create Polygon', 'class="submit_button"');
	
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
