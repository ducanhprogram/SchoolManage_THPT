﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="EmployeeAttendance.aspx.cs" Inherits="SchoolManagementSys.Admin.EmployeeAttendance" %>


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

          <div class="ml-auto text-right">
              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                      <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                      <asp:Label ID="lblTime" runat="server" Font-Bold="true"></asp:Label>
                  </ContentTemplate>
              </asp:UpdatePanel>

          </div>
          <h3 class="text-center">Điểm danh của giáo viên</h3>




          <div class="row mb-3 mr-lg-5 ml-lg-5">     
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="Không có bản ghi nào để hiển thị">
                      <Columns>

                           
                          <asp:TemplateField HeaderText="LỚp">
                             
                              <ItemTemplate>
                                  <%-- Có mặt --%>
                                  <div class="form-check form-check-inline">
                                      <asp:RadioButton ID="RadioButton1" runat="server" Text="Có mặt" Checked="true" GroupName="attendance" CssClass="form-check-input"/>
                                  </div>
                                  <%-- Vắng mặt --%>
                                  <div class="form-check form-check-inline">
                                 <asp:RadioButton ID="RadioButton2" runat="server" Text="Vắng mặt"  GroupName="attendance" CssClass="form-check-input"/>
                                 </div>
                              </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />                                                   
                             
                          </asp:TemplateField>

                      </Columns>

                      <HeaderStyle BackColor="#5558C9"  ForeColor="White"/>

                  </asp:GridView>
              </div>
          </div>
          <%-- end  --%>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
         <div class="col-md-6 col-lg-4 col-xl-3 col-md-offset-2  mb-3">
            <asp:Button ID="btnMarkAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Điểm danh" OnClick="btnMarkAttendance_Click" />
        </div>
        </div>


      </div>
  </div>

</asp:Content>
