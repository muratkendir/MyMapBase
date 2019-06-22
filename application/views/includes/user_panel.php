<?php
$username = $this->session->userdata('username');
if ($username != NULL)
{
?>
<div id="user_panel">
	<div id="user_logout">
		<?php echo anchor('login/logout', 'Logout'); ?>
	</div>
	<div id="user_username">
		<?php 
		$username = $this->session->userdata('username');
		echo 'Hi, '.$username; 
		?>
	</div>
</div>
<?php
}
else
{}
?>
