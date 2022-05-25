<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDangNhap.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TaiKhoan.UiDangNhap" %>
<script>
    document.title = "Trang Đăng Nhập ";
</script>
<section class="sign-in-page">
   <div class="container">
      <div class="row justify-content-center align-items-center height-self-center">
         <div class="col-lg-5 col-md-12 align-self-center">
            <div class="sign-user_card ">
               <div class="sign-in-page-data">
                  <div class="sign-in-from w-100 m-auto">
                     <h3 class="mb-3 text-center">Đăng nhập</h3>
                     <center style="font-size: 22px; color: red">
                        <asp:Label ID="noti" runat="server"></asp:Label>
                     </center>
                     <form class="mt-4" action="#">
                        <div class="form-group">                                 
                           <input onkeyup="kttk()" type="text" class="form-control mb-0" name="taikhoan" id="Tai-khoan" placeholder="Nhập tên đăng nhập" autocomplete="off" required="">
                        </div>
                        <div class="form-group"> 
                           <input type="password"  onkeyup="check_login()"  class="form-control mb-0"  name="password" id="Password"placeholder="Nhập mật khẩu" required="">
                        </div>
                        <div class="sign-info">
                           <button type="submit" class="btn btn-hover">Đăng nhập</button>
                           <div class="custom-control custom-checkbox d-inline-block">
                              <input type="checkbox" class="custom-control-input"  id="nut-dangnhap" >
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="mt-3">
                  <div class="d-flex justify-content-center links">
                     Bạn chưa có tài khoản ? <a href="dangky" class="text-primary ml-2">Đăng ký</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<script>
    function kttk() {
        var tk = document.getElementById("Tai-khoan");
        var ltk = tk.value.replace(/\s/g, '').toLowerCase();
        tk.value = ltk;
    }
    var nut_dn = document.getElementById("nut-dangnhap"); nut_dn.disabled = !0; function check_login() { var account = document.getElementById("Tai-khoan").value; var pass = document.getElementById("Password").value; document.getElementById("Tai-khoan").value = account.toLowerCase(); if (account != "" && pass != "") { nut_dn.disabled = !1 } }
</script>    
</section>
<!--Dynhone 15-10 10:53 -->