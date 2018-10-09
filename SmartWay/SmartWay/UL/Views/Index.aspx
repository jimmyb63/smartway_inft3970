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
                    <img class="d-block img-fluid" src="https://www.vallartatribune.com/wp-content/uploads/2018/07/July-23-Mexico-decor-style-image-1.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="http://cmbcreative.co/wp-content/uploads/2018/07/bohemian-chic-furniture-style-home-hippie-living-room-signs-store-best-interior-boho.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="https://www.wedb.com/wp-content/uploads/2017/08/blog-basement-004.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span> </a><a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
        </div>

        <!--Popular -->
        <div class="p-2 mt-2 blue lighten-1 text-white">Popular</div>
        <div class="row">
            <div class="col-lg-4  col-12 my-2">
                <!-- Card -->
                <div class="card">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/food.jpg" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body">
                        <!-- Title -->
                        <h4 class="card-title">Card title</h4>
                        <h5 class="card-title">Price</h5>
                    </div>
                    <!-- Card footer -->
                    <div class="rounded-bottom blue lighten-4 text-center pt-3">
                        <ul class="list-unstyled list-inline font-small">
                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                        </ul>
                    </div>
                </div>
                <!--/ Card -->
            </div>
            <div class="col-lg-4  col-12 my-2">
                <!-- Card -->
                <div class="card">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/food.jpg" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body">
                        <!-- Title -->
                        <h4 class="card-title">Card title</h4>
                        <h5 class="card-title">Price</h5>
                    </div>
                    <!-- Card footer -->
                    <div class="rounded-bottom blue lighten-4 text-center pt-3">
                        <ul class="list-unstyled list-inline font-small">
                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                        </ul>
                    </div>
                </div>
                <!--/ Card -->
            </div>
            <div class="col-lg-4  col-12 my-2">
                <!-- Card -->
                <div class="card">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/food.jpg" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body">
                        <!-- Title -->
                        <h4 class="card-title">Card title</h4>
                        <h5 class="card-title">Price</h5>
                    </div>
                    <!-- Card footer -->
                    <div class="rounded-bottom blue lighten-4 text-center pt-3">
                        <ul class="list-unstyled list-inline font-small">
                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                        </ul>
                    </div>
                </div>
                <!--/ Card -->
            </div>
            <div class="col-lg-4  col-12 my-2">
                <!-- Card -->
                <div class="card">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/food.jpg" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body">
                        <!-- Title -->
                        <h4 class="card-title">Card title</h4>
                        <h5 class="card-title">Price</h5>
                    </div>
                    <!-- Card footer -->
                    <div class="rounded-bottom blue lighten-4 text-center pt-3">
                        <ul class="list-unstyled list-inline font-small">
                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                        </ul>
                    </div>
                </div>
                <!--/ Card -->
            </div>
            <div class="col-lg-4  col-12 my-2">
                <!-- Card -->
                <div class="card">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/food.jpg" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body">
                        <!-- Title -->
                        <h4 class="card-title">Card title</h4>
                        <h5 class="card-title">Price</h5>
                    </div>
                    <!-- Card footer -->
                    <div class="rounded-bottom blue lighten-4 text-center pt-3">
                        <ul class="list-unstyled list-inline font-small">
                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                        </ul>
                    </div>
                </div>
                <!--/ Card -->
            </div>
            <div class="col-lg-4  col-12 my-2">
                <!-- Card -->
                <div class="card">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/food.jpg" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body">
                        <!-- Title -->
                        <h4 class="card-title">Card title</h4>
                        <h5 class="card-title">Price</h5>
                    </div>
                    <!-- Card footer -->
                    <div class="rounded-bottom blue lighten-4 text-center pt-3">
                        <ul class="list-unstyled list-inline font-small">
                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i>05/10/2015</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-eye mr-2"></i>12</li>
                            <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i>2</li>
                        </ul>
                    </div>
                </div>
                <!--/ Card -->
            </div>
        </div>
        </div>
    </div>
</asp:Content>
