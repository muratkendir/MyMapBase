<?php $this->load->view('includes/header'); ?>
<?php $this->load->view('includes/logo'); ?>
<?php $this->load->view('includes/version'); ?>
<?php $this->load->view('includes/user_panel'); ?>

<?php 
if (isset($message))
	{
	$this->load->view('includes/message');
	}
else
	{}
 ?>

<?php $this->load->view($main_content); ?>

<?php 
if (isset($query_form))
	{
	$this->load->view('includes/query_form');
	}
else
	{}
?>

<?php $this->load->view('includes/footer'); ?>
