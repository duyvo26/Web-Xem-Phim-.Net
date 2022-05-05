<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="DanhGia.aspx.cs" Inherits="WebPhimV1.Admin.Phims.DanhGia" %>

<%@ Register Src="~/Control_Admin/Phims/UiDanhSach.ascx" TagPrefix="uc1" TagName="UiDanhSach" %>
<%@ Register Src="~/Control_Admin/Phims/UiDanhGia.ascx" TagPrefix="uc1" TagName="UiDanhGia" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiDanhGia runat="server" id="UiDanhGia" />
</asp:Content>
