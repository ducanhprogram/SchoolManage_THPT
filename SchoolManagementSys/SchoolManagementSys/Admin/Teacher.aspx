<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolManagementSys.Admin.Teacher" %>
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
         <h3 class="text-center">Thêm giáo viên</h3>

         <%-- Gender --- Tên: Name --%>

       <%--margin-bottom--%>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

              <div class="col-md-6">
                 <label style="font-size: 20px" for="txtName">Tên</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Nhập Tên"  required >
                    </asp:TextBox>                                             <!--The name should be in Characters -->
                  <asp:RegularExpressionValidator runat="server" ErrorMessage="Tên phải ở dạng ký tự" ForeColor="Red" 
                      ValidationExpression="^[a-zA-ZàáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÈÉẺẼẸÊẾỀỂỄỆÌÍỈĨỊÒÓỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÙÚỦŨỤƯỨỪỬỮỰỲÝỶỸỴĐ\s]+$" 
                      Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                  </asp:RegularExpressionValidator> 

            </div>
             <%-- NGày sinh ; Data of Birth --%>
             <div class="col-md-6">
                 <label style="font-size: 20px" for="txtDoB">Ngày Sinh</label>
                 <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required >
                 </asp:TextBox>

             </div>
         </div>

         <%-- Gender --- Giới tính --%>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

              <div class="col-md-6">
                 <label style="font-size: 20px" for="ddlGender">Giới tính</label>
                  <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                      <asp:ListItem Value="0">Chọn giới tính</asp:ListItem>
                      <asp:ListItem>Nam</asp:ListItem>
                      <asp:ListItem>Nữ</asp:ListItem>
                      <asp:ListItem>Khác</asp:ListItem>
                  </asp:DropDownList>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Yêu cầu bắt buộc giới tính"></asp:RequiredFieldValidator>                                                          <!--The name should be in Characters -->--%>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="Yêu cầu bắt buộc giới tính" ForeColor="Red" 
                       Display="Dynamic" ControlToValidate="ddlGender" SetFocusOnError="true" InitialValue="Select Gender">
                  </asp:RequiredFieldValidator> 

            </div>

             <%-- Số điện thoại -- Mobile --%>
             <div class="col-md-6">
                 <label style="font-size: 20px" for="txtMobile">Số điện thoại</label>
                 <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 số Mobile"  required >
                 </asp:TextBox>
                  <asp:RegularExpressionValidator runat="server" ErrorMessage="Số di động không hợp lệ." ForeColor="Red" 
                 ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                </asp:RegularExpressionValidator> 

             </div>
         </div>

         <%-- Email --%>
          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
            <label style="font-size: 20px" for="txtEmail">Email</label>
               <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập Email..." TextMode="Email" required >
               </asp:TextBox>                                             <!--The name should be in Characters -->
            </div>
              
              <%-- Mật khẩu -- Password --%>
               <div class="col-md-6">
                 <label style="font-size: 20px" for="txtPassword">Mật khẩu</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Mật khẩu..." TextMode="Password" required >
                    </asp:TextBox>                                             <!--The name should be in Characters -->
                 </div>
         </div>

         <%-- Địa chỉ - Address --%>
      <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
      <div class="col-md-12">
      <label style="font-size: 20px" for="txtAddress">Địa chỉ</label>
         <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhập địa chỉ..." TextMode="MultiLine" required >
         </asp:TextBox>                                             <!--The name should be in Characters -->
      </div>
       

   </div>



         <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-3 col-md-offset-2 mb-3">
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Teacher" OnClick="btnAdd_Click" />
             </div>
         </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-12">
                <div class="table-container">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False"
                        OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="TeacherId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                         
                            <asp:BoundField DataField="Sr.No" HeaderText="Số thứ tự" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%-- Class --%>
                            <asp:TemplateField  HeaderText="Tên">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control" width="100px"></asp:TextBox>
                                </EditItemTemplate>
                               <ItemTemplate>
                                      <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                   <ItemStyle HorizontalAlign="Center" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- Mobile  --%>
                            <asp:TemplateField HeaderText="Số điện thoại">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <%-- Email --%>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <%-- Password --%>
                             <asp:TemplateField HeaderText="Mật khẩu">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                                <%--Address --%>
                              <asp:TemplateField HeaderText="Địa chỉ">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" Width="100px" TextMode="MultiLine"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                            <asp:CommandField CausesValidation="false" ShowEditButton="True" HeaderText="Operation" ShowDeleteButton="true">
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
