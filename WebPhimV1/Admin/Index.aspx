<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebPhimV1.Admin.Index" %>

<%@ Register Src="~/Control_Admin/UiIndex.ascx" TagPrefix="uc1" TagName="UiIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiIndex runat="server" id="UiIndex" />
</asp:Content>
