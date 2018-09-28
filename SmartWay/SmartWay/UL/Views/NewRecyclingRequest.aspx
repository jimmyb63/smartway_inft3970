<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="NewRecyclingRequest.aspx.cs" Inherits="SmartWay.UL.Views.NewRecyclingRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!------- Page Content -------->
        <div class="col-lg-9 mt-2">
            <div class="p-2 mb-2 bg-primary text-white">Request a New Recycling to be Added</div>
            <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">
                <h5>New Recycling Request Title</h5>
                <asp:TextBox CssClass="form-control" ID="txtTitle" placeholder="Eg. Alluminium For Cash" runat="server" />
                <hr />
                <h5>Type of Recycling Location</h5>
                <asp:RadioButtonList CssClass="form-group" ID="rbAdType" runat="server">
                    <asp:ListItem Text=" Metal Recycling" Value="recycle"/>
                    <asp:ListItem Text=" Plastic Recycling" Value="reuse"/>
                    <asp:ListItem Text=" E-waste Recycling" Value="repurpose"/>
                    <asp:ListItem Text=" Chemical Waste Disposal" Value="repurpose"/>
                    <asp:ListItem Text=" Oil Drop Off Location" Value="repurpose"/>
                    <asp:ListItem Text=" Battery Drop Off Location" Value="repurpose"/>
                </asp:RadioButtonList>
                <hr />
                <h5>Select Tags that Best Apply</h5>
                <asp:ListBox ID="lbRecycleTags" runat="server" SelectionMode="multiple">
                    <asp:ListItem Text="Metal Recycling" Value="red"></asp:ListItem>
                    <asp:ListItem Text="Plastic Recycling" Value="blue"></asp:ListItem>
                    <asp:ListItem Text="Glass Recycling" Value="blue"></asp:ListItem>
                    <asp:ListItem Text="E-waste Recycling" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Chemical Waste Disposal" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Oil Drop Off Location" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Battery Drop Off Location" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Cash for Metal Location" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Cash for Plastic Location" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Cash for Glass Location" Value="green"></asp:ListItem>
                </asp:ListBox>
                
                <hr />
                <div class="form-group">
                <h5>Recycling Location Description</h5><asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="txtDescription" rows="8" runat="server"/>
                </div>
                <hr />
                <h5>Upload photos</h5><div class="row">
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload1" runat="server"/>
                        <label class="custom-file-label" for="FileUpload1">Choose file</label> </div></div></div><div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload2" runat="server"/>
                        <label class="custom-file-label" for="FileUpload2">Choose file</label> </div></div></div></div><br />
                <hr />

                <h5>Select Open Hours if they Apply</h5>
                <asp:Table runat="server" CellPadding="5" GridLines="horizontal" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>Open Always:</asp:TableCell>
                        <asp:TableCell ColumnSpan="2">
                            <asp:CheckBox ID="chkbOpenAlways" runat="server" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Monday:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtTimeMonOpen" CssClass="form-control" TextMode="Time" runat="server"/>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeMonClose" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>Tuesday:</asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeTuesOpen" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeTuesClose" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>Wednesday:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtTimeWedOpen" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeWedClose" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>Thursday:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtTimeThursOpen" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeThursClose" CssClass="form-control" TextMode="Time" format="hh:mm" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>Friday:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtTimeFriOpen" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeFriClose" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>Saturday:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtTimeSatOpen" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeSatClose" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>Sunday:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtTimeSunOpen" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtTimeSunClose" CssClass="form-control" TextMode="Time" runat="server" />
                        </asp:TableCell></asp:TableRow>
                    </asp:Table>
                <hr />
                <asp:Button CssClass="btn btn-block btn-success" Text="Submit" runat="server" OnClick="postAd" />
                <hr />
            </div>
        </div>
            
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>

    </div>

</asp:Content>
