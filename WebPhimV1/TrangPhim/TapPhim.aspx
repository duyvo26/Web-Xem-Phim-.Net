<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="TapPhim.aspx.cs" Inherits="WebPhimV1.TrangPhim.TapPhim" %>

<%@ Register Src="~/Control_NguoiDung/TrangPhim/UiTapPhim.ascx" TagPrefix="uc1" TagName="UiTapPhim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiTapPhim runat="server" id="UiTapPhim" />
</asp:Content>
