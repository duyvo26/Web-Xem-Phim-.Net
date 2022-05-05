<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="ThuVienDoc.aspx.cs" Inherits="WebPhimV1.TaiKhoan.ThuVienDoc" %>

<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiThuVienDoc.ascx" TagPrefix="uc1" TagName="UiThuVienDoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiThuVienDoc runat="server" id="UiThuVienDoc" />
</asp:Content>
