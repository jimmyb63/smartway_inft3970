<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="SmartWay.UL.Views.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.js'></script>
    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoiYmx1ZWNsb3VkIiwiYSI6ImNqbHgybzkyYjA1cDgzcHBqajVsanloZjcifQ.cfB33e0QWToNns3FEyQ-uA';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/bluecloud/cjlx4qqqj47dd2spa6j5kdvzq'
        });
    </script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.css' rel='stylesheet' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="map-right" style="position:absolute; left:200px">
        <div id='map' style="width:200px"></div>
    </div>
    <div class="list-left">

    </div>
</asp:Content>
