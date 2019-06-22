<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.10.4.7.210.211 DATE: 2013-02-02
<hr>
MINOR UPDATES:
<ul>
	<li>
		OpenStreetMap Aerial Base Layer has added.
	</li>
	<li>
		Nokia Here Maps Base Layer has added.
	</li>
	<li>
		Mapbox Terrain base layer has been added.
	</li>
</ul>
BUGFIXES:
<ul>
	<li>
		Edit Point page has been fixed.
	</li>
	<li>
		Mapbox Street Base Layer has been fixed.
	</li>
</ul>
TABLE STRUCTURE CHANGE ID:
<ul>
	<li>
		0__frame -> wms_layer_ids elements lenght has been changed from varchar(34) to varchar(100)
	</li>
</ul>
</div>
<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.9.3.6.210.211 DATE: 2013-02-02
<hr>
MINOR UPDATES:
<ul>
	<li>
		Edit Row option in Table View is now functional. 
	</li>
</ul>

</div>
<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.8.3.6.210.211 DATE: 2013-02-02
<hr>
MINOR UPDATES:
<ul>
	<li>
		Share Polygon link is functional now.
	</li>
	<li>
		Share MyMapbase link is functional now.
	</li>
	<li>
		Linewidth is enlarged, so it is more easy to select lines.
	</li>
	<li>
		Delete Table Row function added to table view.
	</li>
	<li>
		Edit Table Row link is added, but it is unfunctional for now.
	</li>
</ul>
BUGFIXES:
<ul>
	<li>
		Edit Polygon error has fixed. 
	</li>
</ul>
TABLE STRUCTURE CHANGES:
<ul>
	<li>
		There are two new columns in membership table: Profession and Approval
	</li>
	<li>
		New table added to database called table.
	</li>

</ul>
</div>
<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.7.2.5.210.211 DATE: 2013-02-02
<hr>
MINOR UPDATES:
<ul>
	<li>
		Point Create Helper added.
	</li>
	<li>
		Line Create Helper added.
	</li>
	<li>
		Polygon Create Helper added.
	</li>
	<li>
		It is necessary now the WKT (Well Known Transition) type inputs. ( for exp. old-input: 29.0 41.0 ; new-input: POINT(29.0 41.0) )
	</li>
</ul>
TABLE STRUCTURE CHANGES:
<ul>
	<li>
		Point table structure changed. Point Lon (Longitude) and Point Lat (Latitude) columns were not necessary. They are dropped from 0__point table.
	</li>

</ul>
</div>

<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.6.2.4.210.211 DATE: 2013-02-02
<hr>
MINOR UPDATES:
<ul>
	<li>
		"Show MyMapBase" button and map visualization for tables has been added.
	</li>

</ul>
BUGFIXES:
<ul>
	<li>
		Frame Helper button works now.
	</li>

</ul>
TABLE STRUCTURE CHANGES:
<ul>
	<li>
		All spatial datas in user's tables have no prefixes now. They are just refer to geometry types (point, linestring and polygon).
	</li>

</ul>
</div>

<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.5.1.3.210.211 DATE: 2012-05-12
<hr>
MINOR UPDATES:
<ul>
	<li>
		Database Control Panel added.
	</li>

</ul>
TABLE STRUCTURE CHANGES:
<ul>
	<li>
		All default table names (frame, point, line, etc.) has now prefix: "0__"
	</li>
	<li>
		Database control panel has the ability to create tables, add columns and rows. All user created tables will take a prefix with USER ID (USERid__YOURownTABLEname).
	</li>
</ul>
</div>

<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.4.1.2.210.211 DATE: 2012-05-09
<hr>
MINOR UPDATES:
<ul>
	<li>
		Frame Helper has added to all CREATE forms.
	</li>

</ul>
BUGFIXES:
<ul>
	<li>
		Login controller has added to all controllers. All functions except login function will control that user logged in or not.
	</li>
</ul>
</div>

<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.3.0.2.210.211 DATE: 2012-05-07
<hr>
MINOR UPDATES:
<ul>
	<li>
		Share your Frame initialized, unfortunately in some pages it is not working (Especially in calculations, queries and viewing multiple elements in View frames page).
	</li>
	<li>
		Pan and zoom bars has new styles.
	</li>
	<li>
		Envelope query is coded. For more curiuos see this <a href="http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html">page.</a>
	</li>
	<li>
		Distance calculation is coded with help of Haversine Formula. Exp: <a href="http://www.movable-type.co.uk/scripts/latlong.html">An application of Haversine Formula</a>
	</li>
</ul>
TABLE STRUCTURE CHANGES:
<ul>
	<li>
		Comment data table is added. It has id, title, comment, first_name, last_name, email_address, user_id and time columns.
	</li>
</ul>
</div>

<div id="log_container" style="margin:10px 40px;background:#F0F0F0;padding:10px;">
0.2.0.1.210.211 DATE: 2012-05-04
<hr>
MINOR UPDATES:
<ul>
	<li>
		Layers are available for multi selecting.
		Every layer is presented with spherical mercator true option, EPSG:900913 (wgs84 web mercator) and displayed with EPSG:4326 .
	</li>
	<li>
		Frame layer is dropped either from database and create frame form.
	</li>
	<li>
		Script importing is automated and related to database.
	</li>
	<li>
		Layer creating (in javascript) is automated and related to database.
	</li>
</ul>
TABLE STRUCTURE CHANGES:
<ul>
	<li>
		WMS Layer data table has created. (No front access)
	</li>
	<li>
		WMS Layer Scripts data table has created. (No front access)
	</li>
	<li>
		wms_server and wms_layer columns has dropped from frame table.
	</li>
	<li>
		wms_layer_ids column has created in frame table, which is an array contains ids of WMS Layers and seperated with comma.
	</li>
</ul>
</div>

