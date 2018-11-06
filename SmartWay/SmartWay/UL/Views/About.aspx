<%@ Page Title="SmartWay - About us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SmartWay.UL.Views.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Page Content--%>
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Meet the SmartWay Team</div>
        <div class="card">
            <%--------Main Page Content Goes Here--------%>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <img class="aboutUsPhoto m-2 animated rollIn" src="../Images/DefaultImg/James.png" />
                            <h5>James Bailey</h5>
                            <p>Position</p>
                        </div>
                        <div class="col-sm-4 text-center">
                            <img class="aboutUsPhoto m-2 animated rollIn" src="../Images/DefaultImg/Ashley.png" />
                            <h5>Ashley Ballinger</h5>
                            <p>Position</p>
                        </div>
                        <div class="col-sm-4 text-center">
                            <img class="aboutUsPhoto m-2 animated rollIn" src="../Images/DefaultImg/Zac.png" />
                            <h5>Zac Skoumbourdis</h5>
                            <p>Position</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <img class="aboutUsPhoto m-2 animated rollIn" src="../Images/DefaultImg/Brock.png" />
                            <h5>Brock Buttsworth</h5>
                            <p>Position</p>
                        </div>
                        <div class="col-sm-4 text-center">
                            <img class="aboutUsPhoto m-2 animated rollIn" src="../Images/DefaultImg/Graham.png" />
                            <h5>Graham Johnstone</h5>
                            <p>Position</p>
                        </div>
                        <div class="col-sm-4 text-center">
                            <img class="aboutUsPhoto m-2 animated rollIn" src="../Images/DefaultImg/Gabby.png" />
                            <h5>Gabriele Urbonaite</h5>
                            <p>Position</p>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
