<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<% string value = Request.QueryString["advertisementID"]; %>--%>
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
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
                                    <% List<string> adImages = getAdImages(adID); %>
                                    <% for (int i = 0; i < adImages.Count; i++)%>
                                    <% { %>
                                    <img src="<%=adImages[i]%>" style="border: solid" /></a>
                                    <% } %>
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
</asp:Content>
