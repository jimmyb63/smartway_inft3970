<%@ Page Title="SmartWay - About us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SmartWay.UL.Views.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Page Content--%>
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">About Us</div>
        <div class="card">
            <div class="card-body">
                <%--------Main Page Content Goes Here--------%>
                <div class="jumbotron text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4">
                                <h3>Column 1</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
                                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
                            </div>
                            <div class="col-sm-4">
                                <h3>Column 2</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
                                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
                            </div>
                            <div class="col-sm-4">
                                <h3>Column 3</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
                                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
