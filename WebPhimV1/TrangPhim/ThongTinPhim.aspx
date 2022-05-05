<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="ThongTinPhim.aspx.cs" Inherits="WebPhimV1.TrangPhim.ThongTinPhim" %>

<%@ Register Src="~/Control_NguoiDung/TrangPhim/UiThongTinPhim.ascx" TagPrefix="uc1" TagName="UiThongTinPhim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiThongTinPhim runat="server" id="UiThongTinPhim" />
</asp:Content>
