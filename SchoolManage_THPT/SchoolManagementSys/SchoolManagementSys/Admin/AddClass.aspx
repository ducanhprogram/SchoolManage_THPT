<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolManagementSys.Admin.AddClass" %>
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
          <h3 class="text-center">Thêm lớp</h3>

        <%--margin-bottom--%>
          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-6">
                  <label style="font-size: 20px" for="txtClass">Tên lớp</label>
                  <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Nhập tên lớp..." required ></asp:TextBox>
              </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-3 col-md-offset-2 mb-3">
                  <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Class" OnClick="btnAdd_Click" />
              </div>
          </div>


          <div class="row mb-3 mr-lg-5 ml-lg-5">     
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="ClassId"
                      OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AutoGenerateColumns="False"
                      EmptyDataText="No Record to display!" AllowPaging="true" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" >
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Số thứ tự" ReadOnly="True">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="Lớp">
                             
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtClassEdit" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                   <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                              </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />                                                   
                             
                          </asp:TemplateField>
                          <asp:CommandField CausesValidation="False" ShowEditButton="True" HeaderText="Operation"></asp:CommandField>
                      </Columns>

                      <HeaderStyle BackColor="#5558C9"  ForeColor="White"/>

                  </asp:GridView>
              </div>
          </div>
      </div>
  </div>
</asp:Content>
