<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<title>OpenLayers Click Handler Example</title>
		
		<link rel="stylesheet" href="<?php echo base_url(); ?>application/openlayers/theme/default/style.css" type="text/css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>application/views/css/create_frame_helper.css" type="text/css">
		
		<script src='http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1'></script>
		<script src='http://maps.googleapis.com/maps/api/js?sensor=false&v=3.6'></script>
		<script src="http://api.maps.yahoo.com/ajaxymap?v=3.0&appid=euzuro-openlayers"></script>

		<script src="<?php echo base_url(); ?>application/openlayers/OpenLayers.js"></script>
		<script type="text/javascript">

			OpenLayers.Control.Click = OpenLayers.Class(OpenLayers.Control, {				
				defaultHandlerOptions: {
					'single': true,
					'double': false,
					'pixelTolerance': 0,
					'stopSingle': false,
					'stopDouble': false
				},

				initialize: function(options) {
					this.handlerOptions = OpenLayers.Util.extend(
						{}, this.defaultHandlerOptions
					);
					OpenLayers.Control.prototype.initialize.apply(
						this, arguments
					); 
					this.handler = new OpenLayers.Handler.Click(
						this, {
							'click': this.onClick
						}, this.handlerOptions
					);
				}, 
				onClick: function(evt) {
					var proj = new OpenLayers.Projection("EPSG:4326");
					var proj2 = new OpenLayers.Projection("EPSG:900913");
					var coord2 = map.getLonLatFromViewPortPx(evt.xy);
					var coord = coord2.transform(proj2, proj);
					var outputx = document.getElementById(this.key + "Outputx");
					var msgx = coord.lon.toFixed(7);
					outputx.value = outputx.value + msgx + "\r\n";
					
					var outputy = document.getElementById(this.key + "Outputy");
					var msgy = coord.lat.toFixed(7);
					outputy.value = outputy.value + msgy + "\r\n";
				},
				

				

			});

			var map, controls; 

			function init(){
		
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
	<?php  if(isset($geometry) OR isset($num_points) OR isset($num_lines) OR isset($num_polygons))
		{
		echo '
			var geometryLayer = new OpenLayers.Layer.Vector("Geometry Layer");
			map.addLayers([geometryLayer]);
		';
		}
		
	?>
	
	//Noktaları ekler.
	<?php
	if(isset($num_points))
	
	{
		$i=0;
		while($i < $num_points)
		{
		echo '
			var geometry'.$i.' = new OpenLayers.Geometry.fromWKT("'.$point[$i]['AsText(point_point)'].'");
			geometry'.$i.' = geometry'.$i.'.transform(proj, map.getProjectionObject());
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', null, null);
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
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', null, null );
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
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', null, null);
			geometryLayer.addFeatures([geometry'.$i.'Feature]);
		';
		$i++;	
		}
	}
	//varsa diğer geometrileri ekler.
	else{
	if(isset($geometry))
	{echo '
		var geometry = new OpenLayers.Geometry.fromWKT("'.$geometry.'");
		geometry = geometry.transform(proj, map.getProjectionObject());
		
		var geometryFeature = new OpenLayers.Feature.Vector(geometry, null, null);
		geometryLayer.addFeatures([geometryFeature]);
		';} else {} 
	}
	?>
	
	
	map.addControl(new OpenLayers.Control.LayerSwitcher());
	map.addControl(new OpenLayers.Control.Permalink());
	map.addControl(new OpenLayers.Control.MousePosition());
	map.events.register("moveend", null, displayZoom);
	update(document.getElementById("fractional"));

	var click = new OpenLayers.Control.Click();
	map.addControl(click);
	click.activate();
	
	var lonlat = new OpenLayers.LonLat
			(<?php echo $frame_get_center_long ?>, <?php echo $frame_get_center_lat ?>);
	lonlat.transform(proj, map.getProjectionObject());
	map.setCenter(lonlat, <?php echo $frame_zoom_to_extend ; ?>);
	
	if (!map.getCenter()) {map.zoomToMaxExtent()}
				
	controls = {
			"single": new OpenLayers.Control.Click({
				handlerOptions: {
					"single": true
					}
				}),
			};

				var props = document.getElementById("props");
				var control;
				for(var key in controls) {
					control = controls[key];
					// only to route output here
					control.key = key;
					map.addControl(control);
				}

				
			}
			
			function toggle(key) {
				var control = controls[key];
				if(control.active) {
					control.deactivate();
				} else {
					control.activate();
				}
				
				var status = document.getElementById(key + "Status");
				status.innerHTML = control.active ? "Clear Long/Lat" : "Get Long/Lat";
				var outputx = document.getElementById(key + "Outputx");
				outputx.value = "";
				var outputy = document.getElementById(key + "Outputy");
				outputy.value = "";
			}
			function displayZoom() 
			{
				document.getElementById("zoom").innerHTML = map.zoom.toFixed();
			}
			function update(input) 
			{
				map.fractionalZoom = input.checked;
				map.zoomTo(Math.round(map.zoom));
			}
		</script>
	</head>
	<body onload="init()">
	<div id="helper_container">
		
		<div id="west">
			<div id="map" class="smallmap"></div>
		</div>
		<div id="east">
		
			<div id="helper_text">
				<ul>
					<li>
						Press and hold <b>SHIFT</b> key and draw a rectangle to zoom in.
					</li>
					<li>
						Press <b>GET LONG/LAT</b> button and single click on map to view Longitude and Latitude values.
					</li>
					<li>
						Select longitude or latitude value and press <b>CNTRL+C</b> to copy it.
					</li>
				</ul>
			</div>
			<div id="button_toggle">
			<button id="singleStatus" onclick="toggle('single')">Get Long/Lat</button>
			</div>
			<div id="output_area">
			<textarea class="output" id="singleOutputx"></textarea>
			<textarea class="output" id="singleOutputy"></textarea>
			</div>
			<div id="zoom_area">
			<input type="checkbox" name="fractional"
				id="fractional" onclick="update(this)"/>
			<label for="fractional"></label>
			Zoom Level: <span id="zoom"></span>
			</div>
		</div>
		<div id="map_feature_log" style="font-size:12px;width:100%;"></div>
	</div>
<br><br>
	</body>
</html>

