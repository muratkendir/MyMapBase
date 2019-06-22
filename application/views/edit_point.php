<h1>Edit Point</h1>
<fieldset>
	<legend>General Info</legend>
	
	<?php
	echo form_open('point/update_point/'.$point_properties['id']);
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	echo form_hidden('point_id', $point_properties['id']);
	
	echo form_label('Point Title', 'title');
	echo form_input('title', set_value('current_title', $point_properties['title']));
	
	echo form_dropdown('editable_frames', $dropdown, $point_properties['frame_id']);
	
	$public_private = array (0 => 'Private', 1 => 'Public');
	echo form_label('Public or Private','public_private');
	echo form_dropdown('public_private', $public_private, $point_properties['public_private']);
	?>
</fieldset>

<fieldset>
	<legend>Point Location</legend>
	<?php
	
	$point_coord = str_replace('POINT(', '', $point_properties['AsText(point_point)']);
	$point_coord = str_replace(')', '', $point_coord);
	$point_coord = explode(' ', $point_coord);
	
	echo form_label('Point Longitude', 'point_long');
	echo form_input('point_long', set_value('current_point_long', $point_coord[0]));

	echo form_label('Point Latitude', 'point_lat');
	echo form_input('point_lat', set_value('current_point_lat', $point_coord[1]));

	echo form_submit('submit', 'Edit Point');
	
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
