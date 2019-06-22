<h1>Edit Line</h1>

<fieldset>
	<legend>General Info</legend>
	
	<?php
	echo form_open('line/update_line/'.$line_properties['id']);
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	
	echo form_label('Line Title', 'title');
	echo form_input('title', set_value('current_title', $line_properties['title']));
	
	echo form_dropdown('editable_frames', $dropdown, $line_properties['frame_id']);
	
	$public_private = array (0 => 'Private', 1 => 'Public');
	echo form_label('Public or Private','public_private');
	echo form_dropdown('public_private', $public_private, $line_properties['public_private']);
	?>
</fieldset>

<fieldset>
	<legend>Point Location</legend>
	<?php

	echo form_label('Line Points', 'line_points');
	$line_coords = $this->wkts->linewkt_to_coords($line_properties['AsText(line_line)']);
	echo form_input('line_points', set_value('current_line', $line_coords));

	echo form_submit('submit', 'Edit Line');
	
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
