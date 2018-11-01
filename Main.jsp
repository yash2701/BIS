<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/datepicker3.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>
  
  <meta charset="UTF-8">
    <link rel="stylesheet" href="http://localhost:8085/geoserver/openlayers3/ol.css" type="text/css">
    <style>
        .ol-zoom {
          top: 52px;
        }
        .margin{
        	top: 10px;
        }
        .ol-toggle-options {
          z-index: 1000;
          background: rgba(255,255,255,0.4);
          border-radius: 4px;
          padding: 2px;
          position: absolute;
          left: 8px;
          top: 8px;
        }
        #updateFilterButton, #resetFilterButton {
          height: 22px;
          width: 22px;
          text-align: center;
          text-decoration: none !important;
          line-height: 22px;
          margin: 1px;
          font-family: 'Lucida Grande',Verdana,Geneva,Lucida,Arial,Helvetica,sans-serif;
          font-weight: bold !important;
          background: rgba(0,60,136,0.5);
          color: white !important;
          padding: 2px;
        }
        .ol-toggle-options a {
          background: rgba(0,60,136,0.5);
          color: white;
          display: block;
          font-family: 'Lucida Grande',Verdana,Geneva,Lucida,Arial,Helvetica,sans-serif;
          font-size: 19px;
          font-weight: bold;
          height: 22px;
          line-height: 11px;
          margin: 1px;
          padding: 0;
          text-align: center;
          text-decoration: none;
          width: 22px;
          border-radius: 2px;
        }
        .ol-toggle-options a:hover {
          color: #fff;
          text-decoration: none;
          background: rgba(0,60,136,0.7);
        }
        body {
            font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
            font-size: small;
        }
        iframe {
            width: 100%;
            height: 100px;
            border: none;
        }
        /* Toolbar styles */
        #toolbar {
            position: relative;
            padding-bottom: 0.5em;
        }
        #toolbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #toolbar ul li {
            float: left;
            padding-right: 1em;
            padding-bottom: 0.5em;
        }
        #toolbar ul li a {
            font-weight: bold;
            font-size: smaller;
            vertical-align: middle;
            color: black;
            text-decoration: none;
        }
        #toolbar ul li a:hover {
            text-decoration: underline;
        }
        #toolbar ul li * {
            vertical-align: middle;
        }
        #map {
            clear: both;
            position: relative;
            width: 400px;
            height: 350px;
            border: 1px solid black;
        }
        #wrapper {
            width: 400px;
        }
        #location {
            float: right;
        }
        /* Styles used by the default GetFeatureInfo output, added to make IE happy */
        table.featureInfo, table.featureInfo td, table.featureInfo th {
            border: 1px solid #ddd;
            border-collapse: collapse;
            margin: 0;
            padding: 0;
            font-size: 90%;
            padding: .2em .1em;
        }
        table.featureInfo th {
            padding: .2em .2em;
            font-weight: bold;
            background: #eee;
        }
        table.featureInfo td {
            background: #fff;
        }
        table.featureInfo tr.odd td {
            background: #eee;
        }
        table.featureInfo caption {
            text-align: left;
            font-size: 100%;
            font-weight: bold;
            padding: .2em .2em;
        }
    </style>
    <script src="http://localhost:8085/geoserver/openlayers3/ol.js" type="text/javascript"></script>
 
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>BISAG</span>Admin</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Profile</a></li>
							<li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li>
							<li><a href="#"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>

  <div class="row">
    <div class="col-sm-3">
      <div class = "panel panel-success">
       <div class = "panel-heading">
        <h3 class = "panel-title">Select Satellite Data</h3>
       </div>
       <div class="panel-body">
       
<form action="Main.jsp" method="post">
<div class="col-md-6" ><label>Path From :</label><input class="form-control" type="text" name="pfrom" value="" placeholder="Path from" size=7> &nbsp; </div>
<div class="col-md-6" ><label>To :</label><input class="form-control" type="text" name="pto" value="" size=7> &nbsp; </div>

<div class="col-md-6" ><label>Row from: :</label><input class="form-control" type="text" name="rfrom" value="" placeholder="Row from" size=7> &nbsp; </div>
<div class="col-md-6" ><label>To :</label><input class="form-control" type="text" name="rto" value="" size=7> &nbsp; </div>

