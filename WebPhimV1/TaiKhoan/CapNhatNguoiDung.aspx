<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="CapNhatNguoiDung.aspx.cs" Inherits="WebPhimV1.TaiKhoan.CapNhatNguoiDung" %>

<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiCapNhatNguoiDung.ascx" TagPrefix="uc1" TagName="UiCapNhatNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiCapNhatNguoiDung runat="server" id="UiCapNhatNguoiDung" />
</asp:Content>
