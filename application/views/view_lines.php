<style> @import url('<?php echo base_url() ?>application/views/css/lines.css'); </style>
<div class="lines">
<?php 
	echo form_open('line/create_line');
	echo form_submit('submit', 'Add Line', 'id="submit_add_line" title="Add Line"'); 
	echo form_close();
?>
	<div id="line_row" class="titles_row">
		<div id="line_id" class="column_title">ID</div>
		<div id="line_title" class="column_title">line Title</div>
		<div id="line_frame" class="column_title">Frame ID</div>
		<div id="line_points" class="column_title">Line Points</div>
		<div style="float:left;width:30px;">&nbsp;</div>
		<div id="edit" class="column_title">Edit</div>
		<div id="delete" class="column_title">Delete</div>
	</div>
	
<?php 
if (isset($lines)){
	foreach ($lines as $row) : ?>

	<div id="line_row" class="row">
		<div id="line_id">
			<?php echo $row['id']; ?>
		</div>
		<div id="line_title">
			<?php echo 
				anchor('line/show_line/'.$row['frame_id'].'/'.$row['id'], $row['title']);
			?>
		</div>
		<div id="line_frame">
			<?php echo 
				anchor('frame/show_frame/'.$row['frame_id'], $row['frame_id'], 'title="Show frame"');
			?>
		</div>
		<div id="line_points">
			<?php 
				
				$line = $this->wkts->linewkt_to_coords($row['AsText(line_line)']);
				echo $line; 
			?>
		</div>
		<div style="float:left;width:30px;">&nbsp;
		</div>
		<div id="edit">
			<?php 
			echo form_open('line/edit_line/'.$row['id']);
			echo form_submit('submit', '', 'id="submit_edit" title="Edit Line"'); 
			echo form_close();?>
		</div>
		<div id="delete">
			<?php 
			echo form_open('line/delete_line/'.$row['id']);
			echo form_submit('submit', '', 'id="submit_delete" title="Delete Line"'); 
			echo form_close();?>
		</div>
	</div>
<?php endforeach;
}
else {echo 'There is no lines available!';}
?>
	<div id="pagination">
		<?php echo $this->pagination->create_links(); ?>
	</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>	

<script type="text/javascript" charset="utf-8">
	$('.row:odd').css('background', '#e3e3e3');
</script>
