<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebPhimV1.TaiKhoan.DangNhap" %>

<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiDangNhap.ascx" TagPrefix="uc1" TagName="UiDangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiDangNhap runat="server" id="UiDangNhap" />
</asp:Content>
