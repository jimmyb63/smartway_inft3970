<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisementList.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisementList" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <!-- just few comments for now -->
<%--      <asp:GridView ID="SearchResult" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CellPadding="4" HorizontalAlign="Center"
        ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds" onrowcommand="SearchResult_RowCommand">--%>
    <%-- set the content of each rows of the gridview (the list of data we need for each product) --%>
     <%-- Code for gridview sourced from - https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart --%>
        <%--<Columns>--%>
            <%--<asp:ImageField DataImageUrlField="imagePath" HeaderText="image" ControlStyle-Width="100px" ControlStyle-Height = "100px"/>--%>
            <%--<asp:BoundField DataField="advertisementID" HeaderText="AdID"/>
            <asp:BoundField DataField="advertisementSellerID" HeaderText="SellerID"/>
            <asp:BoundField DataField="advertisementType" HeaderText="Type"/>
            <asp:BoundField DataField="advertisementTitle" HeaderText="Title"/>
            <asp:BoundField DataField="advertisementAddressID" HeaderText="Address"/>
            <asp:BoundField DataField="advertisementDatePosted" HeaderText="Date added"/>
            <asp:BoundField DataField="advertisementCategoryID" HeaderText="Category"/>
            <asp:BoundField DataField="advertisementPrice" HeaderText="Price"/>
            <asp:ButtonField buttontype="Button" Text="View Item" commandname="AdvertisementDetail"/>
        </Columns>
    </asp:GridView>--%>
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
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <img src="<%#:getAdThumbnail(Item.advertisementID, Item.advertisementSellerID)%>"
                                            width="100" height="75" style="border: solid" /></a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <span>
                                            <%#:Item.advertisementTitle%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                    </span>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
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
</asp:Content>
