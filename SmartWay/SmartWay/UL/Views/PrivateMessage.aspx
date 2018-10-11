<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PrivateMessage.aspx.cs" Inherits="SmartWay.UL.Views.PrivateMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">Messages</div>
            <div class="card">
                <div class="card-body">
                <%-- LABELS for Name and Title --%>
                <%-- NAME --%>
                <table>
                    <tr>
                    <td>
                        <asp:Label 
                        ID="nameLabel"
                        runat="server"
                        Text="THIS WILL BE MESSAGE TO:">
                        </asp:Label>
                    </td>
                    </tr>
            <%-- TITLE --%>
                    <tr>            
                    <td>                      
                        <asp:Label
                        ID="titleLabel"
                        runat="server"
                        Text="THIS WILL BE THE TITLE aka AD's NAME">
                        </asp:Label>
                    </td>
                    </tr>                 
                </table>
            <br />
            <%-- MESSAGE BOX --%>
            <h6>Message:</h6>
                <asp:TextBox 
                CssClass="form-control" 
                runat="server" 
                ID="txtContent" 
                TextMode="MultiLine"                     
                Rows="5" />
            <br />
            <asp:Button runat="server" Text="Send" CssClass="btn btn-block btn-info" />
            </div>
        </div>
    </div>
</asp:Content>
