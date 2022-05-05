<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiLog-404.ascx.cs" Inherits="WebPhimV1.Control_Admin.UiLog_404" %>
<!-- Content Header (Page header) -->
<div class="content-header">
   <div class="container-fluid">
      <div class="row mb-2">
         <div class="col-sm-6">
            <h1 class="m-0">Danh sách lỗi</h1>
         </div>
         <!-- /.col -->
         <!-- /.col -->
      </div>
      <!-- /.row -->
   </div>
   <!-- /.container-fluid -->
</div>
<!-- Main content -->
<section class="content" style="background: white;">
   <iframe src="<%=WebPhimV1.Code.HeThong.url() %>/log-404.html" style="color:white; width:100%; height:700px; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;">
   </iframe>
</section>