<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebPhimV1.Index" %>

<%@ Register Src="~/Control_NguoiDung/UiIndex.ascx" TagPrefix="uc1" TagName="UiIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiIndex runat="server" id="UiIndex" />
</asp:Content>
