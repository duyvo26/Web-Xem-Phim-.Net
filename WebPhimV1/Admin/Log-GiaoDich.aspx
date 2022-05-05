<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="Log-GiaoDich.aspx.cs" Inherits="WebPhimV1.Admin.Log_GiaoDich" %>

<%@ Register Src="~/Control_Admin/UiLog-GiaoDich.ascx" TagPrefix="uc1" TagName="UiLogGiaoDich" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiLogGiaoDich runat="server" id="UiLogGiaoDich" />
</asp:Content>
