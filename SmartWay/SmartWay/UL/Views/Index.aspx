<%@ Page Title="SmartWay" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SmartWay.UL.Views.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 blue lighten-1 text-white">Featured</div>
        <!--Featured Carousel -->
        <div id="carouselExampleIndicators" class="carousel slide mb-4" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span> </a><a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
        </div>

        <!--Popular -->
        <div class="p-2 mt-2 blue lighten-1 text-white">Popular</div>
        <div class="row">
            <div class="col-lg-4 col-6 my-2">
                <div class="card h-100">
                    <a href="#">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#">Item One</a> </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum</p>
                    </div>
                    <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                </div>
            </div>
            <div class="col-lg-4  col-6 my-2">
                <div class="card h-100">
                    <a href="#">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#">Item Two</a> </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum.</p>
                    </div>
                    <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                </div>
            </div>
            <div class="col-lg-4 col-6 mt-2">
                <div class="card h-100">
                    <a href="#">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#">Item Three</a> </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum</p>
                    </div>
                    <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                </div>
            </div>
            <div class="col-lg-4 col-6 mt-2">
                <div class="card h-100">
                    <a href="#">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#">Item Four</a> </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum</p>
                    </div>
                    <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                </div>
            </div>
            <div class="col-lg-4 col-6 mt-2">
                <div class="card h-100">
                    <a href="#">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#">Item Five</a> </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum</p>
                    </div>
                    <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                </div>
            </div>
            <div class="col-lg-4 col-6 mt-2">
                <div class="card h-100">
                    <a href="#">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#">Item Six</a> </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum</p>
                    </div>
                    <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
