<h1>Create a Frame
<a href="http://www.mymapbase.com/cms/index.php/en/how-to#1-1-step-create-your-frame" target="_blank">
			<span class="hint--rounded" data-hint="If you dont know how to create your frame, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
			</a>
</h1>
<div>	
<fieldset>
	<legend>WMS (Web Mapping Service) Info</legend>
	
	<?php
	echo form_open('frame/add_frame');
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	
	echo form_label('Frame Title', 'title');
	echo form_input('title');
	
	$wms_default = '1';
	echo form_label('WMS Layers','wms_layer');
	echo '<span class="hint--rounded" data-hint="Choose single or multiple WMS Layers. For a multiple choice you should hold down CTRL or SHIFT button on your keyboard." style="color:#FE5928;">*</span>';
	echo form_multiselect('wms_layer[]', $wms_layers, $wms_default);
	
	$public_private = array (0 => 'Private', 1 => 'Public');
	echo form_label('Public or Private','public_private');
	echo '<span class="hint--rounded" data-hint="Select Sharing Status, Private or Public. If you select Private, you can not share your frame anywhere." style="color:#FE5928;">*</span>';
	echo form_dropdown('public_private', $public_private, 0);
	?>
</fieldset>

<fieldset>
	<legend>Frame Properties</legend>
		<p style="margin:0;text-align:right;"><?php
		$atts = array
			(
				'width'      => '800',
				'height'     => '500',
				'scrollbars' => 'yes',
				'status'     => 'yes',
				'resizable'  => 'yes',
				'screenx'    => '0',
				'screeny'    => '0',
				'title'      => 'Help to considering to Center Point Long/lat and Zoom Level'
			);

			echo anchor_popup('frame/create_frame_helper', 'Frame Helper!', $atts);
		?></p>
		<?php
			echo form_label('Frame Width', 'width');
			echo '<span class="hint--rounded" data-hint="Write your decided frame width in pixel unit. (eg. 1024 )" style="color:#FE5928;">*</span>';
			echo form_input('width');
	
			echo form_label('Frame Height', 'height');
			echo '<span class="hint--rounded" data-hint="Write your decided frame height in pixel unit.(eg. 768 )" style="color:#FE5928;">*</span>';
			echo form_input('height');
		
			echo form_label('Center Longitude', 'get_center_long');
			echo '<span class="hint--rounded" data-hint="Write center point longitude of your frame in decimal degree unit (eg. 29.12345678 ). If you can not decide that use frame helper." style="color:#FE5928;">*</span>';
			echo form_input('get_center_long');

			echo form_label('Center Latitude', 'get_center_lat');
			echo '<span class="hint--rounded" data-hint="Write center point latitude of your frame in decimal degree unit (eg. 41.12345678 ). If you can not decide that use frame helper." style="color:#FE5928;">*</span>';
			echo form_input('get_center_lat');
			
			echo form_label('Zoom to Extend', 'zoom_to_extend');
			echo '<span class="hint--rounded" data-hint="Write zoom level of your frame. You can write just integers between 1 and 17. Also frame helper contains zoom level info." style="color:#FE5928;">*</span>';
			echo form_input('zoom_to_extend');
			
			echo form_submit('submit', 'Create Frame', 'class="submit_button"');
	
		?>
	
		<?php echo validation_errors('<p class="error">'); ?>
</fieldset>

