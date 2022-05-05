<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="ThemPhim.aspx.cs" Inherits="WebPhimV1.Admin.Phims.ThemPhim" %>

<%@ Register Src="~/Control_Admin/Phims/UiThemPhim.ascx" TagPrefix="uc1" TagName="UiThemPhim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiThemPhim runat="server" id="UiThemPhim" />
</asp:Content>
