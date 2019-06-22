<fieldset>
	<legend>Lenght of line</legend>
	
	<?php
	echo form_open('query/lenght_of_line');
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	echo form_hidden('render_for_sharing', '0');
	
	echo form_label('Envelope Lines','dropdown_lines');
	echo form_dropdown('dropdown_lines', $dropdown_lines);
	
	echo form_submit('submit', 'Calculate', 'class="submit_button"');
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
