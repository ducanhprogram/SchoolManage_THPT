<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMst.Master" AutoEventWireup="true" CodeBehind="TeacherHome.aspx.cs" Inherits="SchoolManagementSys.Teacher.TeacherHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
     body {
         font-family: Arial, sans-serif;
         margin: 0;
         padding: 0;
         background-color: #ffff; 
     }


     h2 {
         color: #000;
     }
 </style>

 <div class="container">
     <div>
         <asp:Label ID="lblMsg" runat="server"></asp:Label>
     </div>
     <h2 class="text-center">Trang chủ giáo viên</h2>
     
 </div>
</asp:Content>
