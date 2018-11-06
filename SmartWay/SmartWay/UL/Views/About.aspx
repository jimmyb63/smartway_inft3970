<%@ Page Title="SmartWay - About us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SmartWay.UL.Views.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Page Content--%>
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white"></div>
        <div class="card">
            <%--------Main Page Content Goes Here--------%>
                <div class="container">
                    <br />
                    <div class="col-12 text-center">
                    <a class="MeetTheTeam">Meet our Developers</a>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-4 col-6 text-center mb-4">
                            <img class="aboutUsPhoto m-2 animated fadeIn" src="../Images/DefaultImg/James.png" />
                            <h5 class="my-2">James Bailey</h5>
                        </div>
                        <div class="col-lg-4 col-6 text-center">
                            <img class="aboutUsPhoto m-2 animated fadeIn" src="../Images/DefaultImg/Ashley.png" />
                            <h5 class="my-2">Ashley Ballinger</h5>
                        </div>
                        <div class="col-lg-4 col-6 text-center">
                            <img class="aboutUsPhoto m-2 animated fadeIn" src="../Images/DefaultImg/Zac.png" />
                            <h5 class="my-2">Zac Skoumbourdis</h5>
                        </div>
                        <div class="col-lg-4 col-6 text-center">
                            <img class="aboutUsPhoto m-2 animated fadeIn" src="../Images/DefaultImg/Brock.png" />
                            <h5 class="my-2">Brock Buttsworth</h5>
                        </div>
                        <div class="col-lg-4 col-6 text-center">
                            <img class="aboutUsPhoto m-2 animated fadeIn" src="../Images/DefaultImg/Graham.png" />
                            <h5 class="my-2">Graham Johnstone</h5>
                        </div>
                        <div class="col-lg-4 col-6 text-center">
                            <img class="aboutUsPhoto m-2 animated fadeIn" src="../Images/DefaultImg/Gabby.png" />
                            <h5 class="my-2">Gabriele Urbonaite</h5>
                        </div>
                        <br />
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
