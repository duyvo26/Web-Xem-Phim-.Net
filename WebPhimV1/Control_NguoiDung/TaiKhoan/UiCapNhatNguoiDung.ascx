<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiCapNhatNguoiDung.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TaiKhoan.UiCapNhatNguoiDung" %>
<script>
    document.title = "Chỉnh Sửa Thông Tin Cá Nhân";
</script>
<div class="main-content">
   <section class=""  style="margin-top: 60px">
      <div class="container-fluid">
         <div class="row justify-content-center align-items-center height-self-center ">
            <div class="col-sm-4 ">
               <div class="d-flex justify-content-center">
                  <div class="avatar-nguoidung" style="margin-top: 20px;">
                     <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" class="img-avatar" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= NguoiDungs.img_user %>" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/avatar.jpg';" />
                     <hr>
                     <a href="?MatKhau=true" style="text-decoration: none;">Đổi mật khẩu</a>
                     <!--    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#change-password" style="margin-bottom: 30px; margin-top: 15px; height: 60px">Cập nhật mật khẩu</button> -->
                  </div>
               </div>
            </div>
            <div class="col-sm-8 sign-user_card ">
               <% if(string.IsNullOrEmpty(Request.QueryString["MatKhau"])){ %>
               <form method="POST"EncType="multipart/form-data" action="#">
                  <div class="form-group" style="width: 100%">
                     <!--Nick name-->
                     <label>Tên tài khoản:</label>
                     <input type="text" class="form-control" name="fullname" id="nick-name" value="<%=NguoiDungs.fullname %>">
                     <div style="margin-top: 10px"></div>
                     <!--Email -->
                     <label>Địa chỉ mail:</label>
                     <input type="email" class="form-control" name="email" id="email" value=" <%= NguoiDungs.mail %>">
                     <div style="margin-top: 10px"></div>
                     <div class="form-group" style="width: 100%">
                        <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg, .png, .gif"/>
                     </div>
                  </div>
                  <div class="form-group" style="width: 100%">
                     <input type="submit" name="capnhat"  class="btn btn-dark" value="Cập nhật" />
                  </div>
               </form>
               <% }else{ %>
               <form method="POST"EncType="multipart/form-data" action="#">
                  <div class="form-group" style="width: 100%">
                     <!--mat khau cu-->
                     <label>Mật khẩu cũ:</label>
                     <input type="text" class="form-control" name="pass_old">
                     <div style="margin-top: 10px"></div>
                     <!--mat khau moi -->
                     <label>Mật khẩu mới:</label>
                     <input type="text" class="form-control" name="pass_new" >
                     <div style="margin-top: 10px"></div>
                  </div>
                  <div class="form-group" style="width: 100%">
                     <input type="submit" name="doimatkhau"  class="btn btn-dark" value="Cập nhật mật khẩu" />
                  </div>
               </form>
               <%} %>
            </div>
         </div>
      </div>
      <!-- Doi mat khau -->
      <pass>
         <div class="modal fade" id="change-password" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Thay đổi mật khẩu</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body" style="height: auto;width:100%">
                     <div class="form-group">
                        <!--Mật khẩu cũ -->
                        <div id="alert-pass" style="font-size:20px;"></div>
                        <label >Mật khẩu cũ</label>
                        <input type="password" class="form-control" id="Password-cu" placeholder="Password 1">
                        <div style="margin-top: 10px"></div>
                        <!--Mật khẩu mới -->
                        <label>Nhập mật khẩu mới </label>
                        <input type="password" class="form-control" id="Password-moi1" placeholder="Password 2">
                        <div style="margin-top: 10px"></div>
                        <!--Nhập lại mật khẩu mới  -->
                        <label>Nhập lại mật khẩu mới </label>
                        <input type="password" class="form-control" id="Password-moi2" placeholder="Password 2">
                        <div style="margin-top: 10px"></div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                     <button type="button" class="btn btn-primary">Lưu thay đổi </button>
                  </div>
               </div>
            </div>
         </div>
      </pass>
      <style>
         pass .modal-dialog{position:absolute;margin:auto;max-width:100%;width:500px;height:auto;right:0;left:0}
      </style>
   </section>
</div>