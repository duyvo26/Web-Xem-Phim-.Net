<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThemNguoiDung.ascx.cs" Inherits="WebPhimV1.Control_Admin.NguoiDungs.UiThemNguoiDung" %>
<!-- Content Header (Page header) -->
<div class="content-header">
   <div class="container-fluid">
      <div class="row mb-2">
         <div class="col-sm-6">
            <h1 class="m-0">Thêm Người Dùng</h1>
         </div>
         <!-- /.col -->
         <!-- /.col -->
      </div>
      <!-- /.row -->
   </div>
   <!-- /.container-fluid -->
</div>
<!-- Main content -->
<section class="content">
   <div class="container-fluid">
      <div class="container-fluid">
         <div class="card card-danger">
            <div class="card-header">
               <h3 class="card-title">Người dùng</h3>
            </div>
            <asp:Label ID="noti" runat="server" ></asp:Label>
            <div class="card-body">
               <div class="form-group">
                  <label>Full Name:</label>
                  <div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                     </div>
                     <asp:TextBox ID="fullname" runat="server" CssClass="form-control"></asp:TextBox>
                     <!-- <input type="text" name="fullname"  class="form-control" /> -->
                  </div>
                  <!-- /.input group -->
               </div>
               <!-- /.form group -->
               <!-- form -->
               <div class="form-group">
                  <label>Mail:</label>
                  <div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                     </div>
                     <!-- <input type="text" name="email"  class="form-control" /> -->
                     <asp:TextBox ID="email" runat="server" class="form-control"  ></asp:TextBox>
                  </div>
                  <!-- /.input group -->
               </div>
               <!-- /.form group -->
               <!-- form -->
               <div class="form-group">
                  <label>Coin:</label>
                  <div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                     </div>
                     <asp:TextBox id="coin" runat="server" class="form-control" Text="0" onkeyup="this.value = minmax(this.value, 0, 99999999)"></asp:TextBox>
                     <script type="text/javascript">
                         function minmax(value, min, max) {
                             if (parseInt(value) < min || isNaN(parseInt(value)))
                                 return min;
                             else if (parseInt(value) > max)
                                 return max;
                             else return value;
                         }
                     </script>
                     <!-- <input type="number" value="0" class="form-control" name="coin" min="0" max="99999999" > -->
                  </div>
                  <!-- /.input group -->
               </div>
               <!-- /.form group -->
               <div class="form-group" >
                  <label>Quyền Hạn:</label>
                  <asp:DropDownList ID="quyenhan" runat="server" CssClass="form-control">
                     <asp:ListItem Value="0">User</asp:ListItem>
                     <asp:ListItem Value="1">Mod</asp:ListItem>
                     <asp:ListItem Value="2">Admin</asp:ListItem>
                  </asp:DropDownList>
               </div>
               <!-- form -->
               <div class="form-group">
                  <label>Tên Đăng Nhập:</label>
                  <div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                     </div>
                     <asp:TextBox ID="taikhoan" onKeyUp="kttk()" ClientMode="Static"  runat="server" class="form-control" ></asp:TextBox>
                     <script>
                         function kttk() {
                             var tk = document.getElementById("<%=taikhoan.ClientID%>");
                            var ltk = tk.value.replace(/\s/g, '').toLowerCase();
                            tk.value = ltk;
                        }
                     </script>
                     <!-- <input type="text" name="taikhoan"  class="form-control" /> -->
                  </div>
                  <!-- /.input group -->
               </div>
               <!-- /.form group -->
               <!-- form -->
               <div class="form-group">
                  <label>Mật Khẩu:</label>
                  <div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                     </div>
                     <asp:TextBox ID="matkhau" onKeyUp="ktpass()" ClientMode="Static" runat="server" class="form-control"></asp:TextBox>
                     <script>
                        function ktpass() {
                             var tk = document.getElementById("<%=matkhau.ClientID%>");
                             var ltk = tk.value.replace(/\s/g, '');
                             tk.value = ltk;
                         }
                     </script>

                     <!--    <input type="text" name="matkhau"  class="form-control" /> -->
                  </div>
                  <!-- /.input group -->
               </div>
               <!-- /.form group -->
               <asp:Button ID="Them" Text="Thêm người dùng" runat="server" class="btn btn-danger" OnClick="Them_Click"/>
               <!-- <input value="Thêm người dùng" class="btn btn-danger"  name="Them" type="submit" /> -->
            </div>
         </div>
      </div>
   </div>
   <!--/. container-fluid -->
</section>