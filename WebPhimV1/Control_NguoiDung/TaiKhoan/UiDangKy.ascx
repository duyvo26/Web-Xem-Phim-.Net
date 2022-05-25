<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDangKy.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TaiKhoan.UiDangKy" %>
<script>
    document.title = "Đăng Ký Tài Khoản ";
</script>
<section class="sign-in-page">
   <div class="container">
      <div class="row justify-content-center align-items-center height-self-center">
         <div class="col-lg-5 col-md-12 align-self-center">
            <div class="sign-user_card ">
               <div class="sign-in-page-data">
                  <div class="sign-in-from w-100 m-auto">
                     <h3 class="mb-3 text-center">Đăng Ký</h3>
                     <center style="font-size: 22px; color: red">
                        <asp:Label ID="noti" runat="server"></asp:Label>
                     </center>
                     <form class="mt-4" action="#">
                        <div class="form-group">                              
                           <input  type="text" class="form-control mb-0" name="fullname" id="Tai-khoan" placeholder="Họ tên" autocomplete="off" required="">
                        </div>
                        <div class="form-group">                         
                           <input type="email" class="form-control mb-0"  name="email" id="email"  placeholder="Địa chỉ email" autocomplete="off" required="">
                        </div>
                        <div class="form-group">                  
                           <input type="text" class="form-control mb-0"  name="taikhoan" onkeyup="kttk()" id="nick-name"    placeholder="Tài khoản" autocomplete="off" required="">
                        </div>
                        <div class="form-group">     
                           <input type="password"  class="form-control mb-0" name="Password1" id="Password1" placeholder ="Mật khẩu lần 1" required="">
                        </div>
                        <div class="form-group">     
                           <input type="password"  class="form-control mb-0" name="Password2" id="Passwor2" placeholder ="Mật khẩu lần 2" required="">
                        </div>
                        <div class="sign-info">
                           <button type="submit" class="btn btn-hover">Đăng ký</button>
                           <div class="custom-control custom-checkbox d-inline-block">
                              <input type="checkbox" class="custom-control-input" id="nut-dangki" >
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="mt-3">
                  <div class="d-flex justify-content-center links">
                     Bạn đã có tài khoản ? <a href="dangnhap" class="text-primary ml-2">Đăng nhập</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<script>
    var nut = document.getElementById("nut-dangki");


    function kttk() {
        var tk = document.getElementById("nick-name");
        var ltk = tk.value.replace(/\s/g, '').toLowerCase();
        tk.value = ltk;
    }


    nut.disabled = !0;

    function check_dky() {
        var nick_name = document.getElementById("nick-name").value;
        var thongbao = document.getElementById("alert-pass");
        var Tai_khoan = document.getElementById("Tai-khoan").value;
        var Pass1 = document.getElementById("Password1").value;
        var Pass2 = document.getElementById("Password2").value;
        document.getElementById("nick-name").value = nick_name.toLowerCase();
        if (nick_name != "" && Tai_khoan != "" && Pass1 != "" && Pass2 != "") {
            if (Pass1 != Pass2) {
                thongbao.style.color = "red";
                thongbao.innerHTML = "* Mật khẩu không trùng khớp"
            } else {
                thongbao.style.color = "blue";
                thongbao.innerHTML = "* Xác nhận mật khẩu";
                nut.disabled = !1
            }
        } else {
            thongbao.innerHTML = "";
            nut.disabled = !0
        }
    }
</script>
<!--Dynhone 15-10 10:53 -->