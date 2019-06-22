<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<title>Create Point Helper</title>
		<style type="text/css">
			.olControlDrawFeaturePolygonItemInactive{
				visibility:hidden;
				display:none;
			}
			.olControlDrawFeaturePointItemInactive{
				visibility:hidden;
				display:none;
			}
			.olControlNavigationItemActive{
				visibility:hidden;
				display:none;
			}
			.olControlNavigationItemInactive{
				visibility:hidden;
				display:none;
			}
			.olControlEditingToolbar .olControlModifyFeatureItemInactive {
				background-image: url(<?php echo base_url(); ?>application/openlayers/theme/default/img/pan_off.png);
			}
			.olControlEditingToolbar .olControlModifyFeatureItemActive {
				background-image: url(<?php echo base_url(); ?>application/openlayers/theme/default/img/pan_on.png);
			}
		</style>
		<link rel="stylesheet" href="<?php echo base_url(); ?>application/openlayers/theme/default/style.css" type="text/css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>application/views/css/create_frame_helper.css" type="text/css">
		
		<script src='http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1'></script>
		<script src='http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyCnWeuzeW6HSfca3KACo47H-ro13E9dETA'></script>
		<script src="http://api.maps.yahoo.com/ajaxymap?v=3.0&appid=euzuro-openlayers"></script>
		<script src="//ajax.googleapis.com/ajax/libs/dojo/1.8.1/dojo/dojo.js"
			data-dojo-config="async: true"></script>
		<script src="<?php echo base_url(); ?>application/openlayers/OpenLayers.js"></script>
		<script type="text/javascript">
		var map, controls;

		function init(){
		
		var maxExtent = new OpenLayers.Bounds
				(-20037508.34, -20037508.34, 20037508.34, 20037508.34),
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
		var mapProj = new OpenLayers.Projection("EPSG:900913");
		
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
		
		vlayer = new OpenLayers.Layer.Vector( "Editable" );
		
		var toolbar = new OpenLayers.Control.EditingToolbar(vlayer);
		toolbar.addControls([new OpenLayers.Control.ModifyFeature(vlayer, {
			title: "Select feature"})]);

		map.addControl(toolbar);
		map.addLayers([vlayer]);
		
		vlayer.events.on({
			"featureselected": function(e) {
				var coords = e.feature.geometry.clone();
				var coords_lonlat = coords.transform(mapProj, proj).toString();
				showStatus(coords_lonlat);
				}});
		
		map.addControl(new OpenLayers.Control.MousePosition());
		
		if (!map.getCenter()) {map.zoomToMaxExtent()}
		var lonlat = new OpenLayers.LonLat
			(<?php echo $frame_get_center_long ?>, <?php echo $frame_get_center_lat ?>);
			lonlat.transform(proj, map.getProjectionObject());
		map.setCenter(lonlat, <?php echo $frame_zoom_to_extend ; ?>);
		
		}
		
		function showStatus(text) {
			document.getElementById("status").innerHTML = text;
		}
		</script>
	</head>
	<body onload="init()">
	<div id="helper_container">
		<div id="west">
			<div id="map" class="smallmap"></div>
		</div>
		<div id="east">
			<form>
			<textarea id="status" style="width:300px;height:200px;"></textarea>
			<br>
			<h3 style="color:#204a87;width:300px;">Copy & Paste to the input area in main window.</h3>
			</form>
		</div>
		<div id="map_feature_log" style="font-size:12px;width:100%;"></div>
	</div>
<br><br>
	</body>
</html>

