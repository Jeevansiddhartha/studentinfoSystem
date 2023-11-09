<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Student_InformationSystem.RegistrationForm" %>

<asp:Content ID="cntRegistrationForm" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td colspan="2">
                <br />
                <br />
                 <br />
                <br />
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Text="SignUp!"></asp:Label>
            </td>
            <td>
                * Mandatory Fields
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
                <asp:Label ID="lblUserName" runat="server" Text="UserName"></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="RegistrationForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqfUserName" ControlToValidate="txtUserName" ValidationGroup="RegistrationForm" ForeColor="Red" runat="server" ErrorMessage="*">
                  </asp:RequiredFieldValidator>
              </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPwd" runat="server" Text="Password"></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtPwd" TextMode="Password" ValidationGroup="RegistrationForm" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqfPwd" ValidationGroup="RegistrationForm" ControlToValidate="txtPwd" ForeColor="Red" runat="server" ErrorMessage="*">
                  </asp:RequiredFieldValidator>
              </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="RegistrationForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqfEmail" ControlToValidate="txtEmail" ValidationGroup="RegistrationForm" ForeColor="Red" runat="server" ErrorMessage="*">
                  </asp:RequiredFieldValidator>
              </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtGender" runat="server" ValidationGroup="RegistrationForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqfGender" ControlToValidate="txtGender" ValidationGroup="RegistrationForm" ForeColor="Red" runat="server" ErrorMessage="*">

                  </asp:RequiredFieldValidator>
              </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtAddress" ValidationGroup="RegistrationForm" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqfAddress" ControlToValidate="txtAddress" ValidationGroup="RegistrationForm" ForeColor="Red" runat="server" ErrorMessage="*">

                  </asp:RequiredFieldValidator>
              </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblDOB" runat="server" Text="DOB"></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtDateOfBirth" runat="server" ValidationGroup="RegistrationForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqf" ControlToValidate="txtDateOfBirth" ValidationGroup="RegistrationForm" ForeColor="Red" runat="server" ErrorMessage="*">

                  </asp:RequiredFieldValidator>
              </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRegister" runat="server" ValidationGroup="RegistrationForm" Text="Register" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
</asp:Content>