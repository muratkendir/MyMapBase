<h1>Create a Point 
<a href="http://www.mymapbase.com/cms/index.php/en/how-to#2-2-step-create-your-points" target="_blank">
				<span class="hint--rounded" data-hint="If you dont know how to create your point, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
				</a>
</h1>
	
<fieldset>
	<legend>Select Frame in which your geometries exist</legend>
	
	<?php
	echo form_open('calculation/view_geometries_to_transform');
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	
	echo form_label('Available Frames', 'frames');
	$dropdown_id = 'id="frame_id" onChange="getFrameId();"';
	echo form_dropdown('editable_frames', $dropdown, '0', $dropdown_id );
	
	echo form_submit('submit', 'Select Frame', 'class="submit_button"');
	echo form_close();
	?>
	
	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
<div style="margin:0 auto;width:300px;height:200px;">
	
	
</div>
