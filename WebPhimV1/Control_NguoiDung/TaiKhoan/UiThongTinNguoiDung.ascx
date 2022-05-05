<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThongTinNguoiDung.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TaiKhoan.UiThongTinNguoiDung" %>
<%@ Register Src="~/Control_NguoiDung/TaiKhoan/UiThuVienDoc.ascx" TagPrefix="uc1" TagName="UiThuVienDoc" %>



<script>
    document.title = " Thông Tin Người Dùng";
</script>

<!-- noi dung -->
<div class="main-content ">
   <section  style="margin-top: 60px">
      <div class="container-fluid">
         <!-- noi dung -->
         <div class="row" style="width: 100%; margin-right: 0px; margin-left: 0px ">
            <div class="col-sm-4 ">
               <div class="d-flex justify-content-center">
                  <div class="avatar-nguoidung">
                     <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" class="img-avatar" width="250" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= NguoiDungs.img_user %>" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/avatar.jpg';" />
                     <strong><%= NguoiDungs.ten_dangnhap %></strong>
                     <a href="<%=WebPhimV1.Code.HeThong.url() %>/taikhoan/capnhat" class="edit-icon text-primary"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Edit</a>
                  </div>
               </div>
            </div>
            <div class="col-sm-8 ">
               <ul class="list-group ">
                  <li class="list-group-item">
                     <div class="lis_Phim"><strong>Id tài khoản:</strong>&nbsp;#<%= NguoiDungs.id_user %> </div>
                  </li>
                  <li class="list-group-item">
                     <div class="lis_Phim"><strong>Người dùng:</strong>&nbsp; <%= NguoiDungs.fullname %> </div>
                  </li>
                  <li class="list-group-item">
                     <div class="lis_Phim"><strong>Mail:</strong>&nbsp;<%= NguoiDungs.mail %></div>
                  </li>
                  <li class="list-group-item">
                     <div class="lis_Phim"><strong>Coin:</strong>&nbsp;<%=string.Format("{0:#,##0}", Convert.ToDecimal(NguoiDungs.coin))  %></div>
                  </li>
                  <li class="list-group-item">
                     <div class="lis_Phim"><strong>Ngày đăng ký:</strong>&nbsp; <%= NguoiDungs.created_at.ToString("HH:mm:ss MM/dd/yyyy ") %></div>
                  </li>
               </ul>
            </div>
         </div>
         <!-- noi dung -->
         <div class="row" style="margin-top: 60px">
            <div class="col-sm-9 epi-box">
               <!--goi thu vien doc-->
               <uc1:UiThuVienDoc runat="server" ID="UiThuVienDoc" />
            </div>
            <div class=" col-sm-3 epi-box">
               <!-- tong doanh thu -->
               <div style="padding: 10px" class="iq-main-header d-flex align-items-center justify-content-between">
                  <h4 class="main-title"><i class="fa-solid fa-clock-rotate-left"></i>&nbsp;Lịch sử giao dịch</h4>
               </div>
               <!-- phan noi dung -->
               <div>
                  <div class="row" style=" margin-left: 0px;">
                     <div class="list-binhluan_index" >
                        <%int tongDoanhthu = 0;
                           for (int a = 0; a < LogPhim.Count; a++)
                           {
                           %>
                        <%try {
                           if (int.Parse(LogPhim[a].coin) != 0)
                           { 
                           %>
                        <div class="row" style=" margin-left: 0px;">
                           <div class="col-8">
                              <p>
                                 <% 
                                    if (LogPhim[a].id_user_nhan == NguoiDungs.id_user)
                                    {
                                        tongDoanhthu = tongDoanhthu + Convert.ToInt32(LogPhim[a].coin);
                                    }
                                           %>
                              <p>
                                 Id Chuyển:&nbsp;<%= Convert.ToInt32(LogPhim[a].id_user_chuyen)%>
                              </p>
                              <p>
                                 <%= "Coin:&nbsp;" + string.Format("{0:#,##0}", Convert.ToDecimal(LogPhim[a].coin))  %>
                              </p>
                           </div>
                           <div class="col-4" style="text-align: right; font-size: 60%">
                              <%= formatTime(LogPhim[a].created_at.ToString()) %>
                           </div>
                           <div style=" font-size: 80%">
                              <%= LogPhim[a].ghichu%>
                           </div>
                        </div>
                        <hr>
                        <% } } catch{} %>
                        <% } %>    
                     </div>
                  </div>
                  <div class="alert alert-danger" role="alert">
                     Thu:&nbsp;<%=string.Format("{0:#,##0}", Convert.ToDecimal(Thu())) %>|
                     Chi:&nbsp;<%=string.Format("{0:#,##0}", Convert.ToDecimal(Chi())) %>
                  </div>
               </div>
               <!-- tong doanh thu -->
               <div style="padding: 10px" class="iq-main-header d-flex align-items-center justify-content-between">
                  <h4 class="main-title"><i class="fa-solid fa-comment-text"></i>&nbsp;Bình luận gần đây</h4>
               </div>
               <!-- phan noi dung -->
               <div class="maunen_div">
                  <div class="row " style=" margin-left: 0px;">
                     <div class="list-binhluan_index">
                        <% for (int a = 0; a < BinhLuanNguoiDung.Count; a++)
                           {
                           %>
                        <div class="row" style=" margin-left: 0px;">
                           <div class="col-8">
                              <p>
                                 <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= NguoiDungs.img_user %>"  class="avatar" width="40" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" />
                                 <%= NguoiDungs.fullname %>
                              </p>
                           </div>
                           <div class="col-4" style="text-align: right; font-size: 60%">
                              <%=WebPhimV1.Code.HeThong.TinhThoiGian(BinhLuanNguoiDung[a].created_at) %>
                           </div>
                           <div style=" font-size: 70%">
                              <a href="../Phim/<%=LinkRaw(BinhLuanNguoiDung[a].id_phim) + "-" + BinhLuanNguoiDung[a].id_phim%>">
                              <%= tenPhim(BinhLuanNguoiDung[a].id_phim)%>
                              </a>
                           </div>
                           <div class="txt-binhluan">
                              <%if (BinhLuanNguoiDung[a].noidung_cmt.Length >= 35)
                                 {
                                      %>
                              <div class="show-less-div-2">
                                 <%= WebPhimV1.Code.HeThong.TuNhayCam(BinhLuanNguoiDung[a].noidung_cmt)  %> 
                              </div>
                              <% }else{ %>
                              <%= WebPhimV1.Code.HeThong.TuNhayCam(BinhLuanNguoiDung[a].noidung_cmt) %>
                              <%  } %>
                           </div>
                           <a onclick="return confirm('Bạn có chắc muốn bình luận này')" href="?XoaBinhLuan=<%= BinhLuanNguoiDung[a].id_cmt %>" style="font-size: 15px;">Xoá bình luận</a>
                        </div>
                        <% } %>    
                     </div>
                  </div>
               </div>
               <!-- end phan noi dung -->
            </div>
         </div>
         <!-- noi dung -->
      </div>
   </section>
</div>