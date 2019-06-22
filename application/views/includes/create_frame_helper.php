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
		<script src="<?php echo base_url(); ?>application/third_party/ScaleBar.js"></script>
		
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

			var map, controls, scalebar; 

			function init(){
		
					var maxExtent = new OpenLayers.Bounds(-20037508, -20037508, 20037508, 20037508),
		restrictedExtent = maxExtent.clone(),
		maxResolution = 156543.0339;
	
	var options = {
		projection: new OpenLayers.Projection("EPSG:900913"),
		displayProjection: new OpenLayers.Projection("EPSG:4326"),
		units: "m",
		numZoomLevels: 18,
		maxResolution: maxResolution,
		maxExtent: maxExtent,
		restrictedExtent: restrictedExtent,
		controls: [ new OpenLayers.Control.PanZoomBar(), 
				new OpenLayers.Control.Navigation() ]
	};
	map = new OpenLayers.Map('map', options);

	
					var osm_smpl = new OpenLayers.Layer.OSM("Open Street Map");
				map.addLayers([osm_smpl]);
					var osm_aerl = new OpenLayers.Layer.OSM("OSM Aerial", ["http://otile1.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg",  "http://otile2.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg",  "http://otile3.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg",  "http://otile4.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg"], {sphericalMercator: true});
				map.addLayers([osm_aerl]);
					var ggl_phys = new OpenLayers.Layer.Google("Google Physics", {type: google.maps.MapTypeId.TERRAIN, sphericalMercator: true});
				map.addLayers([ggl_phys]);
					var ggl_strts = new OpenLayers.Layer.Google("Google Streets", {sphericalMercator: true});
				map.addLayers([ggl_strts]);
					var ggl_stllt = new OpenLayers.Layer.Google("Google Satellite", {type: google.maps.MapTypeId.SATELLITE, sphericalMercator: true});
				map.addLayers([ggl_stllt]);
					var ggl_hybrd = new OpenLayers.Layer.Google("Google Hybrid", {type: google.maps.MapTypeId.HYBRID, sphericalMercator: true});
				map.addLayers([ggl_hybrd]);
					var bng_rds = new OpenLayers.Layer.VirtualEarth("Bing Roads", {'type': VEMapStyle.Road, sphericalMercator: true});
				map.addLayers([bng_rds]);
					var bng_arl = new OpenLayers.Layer.VirtualEarth("Bing Aerial", {'type': VEMapStyle.Aerial, sphericalMercator: true});
				map.addLayers([bng_arl]);
					var bng_hybrd = new OpenLayers.Layer.VirtualEarth("Bing Hybrid", {'type': VEMapStyle.Hybrid, sphericalMercator: true});
				map.addLayers([bng_hybrd]);
					var nk_nrml_dy = new OpenLayers.Layer.XYZ("Here Normal Day", ["http://2.maps.nlp.nokia.com/maptile/2.1/maptile/newest/normal.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g"], {sphericalMercator: true});
				map.addLayers([nk_nrml_dy]);
					var nk_trrn_mp = new OpenLayers.Layer.XYZ("Here Terrain Map", ["http://1.maps.nlp.nokia.com/maptile/2.1/maptile/newest/terrain.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g"], {sphericalMercator: true});
				map.addLayers([nk_trrn_mp]);
					var nk_stllt_dy = new OpenLayers.Layer.XYZ("Here Satellite Day", ["http://2.maps.nlp.nokia.com/maptile/2.1/maptile/newest/satellite.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g"], {sphericalMercator: true});
				map.addLayers([nk_stllt_dy]);
					var nk_hybrd = new OpenLayers.Layer.XYZ("Here Hybrid Map", ["http://2.maps.nlp.nokia.com/maptile/2.1/maptile/newest/hybrid.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g"], {sphericalMercator: true});
				map.addLayers([nk_hybrd]);
					var mpbx_strt = new OpenLayers.Layer.XYZ("Mapbox Street", [  "http://a.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png",  "http://b.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png",  "http://c.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png",  "http://d.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png"  ], {attribution: "&copy; 2013 Nokia</span>&nbsp;<a href='http://maps.nokia.com/services/terms' target='_blank' title='Terms of Use' style='color:#333;text-decoration: underline;'>Terms of Use</a></div> <img src='http://api.maps.nokia.com/2.2.4/assets/ovi/mapsapi/by_here.png' border='0'>",transitionEffect: "resize"});
				map.addLayers([mpbx_strt]);
					var mpbx_trrn = new OpenLayers.Layer.XYZ("Mapbox Terrain", [
 "http://a.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png",
 "http://b.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png",
 "http://c.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png",
 "http://d.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png"
 ], {attribution: "Tiles &copy; <a href='http://mapbox.com/'>MapBox</a>",sphericalMercator: true, wrapDateLine: true });
				map.addLayers([mpbx_trrn]);
					var esr_cch = new OpenLayers.Layer.XYZ("Esri Cache", "http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/${z}/${y}/${x}", {sphericalMercator: true});
				map.addLayers([esr_cch]);	//Eğer geometri varsa geometri layerı açar.
	// create a vector layer for drawing
	var vector = new OpenLayers.Layer.Vector("Editable Vectors");

	scalebar = new OpenLayers.Control.ScaleBar({subdivisions: 1});
	map.addControl(scalebar);
	map.addControl(new OpenLayers.Control.LayerSwitcher());
	map.addControl(new OpenLayers.Control.Permalink());
	map.addControl(new OpenLayers.Control.MousePosition());
	
	map.events.register("moveend", null, displayZoom);
	update(document.getElementById("fractional"));

	var click = new OpenLayers.Control.Click();
	map.addControl(click);
	click.activate();
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

				map.zoomTo(1);
				
						//locate script
	var vector = new OpenLayers.Layer.Vector('vector');
	map.addLayers([vector]);
		var style = {
    fillColor: '#000',
    fillOpacity: 0.1,
    strokeWidth: 0
};

var pulsate = function(feature) {
    var point = feature.geometry.getCentroid(),
        bounds = feature.geometry.getBounds(),
        radius = Math.abs((bounds.right - bounds.left)/2),
        count = 0,
        grow = 'up';

    var resize = function(){
        if (count>16) {
            clearInterval(window.resizeInterval);
        }
        var interval = radius * 0.03;
        var ratio = interval/radius;
        switch(count) {
            case 4:
            case 12:
                grow = 'down'; break;
            case 8:
                grow = 'up'; break;
        }
        if (grow!=='up') {
            ratio = - Math.abs(ratio);
        }
        feature.geometry.resize(1+ratio, point);
        vector.drawFeature(feature);
        count++;
    };
    window.resizeInterval = window.setInterval(resize, 50, point, radius);
};

var geolocate = new OpenLayers.Control.Geolocate({
    bind: false,
	watch: true,
    geolocationOptions: {
        enableHighAccuracy: true,
        maximumAge: 0,
        timeout: 7000
    }
});
map.addControl(geolocate);
var firstGeolocation = true;
geolocate.events.register("locationupdated",geolocate,function(e) {
    vector.removeAllFeatures();
    var circle = new OpenLayers.Feature.Vector(
        OpenLayers.Geometry.Polygon.createRegularPolygon(
            new OpenLayers.Geometry.Point(e.point.x, e.point.y),
            e.position.coords.accuracy/2,
            40,
            0
        ),
        {},
        style
    );
	
    vector.addFeatures([
        new OpenLayers.Feature.Vector(
            e.point,
            {},
            {
                graphicName: 'cross',
                strokeColor: '#f00',
                strokeWidth: 2,
                fillOpacity: 0,
                pointRadius: 10
            }
        ),
        circle
    ]);
    if (firstGeolocation) {
        map.zoomToExtent(vector.getDataExtent());
        firstGeolocation = false;
        this.bind = true;
    }
	var current_position = e.point.transform(mapProj, proj).toString();
	showStatus(current_position);
});
geolocate.events.register("locationfailed",this,function() {
    OpenLayers.Console.log('Location detection failed');
});
document.getElementById('locate').onclick = function() {
    vector.removeAllFeatures();
    geolocate.deactivate();
    document.getElementById('track').checked = false;
    geolocate.watch = false;
    firstGeolocation = true;
    geolocate.activate();
	
};
document.getElementById('track').onclick = function() {
    vector.removeAllFeatures();
    geolocate.deactivate();
    if (this.checked) {
        geolocate.watch = true;
        firstGeolocation = true;
        geolocate.activate();
    }
};
document.getElementById('track').checked = false;
		
		//locate script
				
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
			<button id="locate" class="submit_button">Locate me!</button>
			<input type="checkbox" name="track" id="track"> Track My Position
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
		
		
	</div>
<br><br>
	</body>
</html>

