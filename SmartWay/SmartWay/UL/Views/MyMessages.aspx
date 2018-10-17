<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="SmartWay.UL.Views.MyMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">My Messages</div>
            <div class="card">
                <div class="card-body">
                <%-- LABELS for Name and Title --%>
                <%-- NAME --%>
                <br />
                <h6>Received Messages</h6>
                    <!--<table style="width:100%">
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
                </table> -->
                <br />
                <div class="row">
                <%-- MESSAGE NOT REPLIED TO --%>
                <h5>Messages Not Replied To:</h5>  
                    <%-- LIST VIEW BEGINS --%>
                    <asp:ListView 
                        ID="lvNotRepliedMessages" 
                        runat="server"
                        DataKeyNames="pmID" 
                        GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.PrivateMsg" 
                        SelectMethod="getPrivateMsgList">
                        <%-- Empty Data Template --%>
                        <EmptyDataTemplate>
                            <div class="card h-100">
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text">
                                        <%-- TODO: Check when no messages are present if this place is default --%>
                                        <h1 class="text-center"><i class="fas fa-exclamation-triangle"></i> Empty!</h1>
                                        <h4 class="text-center">No messages to reply to.</h4>
                                    </p>
                                </div>
                                <div class="col-1 my-2"></div>
                            </div>                            
                        </div>
                        </EmptyDataTemplate>   
                        <%-- Empty Item Template --%>
                         <EmptyItemTemplate>
                        <td />
                        </EmptyItemTemplate> 
                        <%-- Group Template --%>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>  
                        <%-- Item Template --%>
                        <ItemTemplate>
                            <div class="col-lg-12">
                                <div class="card mt-2 grey lighten-5">
                                    <div class="row">                                        
                                        <div>
                                            <div class="card-body">
                                                <!-- Title -->
<%--                                                <h5 class="card-title"><a href="PrivateMessage.aspx?privateMessageID=<%#: // Item.advertisementID%>"><%#:"About: AD TITLE"%></a></h5>--%>
                                                <ul class="list-unstyled list-inline font-small information-content">
                                                    <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i><%#:"Last Message Sent: "+(Item.pmCreationDate).ToString("dd/MM/yyyy")%></li>                                                   
                                                    <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i><%#:"Message From: "+ (Item.pmSendersUserID)%></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>  
                    </asp:ListView>                                    
                </div>
                <%-- MESSAGE NOT REPLIED TO --%>
                <h5>NOT REPLIED</h5>
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

                <%-- MESSAGE REPLIED TO --%>
                <h5>REPLIED</h5>
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
