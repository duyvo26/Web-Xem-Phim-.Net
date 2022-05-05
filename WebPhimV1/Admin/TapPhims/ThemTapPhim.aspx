<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="ThemTapPhim.aspx.cs" Inherits="WebPhimV1.Admin.Tap_Phims.ThemTap_Phim" %>

<%@ Register Src="~/Control_Admin/TapPhims/UiThemTapPhim.ascx" TagPrefix="uc1" TagName="UiThemTap_Phim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiThemTap_Phim runat="server" id="UiThemTap_Phim" />
</asp:Content>
