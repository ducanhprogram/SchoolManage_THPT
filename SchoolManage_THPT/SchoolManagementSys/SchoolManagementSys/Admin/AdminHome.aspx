<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SchoolManagementSys.Admin.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff; 
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }

        caption {
            font-size: 24px;
            margin-bottom: 10px;
            font-weight: bold;
            text-align: center;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        h2 {
            color: #000;
        }
    </style>

    <div class="container">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h2 class="text-center">Trang chủ Admin</h2>
        <table>
            <caption>LỊCH THI TUYỂN SINH VÀO LỚP 10 NĂM HỌC 2024-2025</caption>
            <thead>
                <tr>
                    <th>Ngày thi</th>
                    <th>Buổi</th>
                    <th>Môn thi</th>
                    <th>Thời gian mở đề tại phòng thi</th>
                    <th>Thời gian bắt đầu phát đề</th>
                    <th>Thời gian bắt đầu tính giờ</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>03/6/2024</td>
                    <td>Chiều</td>
                    <td>14 giờ Tập trung thí sinh học Quy chế thi và nhận thẻ dự thi</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>04/6/2024</td>
                    <td>Sáng</td>
                    <td>Ngữ văn</td>
                    <td>7 giờ 50</td>
                    <td>7 giờ 55</td>
                    <td>8 giờ 00</td>
                </tr>
                <tr>
                    <td>04/6/2024</td>
                    <td>Chiều</td>
                    <td>Toán học</td>
                    <td>13 giờ 50</td>
                    <td>13 giờ 55</td>
                    <td>14 giờ 00</td>
                </tr>
                <tr>
                    <td>05/6/2024</td>
                    <td>Sáng</td>
                    <td>Tiếng Anh</td>
                    <td>7 giờ 50</td>
                    <td>7 giờ 55</td>
                    <td>8 giờ 00</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
