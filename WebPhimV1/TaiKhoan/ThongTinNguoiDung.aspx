<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="ThongTinNguoiDung.aspx.cs" Inherits="WebPhimV1.TaiKhoan.ThongTinNguoiDung" %>

<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiThongTinNguoiDung.ascx" TagPrefix="uc1" TagName="UiThongTinNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiThongTinNguoiDung runat="server" id="UiThongTinNguoiDung" />
</asp:Content>
