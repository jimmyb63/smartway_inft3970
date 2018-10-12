<%@ Page Title="SmartWay - View Advertisement" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<% string value = Request.QueryString["advertisementID"]; %>--%>

    <!-- Page Content -->
    <div class="col-lg-9 mt-2">

        <asp:HiddenField ID="adID" runat="server" />
        <asp:HiddenField ID="txtViewCount" runat="server" />
        <asp:ListView ID="displayAd" runat="server"
            DataKeyNames="advertisementID" GroupItemCount="3"
            ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAd">
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <div class="p-2 mb-2 bg-primary text-white"><%#:Item.advertisementTitle%></div>
                <div class="card">
                    <div id="adImages" class="carousel slide container-fluid h-25" data-ride="carousel" style="background-color: grey">
                        <!-- Indicators -->
                        <% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
                        <% List<string> adImages = getAdImages(adID); %>
                        <ul class="carousel-indicators">
                            <li data-target="#adImages" data-slide-to="0" class="active"></li>
                            <% for (int i = 1; i < adImages.Count; i++) %>
                            <% { %>
                            <li data-target="#adImages" data-slide-to="<%=i%>"></li>
                            <% } %>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner" role="listbox" style="text-align: center">
                            <div class="carousel-item thumbnail active" style="align-content: center">
                                <a href="<%=adImages[0]%>">
                                    <img class="img-fluid" src="<%=adImages[0]%>" alt="image"></a>
                            </div>
                            <% for (int i = 1; i < adImages.Count; i++)%>
                            <% { %>
                            <div class="carousel-item thumbnail" style="align-content: center">
                                <a href="<%=adImages[i]%>">
                                    <img class="img-fluid" src="<%=adImages[i]%>" alt="image"></a>
                            </div>
                            <% } %>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#adImages" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#adImages" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <h4>Price: <%#:String.Format("{0:c}", Item.advertisementPrice)%></h4>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <ul class="list-unstyled list-inline">
                                            <li class="list-inline-item pr-2 black-text">
                                                <p>Offers<i class="fas fa-hand-holding-usd m-2"></i><%#:getOfferCount(Item.advertisementID)%></p>
                                            </li>
                                            <li class="list-inline-item pr-2 black-text">Views<i class="fas fa-eye m-2"></i> <%=txtViewCount.Value %></li>
                                        </ul> <h4>Description</h4>
                                        <p><%#:Item.advertisementDescription %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4>
                                    <img class="avatar" src="<%#:getSellerAvatar(Item.advertisementSellerID) %>" />
                                    <%#:getSellerUsername(Item.advertisementSellerID) %></h4>
                                <ul class="list-unstyled list-inline">
                                    <li class="list-inline-item pr-2 black-text">
                                        <p>Joined: <%#:getSellerRegoDate(Item.advertisementSellerID)%></p>
                                    </li>
                                    <li class="list-inline-item pr-2 black-text">
                                        <p>Rating: 5 <i class="fas fa-star"></i></p>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <a href="#" class="badge badge-dark badge-pill mb-2 p-2">Is this still available?</a>
                                        <a href="#" class="badge badge-dark badge-pill mb-2 p-2">Can you deliver?</a>
                                        <a href="#" class="badge badge-dark badge-pill mb-2 p-2">How old is it?</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="Button1" Text="Interested" CssClass="btn btn-success btn-block mt-2" OnClick="WantToBuy" runat="server" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnContact" Text="Contact" OnClick="ContactSeller" CssClass="btn btn-info btn-block mt-2" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-12">
                                <%--                                <h4>Description</h4>
                                <p><%#:Item.advertisementDescription %></p>--%>
                            </div>
                            <%--<div class="col-lg-6 card-text">
                                <div id="map" style="height: 200px;"></div>
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
                            </div>--%>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-lg-12 card-text text-center">
                                <div id="map" style="height: 300px;"></div>
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
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-lg-4 col-md-12 my-1">
                                <%--<asp:Button ID="btnContact" Text="Contact Seller" OnClick="ContactSeller" CssClass="btn btn-info btn-block" runat="server" />--%>
                            </div>
                            <div class="col-lg-4 col-md-0"></div>
                            <div class="col-lg-4 col-md-12 my-1">
                                <asp:Button ID="btnReport" Text="Report Listing" CssClass="btn btn-danger btn-block" OnClick="ReportAd" runat="server" />
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table style="width: 100%;">
                    <tbody>
                        <tr>
                            <td>
                                <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                    <tr id="groupPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr></tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </div>
</asp:Content>
