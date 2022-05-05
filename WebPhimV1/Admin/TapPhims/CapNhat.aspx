<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="CapNhat.aspx.cs" Inherits="WebPhimV1.Admin.Tap_Phims.CapNhat" %>

<%@ Register Src="~/Control_Admin/TapPhims/UiCapNhat.ascx" TagPrefix="uc1" TagName="UiCapNhat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiCapNhat runat="server" id="UiCapNhat" />
</asp:Content>
