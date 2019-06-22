<style> @import url('<?php echo base_url() ?>application/views/css/members_area.css'); </style>


<div id="control_panel">

	<div id="control_panel_left">
		<div id="frames" class="menu_box">
		<div id="frames_title" class="title">
			Frame Panel 
			<a href="http://www.mymapbase.com/cms/index.php/en/how-to#1-1-step-create-your-frame" target="_blank">
			<span class="hint--rounded" data-hint="If you dont know how to create your frame, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
			</a>
		</div>
		<ul>
			<li><?php echo anchor('frame/create_frame', 'Create Frame'); ?></li>
			<li><?php echo anchor('frame/view_frames', 'View Frames'); ?></li>
		</ul>
		</div>
		<div id="Queries" class="menu_box">
		<div id="queries_title" class="title">
			Query Panel
		</div>
		<ul>
			<li><?php echo anchor('query/select_lines_to_envelope', 'Envelope line'); ?></li><li></li>
		</ul>
		</div>
		<div id="Calculations" class="menu_box">
		<div id="calculations_title" class="title">
			Calculation Panel
		</div>
		<ul>
			<li><?php echo anchor('calculation/select_points_to_distance', 'Distance between two points'); ?></li>
			<li><?php echo anchor('calculation/transform_to_cartesian', 'Transform geometries to Cartesian Coordinate Systems'); ?></li>
		</ul>
		</div>
	</div>

	<div id="control_panel_right">
		<div id="points" class="menu_box">
			<div id="points_title" class="title">
				Points Panel
				<a href="http://www.mymapbase.com/cms/index.php/en/how-to#2-2-step-create-your-points" target="_blank">
				<span class="hint--rounded" data-hint="If you dont know how to create your point, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
				</a>
			</div>
			<ul>
				<li><?php echo anchor('point/create_point', 'Create Point'); ?></li>
				<li><?php echo anchor('point/view_points', 'View Points'); ?></li>
			</ul>
		</div>
		<div id="lines" class="menu_box">
			<div id="lines_title" class="title">
				Lines Panel
				<a href="http://www.mymapbase.com/cms/index.php/en/how-to#3-3-step-create-your-lines" target="_blank">
				<span class="hint--rounded" data-hint="If you dont know how to create your line, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
				</a>
			</div>
			<ul>
				<li><?php echo anchor('line/create_line', 'Create Line'); ?></li>
				<li><?php echo anchor('line/view_lines', 'View Lines'); ?></li>
			</ul>
		</div>
		<div id="polygons" class="menu_box">
			<div id="polygons_title" class="title">
				Polygon Panel
				<a href="http://www.mymapbase.com/cms/index.php/en/how-to#4-4-step-create-your-polygons" target="_blank">
				<span class="hint--rounded" data-hint="If you dont know how to create your polygon, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
				</a>
			</div>
			<ul>
				<li><?php echo anchor('polygon/create_polygon', 'Create Polygon'); ?></li>
				<li><?php echo anchor('polygon/view_polygons', 'View Polygons'); ?></li>
			</ul>
		</div>
	</div>
	<div id="database_panel">
		<div id="database_title" class="title">
			Database Panel
			<a href="http://www.mymapbase.com/cms/index.php/en/how-to#5-5-step-design-your-own-table" target="_blank">
				<span class="hint--rounded" data-hint="If you dont know how to design your table structure, click here." style="color:#FE5928;vertical-align:super;font-size:12px;">?</span>
				</a>
		</div>
		<div id="left_side_db">
		<ul>
			<?php 
				
				echo '<li>';
				echo anchor('table/create_table', 'Create Table');
				echo '</li>';
				echo '<li>';
				echo anchor('table/delete_table', 'Delete Table');
				echo '</li>';
				
			?>
			</ul>
		</div>
		<div id="right_side_db">
			<ul>
			<?php
				if ($tables[0] != NULL)
				{
					
					foreach ($tables as $table)
					{
						echo '<li>';
						echo anchor('table/view_table/'.$table, $table, 'title="View Table"');
						echo '</li>';
					}
				}
				else{}
			?>
			</ul>
		</div>
	</div>
</div>
