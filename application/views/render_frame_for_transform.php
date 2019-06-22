<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<title><?php echo $frame_title ?></title>
	<link 
		rel="stylesheet" 
		href="<?php echo base_url(); ?>application/openlayers/theme/default/style.css" 
		type="text/css">

	<!-- this gmaps key generated for http://openlayers.org/dev/ -->
	<!--Her script kodu için databaseden script sourceunu çağırır.-->
	<?php
	if (isset($scripts)){
		foreach ($scripts as $row2)
			{
				echo '<script src="';
				echo $row2['source'];
				echo '"></script>';
			}
			}
	?>
	
	<script src="<?php echo base_url(); ?>application/openlayers/OpenLayers.js"></script>
	<script type="text/javascript" src="http://svn.osgeo.org/metacrs/proj4js/trunk/lib/proj4js-compressed.js"></script>
	<script type="text/javascript">
		Proj4js.defs["EPSG:2320"] = "+proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=intl +datum=ed50 +units=m +towgs84=-84.1515,-101.8515,-129.6228,0.001944,0.01176,-0.487008,1.04856 +no_defs";
		Proj4js.defs["SR-ORG:7835"] = "+proj=tmerc +lat_0=0 +lon_0=27 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
		Proj4js.defs["SR-ORG:7833"] = "+proj=tmerc +lat_0=0 +lon_0=30 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
		Proj4js.defs["SR-ORG:7836"] = "+proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
		Proj4js.defs["SR-ORG:7837"] = "+proj=tmerc +lat_0=0 +lon_0=36 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
		Proj4js.defs["SR-ORG:7838"] = "+proj=tmerc +lat_0=0 +lon_0=39 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
		Proj4js.defs["SR-ORG:7839"] = "+proj=tmerc +lat_0=0 +lon_0=42 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
		Proj4js.defs["SR-ORG:7840"] = "+proj=tmerc +lat_0=0 +lon_0=45 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
	</script>
	<script type="text/javascript" src="http://spatialreference.org/ref/sr-org/7539/proj4js/"></script>
	
	<script src="<?php echo base_url(); ?>application/third_party/ScaleBar.js"></script>
	<script type="text/javascript">
	var map, scalebar;
	function init() {
	//Harita sabit değerlerini çağırır.
	var maxExtent = new OpenLayers.Bounds(-20037508.34, -20037508.34, 20037508.34, 20037508.34),
		restrictedExtent = maxExtent.clone(),
		maxResolution = 156543.0339,
		proj = new OpenLayers.Projection("EPSG:4326");
	
	var options = {
		projection: new OpenLayers.Projection("EPSG:900913"),
		displayProjection: proj,
		units: "m",
		numZoomLevels: 18,
		maxResolution: maxResolution,
		maxExtent: maxExtent,
		restrictedExtent: restrictedExtent,
		controls: [ new OpenLayers.Control.PanZoomBar(), 
				new OpenLayers.Control.Navigation() ]
	};
	
	map = new OpenLayers.Map('map', options);
	//Layer değiştirme panelini açıyor.
	map.addControl(new OpenLayers.Control.LayerSwitcher());

//Seçilen her layerı atar ve haritaya ekler.
	<?php if(isset($wms_layer_ids))
		{
			foreach($wms_layer_ids as $ro)
			{
				if($ro[0]['options'] == NULL)
				{
				echo '
					var '.$ro[0]['uniq_name'].' = new OpenLayers.Layer.'.$ro[0]['func_name'].'("'.$ro[0]['title'].'");
				';
				}
				else
				{
				if($ro[0]['source'] == NULL)
				{
				echo '
					var '.$ro[0]['uniq_name'].' = new OpenLayers.Layer.'.$ro[0]['func_name'].'("'.$ro[0]['title'].'", '.$ro[0]['options'].');
				';
				}
				else
				{
				echo '
					var '.$ro[0]['uniq_name'].' = new OpenLayers.Layer.'.$ro[0]['func_name'].'("'.$ro[0]['title'].'", '.$ro[0]['source'].', '.$ro[0]['options'].');
				';
				}
				}
				echo 'map.addLayers(['.$ro[0]['uniq_name'].']);';
			}
		}
	?>
	//Eğer geometri varsa geometri layerı açar.
	<?php if(isset($geometry) OR isset($num_points) OR isset($num_lines) OR isset($num_polygons))
		{
		echo '
			var geometryLayer = new OpenLayers.Layer.Vector("Geometry Layer");
			map.addLayers([geometryLayer]);
		';
		} 
		
	?>
	
	var lonlat = new OpenLayers.LonLat
			(<?php echo $frame_get_center_long ?>, <?php echo $frame_get_center_lat ?>);
			lonlat.transform(proj, map.getProjectionObject());
			map.setCenter(lonlat, <?php echo $frame_zoom_to_extend ; ?>);
	//Noktaları ekler.
	<?php
	if( isset($num_points) )
	
	{
		$i=0;
		while($i < $num_points)
		{
		echo '
			var geometry'.$i.' = new OpenLayers.Geometry.fromWKT("'.$point[$i]['AsText(point_point)'].'");
			geometry'.$i.' = geometry'.$i.'.transform(proj, map.getProjectionObject());
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', {
			"position" : "point",
			"coords" : "'.$point[$i]['AsText(point_point)'].'"
			});
			geometryLayer.addFeatures([geometry'.$i.'Feature]);
		';
		$i++;	
		}
	}
	//varsa çizgileri ekler.
	if(isset($num_lines))
	
	{
		$i=0;
		while($i < $num_lines)
		{
		echo '
			var geometry'.$i.' = new OpenLayers.Geometry.fromWKT("'.$line[$i]['AsText(line_line)'].'");
			geometry'.$i.' = geometry'.$i.'.transform(proj, map.getProjectionObject());
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', {
			"position" : "Linestring",
			"coords" : "'.$line[$i]['AsText(line_line)'].'"
			});
			geometryLayer.addFeatures([geometry'.$i.'Feature]);
			
		';
		$i++;	
		}
	}
	//varsa polygonları ekler.
	if(isset($num_polygons))
	
	{
		$i=0;
		while($i < $num_polygons)
		{
		echo '
			var geometry'.$i.' = new OpenLayers.Geometry.fromWKT("'.$polygon[$i]['AsText(polygon_polygon)'].'");
			geometry'.$i.' = geometry'.$i.'.transform(proj, map.getProjectionObject());
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', {
			"position" : "Polygon",
			"coords" : "'.$polygon[$i]['AsText(polygon_polygon)'].'"
			});
			geometryLayer.addFeatures([geometry'.$i.'Feature]);
		';
		$i++;	
		}
	}
	//varsa diğer geometrileri ekler.
	else{
	if(isset($geometry))
	{
	echo '
		var geometry = new OpenLayers.Geometry.fromWKT("'.$geometry.'");
		geometry = geometry.transform(proj, map.getProjectionObject());
		
		var geometryFeature = new OpenLayers.Feature.Vector(geometry, {
			"position" : "'.$title.'",
			"coords" : "'.$geometry.'"
			});
		geometryLayer.addFeatures([geometryFeature]);
		';} else {} 
	}
	?>
	var scalebar = new OpenLayers.Control.ScaleBar({subdivisions: 1});
	map.addControl(scalebar);
	//Create and add selectFeature control
	var select_feature_control = new OpenLayers.Control.SelectFeature(
		geometryLayer, 
		{
			multiple: false,
			toggle: true,
			toggleKey: 'ctrlKey',
			multipleKey: 'shiftKey'	
		}
	);
	var external_control = new OpenLayers.Control.MousePosition({
		div: document.getElementById('external_control') });
	map.addControl(external_control);
	map.addControl(select_feature_control);
	
	//Activate the control
	select_feature_control.activate();
	
		//Finally, let's add some events so we can do stuff when the user 
	//	interacts with the features
	function selected_feature(event){
	    //clear out the log's contents
	    document.getElementById('map_feature_log').innerHTML = '';
	    
	    //Show the current selected feature (passed in from the event object)
	    var display_text = event.feature.attributes.coords ;
		document.getElementById('map_feature_log').innerHTML = display_text;
		
		//Show all the selected features
		//document.getElementById('map_feature_log').innerHTML += 'All selected features: ';
		
		//Now, loop through the selected feature array 
		//for(var i=0; i < geometryLayer.selectedFeatures.length; i++){
        //    document.getElementById('map_feature_log').innerHTML += 
        //        geometryLayer.selectedFeatures[i].attributes.position + ' | ';
        //}
	}
	function unselected_feature(event){
	    var display_text = event.feature.attributes.position + ' unselected!' + '<hr />';
		document.getElementById('map_feature_log').innerHTML = display_text;
		
		//Show all the selected features
		document.getElementById('map_feature_log').innerHTML += 'All selected features: ';
		
		//Now, loop through the selected feature array 
		for(var i=0; i<geometryLayer.selectedFeatures.length; i++){
            document.getElementById('map_feature_log').innerHTML += 
                geometryLayer.selectedFeatures[i].attributes.position + ' | ';
        }
	}
	
	//Register the event
	geometryLayer.events.register('featureselected', this, selected_feature);
	geometryLayer.events.register('featureunselected', this, unselected_feature);
	
	
	
}

