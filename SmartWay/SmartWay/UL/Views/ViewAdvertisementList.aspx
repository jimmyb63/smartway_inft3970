<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisementList.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisementList" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
        <div class="col-lg-3 mt-2">
            <div class="list-group mt-2"> <a href="PostAdvertisement.aspx" class="btn btn-success">Post New Ad</a> 
            <!-- Shown on md and down devices (turns list groups into dropdown buttons for mobile) -->
            <div class="dropdown mt-2">
                <button class="btn btn-primary d-lg-none btn-block dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Browse Goods </button>
                <div class="dropdown-menu btn-block" aria-labelledby="dropdownMenuButton"> 
                    <a class="dropdown-item" href="#">Category 1</a> 
                    <a class="dropdown-item" href="#">Category 2</a> 
                    <a class="dropdown-item" href="#">Category 3</a> 
                    <a class="dropdown-item" href="#">Category 4</a> 
                    <a class="dropdown-item" href="#">Category 5</a> 
                </div>
            </div>
            <div class="dropdown mt-2">
                <button class="btn btn-primary d-lg-none btn-block dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Browse Services </button>
                <div class="dropdown-menu btn-block" aria-labelledby="dropdownMenuButton"> 
                    <a class="dropdown-item" href="#">Category 1</a> 
                    <a class="dropdown-item" href="#">Category 2</a> 
                    <a class="dropdown-item" href="#">Category 3</a> 
                    <a class="dropdown-item" href="#">Category 4</a> 
                    <a class="dropdown-item" href="#">Category 5</a> 
                </div>
            </div>
        
            <!--Only shown on lg devices (turns dropdown buttons into list group in sidebar-->
            <div class="list-group d-none d-lg-block"> 
                <a href="#" class="list-group-item disabled"><h6>Browse Goods</h6></a> 
                <a href="#" class="list-group-item">Category 1</a> 
                <a href="#" class="list-group-item">Category 2</a> 
                <a href="#" class="list-group-item">Category 3</a> 
                <a href="#" class="list-group-item">Category 4</a> 
                <a href="#" class="list-group-item">Category 5</a>
            </div>
            <br/>
            <div class="list-group d-none d-lg-block"> 
                <a href="#" class="list-group-item disabled"><h6>Browse Services</h6></a> 
                <a href="#" class="list-group-item">Category 1</a> 
                <a href="#" class="list-group-item">Category 2</a> 
                <a href="#" class="list-group-item">Category 3</a> 
                <a href="#" class="list-group-item">Category 4</a> 
            </div>
            </div>
        </div>
        <div class="col-lg-9 mt-2">
          <div class="p-2 mb-2 bg-primary text-white">Search results for Lawn Mower in Newcastle</div>
	      <div class="p-2 mb-2 bg-info text-white">Refine Search</div>
          <div class="row">
            <asp:ListView ID="adList" runat="server" 
                DataKeyNames="advertisementID" GroupItemCount="4"
                ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds">
                <EmptyDataTemplate>
                    <table >
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
                    <div class="col-12 my-2" runat="server">
                      <div class="card h-100">
                          <div class="row">
                            <div class="col-6">
                          <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                              <img src="<%#:getAdThumbnail(Item.advertisementID, Item.advertisementSellerID)%>"
                                            style="border: solid; width: 100%" />
                          </a>
                          </div>
                            <div class="col-6">
                            <div class="card-body">
                                <div class="row">
                                <div class="col-lg-6 col-md-12">
                                  <h4 class="card-title"> 
                                      <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <span>
                                            <%#:Item.advertisementTitle%>
                                        </span>
                                      </a> 
                                  </h4>
                                  <h5>
                                    <span>
                                        <%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                    </span>
                                  </h5>
                                </div>
                                <div class="col-6 d-none d-lg-block">
                                    <p class="card-text">Lorem ipsum</p>
                                </div>
                               </div>
                            </div>
                          </div>
                          </div> 
                        <div class="card-footer"> <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
                      </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <table >
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
</div>
</asp:Content>
