<style> @import url('<?php echo base_url() ?>application/views/css/comments.css'); </style>

<div class="comments">
<?php echo anchor('site/add_comment', 'Add your Comment'); ?>
	<div id="comment_row" class="titles_row">
		<div id="comment_id" class="column_title">ID</div>
		<div id="comment_title" class="column_title">Title</div>
		<div id="comment_comment" class="column_title">Comment</div>
		<div id="comment_f_name" class="column_title">First Name</div>
		<div id="comment_l_name" class="column_title">Last Name</div>		
	</div>
<?php 
if (isset($comments)){
	foreach ($comments as $row) : ?>
	<div id="comment_row" class="row">
		<div id="comment_id">
			<?php echo $row->id; ?>
		</div>
		<div id="comment_title">
			<?php 
				echo $row->title;
			?>
		</div>
		<div id="comment_comment">
			<?php 
				echo $row->comment;
			?>
		</div>
		<div id="comment_f_name">
			<?php echo $row->first_name; ?>
		</div>
		<div id="comment_l_name">
			<?php echo $row->last_name; ?> 
		</div>
	</div>
<?php endforeach; 
}
else {echo 'There is no comments available!';}
?>
	<div id="pagination">
		<?php echo $this->pagination->create_links(); ?>
	</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>	

<script type="text/javascript" charset="utf-8">
	$('.row:odd').css('background', '#e3e3e3');
</script>
