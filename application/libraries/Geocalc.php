<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
* Code Igniter
*
* An open source application development framework for PHP 4.3.2 or newer
*
* @package	 CodeIgniter
* @author	  Dariusz Debowczyk
* @copyright   Copyright (c) 2006, D.Debowczyk
* @license	 http://www.codeignitor.com/user_guide/license.html
* @link		http://www.codeigniter.com
* @since	   Version 1.0
* @filesource
*/

// ------------------------------------------------------------------------

/**
* GeoCalc - Geographic Calculator
* 
* This code was converted to PHP from Visual C++
* by Steven Brendtro on behalf of imaginerc.com
* and updated to a PHP5 library for use with Code
* Igniter by Paul Edwin Mastin, adding a short distance 
* calculator with height calculations
*
* The original code and an article can be found
* on CodeGuru at:
* http://www.codeguru.com/Cpp/Cpp/algorithms/print.php/c5115/
*
* @package	 CodeIgniter
* @subpackage  Libraries
* @category	GeoCalc - Geographic Calculator
* @author	  Steven Brendtro, Paul Edwin Mastin
* @link		http://www.bunkertrails.org/wiki
*/

class Geocalc {

	/*public function __construct() 
	{
		parent::__construct();
		$CI =& get_instance();
		$PI = 3.14159265359;
		$TWOPI = 6.28318530718;
		$DE2RA = 0.01745329252;
		$RA2DE = 57.2957795129;
		$ERAD = 6378.135;
		$ERADM = 6378135.0;
		$AVG_ERAD = 6371.0;
		$EPS = 0.000000000005;
		$KM2MI = 0.621371;
		//$FLATTENING = 0;
		//$CI->FLATTENING = 1.0/298.26;  // Earth flattening
								 // (WGS 1972)
		
	}*/

