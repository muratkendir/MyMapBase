<!DOCTYPE html>
<html lang='en'>

<head>
	<meta charset='utf-8' />
	<title>My OpenLayers Map</title>
 	
	<script type='text/javascript' src='http://localhost/application/openlayers/OpenLayers.js'></script>
	<script type='text/javascript'>

		var map;
		function init() {
		map = new OpenLayers.Map('map_element', {});
		var wms = new OpenLayers.Layer.WMS
			(
			'OpenLayers WMS',
			'http://vmap0.tiles.osgeo.org/wms/vmap0',
			{layers: 'basic'},
			{}
			);
		map.addLayer(wms);
		if(!map.getCenter()){
		map.zoomToMaxExtent();
		}
		}
	</script>
</head>

<body onload='init();'>

<div id='map_element' style='width: 500px; height: 500px; background-color: #000;'>
<h1>asasjhfjkhsakfhsakhfkjhsdkjhglkjfdh</h1>
</div>
</body>
</html>

