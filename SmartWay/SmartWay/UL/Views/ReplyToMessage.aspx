<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ReplyToMessage.aspx.cs" Inherits="SmartWay.UL.Views.ReplyToMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">Reply Messages</div>
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
                <%-- MESSAGE NOT REPLIED TO --%>
                <h5>Messages Not Replied To:</h5>
                <div class="row">
                    <asp:GridView 
                        ID="gvNotRepliedMessages" 
                        runat="server" 
                        AutoGenerateColumns="false" 
                        GridLines="Horizontal" 
                        CssClass="table table-bordered" 
                        CellPadding="4" 
                        HorizontalAlign="Center"
                        ItemType="SmartWay.BL.Models.PrivateMsg" 
                        SelectMethod="getNotRepliedPrivateMsgList">
                        <Columns>
                        
                            <asp:BoundField DataField="pmCreationDate" HeaderText="Message Sent" />
                            <asp:BoundField DataField="pmMessageDetails" HeaderText="Message" />
                            <asp:BoundField DataField="pmMessageRead" HeaderText="MessageRead" />
                            <asp:BoundField DataField="pmMessageReplied" HeaderText="MessageReplies" />
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
                <%-- MESSAGE BOX --%>
                <h5>Reply Message:</h5>
                <asp:TextBox 
                CssClass="form-control" 
                runat="server" 
                ID="txtMessage" 
                TextMode="MultiLine"                     
                Rows="5" />
                <br />
                <asp:Button runat="server" Text="Reply" CssClass="btn btn-block btn-info" />
                <br />
                <%-- MESSAGE REPLIED TO --%>
                <h5>Messages That Have Been Replied To:</h5>
                <div class="row">
                    <asp:GridView 
                        ID="gvRepliedMessages" 
                        runat="server" 
                        AutoGenerateColumns="false" 
                        GridLines="Horizontal" 
                        CssClass="table table-bordered" 
                        CellPadding="4" 
                        HorizontalAlign="Center"
                        ItemType="SmartWay.BL.Models.PrivateMsg" 
                        SelectMethod="getRepliedPrivateMsgList">
                        <Columns>
                            <asp:BoundField DataField="pmCreationDate" HeaderText="Message Sent" />
                            <asp:BoundField DataField="pmMessageDetails" HeaderText="Message" />
                            <asp:BoundField DataField="pmMessageRead" HeaderText="MessageRead" />
                            <asp:BoundField DataField="pmMessageReplied" HeaderText="MessageReplies" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
