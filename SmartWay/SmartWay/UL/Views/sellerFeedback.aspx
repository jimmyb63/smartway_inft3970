<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="sellerFeedback.aspx.cs" Inherits="SmartWay.UL.Views.sellerFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-danger text-white">Report Advertisement</div>
        <div class="card">
            <div class="row">
                <% int sellerID = Convert.ToInt32(Request.QueryString["sellerID"]); %>
                <% int advertisementID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
                <div class="card-header">
                    <p>Rate this Seller - <%=getUsername(sellerID) %></p>
                </div>
            </div>
            <!------- Main Page Content Goes Here-------->
            <div class="row">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-md-0"></div>
                        <div class="col-lg-6 col-md-12">
                            <p>Rate this seller out of 5 and leave a comment</p>
                        </div>
                        <div class="col-lg-3 col-md-0"></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-md-0"></div>
                        <div class="col-lg-8 col-md-12">
                            <asp:RadioButtonList CssClass="form-group" RepeatDirection="Horizontal" ID="rbRating" runat="server">
                                <asp:ListItem class="radio-inline" Text="1" Value="1" />
                                <asp:ListItem class="radio-inline" Text="2" Value="2" />
                                <asp:ListItem class="radio-inline" Text="3" Value="3" />
                                <asp:ListItem class="radio-inline" Text="4" Value="4" />
                                <asp:ListItem class="radio-inline" Text="5" Value="5" />
                            </asp:RadioButtonList>
                        </div>
                        <div class="col-lg-2 col-md-0"></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:TextBox ID="txtFeedbackComment" PlaceHolder="Please leave a comment here..." TextMode="MultiLine" Height="10" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button ID="button" Text="Submit" OnClick="submitFeedback" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
