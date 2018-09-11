<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="SmartWay.UL.Views.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.css' rel='stylesheet' />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id='map' style="position: absolute; left: 58%; width: 42%; height: 92%;"></div>
    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoiYmx1ZWNsb3VkIiwiYSI6ImNqbHgybzkyYjA1cDgzcHBqajVsanloZjcifQ.cfB33e0QWToNns3FEyQ-uA';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/bluecloud/cjlx4qqqj47dd2spa6j5kdvzq'
        });
    </script>
</asp:Content>
