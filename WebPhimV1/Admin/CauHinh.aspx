<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="CauHinh.aspx.cs" Inherits="WebPhimV1.Admin.CauHinh" %>

<%@ Register Src="~/Control_Admin/UiCauHinh.ascx" TagPrefix="uc1" TagName="UiCauHinh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiCauHinh runat="server" id="UiCauHinh" />
</asp:Content>
