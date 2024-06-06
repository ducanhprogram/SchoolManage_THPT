<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="SchoolManagementSys.Admin.MarkDetails" %>

<%@ Register Src="~/MarksDetailUserControl.ascx" TagPrefix="uc" TagName="MarksDetail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



         <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        html {
            font-family: "Poppins", sans-serif !important;
        }
         body {
              font-family: "Poppins", sans-serif !important;
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
   
         
   
     <%--<div  width:100%; height:720px; background-repeat:no-repeat;background-size:cover;background-attachment:fixed">
     <div class="container p-md-4 p-sm-4">
         <div>
             <asp:Label ID="lblMsg" runat="server"></asp:Label>
         </div>
         <h3 class="text-center">Thông tin điểm</h3>

     
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

              <div class="col-md-6">
                 <label style="font-size: 20px" for="ddlClass">Lớp</label>
                  <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" ></asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng chọn lớp học."
                      ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                  </asp:RequiredFieldValidator>

            </div>
           
             <div class="col-md-6">
                 <label style="font-size: 20px" for="txtRoll">Mã học sinh</label>
                 <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Nhập mã học sinh" TextMode="Number" required >

                 </asp:TextBox>
             </div>
         </div>

         <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-3 col-md-offset-2 mb-3">
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" OnClick="btnAdd_Click" Text="Tra cứu điểm" />
             </div>
         </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-12">
                <div class="table-container">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False" 
                        OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="8" >
                        <Columns>
                          
                            <asp:BoundField DataField="Sr.No" HeaderText="Số thứ tự">
                                <ItemStyle HorizontalAlign="Center" />
                               </asp:BoundField>

                               <asp:BoundField DataField="ExamId" HeaderText="Mã bài thi">
                                  <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ClassName" HeaderText="Lớp">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            

                            <asp:BoundField DataField="SubjectName" HeaderText="Môn học">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                           </asp:BoundField>


                            <asp:BoundField DataField="RollNo" HeaderText="Mã sinh viên">
                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                             </asp:BoundField>
                          
                            <asp:BoundField DataField="TotalMarks" HeaderText="Tổng điểm">
                         <ItemStyle HorizontalAlign="Center"></ItemStyle>
                         </asp:BoundField> 
                            
                            <asp:BoundField DataField="OutOfMarks" HeaderText="Điểm tối đa">
                         <ItemStyle HorizontalAlign="Center"></ItemStyle>
                         </asp:BoundField>
                          

                            
                        </Columns>
                      <HeaderStyle BackColor="#5558C9"  ForeColor="White"/>
                    </asp:GridView>
                </div>
            </div>
         </div>

     </div>
 </div>--%>

    <uc:MarksDetail runat="server" ID="MarksDetail1"/>


</asp:Content>
