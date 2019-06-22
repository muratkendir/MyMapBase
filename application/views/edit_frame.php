<h1>Edit Frame</h1>
<div>
<fieldset>
	<legend>WMS (Web Mapping Service) Info</legend>
	
	<?php
	echo form_open('frame/update_frame/'.$frame_properties['id']);
	$user_id = $this->session->userdata('user_id');
	
	echo form_hidden('user_id', $user_id);
	echo form_hidden('id', $frame_properties['id']);
	
	echo form_label('Frame Title', 'title');
	echo form_input('title', set_value('current_title', $frame_properties['title']));
	
	$wms_default = explode(',', $frame_properties['wms_layer_ids']);
	foreach($wms_default as $row)
	{
		$wms_defaults[$row] = $row;
	}
	echo form_label('WMS Layers','wms_layer');
	echo form_multiselect('wms_layer[]', $wms_layers, $wms_defaults);
	
	$public_private = array (0 => 'Private', 1 => 'Public');
	echo form_label('Public or Private','public_private');
	echo form_dropdown('public_private', $public_private, $frame_properties['public_private']);
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
			echo form_input('width', set_value('current_width', $frame_properties['width']));
	
			echo form_label('Frame Height', 'height');
			echo form_input('height', set_value('current_height', $frame_properties['height']));
		
			$center_coord = str_replace('POINT(', '', $frame_properties['AsText(get_center_point)']);
			$center_coord = str_replace(')', '', $center_coord);
			$center_coord = explode(' ', $center_coord);
			
			echo form_label('Center Longitude', 'get_center_long');
			echo form_input('get_center_long', set_value('current_center_long', $center_coord[0]));
			
			echo form_label('Center Latitude', 'get_center_lat');
			echo form_input('get_center_lat', set_value('current_center_lat', $center_coord[1]));
			
			echo form_label('Zoom to Extend', 'zoom_to_extend');
			echo form_input('zoom_to_extend', set_value('current_zoom_to_extend', $frame_properties['zoom_to_extend']));
			echo form_submit('submit', 'Edit Frame');
	
		?>
	
		<?php echo validation_errors('<p class="error">'); ?>
</fieldset>

