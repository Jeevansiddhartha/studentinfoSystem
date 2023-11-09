<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Student_InformationSystem.Login" %>

<asp:Content ID="cntLogin" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <br />
        <br />
        <br />
         <br />
        <br />
        <br />
        <table style="align-content:center;height:100px;">
         <tbody style="height:90%;">
             <tr>
                 <td colspan="2">
                     <asp:Label ID="lblMsg" style="color:red;" runat="server"></asp:Label>

                 </td>
                 
             </tr>
              <tr>
                 <td></td>
                 <td></td>
             </tr>
              <tr>
                 <td></td>
                 <td></td>
             </tr>
            <tr>
                <td colspan="2" style="color: darkblue;">
                    <asp:Label ID="lblLogin" runat="server" Text="LogIn"></asp:Label>
                </td>
            </tr>
             <tr>
                 <td>

                 </td>
                 <td>

                 </td>
             </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Text="UserName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName"  ValidationGroup="LoginForm" runat="server">

                    </asp:TextBox><asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="LoginForm" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter UserName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPwd" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPwd" TextMode="Password" ValidationGroup="LoginForm" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtPwd" ID="RequiredFieldValidator2" ValidationGroup="LoginForm" runat="server" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                 <td>

                 </td>
                 <td>

                 </td>
             </tr>
            <tr>
                <td colspan="2" style="text-align:right">
                    <asp:Button ID="btnLogin" runat="server" Text="LogIn" ValidationGroup="LoginForm" OnClick="btnLogin_Click" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <%--<asp:Label ID="lblRegister" runat="server" Text="New User?Register"></asp:Label>--%>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/RegistrationForm.aspx" runat="server">New User?Register</asp:HyperLink>
                </td>
            </tr>
          </tbody>
        </table>
    </div>
  
</asp:Content>