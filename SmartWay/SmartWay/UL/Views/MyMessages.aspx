<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="SmartWay.UL.Views.MyMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">My Messages</div>
            <div class="card">
                <div class="card-body">
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
                            <div class="col-lg-12">
                                <div class="card mt-2 grey lighten-5">
                                    <div class="row">                                        
                                        <div>
                                            <div class="card-body">
                                                <!-- Title -->
                                                <h5 class="card-title"><a href="ReplyToMessage.aspx?privateMessageID=<%#: Item.pmID%>"><%#:"About: "+ getAdTitle(Item.pmAdID)%></a></h5>
                                                <br />
                                                <ul class="list-unstyled list-inline font-small information-content">
                                                    <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i><%#:"Last Message Sent: "+(Item.pmCreationDate).ToString("dd/MM/yyyy HH:mm")%></li>                                                   
                                                    <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i><%#:"Message From: "+ getUsername(Item.pmSendersUserID)%></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>  
                    </asp:ListView>                                    
                </div>

                <br />
                <hr />
                <br />

                <%-- MESSAGE REPLIED TO --%>
                <h5>Messages Replied To:</h5>
                <div class="row">
                    <asp:ListView 
                        ID="ListView1" 
                        runat="server"
                        DataKeyNames="pmID" 
                        GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.PrivateMsg" 
                        SelectMethod="getRepliedPrivateMsgList">
                        <%-- Empty Data Template --%>
                        <EmptyDataTemplate>
                            <div class="card h-100">
                            <div class="row">
                                <br />
                                <hr />
                                <br />
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
                                                <h5 class="card-title"><a href="ReplyToMessage.aspx?privateMessageID=<%#: Item.pmID%>"><%#:"About: "+ getAdTitle(Item.pmAdID)%></a></h5>
                                                <br />
                                                <ul class="list-unstyled list-inline font-small information-content">
                                                    <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i><%#:"Last Message Sent: "+(Item.pmCreationDate).ToString("dd/MM/yyyy HH:mm")%></li>                                                   
                                                    <li class="list-inline-item pr-2 black-text"><i class="fas fa-hand-holding-usd mr-2"></i><%#:"Message From: "+ getUsername(Item.pmSendersUserID)%></li>
                                                </ul>
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

</asp:Content>
