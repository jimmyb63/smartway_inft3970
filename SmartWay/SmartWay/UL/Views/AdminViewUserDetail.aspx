<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminViewUserDetail.aspx.cs" Inherits="SmartWay.UL.Views.AdminViewUserDetail" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% string userID = Request.QueryString["userID"]; %>
    <% Person user = (Person)Session["selectedUser"]; %>
    <div class="col-lg-12 mt-2">
        <div class="p-2 mb-2 bg-info text-white">Details for UserID - <%=userID %></div>
        <div class="card">
            <div class="card-body">
		        <div class="row my-2">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-5">
                        <div class="card-text"><b>ID: </b><%=user.userID %></div>
                        <br />
                        <div class="card-text"><b>Username: </b><%=user.userName %></div>
                        <br />
                        <div class="card-text"><b>First Name: </b><%=user.userfName %></div>
                        <br />
                        <div class="card-text"><b>Last Name: </b><%=user.userlName %></div>
                        <br />
                        <div class="card-text"><b>Email: </b><%=user.userEmail %></div>
                        <br />
                        <div class="card-text"><b>Date of Birth: </b><%=user.userDOB %></div>
                        <br />
                        <div class="card-text"><b>Phone Number: </b></div>
                        <br />
                        <div class="card-text"><b>Address: </b></div>
                        <br />
                        <div class="card-text"><b>Password: </b><%=user.userPassword %></div>
                        <br />
                        <div class="card-text"><b>Verification Date: </b><%=user.userVerDate %></div>
                        <br />
                        <div class="card-text"><b>Registration Date:</b><%=user.userCreateDate %></div>
                        <br />
                        <div class="card-text"><b>Status: </b><%=user.userActive %></div>
                        <br />
                    </div>
                    <div class="col-lg-3">
                        <div class="row">
                            <asp:Button ID="btnEmailUser" Text="Email User" CssClass="btn btn-block btn-primary my-5" runat="server" />
                        </div>
                        <div class="row">
                            <asp:Button ID="btnActivateUser" Text="Activate User" CssClass="btn btn-block btn-success my-5" runat="server" />
                        </div>
                        <div class="row">
                            <asp:Button ID="btnDeactivateUser" Text="Deactivate User" CssClass="btn btn-block btn-danger my-5" runat="server" />
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
		        </div>
            </div>
        </div>
    </div>
</asp:Content>
