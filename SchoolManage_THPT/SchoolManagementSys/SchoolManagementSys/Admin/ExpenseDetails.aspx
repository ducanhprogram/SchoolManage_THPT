<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ExpenseDetails.aspx.cs" Inherits="SchoolManagementSys.Admin.ExpenseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GridView1.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({ "paging": true, "ordering": true, "searching": true });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <style>
       
         h3 {
          color: #fff;
             }

         div {
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

        <div style="background-image:url('../Image/pencil_artl.jpg'); width:100%; height:720px; background-repeat:no-repeat;background-size:cover;background-attachment:fixed">
        <div class="container p-md-4 p-sm-4">
                     <!--Expense Details-->
        <h3 class="text-center">Danh sách chi phí</h3>

  
      


         <div class="row mb-3 mr-lg-5 ml-lg-5">
           <div class="col-md-12">
               <div class="table-container">
                   <%--"--%>                                                                                <!--No record to display-->
                   <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="Không có dữ liệu để hiển thị" AutoGenerateColumns="False"  >    <%-- Sr.No - Số thứ tự --%>

                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Số thứ tự">
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="ClassName" HeaderText="Lớp">
                             <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                           <asp:BoundField DataField="SubjectName" HeaderText="Môn học">
                           <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                           <asp:BoundField DataField="ChargeAmount"  DataFormatString="{0:#,###} VNĐ" HeaderText="Số tiền thu (mỗi buổi học)">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                                   
                       </Columns>
                     <HeaderStyle BackColor="#5558C9"  ForeColor="White"/>
                   </asp:GridView>
               </div>
           </div>
        </div>

    </div>
</div>
</asp:Content>
