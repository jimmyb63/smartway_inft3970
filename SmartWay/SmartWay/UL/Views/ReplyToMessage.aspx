<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ReplyToMessage.aspx.cs" Inherits="SmartWay.UL.Views.ReplyToMessage" %>
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
                <table style="width:100%">
                    <%-- FIRST ROW --%>
                    <tr>    
                        <%-- FROM: --%>                    
                        <td style="width:50%">
                            <asp:Label 
                            ID="lblSender"
                            runat="server"
                            Text="From:">
                            </asp:Label>
                        </td>
                        <%-- Ad Details: --%>
                        <td style="width:50%">                      
                        <asp:Label
                        ID="lblAdDetails"
                        runat="server"
                        Text="Ad Details: ">
                        </asp:Label>
                        </td>
                    </tr>
                    <%-- SECOND ROW --%>
                    <tr>
                        <%-- SENT: --%>
                        <td style="width:50%">
                            <asp:Label
                                ID="lblSentDate"
                                runat="server"
                                Text="Original Sent: ">
                            </asp:Label>
                        </td>
                        <%-- TITLE --%>
                        <td style="width:50%">
                            <asp:Label
                                ID="lblAdTitle"
                                runat="server"
                                Text="Title: ">
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
                ID="txtMessage" 
                TextMode="MultiLine"                     
                Rows="5" />
            <br />
            <asp:Button runat="server" Text="Send" CssClass="btn btn-block btn-info" />
            </div>
        </div>
    </div>
</asp:Content>
