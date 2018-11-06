<%@ Page Title="SmartWay" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SmartWay.UL.Views.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <!--Featured Carousel -->
        <div id="carouselExampleIndicators" class="carousel slide mb-4" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img class="d-block img-fluid" src="../Images/girlBanner.png" alt="First slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="../Images/reuseBanner.png" alt="First slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="../Images/liveBanner.png" alt="First slide" />
                </div>
            </div>
            <a class="carousel-control-prev"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span></a>
            <a class="carousel-control-next"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="next">
                <span class="carousel-control-next-icon"
                    aria-hidden="true"></span>
                <span class="sr-only">Next</span> </a>
        </div>
        
        <!-------------Popular Goods----------->
        <div class="p-2 mt-2 blue lighten-1 text-white">Popular Goods</div>
        <div class="col-12 testimonial-group">
            <!---------------- Card ------------------>
            <asp:ListView ID="popularGoods" runat="server"
                DataKeyNames="advertisementID"
                ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="getPopularGoods">
                <EmptyDataTemplate>
                    <div class="row">
                        <div class="col-1 my-2"></div>
                        <div class="col-10 my-2">
                            <p class="card-text">
                                <h4 class="text-center">No offers Accepted yet!</h4>
                            </p>
                        </div>
                        <div class="col-1 my-2"></div>
                    </div>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <ItemTemplate>
                    <div class="col-lg-4  col-6 my-2">
                        <div class="card zoom hoverable z-depth-3">
                            <!-- Card image -->
                            <div class="view overlay" style="background-color: #263238">
                                <div class="thumbnail">
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <img class="img-responsive" src="<%#getAdImage(Item.advertisementID)%>" alt="" />
                                    </a>
                                </div>
                            </div>
                            <!-- Card content -->
                            <div class="card-body">
                                <!-- Title -->
                                <h4 class="card-text cut-text"><a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a></h4>
                                <h5 class="card-text"><%#:String.Format("{0:c}", Item.advertisementPrice)%></h5>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row text-center grey lighten-3 flex-nowrap" runat="server">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
        <div class="p-2 mt-2 blue lighten-1 text-white">Popular Services</div>
        <div class="col-12 testimonial-group">
            <asp:ListView ID="popularServies" runat="server"
                DataKeyNames="advertisementID"
                ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="getPopularServices">
                <EmptyDataTemplate>
                    <div class="row">
                        <div class="col-1 my-2"></div>
                        <div class="col-10 my-2">
                            <p class="card-text">
                                <h4 class="text-center">No offers Accepted yet!</h4>
                            </p>
                        </div>
                        <div class="col-1 my-2"></div>
                    </div>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <ItemTemplate>
                    <div class="col-lg-4  col-6 my-2">
                        <div class="card zoom hoverable z-depth-3">
                            <!-- Card image -->
                            <div class="view overlay" style="background-color: #263238">
                                <div class="thumbnail">
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <img class="img-responsive" src="<%#getAdImage(Item.advertisementID)%>" alt="" />
                                    </a>
                                </div>
                            </div>
                            <!-- Card content -->
                            <div class="card-body" style="overflow:hidden;">
                                <!-- Title -->
                                <h4 class="card-text cut-text"><a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a></h4>
                                <h5 class="card-text"><%#:String.Format("{0:c}", Item.advertisementPrice)%></h5>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row text-center grey lighten-3 flex-nowrap" runat="server">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
