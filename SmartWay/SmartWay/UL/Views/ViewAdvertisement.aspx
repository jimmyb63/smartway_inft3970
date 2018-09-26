<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      /* Make the image fully responsive */
      .carousel-inner img {
          width: 80%;
          height: 30%;
      }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<% string value = Request.QueryString["advertisementID"]; %>--%>
 <div class="container">
  <div class="row">
    <div class="col-lg-3 mt-2">
      <div class="list-group"> <a href="AddItem.html" mt-2 class="btn btn-success">Post New Ad</a> 
        <!-- Shown on md and down devices (turns list groups into dropdown buttons for mobile) -->
        <div class="dropdown mt-2">
          <button class="btn btn-primary d-lg-none btn-block dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Browse Goods </button>
          <div class="dropdown-menu btn-block" aria-labelledby="dropdownMenuButton"> <a class="dropdown-item" href="#">Category 1</a> <a class="dropdown-item" href="#">Category 2</a> <a class="dropdown-item" href="#">Category 3</a> <a class="dropdown-item" href="#">Category 4</a> <a class="dropdown-item" href="#">Category 5</a> </div>
        </div>
        <div class="dropdown mt-2">
          <button class="btn btn-primary d-lg-none btn-block dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Browse Services </button>
          <div class="dropdown-menu btn-block" aria-labelledby="dropdownMenuButton"> <a class="dropdown-item" href="#">Category 1</a> <a class="dropdown-item" href="#">Category 2</a> <a class="dropdown-item" href="#">Category 3</a> <a class="dropdown-item" href="#">Category 4</a> <a class="dropdown-item" href="#">Category 5</a> </div>
        </div>
        
        <!--Only shown on lg devices (turns dropdown buttons into list group in sidebar-->
        <div class="list-group d-none d-lg-block"> <a href="#" class="list-group-item disabled">
          <h6>Browse Goods</h6>
          </a> <a href="#" class="list-group-item">Category 1</a> <a href="#" class="list-group-item">Category 2</a> <a href="#" class="list-group-item">Category 3</a> <a href="#" class="list-group-item">Category 4</a> <a href="#" class="list-group-item">Category 5</a> </div>
        <br>
        <div class="list-group d-none d-lg-block"> <a href="#" class="list-group-item disabled">
          <h6>Browse Services</h6>
          </a> <a href="#" class="list-group-item">Category 1</a> <a href="#" class="list-group-item">Category 2</a> <a href="#" class="list-group-item">Category 3</a> <a href="#" class="list-group-item">Category 4</a> </div>
      </div>
    </div>
<!--/Sidebar Content -->
	  
<!----------------------------------------------------------------------------------------------------------------> 
 
<!-- Page Content -->
 <div class="col-lg-9 mt-2">
            
     <asp:HiddenField ID="adID" runat="server"/>
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
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
        <ItemTemplate>
      <div class="p-2 mb-2 bg-primary text-white"><%#:Item.advertisementTitle%></div>
      <div class="card">
                        <div id="adImages" class="carousel slide" data-ride="carousel" style="height:auto; background-color: grey">
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
                          <div class="carousel-inner" role="listbox" style="text-align:center">
                            <div class="carousel-item active" style="align-content:center">
                              <a href="<%=adImages[0]%>"><img src="<%=adImages[0]%>" height="800" alt="image"></a>
                            </div>
                            <% for (int i = 1; i < adImages.Count; i++)%>
                              <% { %>
                                <div class="carousel-item" style="align-content:center">
                                    <a href="<%=adImages[i]%>"><img src="<%=adImages[i]%>" alt="image"></a>
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
          <h4><b>Price: </b><%#:String.Format("{0:c}", Item.advertisementPrice)%></h4>
          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.
          <h4>Description</h4>
          <p>Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus! Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus! Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
          <hr>
          <a href="#" class="btn btn-info">Contact Seller</a> <a href="#" class="btn btn-danger float-md-right">Report Listing</a> <br></div>
      </div>
    </div>
        </ItemTemplate>
                        <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
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
  
    </div>
  </div>




</asp:Content>
