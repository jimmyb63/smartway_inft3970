<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="NewForumTag.aspx.cs" Inherits="SmartWay.UL.Views.NewForumTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">Add New Forum Tag</div>
            <div class="card">
                <div class="card-body">
                <%-- LABELS for Name and Title --%>
                <%-- NAME --%>
                    <div class="row">
                        <%-- FIRST ROW --%>
                            <%-- Label: --%>
                            <div class="col-lg-4 col-12 d-flex align-items-center">
                                <h6>Enter A New Forum Tag: </h6>
                            </div>
                            <%-- TxtBox --%>
                            <div class="col-lg-4 col-12 d-flex align-items-center">
                                <asp:textbox ID="txbNewTag" CssClass="form-control mb-2" runat="server"></asp:textbox>
                            </div>     
                      <div class="col-lg-4 col-12 d-flex mt-0">
                        <asp:Button ID="btnNewTagSubmit" runat="server" Text="Add New Forum Tag" CssClass="btn btn-block btn-info" OnClick="btnNewTagSubmit_Click" />
                    </div>
                    </div>
                    <div class="row">
                     <%-- ValidationMsg --%>
                            <div class="col-12 d-flex align-items-center">
                                <asp:Label
                                    ID="lblNewTagVal"
                                    runat="server"
                                    Text="" ForeColor="Red">
                                </asp:Label>
                            </div>       
                    </div>
                    <br />
                     <%-- CURRENT LIST --%>
                    <h6>These are some Tags that already exist:</h6>
                    <div class="row">
                        <div class="col-12">
                        <table style="width:100%">
                        <%-- FIRST ROW --%>
                        <tr>
                            <%-- Column1 List: --%>
                            <td style="width:33%; vertical-align:top">
                                <asp:GridView 
                                    ID="gvTagsColumn1" 
                                    runat="server" 
                                    AutoGenerateColumns="false" 
                                    GridLines="Horizontal" 
                                    CssClass="table table-bordered" 
                                    CellPadding="4" 
                        
                                    HorizontalAlign="Center"
                                    ItemType="SmartWay.BL.Models.ForumTag" 
                                    SelectMethod="getForumTagsColumn1">
                                    <Columns>
                                        <asp:BoundField DataField="forumTagName" HeaderText="Current Forum Tags" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <%-- Column2 List: --%>
                            <td style="width:33%; vertical-align:top">
                                <asp:GridView 
                                    ID="gvTagsColumn2" 
                                    runat="server" 
                                    AutoGenerateColumns="false" 
                                    GridLines="Horizontal" 
                                    CssClass="table table-bordered" 
                                    CellPadding="4" 
                        
                                    HorizontalAlign="Center"
                                    ItemType="SmartWay.BL.Models.ForumTag" 
                                    SelectMethod="getForumTagsColumn2">
                                    <Columns>
                                        <asp:BoundField DataField="forumTagName" HeaderText="Current Forum Tags" />
                                    </Columns>
                                </asp:GridView>
                            </td>

                            <%-- Column3 List: --%>
                            <td style="width:34%; vertical-align:top">
                                <asp:GridView 
                                    ID="gvTagsColumn3" 
                                    runat="server" 
                                    AutoGenerateColumns="false" 
                                    GridLines="Horizontal" 
                                    CssClass="table table-bordered" 
                                    CellPadding="4" 
                        
                                    HorizontalAlign="Center"
                                    ItemType="SmartWay.BL.Models.ForumTag" 
                                    SelectMethod="getForumTagsColumn3">
                                    <Columns>
                                        <asp:BoundField DataField="forumTagName" HeaderText="Current Forum Tags" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>                   
                    </table>
                    </div>
                </div>

                <br />
                
                <div>
                    <asp:Button ID="btnReturnToForumPost" runat="server" Text="Return to New Forum Post" CssClass="btn btn-block btn-info" OnClick="btnReturnToForumPost_Click"/>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
