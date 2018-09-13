<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapPage.aspx.cs" Inherits="SmartWay.UL.Views.MapPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.css' rel='stylesheet' />
    <link href="../../Content/map.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
    <div class="sidebar pad2">Listing</div>
        <div id='map' class="map"></div>
        <script>
            mapboxgl.accessToken = 'pk.eyJ1IjoiYmx1ZWNsb3VkIiwiYSI6ImNqbHgybzkyYjA1cDgzcHBqajVsanloZjcifQ.cfB33e0QWToNns3FEyQ-uA';
            var map = new mapboxgl.Map({
                container: 'map',
                style: 'mapbox://styles/bluecloud/cjlx4qqqj47dd2spa6j5kdvzq',
                center: [137.003, -27.525],
                zoom: 3.6
            });

        </script>
    </form>
</body>
</html>
