<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="SchoolManagementSys.Admin.Marks" %>
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
          color: #000;
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

        <div width:100%; height:720px; background-repeat:no-repeat;background-size:cover;background-attachment:fixed">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">Thêm điểm số</h3>

      <%--margin-bottom--%>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <%-- Lớp - class --%>
             <div class="col-md-6">
                <label style="font-size: 20px" for="ddlClass">Lớp</label>
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng chọn lớp học."
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

            <%-- Student Roll  number - Mã học sinh --%>
           <div class="col-md-12 mt-2">
         <label style="font-size: 20px" for="txtRoll">Mã học sinh</label>
               <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Nhập mã học sinh..."  required></asp:TextBox>
          </div>

            <%-- Totaal Marks - Tổng số điểm --%>
             <div class="col-md-6 mt-2">
          <label style="font-size: 20px" for="txtStudMarks">Tổng số điểm (điểm học sinh)</label>
                <asp:TextBox ID="txtStudMarks" runat="server" CssClass="form-control" placeholder="Nhập tổng số điểm..." TextMode="Number" required></asp:TextBox>
           </div>

            <%-- out of Marks --%>
              <div class="col-md-6 mt-2">
            <label style="font-size: 20px" for="txtOutOfMarks">Điểm tối đa</label>
                  <asp:TextBox ID="txtOutOfMarks" runat="server" CssClass="form-control" placeholder="Nhập điểm tối đa..." TextMode="Number" required></asp:TextBox>
             </div>

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Thêm điểm" OnClick="btnAdd_Click"/>
            </div>
        </div>


         <div class="row mb-3 mr-lg-5 ml-lg-5">
           <div class="col-md-12">
               <div class="table-container">
                   <%--"--%>
                   <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False"
                       OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="ExamId"
                       OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound" >    <%-- Sr.No - Số thứ tự --%>

                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Số thứ tự" ReadOnly="True">
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <%-- Class - lớp --%>
                           <asp:TemplateField HeaderText="Lớp" >
                               <EditItemTemplate>                                               <!--"SqlDataSource1" -->
                               <asp:DropDownList ID="ddlClassGv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                   DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="true"
                                   OnSelectedIndexChanged="ddlClassGv_SelectedIndexChanged" >
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
                           
                           <%-- Số thứ tự - Roll Number  --%>
                               <asp:TemplateField HeaderText="Số báo danh">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRollNoGv" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("RollNo") %>'></asp:TextBox>                  
                               </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"/>
                        </asp:TemplateField>

                           <%-- Total Marks - Tổng số điểm --%>
                         <asp:TemplateField HeaderText="Tổng số điểm">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStudMarksGv" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("TotalMarks") %>'></asp:TextBox>                  
                       </EditItemTemplate>

                      <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("TotalMarks") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"/>
                  </asp:TemplateField>

                           <%-- Điểm tối đa --%>
                     <asp:TemplateField HeaderText="Điểm tối đa">
                       <EditItemTemplate>
                          <asp:TextBox ID="txtOutOfMarksGv" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("OutOfMarks") %>'></asp:TextBox>                  
                        </EditItemTemplate>

                     <ItemTemplate>
                          <asp:Label ID="Label5" runat="server" Text='<%#  Eval("OutOfMarks") %>'></asp:Label>
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


