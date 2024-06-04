<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="TeacherSubject.aspx.cs" Inherits="SchoolManagementSys.Admin.TeacherSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
    
         body {
             background-color: #fff;
             font-weight: 600;
         }
      h3 {
       color: #000;
          }

      div {
          color: #fff;
      }

      label {
          color: #fff;
      }

        .table-container {
             width: 100%; /* Đặt chiều rộng của container bảng là 100% */
            overflow-x: auto; /* Cho phép cuộn ngang nếu bảng quá lớn */
          }

        .table {
            width: 100%; /* Đặt chiều rộng của bảng là 100% */
            max-width: 100%; /* Đảm bảo bảng không vượt quá kích thước container */
            background-color: #fff; /* Màu nền của bảng */
            color: #000; /* Màu chữ của bảng */
        }

        .table th, .table td {
            padding: 15px; /* Tăng khoảng cách trong các ô bảng */
            text-align: left; /* Căn chỉnh văn bản trong các ô bảng */
        }

        .table th {
            background-color: #5558C9; /* Màu nền cho tiêu đề bảng */
            color: #fff; /* Màu chữ cho tiêu đề bảng */
        }

     
</style>

        <div  width:100%; height:720px; background-repeat:no-repeat;background-size:cover;background-attachment:fixed">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">Thêm Giáo viên bộ môn</h3>

      <%--margin-bottom--%>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <%-- Lớp - class --%>
             <div class="col-md-6">
                <label style="font-size: 20px" for="ddlClass">Lớp</label>
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required."
                     ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                 </asp:RequiredFieldValidator>

           </div>

            <%-- Môn học - Subject --%>
            <div class="col-md-6">
                <label style="font-size: 20px" for="txtSubject">Môn Học</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng chọn môn học."
                    ControlToValidate="ddlSubject" InitialValue="Select Subject" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <%-- Giáo viên - Teacher --%>
           <div class="col-md-6">
         <label style="font-size: 20px" for="ddTeacher">Giáo viên</label>
          <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng chọn lớp học"
              ControlToValidate="ddlTeacher" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
          </asp:RequiredFieldValidator>

          </div>

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" OnClick="btnAdd_Click" Text="Phân công môn học" />
            </div>
        </div>


         <div class="row mb-3 mr-lg-5 ml-lg-5">
           <div class="col-md-12">
               <div class="table-container">
                   <%--"--%>
                   <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False"
                       OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="Id"
                       OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
                       <Columns>
                       <%-- Sr.No - Số thứ tự --%>
                           <asp:BoundField DataField="Sr.No" HeaderText="Số thứ tự" ReadOnly="True">
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <%-- Class - lớp --%>
                           <asp:TemplateField HeaderText="Lớp" >
                               <EditItemTemplate>                                               <!--"SqlDataSource1" -->
                               <asp:DropDownList ID="ddlClassGv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                   DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClassGv_SelectedIndexChanged">
                               <asp:ListItem>Chọn lớp học</asp:ListItem>
                               </asp:DropDownList>

                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" 
                                   SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>

                                </EditItemTemplate>

                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center"/>
                           </asp:TemplateField>

                           <%-- Subject - Môn học --%>
                           <asp:TemplateField HeaderText="Môn Học">
                               <EditItemTemplate>
                               <asp:DropDownList ID="ddlSubjectGv" runat="server" CssClass="form-control"></asp:DropDownList>

                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>   
                           
                           <%-- Giáo viên _Teacher --%>
                       <asp:TemplateField HeaderText="Giáo viên">
                        <EditItemTemplate>
                        <asp:DropDownList ID="ddlTeacherGv" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" 
                            DataValueField="TeacherId" SelectedValue='<%# Eval("TeacherId") %>' CssClass="form-control"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" 
                            SelectCommand="SELECT [TeacherId], [Name] FROM [Teacher]"></asp:SqlDataSource>

                       </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"/>
                </asp:TemplateField>


                       <asp:CommandField CausesValidation="false"  ShowEditButton="True" HeaderText="Operation" ShowDeleteButton="true">
                          <ItemStyle HorizontalAlign="Center" />
                           </asp:CommandField>
                       </Columns>
                     <HeaderStyle BackColor="#5558C9"  ForeColor="White"/>
                   </asp:GridView>
               </div>
           </div>
        </div>

    </div>
</div>
</asp:Content>
