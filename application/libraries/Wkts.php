<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Wkts 
{
	public function pointwkt_to_coords($wkt)
	{
		$point = str_replace('POINT(', '', $wkt) ;
		$point = str_replace(')', '', $point) ;
		return $point;
	}
	public function linewkt_to_coords($wkt)
	{
		$line = str_replace('LINESTRING(', '', $wkt) ;
		$line = str_replace(')', '', $line) ;
		return $line;
	}
	public function polygonwkt_to_coords($wkt)
	{
		$polygon = str_replace('POLYGON(', '', $wkt) ;
		$polygon = str_replace('))', ')', $polygon) ;
		return $polygon;
	}
	public function point_to_lonlat ($point)
	{
		$lonlat = explode(' ', $point);
		$point = array ('lon' => $lonlat[0], 'lat' => $lonlat[1]);
		return $point;
	}
}
