<style> @import url('<?php echo base_url() ?>application/views/css/polygons.css'); </style>

<div class="polygons">
<?php 
	echo form_open('polygon/create_polygon');
	echo form_submit('submit', 'Add Polygon', 'id="submit_add_polygon" class="add_item" title="Add Polygon"'); 
	echo form_close();
?>
	<div id="polygon_row" class="titles_row">
		<div id="polygon_id" class="column_title">ID</div>
		<div id="polygon_title" class="column_title">Polygon Title</div>
		<div id="polygon_frame" class="column_title">Frame ID</div>
		<div id="polygon_points" class="column_title">Polygon Points</div>
		<div style="float:left;width:30px;">&nbsp;</div>
		<div id="edit" class="column_title">Edit</div>
		<div id="delete" class="column_title">Delete</div>
	</div>
	
<?php 
if (isset($polygons)){
foreach ($polygons as $row) : ?>

	<div id="polygon_row" class="row">
		<div id="polygon_id">
			<?php echo $row['id']; ?>
		</div>
		<div id="polygon_title">
			<?php echo 
				anchor('polygon/show_polygon/'.$row['frame_id'].'/'.$row['id'].'/0', $row['title']);
			?>
		</div>
		<div id="polygon_frame">
			<?php echo 
				anchor('frame/show_frame/'.$row['frame_id'].'/0', $row['frame_id'], 'title="Show Frame"');
			?>
		</div>
		<div id="polygon_points">
			<?php 
			$polygon_coords = $this->wkts->polygonwkt_to_coords($row['AsText(polygon_polygon)']);
			echo $polygon_coords; 
			?>
		</div>
		<div style="float:left;width:30px;">&nbsp;
		</div>
		<div id="edit">
			<?php 
			echo form_open('polygon/edit_polygon/'.$row['id']);
			echo form_submit('submit', '', 'id="submit_edit" title="Edit Polygon"'); 
			echo form_close();?>
		</div>
		<div id="delete">
			<?php 
			echo form_open('polygon/delete_polygon/'.$row['id']);
			echo form_submit('submit', '', 'id="submit_delete" title="Delete Polygon"'); 
			echo form_close();?>
		</div>
	</div>
<?php endforeach; 
}
else {
	echo 'There is no polygon available!';
}

?>
	<div id="pagination">
		<?php echo $this->pagination->create_links(); ?>
	</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>	

<script type="text/javascript" charset="utf-8">
	$('.row:odd').css('background', '#e3e3e3');
</script>