	public function gcdistance($lat1, $lon1, $lat2, $lon2) {
		$AVG_ERAD = 6378137;
		$lat1 = deg2rad($lat1);
		$lon1 = deg2rad($lon1);
		$lat2 = deg2rad($lat2);
		$lon2 = deg2rad($lon2);
		$d = sin($lat1)*sin($lat2) + cos($lat1)*cos($lat2)*cos($lon1 - $lon2);
		$distance = $AVG_ERAD * acos($d);
		return $distance;
	}
	/*
	function GCAzimuth($lat1, $lon1, $lat2, $lon2) {
		$result = 0.0;
		
		$ilat1 = intval(0.50 + $lat1 * 360000.0);
		$ilat2 = intval(0.50 + $lat2 * 360000.0);
		$ilon1 = intval(0.50 + $lon1 * 360000.0);
		$ilon2 = intval(0.50 + $lon2 * 360000.0);
		
		$lat1 = deg2rad($lat1);
		$lon1 = deg2rad($lon1);
		$lat2 = deg2rad($lat2);
		$lon2 = deg2rad($lon2);
		
		if (($ilat1 == $ilat2) && ($ilon1 == $ilon2)) {
			
			return result;
		}
		
		else if ($ilat1 == $ilat2) {
			
			if ($ilon1 > $ilon2) $result = 90.0;
			else $result = 270.0;
		}
		
		else if ($ilon1 == $ilon2) {
			
			if ($ilat1 > $ilat2) $result = 180.0;
		}
		
		else {

			$c = acos(sin($lat2)*sin($lat1) + cos($lat2)*cos($lat1)*cos(($lon2-$lon1)));
			$A = asin(cos($lat2)*sin(($lon2-$lon1))/sin($c));
			$result = deg2rad($A);
		
		
			if (($ilat2 > $ilat1) && ($ilon2 > $ilon1)) $result = $result;
			else if (($ilat2 < $ilat1) && ($ilon2 < $ilon1)) $result = 180.0 - $result;
			else if (($ilat2 < $ilat1) && ($ilon2 > $ilon1)) $result = 180.0 - $result;
			else if (($ilat2 > $ilat1) && ($ilon2 < $ilon1)) $result += 360.0;
		}
		
		return $result;
	}

	function ApproxDistance($lat1, $lon1, $lat2, $lon2) {
		$lat1 = deg2rad($lat1);
		$lon1 = -deg2rad($lon1);
		$lat2 = deg2rad($lat2);
		$lon2 = -deg2rad($lon2);
		
		$F = ($lat1 + $lat2) / 2.0;
		$G = ($lat1 - $lat2) / 2.0;
		$L = ($lon1 - $lon2) / 2.0;
		
		$sing = sin($G);
		$cosl = cos($L);
		$cosf = cos($F);
		$sinl = sin($L);
		$sinf = sin($F);
		$cosg = cos($G);
		
		$S = $sing*$sing*$cosl*$cosl + $cosf*$cosf*$sinl*$sinl;
		$C = $cosg*$cosg*$cosl*$cosl + $sinf*$sinf*$sinl*$sinl;
		$W = atan2(sqrt($S),sqrt($C));
		$R = sqrt(($S*$C))/$W;
		$H1 = (3 * $R - 1.0) / (2.0 * $C);
		$H2 = (3 * $R + 1.0) / (2.0 * $S);
		$D = 2 * $W * self::ERAD;
		$return = ($D * (1 + $this->FLATTENING * $H1 * $sinf*$sinf*$cosg*$cosg - $this->FLATTENING*$H2*$cosf*$cosf*$sing*$sing));
		return $return;
	}

	function EllipsoidDistance($lat1, $lon1, $lat2, $lon2) {
		
		$distance = 0.0;
		$faz = 0.0;
		$baz = 0.0;
		$r = 1.0 - $this->FLATTENING;
		$tu1 = 0.0;
		$tu2 = 0.0;
		$cu1 = 0.0;
		$su1 = 0.0;
		$cu2 = 0.0;
		$x = 0.0;
		$sx = 0.0;
		$cx = 0.0;
		$sy = 0.0;
		$cy = 0.0;
		$y = 0.0;
		$sa = 0.0;
		$c2a = 0.0;
		$cz = 0.0;
		$e = 0.0;
		$c = 0.0;
		$d = 0.0;
		
		$cosy1 = 0.0;
		$cosy2 = 0.0;
		
		if(($lon1 == $lon2) && ($lat1 == $lat2)) return $distance;
		
		$lat1 = deg2rad($lat1);
		$lon1 = deg2rad($lon1);
		$lat2 = deg2rad($lat2);
		$lon2 = deg2rad($lon2);
		
		$cosy1 = cos($lat1);
		$cosy2 = cos($lat2);
		
		if($cosy1 == 0.0) $cosy1 = 0.0000000001;
		if($cosy2 == 0.0) $cosy2 = 0.0000000001;
		
		$tu1 = $r * sin($lat1) / $cosy1;
		$tu2 = $r * sin($lat2) / $cosy2;
		$cu1 = 1.0 / sqrt($tu1 * $tu1 + 1.0);
		$su1 = $cu1 * $tu1;
		$cu2 = 1.0 / sqrt($tu2 * $tu2 + 1.0);
		$x = $lon2 - $lon1;
		
		$distance = $cu1 * $cu2;
		$baz = $distance * $tu2;
		$faz = $baz * $tu1;
		
		while(abs($d - $x) > self::EPS) {
			$sx = sin($x);
			$cx = cos($x);
			$tu1 = $cu2 * $sx;
			$tu2 = $baz - $su1 * $cu2 * $cx;
			$sy = sqrt($tu1 * $tu1 + $tu2 * $tu2);
			$cy = $distance * $cx + $faz;
			$y = atan2($sy, $cy);
			$sa = $distance * $sx / $sy;
			$c2a = - $sa * $sa + 1.0;
			$cz = $faz + $faz;
			if($c2a > 0.0) $cz = - $cz / $c2a + $cy;
			$e = $cz * $cz * 2.0 - 1.0;
			$c = ((-3.0 * $c2a + 4.0) * $this->FLATTENING + 4.0) * $c2a * $this->FLATTENING / 16.0;
			$d = $x;
			$x = (($e * $cy * $c + $cz) * $sy * $c + $y) * $sa;
			$x = (1.0 - $c) * $x * $this->FLATTENING + $lon2 - $lon1;
		}
		
		$x = sqrt((1.0 / $r / $r - 1.0) * $c2a + 1.0) + 1.0;
		$x = ($x - 2.0) / $x;
		$c = 1.0 - $x;
		$c = ($x * $x / 4.0 + 1.0) / $c;
		$d = (0.375 * $x * $x - 1.0) * $x;
		$x = $e * $cy;
		$distance = 1.0 - $e - $e;
		$distance = (((($sy * $sy * 4.0 - 3.0) * $distance * $cz * $d / 6.0 - $x) * $d / 4.0 + $cz) * $sy * $d + $y) * $c * self::ERAD * $r;
		
		return $distance;
	 }
	 
	 //Short Distance (For distances less than ~10 miles)
	 function sDistance($input_lat1, $input_lon1, $height1, $input_lat2, $input_lon2, $height2) {
		
		 $lat1 = deg2rad($input_lat1);
		$lon1 = deg2rad($input_lon1);
		$lat2 = deg2rad($input_lat2);
		$lon2 = deg2rad($input_lon2);
		
		$height1 = $height1;
		$height2 = $height2;
		
		$x1 = (self::ERADM + $height1) * ( cos($lat1) * cos($lon1) );
		$y1 = (self::ERADM + $height1) * ( sin($lat1) );
		$z1 = (self::ERADM + $height1) * ( cos($lat1) * sin($lon1) );
		
		$x2 = (self::ERADM + $height2) * ( cos($lat2) * cos($lon2) );
		$y2 = (self::ERADM + $height2) * ( sin($lat2) );
		$z2 = (self::ERADM + $height2) * ( cos($lat2) * sin($lon2) );
		
		$dx = ( $x2 - $x1 );
		$dy = ( $y2 - $y1 );
		$dz = ( $z2 - $z1 );
		
		return sqrt(  ( $dx * $dx ) + ( $dy * $dy ) + ( $dz * $dz ) );		 
	 }
	 
	function getKmPerLonAtLat($dLatitude) {
		// Thanks to Eric Iverson for this correction!  Must convert degrees to radians...
		$dLatitude = deg2rad($dLatitude);
		return 111.321 * cos($dLatitude);
	}

	function getLonPerKmAtLat($dLatitude) {
		
		return 1 / $this->getKmPerLonAtLat($dLatitude);
	}

	function getKmPerLat() {
		
		return 111.000;
	}

	function getLatPerKm() {
		
		return 1 / $this->getKmPerLat();
	}*/


}
