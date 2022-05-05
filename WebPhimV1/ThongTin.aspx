<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="ThongTin.aspx.cs" Inherits="WebPhimV1.ThongTin" %>

<%@ Register Src="~/Control_NguoiDung/UiThongTin.ascx" TagPrefix="uc1" TagName="UiThongTin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiThongTin runat="server" id="UiThongTin" />
</asp:Content>
