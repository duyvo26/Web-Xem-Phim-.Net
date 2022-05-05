<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="TimKiemPhim.aspx.cs" Inherits="WebPhimV1.TimKiemPhim" %>

<%@ Register Src="~/Control_NguoiDung/UiTimKiemPhim.ascx" TagPrefix="uc1" TagName="UiTimKiemPhim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiTimKiemPhim runat="server" id="UiTimKiemPhim" />
</asp:Content>
