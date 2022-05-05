<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="WebPhimV1.TaiKhoan.DangKy" %>

<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiDangKy.ascx" TagPrefix="uc1" TagName="UiDangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiDangKy runat="server" id="UiDangKy" />
</asp:Content>
