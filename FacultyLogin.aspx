<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyLogin.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Student_InformationSystem.FacultyLogin" %>

<asp:Content ID="cntFaculty" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function validateWeekDays() {
            alert("Please select week days.")
        }
    </script>
    <div>
        <br />
        <br />
         <br />
        <br />
    </div>
    <table border="1">
       
        <thead style="background-color:darkblue;color:white;">
            <tr style="background-color:white;">
                <td colspan="7" style="text-align:right;">Select Date:</td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Select Date" runat="server" ForeColor="Red" ControlToValidate="txtDate" ValidationGroup="calendartext"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDate" runat="server" ValidationGroup="calendartext" OnTextChanged="txtDate_TextChanged" ForeColor="Black" AutoPostBack="True"></asp:TextBox>
                    <asp:Button ID="btnDate" runat="server" Text="Calendar" ForeColor="Black" OnClick="btnDate_Click" />
                </td>
                <td colspan="4">
                    <asp:Calendar ID="clndrAttendacne" runat="server" SelectionMode="DayWeekMonth" OnSelectionChanged="clndrAttendacne_SelectionChanged"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>Id
                </td>
                <td>Name
                </td>
                
                <td>Contact Number
                </td>
                <td>Class</td>
                <td>Grade
                </td>
                <td>Attendance
                </td>
                <td>Marks
                </td>
                <td>Hour-1
                </td>
                <td>Hour-2
                </td>
                <td>Hour-3
                </td>
                <td>Hour-4
                </td>
                <td>Submit
                </td>
            </tr>

        </thead>
        <tbody>


            <tr>
                <td>
                    <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblContactNumber" runat="server" Text=""></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblGrade" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblAttendance" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMarks" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="chkHour_1" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="chkHour_2" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="chkHour_3" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="chkHour_4" runat="server" />
                </td>
                <td>
                    <asp:Button runat="server" ID="btnSubmit" ValidationGroup="calendartext" Text="Submit Attendance" OnClick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
               <td>
                    <asp:Label ID="lblId1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblName1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblContactNumber1" runat="server" Text=""></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblClass1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblGrade1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblAttendance1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMarks1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="chkHour1_1" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="chkHour1_2" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="chkHour1_3" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="chkHour1_4" runat="server" />
                </td>
                <td>
                    <asp:Button runat="server" ID="btnAttendance1" ValidationGroup="calendartext" Text="Submit Attendance" OnClick="btnAttendance1_Click" />
                </td>
            </tr>
        </tbody>
    </table>

    <table  style="width:100%;">
        <tr>
            <td>
                <br />
                <br />
            </td>
        </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdStudentsDetails" runat="server" AutoGenerateColumns="False"   
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"   
                        CellPadding="4" DataKeyNames="Id"  >
                       <%-- OnRowCancelingEdit="grdStudentsDetails_RowCancelingEditing"
                        OnRowEditing="grdStudentsDetails_RowEditing"              
                        OnRowDeleting="grdStudentsDetails_RowDeleting"  
                        OnRowUpdating="grdStudentsDetails_RowUpdating"--%>
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

                           <asp:TemplateField HeaderText="Date">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 

                             <asp:TemplateField HeaderText="Attendance_Hour1">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtAttendance_H1" runat="server" Text='<%# Bind("Attendance_Hour1") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblAttendance_H1" runat="server" Text='<%# Bind("Attendance_Hour1") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Attendance_Hour2">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtAttendance_H2" runat="server" Text='<%# Bind("Attendance_Hour2") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblAttendance_H2" runat="server" Text='<%# Bind("Attendance_Hour2") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Attendance_Hour3">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtAttendance_H3" runat="server" Text='<%# Bind("Attendance_Hour3") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblAttendance_H3" runat="server" Text='<%# Bind("Attendance_Hour3") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Attendance_Hour4">  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtAttendance_H4" runat="server" Text='<%# Bind("Attendance_Hour4") %>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:Label ID="lblAttendance_H4" runat="server" Text='<%# Bind("Attendance_Hour4") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField> 
                      <%--  <asp:CommandField ShowEditButton="true" ButtonType="Button"  HeaderText="Edit" />  
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" HeaderText="Delete" /> --%>
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
