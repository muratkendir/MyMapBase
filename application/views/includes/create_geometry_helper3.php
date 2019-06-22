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
		<script src="//ajax.googleapis.com/ajax/libs/dojo/1.8.1/dojo/dojo.js"
			data-dojo-config="async: true"></script>
		<script src="<?php echo base_url(); ?>application/openlayers/OpenLayers.js"></script>
		<script type="text/javascript">
		var map, selectControl;
        OpenLayers.Feature.Vector.style['default']['strokeWidth'] = '2';
        function init(){
            map = new OpenLayers.Map('map');
            var wmsLayer = new OpenLayers.Layer.WMS(
                "OpenLayers WMS", 
                "http://vmap0.tiles.osgeo.org/wms/vmap0",
                {layers: 'basic'}
            ); 

		
            // allow testing of specific renderers via "?renderer=Canvas", etc
            var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
            renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

            var vectors2 = new OpenLayers.Layer.Vector("Vector Layer 2", {
                renderers: renderer
            });
            map.addLayers([wmsLayer, vectors2]);
            map.addControl(new OpenLayers.Control.LayerSwitcher());
            
            var toolbar = new OpenLayers.Control.EditingToolbar(vectors2);
		toolbar.addControls([new OpenLayers.Control.ModifyFeature(vectors2, {
    title: "Select feature"
})]);

		map.addControl(toolbar);
            
            selectControl = new OpenLayers.Control.SelectFeature(
                [vectors2],
                {
                    clickout: true, toggle: false,
                    multiple: false, hover: false,
                    toggleKey: "ctrlKey", // ctrl key removes from selection
                    multipleKey: "shiftKey" // shift key adds to selection
                }
            );
            
            map.addControl(selectControl);
            selectControl.activate();
            map.setCenter(new OpenLayers.LonLat(0, 0), 3);

           

            vectors2.events.on({
                "featureselected": function(e) {
                    showStatus("selected feature "+e.feature.geometry.toString()+" on Vector Layer 2");
                },
                "featureunselected": function(e) {
                    showStatus("unselected feature "+e.feature.id+" on Vector Layer 2");
                }
            });
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
			<form>
			<div id="status"></div>
			<input type="submit" id="post_coords" value="Get Coords"></input>
			</form>
		</div>
		<div id="east">
		
		</div>
		<div id="map_feature_log" style="font-size:12px;width:100%;"></div>
	</div>
<br><br>
	</body>
</html>

