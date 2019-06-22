<h1>Edit Polygon</h1>
<fieldset>
	<legend>General Info</legend>
	
	<?php
	echo form_open('polygon/update_polygon/'.$polygon_properties['id']);
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	
	echo form_label('Polygon Title', 'title');
	echo form_input('title', set_value('current_title', $polygon_properties['title']));
	
	echo form_dropdown('editable_frames', $dropdown, $polygon_properties['frame_id']);
	
	$public_private = array (0 => 'Private', 1 => 'Public');
	echo form_label('Public or Private','public_private');
	echo form_dropdown('public_private', $public_private, $polygon_properties['public_private']);
	?>
</fieldset>

<fieldset>
	<legend>Polygon Points</legend>
	<?php
	$polygon_coords = $this->wkts->polygonwkt_to_coords($polygon_properties['AsText(polygon_polygon)']);
	
	echo form_label('Polygon Points', 'polygon_points');
	echo form_input('polygon_points', set_value('current_points', $polygon_coords));

	echo form_submit('submit', 'Edit Polygon');
	
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
