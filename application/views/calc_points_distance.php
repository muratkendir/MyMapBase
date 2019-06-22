<fieldset>
	<legend>Calculate distance between two points</legend>
	
	<?php
	echo form_open('calculation/calc_between_points');
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	echo form_hidden('render_for_sharing', '0');
	
	echo form_label('First Point','dropdown_point1');
	echo form_dropdown('dropdown_point1', $dropdown_points);
	
	echo form_label('Second Point','dropdown_point2');
	echo form_dropdown('dropdown_point2', $dropdown_points);
	
	echo form_submit('submit', 'Calculate Distance', 'class="submit_button"');
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
