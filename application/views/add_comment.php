<h1>Add your comment</h1>
	
<fieldset>
	<legend>Personal Information</legend>
	
	<?php
	
	echo form_open('site/post_comment');
	echo form_input('first_name', set_value('first_name', 'First Name'));
	echo form_input('last_name', set_value('last_name', 'Last Name'));
	echo form_input('email_address', set_value('email_address', 'Email Address'));
	
	?>
</fieldset>

<fieldset>
	<legend>Comment</legend>
	
	<?php
	$this->load->helper('date');
	$datestring = "%Y-%m-%d %h:%i:%s";
	$time = time();

	$date_time = mdate($datestring, $time);
	
	
	echo form_input('title', set_value('title', 'Title'));
	echo form_textarea('comment', set_value('comment', 'Comment'));
	echo form_hidden('time', set_value('time', $date_time));
	echo form_submit('submit', 'Post your comment');

	
	?>

	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
