<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="ThemNguoiDung.aspx.cs" Inherits="WebPhimV1.Admin.NguoiDungs.ThemNguoiDung" %>

<%@ Register Src="~/Control_Admin/NguoiDungs/UiThemNguoiDung.ascx" TagPrefix="uc1" TagName="UiThemNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiThemNguoiDung runat="server" id="UiThemNguoiDung" />
</asp:Content>
