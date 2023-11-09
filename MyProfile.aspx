<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Student_InformationSystem._MyProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   Welcome to Student Information System.
    <br />
    <br />
    <br />
    <br />
    <br />
    <table>
        <tr>
            <td>
                UserName
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Gender
            </td>
            <td>
                <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                DOB
            </td>
            <td>
                <asp:TextBox ID="txtDateOfBirth" runat="server"></asp:TextBox>
            </td>
        </tr>
       
         <tr>
            <td colspan="2">
                <br />
                <br />
            </td>
           
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            </td>
            <td>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
        </tr>
    </table>

</asp:Content>