<div class="col-md-12" >
<label>Sensor type : </label>
<select class="selectpicker form-control" name="sen_type">
            <option value="AWF">AWF</option>
            <option value="L3">L3</option>
            <option value="L-4">L-4</option>
            <option value="44T cartosat">44T cartosat</option>
            <option value="PAN-AFT">PAN-AFT</option>
            <option value="PAN-FORE">PAN-FORE</option>
            </select>
</div>
<div class="col-md-12">
<label>Satellite type :</label>            
<select class="selectpicker form-control" name="sat_type">
           <option value="IRS 1C">IRS 1C</option>
           <option value="IRS 1D">IRS 1D</option>
           <option value="IRS-P6">IRS-P6</option>
           <option value="IRS R2">IRS R2</option>
           <option value="ISR P6">ISR P6</option>
           <option value="MERGE">MERGE</option>
           <option value="P5">P5</option>
           <option value="P6">P6</option>
        </select>
</div>
<div class="margin col-md-12" align="center">
    <button type="submit" class="btn btn-primary btn-block" onclick="showInput();"><b>Run Query</b></button><br> 
 </div>
 </form> 
 <form action="google_maps.html" method="post">
   <div class="margin" align="center">
   lat : <input type="text" name="lat" id="lat">
   lon : <input type="text" name="lon" id="lon"> 
   <div class="col-md-6">
   	<a href="http://maps.google.com/?q=23,72" class="btn btn-success btn-block" ><b>Plot scene</b></a>
   </div>
 
   <div class="col-md-6"> 
   	<button type="button" class="btn btn-info btn-block"><b>Clear scene</b></button> 
   </div>
   </div>
 </form>
 
    </div>
      </div>
    </div>
  <div class="col-sm-4">
     <div class = "panel panel-info">
      <div class = "panel-heading">
      <h3 class = "panel-title">Satellite Image</h3>
      </div>
      <div class = "panel-body">
 
    <div id="toolbar" style="display: none;">
      <ul>
        <li>
          <a>WMS version:</a>
          <select id="wmsVersionSelector" onchange="setWMSVersion(value)">
            <option value="1.1.1">1.1.1</option>
            <option value="1.3.0">1.3.0</option>
          </select>
        </li>
        <li>
          <a>Tiling:</a>
          <select id="tilingModeSelector" onchange="setTileMode(value)">
            <option value="untiled">Single tile</option>
            <option value="tiled">Tiled</option>
          </select>
        </li>
        <li>
          <a>Antialias:</a>
          <select id="antialiasSelector" onchange="setAntialiasMode(value)">
            <option value="full">Full</option>
            <option value="text">Text only</option>
            <option value="none">Disabled</option>
          </select>
        </li>
        <li>
          <a>Format:</a>
          <select id="imageFormatSelector" onchange="setImageFormat(value)">
            <option value="image/png">PNG 24bit</option>
            <option value="image/png8">PNG 8bit</option>
            <option value="image/gif">GIF</option>
            <option id="jpeg" value="image/jpeg">JPEG</option>
          </select>
        </li>
        <li>
          <a>Styles:</a>
          <select id="imageFormatSelector" onchange="setStyle(value)">
            <option value="">Default</option>
          </select>
        </li>
        <li>
          <a>Width/Height:</a>
          <select id="widthSelector" onchange="setWidth(value)">
             <option value="auto">Auto</option>
                <option value="600">600</option>
                <option value="750">750</option>
                <option value="950">950</option>
                <option value="1000">1000</option>
                <option value="1200">1200</option>
                <option value="1400">1400</option>
                <option value="1600">1600</option>
                <option value="1900">1900</option>
            </select>
            <select id="heigthSelector" onchange="setHeight(value)">
                <option value="auto">Auto</option>
                <option value="300">300</option>
                <option value="400">400</option>
                <option value="500">500</option>
                <option value="600">600</option>
                <option value="700">700</option>
                <option value="800">800</option>
                <option value="900">900</option>
                <option value="1000">1000</option>
            </select>
          </li>
          <li>
              <a>Filter:</a>
              <select id="filterType">
                  <option value="cql">CQL</option>
                  <option value="ogc">OGC</option>
                  <option value="fid">FeatureID</option>
              </select>
              <input type="text" size="80" id="filter"/>
              <a id="updateFilterButton" href="#" onClick="updateFilter()" title="Apply filter">Apply</a>
              <a id="resetFilterButton" href="#" onClick="resetFilter()" title="Reset filter">Reset</a>
          </li>
        </ul>
      </div>
    <div id="map">
      <div class="ol-toggle-options ol-unselectable"><a title="Toggle options toolbar" onClick="toggleControlPanel()" href="#toggle">...</a></div>
    </div>
    <div id="wrapper">
        <div id="location"></div>
        <div id="scale">
    </div></div>
    <div id="nodelist">
        <em>Click on the map to get feature info</em>
    </div>
    <script type="text/javascript">
      var pureCoverage = false;
      // if this is just a coverage or a group of them, disable a few items,
      // and default to jpeg format
      var format = 'image/png';
      var bounds = [68.14806781208101, 20.118149140613397,
                    74.47891169978561, 24.722655175866358];
      if (pureCoverage) {
        document.getElementById('filterType').disabled = true;
        document.getElementById('filter').disabled = true;
        document.getElementById('antialiasSelector').disabled = true;
        document.getElementById('updateFilterButton').disabled = true;
        document.getElementById('resetFilterButton').disabled = true;
        document.getElementById('jpeg').selected = true;
        format = "image/jpeg";
      }

      var mousePositionControl = new ol.control.MousePosition({
        className: 'custom-mouse-position',
        target: document.getElementById('location'),
        coordinateFormat: ol.coordinate.createStringXY(5),
        undefinedHTML: '&nbsp;'
      });
      var untiled = new ol.layer.Image({
        source: new ol.source.ImageWMS({
          ratio: 1,
          url: 'http://localhost:8085/geoserver/gujarat_highway/wms',
          params: {'FORMAT': format,
                   'VERSION': '1.1.1',  
                STYLES: '',
                LAYERS: 'gujarat_highway:DistrictBoundry_geo_lat_long',
          }
        })
      });
      var tiled = new ol.layer.Tile({
        visible: false,
        source: new ol.source.TileWMS({
          url: 'http://localhost:8085/geoserver/gujarat_highway/wms',
          params: {'FORMAT': format, 
                   'VERSION': '1.1.1',
                   tiled: true,
                STYLES: '',
                LAYERS: 'gujarat_highway:DistrictBoundry_geo_lat_long',
          }
        })
      });
      var projection = new ol.proj.Projection({
          code: 'EPSG:4326',
          units: 'degrees',
          axisOrientation: 'neu'
      });
      var map = new ol.Map({
        controls: ol.control.defaults({
          attribution: false
        }).extend([mousePositionControl]),
        target: 'map',
        layers: [
          untiled,
          tiled
        ],
        view: new ol.View({
           projection: projection
        })
      });
      map.getView().on('change:resolution', function(evt) {
        var resolution = evt.target.get('resolution');
        var units = map.getView().getProjection().getUnits();
        var dpi = 25.4 / 0.28;
        var mpu = ol.proj.METERS_PER_UNIT[units];
        var scale = resolution * mpu * 39.37 * dpi;
        if (scale >= 9500 && scale <= 950000) {
          scale = Math.round(scale / 1000) + "K";
        } else if (scale >= 950000) {
          scale = Math.round(scale / 1000000) + "M";
        } else {
          scale = Math.round(scale);
        }
        document.getElementById('scale').innerHTML = "Scale = 1 : " + scale;
      });
      map.getView().fit(bounds, map.getSize());
      map.on('singleclick', function(evt) {
        document.getElementById('nodelist').innerHTML = "Loading... please wait...";
        var view = map.getView();
        var viewResolution = view.getResolution();
        var source = untiled.get('visible') ? untiled.getSource() : tiled.getSource();
        var url = source.getGetFeatureInfoUrl(
          evt.coordinate, viewResolution, view.getProjection(),
          {'INFO_FORMAT': 'text/html', 'FEATURE_COUNT': 50});
        if (url) {
          document.getElementById('nodelist').innerHTML = '<iframe seamless src="' + url + '"></iframe>';
        }
      });

      // sets the chosen WMS version
      function setWMSVersion(wmsVersion) {
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'VERSION': wmsVersion});
        });
      }

      // Tiling mode, can be 'tiled' or 'untiled'
      function setTileMode(tilingMode) {
        if (tilingMode == 'tiled') {
          untiled.set('visible', false);
          tiled.set('visible', true);
        } else {
          tiled.set('visible', false);
          untiled.set('visible', true);
        }
      }

      function setAntialiasMode(mode) {
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'FORMAT_OPTIONS': 'antialias:' + mode});
        });
      }

      // changes the current tile format
      function setImageFormat(mime) {
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'FORMAT': mime});
        });
      }

      function setStyle(style){
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'STYLES': style});
        });
      }

      function setWidth(size){
        var mapDiv = document.getElementById('map');
        var wrapper = document.getElementById('wrapper');

        if (size == "auto") {
          // reset back to the default value
          mapDiv.style.width = null;
          wrapper.style.width = null;
        }
        else {
          mapDiv.style.width = size + "px";
          wrapper.style.width = size + "px";
        }
        // notify OL that we changed the size of the map div
        map.updateSize();
      }

      function setHeight(size){
        var mapDiv = document.getElementById('map');
        if (size == "auto") {
          // reset back to the default value
          mapDiv.style.height = null;
        }
        else {
          mapDiv.style.height = size + "px";
        }
        // notify OL that we changed the size of the map div
        map.updateSize();
      }

      function updateFilter(){
        if (pureCoverage) {
          return;
        }
        var filterType = document.getElementById('filterType').value;
        var filter = document.getElementById('filter').value;
        // by default, reset all filters
        var filterParams = {
          'FILTER': null,
          'CQL_FILTER': null,
          'FEATUREID': null
        };
        if (filter.replace(/^\s\s*/, '').replace(/\s\s*$/, '') != "") {
          if (filterType == "cql") {
            filterParams["CQL_FILTER"] = filter;
          }
          if (filterType == "ogc") {
            filterParams["FILTER"] = filter;
          }
          if (filterType == "fid")
            filterParams["FEATUREID"] = filter;
          }
          // merge the new filter definitions
          map.getLayers().forEach(function(lyr) {
            lyr.getSource().updateParams(filterParams);
          });
        }

        function resetFilter() {
          if (pureCoverage) {
            return;
          }
          document.getElementById('filter').value = "";
          updateFilter();
        }

        // shows/hide the control panel
        function toggleControlPanel(){
          var toolbar = document.getElementById("toolbar");
          if (toolbar.style.display == "none") {
            toolbar.style.display = "block";
          }
          else {
            toolbar.style.display = "none";
          }
          map.updateSize()
        }

    </script>
   
    </div>
    </div> 
   </div>
  </div>
 
  
  
  <div class="row">
  <div class="col-sm-12">

