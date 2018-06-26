
<%@ Page Title="TripInfo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripInfo.aspx.cs" Inherits="MapleLeaf2.TripInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <link rel="Stylesheet" href="./Styles/trip.css" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Saira+Condensed" rel="stylesheet">

  <div class="container">
  <h1>Trip Information</h1>
  <h2>Choose your destination!✈️</h2>

  <div class="panel row" >
    
      <!--Ontario panel-->
      <div class="panel panel-default col-sm-2 col-xs-12 tripPanel">
      <div class="panel-heading heading">Ontario</div>
      <div class="panel-body">
          <ul class="panelChild">
              <li><a href="./Trip/toronto.aspx">TORONTO</a></li>
              <li><a href="#">NIAGARA</a></li>
              <li><a href="#">OTTAWA</a></li>
              <li><a href="#">THOUSAND ISLANDS</a></li>
              <%--<li><a href="#">BAINSVILLE</a></li>--%>
          </ul>
      </div>
    </div>

    <!--Quebec panel-->
    <div class="panel panel-default col-sm-2 col-xs-12 tripPanel">
      <div class="panel-heading heading">Quebec</div>
      <div class="panel-body">
            <ul class="panelChild">
                <li><a href="./Trip/QuebecCity.aspx">QUEBEC CITY</a></li>
                <li><a href="#">MONTREAL</a></li>    
                <li><a href="#">GATINEAU</a></li>
                <li><a href="#">TROIS-RIVIERÈS</a></li>
            </ul>
        </div>
    </div>

    <!--Alberta panel-->
    <div class="panel panel-default col-sm-2 col-xs-12 tripPanel">
      <div class="panel-heading heading">Alberta</div>
      <div class="panel-body">
            <ul class="panelChild">
                <li><a href="./Trip/Banff.aspx">BANFF NATIONAL PARK</a></li>
                <li><a href="#">EDMONTON</a></li>
                <li><a href="#">CALGARY</a></li>
                <li><a href="#">RED DEER</a></li>
              <%--  <li><a href="#">Dinosaur Provincial Park</a></li>--%>
            </ul>
        </div>
    </div>
    
    <!--BC panel-->
    <div class="panel panel-default col-sm-2 col-xs-12 tripPanel">
            <div class="panel-heading heading">BC</div>
            <div class="panel-body">
                <ul class="panelChild">
                    <li><a href="./Trip/Vancouver.aspx">VANCOUVER</a></li>
                    <li><a href="#">VICTORIA</a></li>
                    <li><a href="#">KELOWNA</a></li>
                    <li><a href="#">WHISTLER</a></li>
                </ul>
            </div>
    </div>

    <!--PEI panel-->
    <div class="panel panel-default col-sm-2 col-xs-12 tripPanel">
        <div class="panel-heading heading">PEI</div>
        <div class="panel-body">
            <ul class="panelChild">
                <li><a href="./Trip/Charlottetown.aspx">CHARLOTTETOWN</a></li>
                <li><a href="#">SUMMERSIDE</a></li>
                <li><a href="#">STRATFORD</a></li>
                <li><a href="#">MONTAGUE</a></li>
            </ul>
        </div>
    </div>
  </div>
      <%--<div class="boxforMap">
          <img class="canadamap" runat="server" src="img/canadamap.png" />
      </div>--%>
      
</div>

    <div class="panel-group">
      <div class="panel panel-default">
        <div class="panel-body maps" id="map"></div>
      </div>
    </div>

    <%-- JavaScript Google Map --%>

    <script type="text/javascript">
    	/*var map = {};
    	var markers = [];
    	var place = [];
        var globalPos;*/

        /*show five provices by picking markers*/

        var provinceList = [
            ["Quebec", "Canada"],
            ["British Columbia", "Canada"],
            ["Prince Edward Island", "Canada"],
            ["Alberta", "Canada"],
            ["Ontario", "Canada"]
        ];

        var geocoder, map;

        // initiate the map
        function initMap() {
            geocoder = new google.maps.Geocoder();
    		//var mapContainer = (document.getElementById("map"));

            var mapOptions = {
                // modify center
                center: new google.maps.LatLng(57.405072, -107.542391),
    			zoom: 4,
	    		showCopyright: true
    		}

    		//map = new google.maps.Map(mapContainer, mapOptions);
            map = new google.maps.Map(document.getElementById("map"), mapOptions);

            for (var i = 0; i < provinceList.length; i++) {
                var address = provinceList[i][0] + ', ' + provinceList[i][1];
                codeAddress(address);
            }
        }


        function codeAddress(address) {
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });
                } else {
                    alert("Geocode unsuccessful");
                }
            });
        };
        
        /*
        // get the current location
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            }
        }

        function showPosition(position) {
            globalPos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            map.setCenter(globalPos);

            addMarkerGlobal(globalPos);
        }

    	function addMarkerGlobal(globalPos) {
    		var marker = new google.maps.Marker({
				position: {lat: globalPos.lat, lng: globalPos.lng},
				map: map,				
				animation: google.maps.Animation.DROP,
				draggable: false
			});

			marker.addListener('click', function() {
				map.setZoom(7);
				map.setCenter(marker.getPosition());
			});
    	}
        */

		// **************************************************************
		// function creates a marker object and adds the new marker (pin)
		// to the marker array
		/*function addMarker(place) {
			var image = {
				url: 'image/coffee_5.png'
			}
			// create a marker (pin) object
			var marker = new google.maps.Marker({
				position: place.geometry.location,
				map: map,
				icon: image,
				title: place.name + "\n" + place.formatted_address, // hover the mouse on the marker
				animation: google.maps.Animation.DROP,
				draggable: false
			});
		
			// add a "click" event handler to centre on the marker
			marker.addListener('click', function() {
				map.setZoom(7);
				map.setCenter(marker.getPosition());
			});
			
			// push the marker object onto the markers array
			markers.push(marker);
		}*/
		/*
		// *********************************************************
		// display all the marker objects (pins) in the marker array
		function displayAllMarkers(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}
        */
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEZ57nS85PaN1ZWBQMzmtajMH8xeZyt4Y&callback=initMap&libraries=places" async defer></script>


</asp:Content>