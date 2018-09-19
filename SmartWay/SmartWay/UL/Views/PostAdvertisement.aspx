<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.PostAdvertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
            <tr>
                <th colspan="3">
                    <h2>Post an Advertisment</h2>
                </th>
            </tr>
            <tr>
                <td>
                    *Title:
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" placeholder="Title" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator
                         ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtTitle" 
                        runat="server" />
                   
                </td>
            </tr>
            <tr>
                <td>
                    Type of Ad:
                </td>
                <td>
                    <asp:RadioButtonList ID="rbAdType" runat="server">
                        <asp:ListItem Text="Offer" Value="offer"/>
                        <asp:ListItem Text="Request" Value="request"/>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    *Category:
                </td>
                <td>
                    <asp:RadioButtonList ID="rbAdCategory" OnSelectedIndexChanged="rbAdCategory_SelectedIndexChanged" AutoPostBack="true" runat="server">
                        <asp:ListItem Text="Goods" Value="goods"/>
                        <asp:ListItem Text="Services" Value="services"/>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    *Sub-Category:
                </td>
                <td>
                    <asp:DropDownList ID="ddSubCategory" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="ddSubCategory"
                        runat="server" />                       
                </td>
            </tr>
            <tr>
                <td>
                    *Price:  $
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtPrice" 
                        TextMode="Number"
                        placeholder="0"
                        step="0.01"
                        min="0" 
                        runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtPrice"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    *Description:
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDescription" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    *Images:
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server"/>
                    <asp:FileUpload ID="FileUpload2" runat="server"/>
                    <asp:FileUpload ID="FileUpload3" runat="server"/>
                    <asp:FileUpload ID="FileUpload4" runat="server"/>
                    <asp:FileUpload ID="FileUpload5" runat="server"/>
                    <asp:FileUpload ID="FileUpload6" runat="server"/>
                </td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="3"><hr /></td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>
                <!-- Submit button runs RegisterUser method when clicked -->
                <td>
                    <asp:Button Text="Submit" runat="server" OnClick="postAd" />
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
        <br />
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
</asp:Content>
