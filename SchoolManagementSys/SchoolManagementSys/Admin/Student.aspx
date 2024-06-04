<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolManagementSys.Admin.Student" %>
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
         <h3 class="text-center">Thêm học sinh</h3>

         <%-- Gender --- Tên: Name --%>

       <%--margin-bottom--%>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

              <div class="col-md-6">
                 <label style="font-size: 20px" for="txtName">Tên</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Nhập Tên...."  required >
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

             <%-- Số điện thoại --Contact Number --%>
             <div class="col-md-6">
                 <label style="font-size: 20px" for="txtMobile">Số điện thoại liên lạc</label>
                 <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 số Mobile"  required >
                 </asp:TextBox>
                  <asp:RegularExpressionValidator runat="server" ErrorMessage="Số di động không hợp lệ." ForeColor="Red" 
                 ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                </asp:RegularExpressionValidator> 

             </div>
         </div>

         <%-- Roll number - số báo danh --%>
          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
            <label style="font-size: 20px" for="txtEmail">Số báo danh</label>
               <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Nhập số báo danh..."  required >
               </asp:TextBox>                                             <!--The name should be in Characters -->
            </div>
              
              <%-- Lớp - Class --%>
               <div class="col-md-6">
                 <label style="font-size: 20px" for="ddlClass">Lớp</label>
                   <asp:DropDownList ID="ddlClass" runat="server"  CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng chọn lớp học."
                     ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                    </asp:RequiredFieldValidator>
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
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Thêm học sinh" OnClick="btnAdd_Click" />
             </div>
         </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-12">
                <div class="table-container">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False"
                        OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="StudentId"
                        OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting"  OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" >
                        <Columns>
                         
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%-- Lớp --%>
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

                            <%--Số báo danh --%>
                            <asp:TemplateField HeaderText="Số báo danh">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtRollNo" runat="server" Text='<%# Eval("RollNo") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                                 </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRollNo" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <%-- Lớp -Class --%>
                             <asp:TemplateField HeaderText="Lớp">
                              <EditItemTemplate>
                                  <asp:DropDownList ID="ddlClass" runat="server"  CssClass="form-control" Width="120px"></asp:DropDownList>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblClass" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                                <%--Address --%>
                              <asp:TemplateField HeaderText="Địa chỉ">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" Width="130px" TextMode="MultiLine"></asp:TextBox>
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
