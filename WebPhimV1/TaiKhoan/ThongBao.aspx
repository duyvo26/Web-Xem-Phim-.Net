<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="ThongBao.aspx.cs" Inherits="WebPhimV1.TaiKhoan.ThongBao" %>

<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiThongBao.ascx" TagPrefix="uc1" TagName="UiThongBao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiThongBao runat="server" id="UiThongBao" />
</asp:Content>
