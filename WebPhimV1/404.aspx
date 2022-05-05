<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="WebPhimV1._404" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title>Lỗi</title>
   </head>
   <body>
      <form id="form1" runat="server">
         <a href="/">
         <img src="<%=WebPhimV1.Code.HeThong.url() %>/Public/img/www/404/<%=HeThongs.img_404 %>" width="100%" />
         </a>
      </form>
   </body>
</html>