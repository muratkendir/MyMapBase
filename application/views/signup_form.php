<h1>Create an account</h1>
	
<fieldset>
	<legend>Personal Information</legend>
	
	<?php
	
	echo form_open('login/create_member');
	
	echo form_label('First Name', 'first_name');
	echo form_input('first_name', set_value('first_name'));
	
	echo form_label('Last Name', 'last_name');
	echo form_input('last_name', set_value('last_name'));
	
	$profession = array(
		'Survey Engineer/Geomatics' => 'Survey Engineer/Geomatics',
		'City Planner' => 'City Planner',
		'Civil Engineer' => 'Civil Engineer',
		'Geophysics Engineer' => 'Geophysics Engineer',
		'Geologist' => 'Geologist',
		'Computer Engineer' => 'Computer Engineer',
		'Database Operator' => 'Database Operator',
		'Researcher' => 'Researcher'
	);
	echo form_label('Profession', 'profession');
	echo form_dropdown('profession', $profession, '0');
	
	echo form_label('Email Address', 'email_address');
	echo form_input('email_address', set_value('email_address'));
	
	?>
</fieldset>

<fieldset>
	<legend>Login Info</legend>
	
	<?php
	
	echo form_label('Username', 'username');
	echo form_input('username', set_value('username'));
	
	echo form_label('Password', 'password');
	echo form_password('password', set_value('password'));
	
	echo form_label('Confirm Password', 'confirm_password');
	echo form_password('password2', set_value('password2'));

	echo form_submit('submit', 'Create Account');
	
	?>

	<?php echo validation_errors('<p class="error">'); ?>
</fieldset>