var epsg_code = '';
var geometry_wkt = '';
	
function transform_geometry (geometry_wkt, epsg_code){
	//console.log(geometry_wkt);
	//console.log(epsg_code);
	transforming_geometry = new OpenLayers.Geometry.fromWKT(geometry_wkt);
	transforming_geometry.transform(
        new OpenLayers.Projection('EPSG:4326'), 
        new OpenLayers.Projection(epsg_code)
    );
	var elem = document.getElementById("transformed_coord");
	
	elem.value = transforming_geometry;
	//console.log(elem.value);

}
</script>
</head>
<body onload="init()">

	<div id="map_container" style="width:<?php echo $frame_width+40 ?>px;height:<?php echo $frame_height+150 ?>px">
		<h2 id="title"><?php echo $frame_title ?> (<?php echo $frame_id; ?>)</h2>
		
		<div id="map" class="smallmap" style="width:<?php echo $frame_width; ?>px;height:<?php echo $frame_height; ?>px;">
		</div>
		<div id"coordinates">
			<div id="Projection_type">
				<a href="http://spatialreference.org/ref/epsg/4326/" target="_blank">
				EPSG:4326
				</a>
			</div>
			<div id="external_control_box">
				Cursor Position: 
			</div>
			<div id="external_control">
				</div>
			<div id="share_link">
				<?php
		/*$class = $this->uri->segment(1);
		$function = $this->uri->segment(2);
		$element_segment = $this->uri->segment(4);
		if ($element_segment != NULL)
		{
			$element_segment = '/'.$this->uri->segment(4);
		}
		else
		{
			$element_segment = '';
		}
		$atts = array(
			'width'      => '400',
			'height'     => '300',
			'scrollbars' => 'no',
			'status'     => 'yes',
			'resizable'  => 'yes',
			'screenx'    => '0',
			'screeny'    => '0'
		);
		echo anchor_popup(
			'frame/share_frame/'
			.$class
			.'/'
			.$function
			.'/'
			.$frame_id
			.$element_segment, 
			'Share your frame', $atts); */?>
			<?php 
			$class = $this->uri->segment(1);
			$function = $this->uri->segment(2);
			$frame = $this->uri->segment(3);
			$object = $this->uri->segment(4);
			
			if (isset($object))
			{echo anchor('share/'.$class.'/'.$frame_id.'/'.$object, 'Share your '.$class, array('title' => 'Share your '.$class.' wherever you want.', 'target' => '_blank'));}
			else
			{echo anchor('share/'.$class.'/'.$frame_id, 'Share your frame', array('title' => 'Share your '.$class.' wherever you want.', 'target' => '_blank'));}
			
			?>
			</div>
		</div>
		<div id="details">
			<div id="shortdesc">
				<div id="map_feature_log" style="font-size:12px;width:100%;"></div></br>
				<select id="select_coord_sys">
				
					<option value="EPSG:2320">ED50 TM30 (3 degree: Zone 10)</option>
					<option value="SR-ORG:7835">ITRF96 / TM27</option>
					<option value="SR-ORG:7833">ITRF96 / TM30</option>
					<option value="SR-ORG:7836">ITRF96 / TM33</option>
					<option value="SR-ORG:7837">ITRF96 / TM36</option>
					<option value="SR-ORG:7838">ITRF96 / TM39</option>
					<option value="SR-ORG:7839">ITRF96 / TM42</option>
					<option value="SR-ORG:7840">ITRF96 / TM45</option>
				</select> 
				<input type="button" value="Transform Selected Object" 
                    onclick="trans_selected_obj();"
                    id="get_coord_sys">
				<input type="text" value='' id="transformed_coord"></input>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		//Enlem ve Boylamları seçilen koordinatlara dönüştür
	
	function trans_selected_obj(){
			var menu = document.getElementById('select_coord_sys');
			var value = menu.options[menu.selectedIndex].value;
			var selected_epsg_code = value;
			
			var geometry_4326 = document.getElementById('map_feature_log');
			var geometry_wkt_4326 = geometry_4326.innerHTML;
			
			transform_geometry(geometry_wkt_4326, selected_epsg_code);
			
		}
	</script>
  </body>
</html>
