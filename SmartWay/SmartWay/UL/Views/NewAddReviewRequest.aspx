<%@ Page Title="SmartWay - Add Review Request" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="NewAddReviewRequest.aspx.cs" Inherits="SmartWay.UL.Views.NewAddReviewRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--
    This will capture the Reason for Adds to be reviewed
    
    @todo

    -Onclick Method
    -Method to add to the database
    -Tables in Database
    -Validation that a reason was selected
    -Decision on if we email the person making the report to let them know it was submitted??

-->
    <table>
            <tr>
                <th colspan="3">
                    <h2>Add Review</h2>
                    
                </th>
            </tr>



            
            <tr>
                <td colspan ="3">
                    <br />
                    <p>Thank you for taking the time to bring this to our attention.</p>
                    <br />
                </td>
            </tr>
            <tr>
                
                <td colspan="3"><hr /><br /><p>Please fill out the below form to contact admin</p></td>
            </tr>

            <!-- Last name textbox with validators -->
            <tr>
                <td>
                    Reason For This Review Request:
                    <br />
                    <br />
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlAddReviewReason" runat="server">
                        <asp:ListItem Enabled="true" Text="Please Choose the Best Reason" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Offensive Language" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Racist Messages" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Unappropriate Photos/ Nudity" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Cause the Cat made me" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Geoff said too" Value="4"></asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>
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
                <td>
                    Please explain in more detail:
                </td>
                <td colspan="2">
                    <asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine" Rows="10" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <!-- Submit button to send email to admin -->
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
        <br />
</asp:Content>
