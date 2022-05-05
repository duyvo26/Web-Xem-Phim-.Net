<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="Log-404.aspx.cs" Inherits="WebPhimV1.Admin.Log_404" %>

<%@ Register Src="~/Control_Admin/UiLog-404.ascx" TagPrefix="uc1" TagName="UiLog404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiLog404 runat="server" id="UiLog404" />
</asp:Content>
