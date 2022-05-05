<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="BinhLuan.aspx.cs" Inherits="WebPhimV1.Admin.Phims.BinhLuan" %>

<%@ Register Src="~/Control_Admin/Phims/UiBinhLuan.ascx" TagPrefix="uc1" TagName="UiBinhLuan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiBinhLuan runat="server" id="UiBinhLuan" />
</asp:Content>