<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.lang.*"%>

<%

int pfrom = Integer.parseInt(request.getParameter("pfrom"));
int pto = Integer.parseInt(request.getParameter("pto"));
int rfrom = Integer.parseInt(request.getParameter("rfrom"));
int rto = Integer.parseInt(request.getParameter("rto"));
String sen_type = request.getParameter("sen_type");
String sat_type = request.getParameter("sat_type");

try {
	Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<table   border="1" class="table table-striped table-hover ">
  <thead>
    <tr>
      <th><b>id</b></th>
      <th><b>Path</b></th>
      <th><b>Row</b></th>
      <th><b>Date</b></th>
      <th><b>Time</b></th>
      <th><b>Satellite Type</b></th>
      <th><b>Sensor Type</b></th>
       <th><b>Image</b></th>
    </tr>
  </thead>
<%
try{
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
        "postgres", "Micro2016");

Statement st = con.createStatement();

Blob b2;
byte br[];

ResultSet rs= st.executeQuery("SELECT * FROM satdatatable WHERE (path >= '"+ pfrom +"' AND path <= '"+ pto +"') AND (row >= '"+ rfrom +"' AND row <= '"+ rto +"') AND mission_id='"+ sat_type +"' AND sensor_id='"+ sen_type +"'");
while(rs.next()){
	//Blob b = rs.getBlob("image");
	//byte i[] = b.getBytes(1,(int)b.length());
	
	
%>
<tr bgcolor="#DEB887">

<td><%=rs.getInt("id") %> </td>
<td><%=rs.getInt("path") %></td>
<td><%=rs.getInt("row") %></td>
<td><%=rs.getString("date") %></td>
<td><%=rs.getString("time") %></td>
<td><%=rs.getString("mission_id") %></td>
<td><%=rs.getString("sensor_id") %></td>
<% 
}
}catch (Exception e) {
e.printStackTrace();
}
%>

</table>

  </div>
  </div> 
 
        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/chart.min.js"></script>
	    <script src="js/chart-data.js"></script>
	    <script src="js/easypiechart.js"></script>
	    <script src="js/easypiechart-data.js"></script>
	    <script src="js/bootstrap-datepicker.js"></script>
        
</body>
</html>