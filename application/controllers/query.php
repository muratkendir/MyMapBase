<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Query extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('query_model');
		$this->userdata->is_logged_in();
	}
	public function select_lines_to_envelope()
	{
		$data['dropdown_lines'] = $this->query_model->list_lines();
		$data['title'] = 'General Queries';
		$data['main_content'] = 'query_line_envelope';
		$this->load->view('includes/template', $data);
	}
	public function envelope_line()
	{
		$lines_to_envelope = $this->query_model->envelope_lines();
		$frame_id = $lines_to_envelope['2'];
		$render_for_sharing = 0;
		$data = $this->renderframe->render_frame_by_id($frame_id);
		$data['title'] = 'Envelope Line';
		$this->load->model('polygon_model');
		$data['dropdown'] = $this->polygon_model->list_editable_frames();
		
		$geometry = $lines_to_envelope['3'];
		$geometry_points = $this->query_model->replace_geometry_string($geometry);
		$data['polygon_points'] = $geometry_points;
		
		$data['query_form'] = 'query_form';
		$data['message'] = 'Envelope geometry successfully created!</br>it takes only '.$lines_to_envelope['execute_time'].' seconds...';
		$data['polygon_id'] = $lines_to_envelope['0'] ;
		$data['polygon_title'] = $lines_to_envelope['1'] ;
		$data['frame_of_polygon_id'] = $lines_to_envelope['2'];
		$data['geometry'] = $lines_to_envelope['3'];
		
		if($render_for_sharing == 0)
		{
			$this->load->view('includes/template', $data);
		}
		else
		{
			$this->load->view('render_share_frame', $data);
		}
	}
	function GCDistance()
	{
		$AVG_ERAD = 6371000;
		$lat1 = 40.87149;
		$lon1 = 29.10051;
		$lat2 = 40.86655;
		$lon2 = 29.11441;
		$lat1 = deg2rad($lat1);
		$lon1 = deg2rad($lon1);
		$lat2 = deg2rad($lat2);
		$lon2 = deg2rad($lon2);
		$d = sin($lat1)*sin($lat2) + cos($lat1)*cos($lat2)*cos($lon1 - $lon2);
		$distance =round ($AVG_ERAD * acos($d), 2);
		echo '<h1>'.$distance.' m</h1>';
	}
}
