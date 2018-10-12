<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="SmartWay.UL.Views.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 blue lighten-1 text-white">Map</div>
        <div class="row">
            <div class="col-lg-4">
                <h5>Listings</h5>
                <br />
                <p>ad</p>
                <br />
                <p>ad</p>
                <br />
                <p>ad</p>
                <br />
                <p>ad</p>
                <br />
                <p>ad</p>
            </div>
            <div class="col-lg-8">
                <div id="map" style="height: 500px;"></div>
                <script>
                    $(function () {

                        function initMap() {

                            var location = new google.maps.LatLng(-32.89235, 151.69862);

                            var mapCanvas = document.getElementById('map');
                            var mapOptions = {
                                center: location,
                                zoom: 16,
                                panControl: false,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            }
                            var map = new google.maps.Map(mapCanvas, mapOptions);

                            var markerImage = '../Images/map-pin-solid.svg';

                            var marker = new google.maps.Marker({
                                position: location,
                                map: map,
                                icon: markerImage
                            });

                            var contentString =
                                    '<div class="info-window text-center">' +
                                    '<h3>University of Newcastle</h3>' +
                                    '<div class="info-content">' +
                                    '<p>This is a place where young adults go to serve their life sentence</p>' +
                                    '</div>' +
                                    '</div>';

                            var infowindow = new google.maps.InfoWindow({
                                content: contentString,
                                maxWidth: 400
                            });

                            marker.addListener('click', function () {
                                infowindow.open(map, marker);
                            });

                            var styles = [{ "featureType": "landscape", "stylers": [{ "saturation": -100 }, { "lightness": 65 }, { "visibility": "on" }] }, { "featureType": "poi", "stylers": [{ "saturation": -100 }, { "lightness": 51 }, { "visibility": "simplified" }] }, { "featureType": "road.highway", "stylers": [{ "saturation": -100 }, { "visibility": "simplified" }] }, { "featureType": "road.arterial", "stylers": [{ "saturation": -100 }, { "lightness": 30 }, { "visibility": "on" }] }, { "featureType": "road.local", "stylers": [{ "saturation": -100 }, { "lightness": 40 }, { "visibility": "on" }] }, { "featureType": "transit", "stylers": [{ "saturation": -100 }, { "visibility": "simplified" }] }, { "featureType": "administrative.province", "stylers": [{ "visibility": "off" }] }, { "featureType": "water", "elementType": "labels", "stylers": [{ "visibility": "on" }, { "lightness": -25 }, { "saturation": -100 }] }, { "featureType": "water", "elementType": "geometry", "stylers": [{ "hue": "#ffff00" }, { "lightness": -25 }, { "saturation": -97 }] }];

                            //map.set('styles', styles);
                        }

                        google.maps.event.addDomListener(window, 'load', initMap);
                    });
                </script>
                <%--<div class="row">
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtMapSearch" CssClass="form-control" Placeholder="Enter location" runat="server" />
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="btnMapSearch" Text="Search" CssClass="btn btn-blue btn-block" OnClientClick="getmap()" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div id="map_populate" style="width:100%; height:500px; border: 5px solid #5E5454;"></div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
