<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Theme.Master" AutoEventWireup="true" CodeBehind="NapCoin.aspx.cs" Inherits="WebPhimV1.Admin.NguoiDungs.NapCoin" %>

<%@ Register Src="~/Control_Admin/NguoiDungs/UiNapCoin.ascx" TagPrefix="uc1" TagName="UiNapCoin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UiNapCoin runat="server" id="UiNapCoin" />
</asp:Content>
