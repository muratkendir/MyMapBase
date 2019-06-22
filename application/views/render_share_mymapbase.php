<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<title><?php echo $frame_title ?></title>
	<link 
		rel="stylesheet" 
		href="<?php echo base_url(); ?>application/views/css/template.css"
		type="text/css">
	<link 
		rel="stylesheet" 
		href="<?php echo base_url(); ?>application/openlayers/theme/default/style.css" 
		type="text/css">

	<!-- this gmaps key generated for http://openlayers.org/dev/ -->
	<!--Her script kodu için databaseden script sourceunu çağırır.-->
	<?php
		foreach ($scripts as $row2)
			{
				echo '<script src="';
				echo $row2['source'];
				echo '"></script>';
			}
	?>
	
	<script src="<?php echo base_url(); ?>application/openlayers/OpenLayers.js"></script>
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
			var geometryLayer = new OpenLayers.Layer.Vector("Geometry Layer", {
    eventListeners:{
        "featureselected":function(evt){
            var feature = evt.feature;
            var popup = new OpenLayers.Popup.FramedCloud("popup",
                feature.geometry.getBounds().getCenterLonLat(),
                null,
                feature.attributes.message+"<br>"+feature.attributes.location,
                null,
                true,
                null
            );
            popup.autoSize = true;
            popup.maxSize = new OpenLayers.Size(400,800);
            popup.fixedRelativePosition = true;
            feature.popup = popup;
            map.addPopup(popup);
        },
        "featureunselected":function(evt){
            var feature = evt.feature;
            map.removePopup(feature.popup);
            feature.popup.destroy();
            feature.popup = null;
        }
    }
});
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
	if(isset($num_points))
	
	{
		$i=0;
		while($i < $num_points)
		{
		echo '
			var geometry'.$i.' = new OpenLayers.Geometry.fromWKT("'.$point[$i]['AsText(point_point)'].'");
			geometry'.$i.' = geometry'.$i.'.transform(proj, map.getProjectionObject());
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', 
			{message:"<b style=\"color:#287368;\">'.$point_info[$i]["keys"][1].'</b> : '.$point_info[$i]["values"][1].'<br>", 
			location:"';
			for ($j=2; $j<$num_point_infos; $j++)
			{
				if ($odd = $j%2)
				{ $background='#ffffff';}
				else
				{ $background='#f0f0f0';}
				if (strstr($point_info[$i]["keys"][$j], 'video'))
				{
					$point_info[$i]["values"][$j] = str_replace('https:', '', $point_info[$i]["values"][$j]);
					$point_info[$i]["values"][$j] = str_replace('watch?v=', 'embed/', $point_info[$i]["values"][$j]);
					echo '<iframe width=\"360\" height=\"270\" src=\"'.$point_info[$i]["values"][$j].'?rel=0\" frameborder=\"0\" allowfullscreen></iframe>';
				}
				if (strstr($point_info[$i]["keys"][$j], 'iframe'))
				{
					$point_info[$i]["values"][$j] = str_replace('"', '\"', $point_info[$i]["values"][$j]);
					echo $point_info[$i]["values"][$j];
				}
				if (strstr($point_info[$i]["keys"][$j], 'imageURL'))
				{
					echo '<a href=\"'.$point_info[$i]["values"][$j].'\" target=\"blank\"><img src=\"'.$point_info[$i]["values"][$j].'\" width=\"300\"></a>';
				}
				elseif (strstr($point_info[$i]["keys"][$j], 'URL'))
				{
					echo '<a href=\"'.$point_info[$i]["values"][$j].'\" target=\"blank\">'.$point_info[$i]["values"][$j].'</a>';
				}
				else{
					echo '<div style=\"font-size:11px;padding:2px;text-align:center;background:'.$background.';\"><b>'.$point_info[$i]["keys"][$j].'</b> : '.$point_info[$i]["values"][$j].'<br></div>';
					}
			}
			echo '",
			"position" : "'.$point_info[$i]["values"][1].'",
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
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', {message:"<b style=\"color:#287368;\">'.$line_info[$i]["keys"][1].'</b> : '.$line_info[$i]["values"][1].'<br>", 
			location:"';
			for ($j=2; $j<$num_line_infos; $j++)
			{
				if ($odd = $j%2)
				{ $background='#ffffff';}
				else
				{ $background='#f0f0f0';}
				if (strstr($line_info[$i]["keys"][$j], 'video'))
				{
					$line_info[$i]["values"][$j] = str_replace('https:', '', $line_info[$i]["values"][$j]);
					$line_info[$i]["values"][$j] = str_replace('watch?v=', 'embed/', $line_info[$i]["values"][$j]);
					echo '<iframe width=\"360\" height=\"270\" src=\"'.$line_info[$i]["values"][$j].'?rel=0\" frameborder=\"0\" allowfullscreen></iframe>';
				}
				if (strstr($line_info[$i]["keys"][$j], 'iframe'))
				{
					$line_info[$i]["values"][$j] = str_replace('"', '\"', $line_info[$i]["values"][$j]);
					echo $line_info[$i]["values"][$j];
				}
				if (strstr($line_info[$i]["keys"][$j], 'imageURL'))
				{
					echo '<a href=\"'.$line_info[$i]["values"][$j].'\" target=\"blank\"><img src=\"'.$line_info[$i]["values"][$j].'\" width=\"300\"></a>';
				}
				elseif (strstr($line_info[$i]["keys"][$j], 'URL'))
				{
					echo '<a href=\"'.$line_info[$i]["values"][$j].'\" target=\"blank\">'.$line_info[$i]["values"][$j].'</a>';
				}
				else{
					echo '<div style=\"font-size:11px;padding:2px;text-align:center;background:'.$background.';\"><b>'.$line_info[$i]["keys"][$j].'</b> : '.$line_info[$i]["values"][$j].'<br></div>';
					}
			}
			echo '",
			"position" : "'.$line_info[$i]["values"][1].'",
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
			var geometry'.$i.'Feature = new OpenLayers.Feature.Vector(geometry'.$i.', {message:"<b style=\"color:#287368;\">'.$polygon_info[$i]["keys"][1].'</b> : '.$polygon_info[$i]["values"][1].'<br>", 
			location:"';
			for ($j=2; $j<$num_polygon_infos; $j++)
			{
				if ($odd = $j%2)
				{ $background='#ffffff';}
				else
				{ $background='#f0f0f0';}
				if (strstr($polygon_info[$i]["keys"][$j], 'video'))
				{
					$polygon_info[$i]["values"][$j] = str_replace('https:', '', $polygon_info[$i]["values"][$j]);
					$polygon_info[$i]["values"][$j] = str_replace('watch?v=', 'embed/', $polygon_info[$i]["values"][$j]);
					echo '<iframe width=\"360\" height=\"270\" src=\"'.$polygon_info[$i]["values"][$j].'?rel=0\" frameborder=\"0\" allowfullscreen></iframe>';
				}
				if (strstr($polygon_info[$i]["keys"][$j], 'iframe'))
				{
					$polygon_info[$i]["values"][$j] = str_replace('"', '\"', $polygon_info[$i]["values"][$j]);
					echo $polygon_info[$i]["values"][$j];
				}
				if (strstr($polygon_info[$i]["keys"][$j], 'imageURL'))
				{
					echo '<a href=\"'.$polygon_info[$i]["values"][$j].'\" target=\"blank\"><img src=\"'.$polygon_info[$i]["values"][$j].'\" width=\"300\"></a>';
				}
				elseif (strstr($polygon_info[$i]["keys"][$j], 'URL'))
				{
					echo '<a href=\"'.$polygon_info[$i]["values"][$j].'\" target=\"blank\">'.$polygon_info[$i]["values"][$j].'</a>';
				}
				else{
					echo '<div style=\"font-size:11px;padding:2px;text-align:center;background:'.$background.';\"><b>'.$polygon_info[$i]["keys"][$j].'</b> : '.$polygon_info[$i]["values"][$j].'<br></div>';
					}
			}
			echo '",
			"position" : "'.$polygon_info[$i]["values"][1].'",
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
	{echo '
		var geometry = new OpenLayers.Geometry.fromWKT("'.$geometry.'");
		geometry = geometry.transform(proj, map.getProjectionObject());
		
		var geometryFeature = new OpenLayers.Feature.Vector(geometry, null, null);
		geometryLayer.addFeatures([geometryFeature]);
		';} else {} 
	}
	?>
	
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
	
	var scalebar = new OpenLayers.Control.ScaleBar({subdivisions: 1});
	map.addControl(scalebar);
	map.addControl(select_feature_control);
	select_feature_control.activate();
	
		//Finally, let's add some events so we can do stuff when the user 
	//	interacts with the features
	function selected_feature(event){
	    //clear out the log's contents
	    document.getElementById('map_feature_log').innerHTML = '';
	    
	    //Show the current selected feature (passed in from the event object)
	    var display_text = 'Clicked on: ' 
	        + '<strong><a>' + event.feature.attributes.position + '</a></strong>'
	        + ': ' + event.feature.attributes.coords + '<hr />';
		document.getElementById('map_feature_log').innerHTML = display_text;
		
		//Show all the selected features
		document.getElementById('map_feature_log').innerHTML += 'All selected features: ';
		
		//Now, loop through the selected feature array 
		for(var i=0; i < geometryLayer.selectedFeatures.length; i++){
            document.getElementById('map_feature_log').innerHTML += 
                geometryLayer.selectedFeatures[i].attributes.position + ' | ';
        }
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
	
	var selector = new OpenLayers.Control.SelectFeature(geometryLayer,{
    hover:false,
    autoActivate:false
	});
	
	var external_control = new OpenLayers.Control.MousePosition({
		div: document.getElementById('external_control') });
	
	map.addControl(external_control);
	map.addControl(selector);
	
}
	</script>
</head>
<body onload="init()">

	<div id="share_map_container" style="width:<?php echo $frame_width ?>px;height:<?php echo $frame_height ?>px">
		
		<div id="map" class="smallmap" style="width:<?php echo $frame_width; ?>px;height:<?php echo $frame_height; ?>px;">
		</div>
	</div>
  </body>
</html>
