<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ReplyToMessage.aspx.cs" Inherits="SmartWay.UL.Views.ReplyToMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <asp:HiddenField ID="hfAdID" runat="server" />
        <asp:HiddenField ID="hfUserID" runat="server" />
        <asp:HiddenField ID="hfUserSenderID" runat="server"/>
        <div class="p-2 mb-2 bg-primary text-white">Reply Messages</div>
            <div class="card">
                <div class="card-body">
                <%-- LABELS for Name and Title --%>
                <%-- NAME --%>
                <table style="width:100%">
                    <%-- FIRST ROW --%>
                    <tr>    
                        <%-- Ad Details: --%>
                        <td style="width:100%">                      
                        <asp:Label
                        ID="lblAdDetails"
                        runat="server"
                        Text="<h4>Ad Details: </h4>">
                        </asp:Label>
                        </td>
                    </tr>
                    <%-- SECOND ROW --%>
                    <tr>
                        <%-- TITLE --%>
                        <td style="width:100%">
                            <asp:Label
                                ID="lblAdTitle"
                                runat="server"
                                Text="<h5>Title: </h5>">
                            </asp:Label>
                        </td>
                    </tr>                   
                </table>
                <br />
                <%-- MESSAGE NOT REPLIED TO --%>
                <h4>New Messages:</h4>
                <div class="row">
                    <asp:ListView 
                        ID="lvNotRepliedMessages" 
                        runat="server"
                        DataKeyNames="pmID" 
                        GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.PrivateMsg" 
                        SelectMethod="getNotRepliedPrivateMsgList">
                        <%-- Empty Data Template --%>
                        <EmptyDataTemplate>
                            <div class="card h-100">
                            <div class="row">
                                
                                <div class="col-1 my-2"></div>
                                <br />
                                <hr />
                                <br />
                                <div class="col-10 my-2">
                                    <br />

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
                            <div class="col-lg-12" >
                                <div class="card mt-12 grey lighten-5">
                                    <asp:Label ID="lblsenderID" runat="server" Visible="false" Text='<%# Item.pmSendersUserID %>' />
                                        <div class="row" style= '<%#: setMessageStyle(Item.pmSendersUserID) %>' >   
                                        <div style='width : 100%'>
                                            <div class="card-body">
                                                <div >
                                                    <!-- Title -->
                                                    <h5 class="card-title">
                                                        <asp:Label ID="lblReplyHeader" runat="server" Text="<%#: messageFromStyle(Item.pmSendersUserID) %>"></asp:Label>
                                                        <%#:"On : "+ (Item.pmCreationDate).ToString("dd/MM/yyyy HH:mm")%></h5>
                                                    <h5><B><%#: (Item.pmMessageDetails)%></B></h5>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>  
                    </asp:ListView>   
                </div>
                <br />
                <%-- MESSAGE BOX --%>
                <h4>Reply Message:</h4>
                <asp:TextBox 
                CssClass="form-control" 
                runat="server" 
                ID="txtMessage" 
                TextMode="MultiLine"                     
                Rows="5" />
                <br />
                <asp:Button ID="btnReply" runat="server" Text="Reply" CssClass="btn btn-block btn-info" OnClick="btnReply_Click" />
                <br />
                <%-- MESSAGE REPLIED TO --%>
                <h4>Messages History:</h4>
                <div class="row">
                    <asp:ListView 
                        ID="lvRepliedMessages" 
                        runat="server"
                        DataKeyNames="pmID" 
                        GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.PrivateMsg" 
                        SelectMethod="getRepliedPrivateMsgList">
                        <%-- Empty Data Template --%>
                        <EmptyDataTemplate>
                            <div class="card h-100">
                            <div class="row">
                                
                                <div class="col-1 my-2"></div>
                                <br />
                                <hr />
                                <br />
                                <div class="col-10 my-2">
                                    <br />

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
                            <div class="col-lg-12" >
                                <div class="card mt-12 grey lighten-5">
                                    <asp:Label ID="lblsenderID" runat="server" Visible="false" Text='<%# Item.pmSendersUserID %>' />
                                        <div class="row" style= '<%#: setMessageStyle(Item.pmSendersUserID) %>' >   
                                        <div style='width : 100%'>
                                            <div class="card-body" >
                                                <div>
                                                    <!-- Title -->
                                                    <h5 class="card-title">
                                                        <asp:Label ID="lblReplyHeader" runat="server" Text="<%#: messageFromStyle(Item.pmSendersUserID) %>"></asp:Label>
                                                        <%#:"On : "+ (Item.pmCreationDate).ToString("dd/MM/yyyy HH:mm")%></h5>
                                                    <h5><B><%#: (Item.pmMessageDetails)%></B></h5>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>  
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
