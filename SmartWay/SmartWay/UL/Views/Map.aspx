<%@ Page Title="SmartWay - Recycle Locations" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="SmartWay.UL.Views.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS_nOmu7Z5my3ELOiqHOgxrzOnoHfvJNU"></script>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 blue lighten-1 text-white">Map</div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div id="map" style="height: 500px;"></div>
                <script>
                    $(function () {

                        function initMap() {

                            var location1 = new google.maps.LatLng(<%=getLat("34 Rural Dr, Sandgate NSW 2304")%>, <%=getLong("34 Rural Dr, Sandgate NSW 2304")%>);
                            var location2 = new google.maps.LatLng(<%=getLat("2/29 Rosegum Rd, Warabrook NSW 2304")%>, <%=getLong("2/29 Rosegum Rd, Warabrook NSW 2304")%>);
                            var location3 = new google.maps.LatLng(<%=getLat("1 McIntosh Dr, Mayfield West NSW 2304")%>, <%=getLong("1 McIntosh Dr, Mayfield West NSW 2304")%>);
                            var location4 = new google.maps.LatLng(<%=getLat("Maitland Rd, Mayfield NSW 2304")%>, <%=getLong("Maitland Rd, Mayfield NSW 2304")%>);
                            var location5 = new google.maps.LatLng(<%=getLat("28 Blue Gum Rd, Jesmond NSW 2299")%>, <%=getLong("28 Blue Gum Rd, Jesmond NSW 2299")%>);
                            var location6 = new google.maps.LatLng(<%=getLat("158 Maitland Rd, Mayfield NSW 2304")%>, <%=getLong("158 Maitland Rd, Mayfield NSW 2304")%>);
                            var location7 = new google.maps.LatLng(<%=getLat("12 Maitland Rd, Islington NSW 2296")%>, <%=getLong("12 Maitland Rd, Islington NSW 2296")%>);
                            var location8 = new google.maps.LatLng(<%=getLat("175 Nelson St, Wallsend NSW 2287")%>, <%=getLong("175 Nelson St, Wallsend NSW 2287")%>);
                            var location9 = new google.maps.LatLng(<%=getLat("4 Church St, Mayfield NSW 2304")%>, <%=getLong("4 Church St, Mayfield NSW 2304")%>);
                            var location10 = new google.maps.LatLng(<%=getLat("Ingall St, Mayfield NSW 2304")%>, <%=getLong("Ingall St, Mayfield NSW 2304")%>);
                            var location11 = new google.maps.LatLng(<%=getLat("8 Gross St, Carrington NSW 2294")%>, <%=getLong("8 Gross St, Carrington NSW 2294")%>);

                            var mapCanvas = document.getElementById('map');
                            var mapOptions = {
                                center: location3,
                                zoom: 13,
                                panControl: false,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            }
                            var map = new google.maps.Map(mapCanvas, mapOptions);

                            var markerImage = '../Images/smartway-map-pin.png';

                            //Location 1

                            var marker1 = new google.maps.Marker({
                                position: location1,
                                map: map,
                                icon: markerImage
                            });

                            var contentString1 =
                                '<div class="info-window text-center">' +
                                '<h3>Recycling Solutions Australia</h3>' +
                                '<div class="info-content">' +
                                '<p>A huge selection of quality secondhand items at great prices. Including Antiques and Collectables. </p><br />' +
                                '<p>Location: 34 Rural Dr, Sandgate NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow1 = new google.maps.InfoWindow({
                                content: contentString1,
                                maxWidth: 400
                            });

                            marker1.addListener('click', function () {
                                infowindow1.open(map, marker1);
                            });

                            // Location 2

                            

                            var marker2 = new google.maps.Marker({
                                position: location2,
                                map: map,
                                icon: markerImage
                            });

                            var contentString2 =
                                '<div class="info-window text-center">' +
                                '<h3>House with No Steps Recycling</h3>' +
                                '<div class="info-content">' +
                                '<p>Paper, plastic, cardboard, and clothing recycling</p><br />' +
                                '<p>Location: 2/29 Rosegum Rd, Warabrook NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow2 = new google.maps.InfoWindow({
                                content: contentString2,
                                maxWidth: 400
                            });

                            marker2.addListener('click', function () {
                                infowindow2.open(map, marker2);
                            });

                            // Location 3

                            var location3 = new google.maps.LatLng(<%=getLat("1 McIntosh Dr, Mayfield West NSW 2304")%>, <%=getLong("1 McIntosh Dr, Mayfield West NSW 2304")%>);

                            var marker3 = new google.maps.Marker({
                                position: location3,
                                map: map,
                                icon: markerImage
                            });

                            var contentString3 =
                                '<div class="info-window text-center">' +
                                '<h3>Benedict Recycling Mayfield West</h3>' +
                                '<div class="info-content">' +
                                '<p>Recycle centre</p><br />' +
                                '<p>Location: 1 McIntosh Dr, Mayfield West NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow3 = new google.maps.InfoWindow({
                                content: contentString3,
                                maxWidth: 400
                            });

                            marker3.addListener('click', function () {
                                infowindow3.open(map, marker3);
                            });

                            // Location 4

                            

                            var marker4 = new google.maps.Marker({
                                position: location4,
                                map: map,
                                icon: markerImage
                            });

                            var contentString4 =
                                '<div class="info-window text-center">' +
                                '<h3>Return and Earn</h3>' +
                                '<div class="info-content">' +
                                '<p>Return Your Drink Containers At A Collection Point For A Refund.</p><br />' +
                                '<p>Location: Maitland Rd, Mayfield NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow4 = new google.maps.InfoWindow({
                                content: contentString4,
                                maxWidth: 400
                            });

                            marker4.addListener('click', function () {
                                infowindow4.open(map, marker4);
                            });

                            // Location 5

                            

                            var marker5 = new google.maps.Marker({
                                position: location5,
                                map: map,
                                icon: markerImage
                            });

                            var contentString5 =
                                '<div class="info-window text-center">' +
                                '<h3>Return and Earn</h3>' +
                                '<div class="info-content">' +
                                '<p>Return Your Drink Containers At A Collection Point For A Refund.</p><br />' +
                                '<p>Location: 28 Blue Gum Rd, Jesmond NSW 2299</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow5 = new google.maps.InfoWindow({
                                content: contentString5,
                                maxWidth: 400
                            });

                            marker5.addListener('click', function () {
                                infowindow5.open(map, marker5);
                            });

                            // Location 6

                            

                            var marker6 = new google.maps.Marker({
                                position: location6,
                                map: map,
                                icon: markerImage
                            });

                            var contentString6 =
                                '<div class="info-window text-center">' +
                                '<h3>Lifeline Shop Mayfield</h3>' +
                                '<div class="info-content">' +
                                '<p> Every $1 spent in store helps us save lives. </p><br />' +
                                '<p>Location: 158 Maitland Rd, Mayfield NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow6 = new google.maps.InfoWindow({
                                content: contentString6,
                                maxWidth: 400
                            });

                            marker6.addListener('click', function () {
                                infowindow6.open(map, marker6);
                            });

                            // Location 7

                            

                            var marker7 = new google.maps.Marker({
                                position: location7,
                                map: map,
                                icon: markerImage
                            });

                            var contentString7 =
                                '<div class="info-window text-center">' +
                                '<h3>Lifeline Newcastle & Hunter</h3>' +
                                '<div class="info-content">' +
                                '<p>Every $1 spent in store helps us save lives.</p><br/>' +
                                '<p>Location: 12 Maitland Rd, Islington NSW 2296</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow7 = new google.maps.InfoWindow({
                                content: contentString7,
                                maxWidth: 400
                            });

                            marker7.addListener('click', function () {
                                infowindow7.open(map, marker7);
                            });

                            // Location 8

                            

                            var marker8 = new google.maps.Marker({
                                position: location8,
                                map: map,
                                icon: markerImage
                            });

                            var contentString8 =
                                '<div class="info-window text-center">' +
                                '<h3>St Vincent de Paul Society</h3>' +
                                '<div class="info-content">' +
                                '<p>The Society of St. Vincent de Paul is composed of women and men who seek their personal holiness through works of charity. </p><br/>' +
                                '<p>Location: 175 Nelson St, Wallsend NSW 2287</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow8 = new google.maps.InfoWindow({
                                content: contentString8,
                                maxWidth: 400
                            });

                            marker8.addListener('click', function () {
                                infowindow8.open(map, marker8);
                            });

                            // Location 9

                            

                            var marker9 = new google.maps.Marker({
                                position: location9,
                                map: map,
                                icon: markerImage
                            });

                            var contentString9 =
                                '<div class="info-window text-center">' +
                                '<h3>St Vincent De Paul Society</h3>' +
                                '<div class="info-content">' +
                                '<p>The Society of St. Vincent de Paul is composed of women and men who seek their personal holiness through works of charity.</p><br/>' +
                                '<p>Location: 4 Church St, Mayfield NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow9 = new google.maps.InfoWindow({
                                content: contentString9,
                                maxWidth: 400
                            });

                            marker9.addListener('click', function () {
                                infowindow9.open(map, marker9);
                            });

                            // Location 10

                            
                            var marker10 = new google.maps.Marker({
                                position: location10,
                                map: map,
                                icon: markerImage
                            });

                            var contentString10 =
                                '<div class="info-window text-center">' +
                                '<h3>SCE Recycling (Hunter)</h3>' +
                                '<div class="info-content">' +
                                '<p>SCE Solutions. In a world of shrinking resources, we deliver modern solutions the good old-fashioned way.</p><br/>' +
                                '<p>Location: Ingall St, Mayfield NSW 2304</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow10 = new google.maps.InfoWindow({
                                content: contentString10,
                                maxWidth: 400
                            });

                            marker10.addListener('click', function () {
                                infowindow10.open(map, marker10);
                            });

                            // Location 11

                            
                            var marker11 = new google.maps.Marker({
                                position: location11,
                                map: map,
                                icon: markerImage
                            });

                            var contentString11 =
                                '<div class="info-window text-center">' +
                                '<h3>Hunter Recyclers</h3>' +
                                '<div class="info-content">' +
                                '<p>Scrap Metal Merchants</p><br/>' +
                                '<p>Location: 8 Gross St, Carrington NSW 2294</p>' +
                                '</div>' +
                                '</div>';

                            var infowindow11 = new google.maps.InfoWindow({
                                content: contentString11,
                                maxWidth: 400
                            });

                            marker11.addListener('click', function () {
                                infowindow11.open(map, marker11);
                            });
                           
                            var styles = [
                                            {
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#ebe3cd"
                                                }
                                                ]
                                            },
                                            {
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#523735"
                                                }
                                                ]
                                            },
                                            {
                                                "elementType": "labels.text.stroke",
                                                "stylers": [
                                                {
                                                    "color": "#f5f1e6"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "administrative",
                                                "elementType": "geometry.stroke",
                                                "stylers": [
                                                {
                                                    "color": "#c9b2a6"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "administrative.land_parcel",
                                                "elementType": "geometry.stroke",
                                                "stylers": [
                                                {
                                                    "color": "#dcd2be"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "administrative.land_parcel",
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#ae9e90"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "landscape.natural",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#dfd2ae"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "poi",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#dfd2ae"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "poi",
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#93817c"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "poi.park",
                                                "elementType": "geometry.fill",
                                                "stylers": [
                                                {
                                                    "color": "#a5b076"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "poi.park",
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#447530"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#f5f1e6"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road.arterial",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#fdfcf8"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road.highway",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#f8c967"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road.highway",
                                                "elementType": "geometry.stroke",
                                                "stylers": [
                                                {
                                                    "color": "#e9bc62"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road.highway.controlled_access",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#e98d58"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road.highway.controlled_access",
                                                "elementType": "geometry.stroke",
                                                "stylers": [
                                                {
                                                    "color": "#db8555"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "road.local",
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#806b63"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "transit.line",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#dfd2ae"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "transit.line",
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#8f7d77"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "transit.line",
                                                "elementType": "labels.text.stroke",
                                                "stylers": [
                                                {
                                                    "color": "#ebe3cd"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "transit.station",
                                                "elementType": "geometry",
                                                "stylers": [
                                                {
                                                    "color": "#dfd2ae"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "water",
                                                "elementType": "geometry.fill",
                                                "stylers": [
                                                {
                                                    "color": "#b9d3c2"
                                                }
                                                ]
                                            },
                                            {
                                                "featureType": "water",
                                                "elementType": "labels.text.fill",
                                                "stylers": [
                                                {
                                                    "color": "#92998d"
                                                }
                                                ]
                                            }
                            ]

                            map.set('styles', styles);
                        }

                        google.maps.event.addDomListener(window, 'load', initMap);
                    });
                </script>
            </div>
        </div>
    </div>
</asp:Content>
