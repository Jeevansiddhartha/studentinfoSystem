<%@ Page Title="StudentsDetails" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentsDetails.aspx.cs" Inherits="Student_InformationSystem.StudentsDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <table  style="width:100%;">
        <tr>
            <td>
                <br />
                <br />
                 <br />
                <br />
                 <br />
                <br />
            </td>
        </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdStudentsDetails" runat="server" AutoGenerateColumns="False"   
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"   
                        CellPadding="4" DataKeyNames="Id"  
                        OnRowCancelingEdit="grdStudentsDetails_RowCancelingEditing"
                        OnRowEditing="grdStudentsDetails_RowEditing"              
                        OnRowDeleting="grdStudentsDetails_RowDeleting"  
                        OnRowUpdating="grdStudentsDetails_RowUpdating">
                        <Columns>  
                        <asp:TemplateField HeaderText="Name">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="ConactNumber">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtContactNumber" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblContactNumber" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Class">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtClass" runat="server" Text='<%# Bind("Class") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblClass" runat="server" Text='<%# Bind("Class") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                              <asp:TemplateField HeaderText="Grade">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                              <asp:TemplateField HeaderText="Attendance">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtAttendance" runat="server" Text='<%# Bind("Attendance") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblAttendance" runat="server" Text='<%# Bind("Attendance") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                        <asp:CommandField ShowEditButton="true" ButtonType="Button"  HeaderText="Edit" />  
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" HeaderText="Delete" /> 
                    </Columns>  
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />  
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />  
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />  
                    <RowStyle BackColor="White" ForeColor="#003399" />  
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />  
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />  
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />  
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />  
                    <SortedDescendingHeaderStyle BackColor="#002876" />  
                    </asp:GridView>
                </td>
            </tr>
       
    </table>
</asp:Content>
