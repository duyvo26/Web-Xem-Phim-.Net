<%@ Page Title="" Language="C#" MasterPageFile="~/Theme/NguoiDung.Master" AutoEventWireup="true" CodeBehind="NapCoin.aspx.cs" Inherits="WebPhimV1.NapCoin" %>

<%@ Register Src="~/Control_NguoiDung/UiNapCoin.ascx" TagPrefix="uc1" TagName="UiNapCoin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PhanNoiDung" runat="server">
    <uc1:UiNapCoin runat="server" id="UiNapCoin" />
</asp:Content>
