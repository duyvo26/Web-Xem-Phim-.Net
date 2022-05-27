<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThongTinPhim.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TrangPhim.UiThongTinPhim" %>
<script>
    document.title = "Phim <%=infoPhim.ten_phim %>";
</script>
<!-- Banner Start -->
<style>
   .iq-main-slider {
   position: inherit;
   }
</style>
<section class="banner-wrapper iq-main-slider" style="background-size: cover; background-position: top; background-image: url(<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%=infoPhim.img_phim %>)">
   <div class="banner-caption">
      <!--
         <ul class="list-inline p-0 m-0 share-icons music-play-lists">
            <li class="share">
               <span><i class="ri-star-fill"></i></span>
               <div class="share-box" style="width: 250px;">
                  <div class="d-flex align-items-center">
                     <center>
                        <%= DanhGia %> từ <%= NguoiDanhGia %> Lượt đánh giá
                        <br>
                        <%
            double DG = DanhGia;
            //DG = Math.Truncate(DG);
            for (int i = 0; i < 5; i++) { %>
                        <% if (ListTap_Phim != null)
            { %>
                        <a class="vote" href="?danhgia=<%=i+1 %>"      <% if (Request.Cookies["Log"] == null){ %> onclick="alert('Vui lòng đăng nhập'); return false;" <% } %> >
                        <% } %>
                        <%  if (i >= DG)
            { %>
                        <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="../../Public/img/www/top-icon/star-shape.png" width="25"/>  
                        <% } else if(DG > i && DG < i + 1) {%>
                        <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="../../Public/img/www/top-icon/rating.png" width="25"/>  
                        <% } else { %>
                        <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="../../Public/img/www/top-icon/astar.png" width="25" />
                        <% } %>
                        </a>
                        <%  }
            %>
                     </center>
                  </div>
               </div>
            </li>
         </ul> -->
   </div>
</section>
<!-- Banner end -->
<!-- Main -->
<div  class=" main-content" >
   <section class="movie-detail container-fluid">
      <div class="row">
         <div class="col-lg-12">
            <div class="trending-info g-border">
               <!-- nut xem -->
               <div class="position-relative mb-4">
                  <!-- -->
                  <% if (checkthuvien != null && WebPhimV1.Code.NguoiDung.CheckLogin() == true) { %>
                  <a href="<%= infoPhim.link_raw + '-' + infoPhim.id_phim + '/' + GetDangDoc() %>" style="color: white">
                     <div class="d-flex align-items-center">
                        <div class="play-button">
                           <i class="fa fa-play"></i>
                        </div>
                        <h4 class="w-name text-white font-weight-700">Tiếp tục Xem</h4>
                     </div>
                  </a>
                  <% } %>
                  <!-- -->
                  <!-- -->
                  <% if (infoPhim.id_user == NguoiDungs.id_user && checkthuvien == null && WebPhimV1.Code.NguoiDung.CheckLogin() == true)  { %>
                  <div class="d-flex align-items-center">
                     <div class="play-button" onclick="xemPhim();">
                        <i class="fa fa-play"></i>
                     </div>
                     <h4 class="w-name text-white font-weight-700">Lưu phim người đăng </h4>
                  </div>
                  <% } %>
                  <!-- -->
                  <!-- -->
                  <% if (int.Parse(infoPhim.coin_phim) == 0 && infoPhim.id_user != NguoiDungs.id_user && checkthuvien == null && WebPhimV1.Code.NguoiDung.CheckLogin() == true)
                     { %>
                  <div class="d-flex align-items-center">
                     <div class="play-button" onclick="muaPhim();">
                        <i class="fa fa-play"></i>
                     </div>
                     <h4 class="w-name text-white font-weight-700">Lưu phim </h4>
                  </div>
                  <% } %>
                  <!-- -->
                  <!-- -->
                  <% if (checkthuvien == null && infoPhim.id_user != NguoiDungs.id_user && int.Parse(infoPhim.coin_phim) > 0 && WebPhimV1.Code.NguoiDung.CheckLogin() == true)
                     { %>
                  <div class="d-flex align-items-center">
                     <div class="play-button" onclick="muaPhim();">
                        <i class="fa fa-play"></i>
                     </div>
                     <h4 class="w-name text-white font-weight-700">Mua phim</h4>
                  </div>
                  <% } %>
                  <!-- -->
                  <!-- -->
                  <% if (int.Parse(infoPhim.coin_phim) > 0  && WebPhimV1.Code.NguoiDung.CheckLogin() != true)
                     { %>
                  <div class="d-flex align-items-center">
                     <div class="play-button" onclick="muaPhim_noLogin();">
                        <i class="fa fa-play"></i>
                     </div>
                     <h4 class="w-name text-white font-weight-700">Mua phim</h4>
                  </div>
                  <% } %>
                  <% if (Request.Cookies["Log"] == null && Convert.ToInt32(infoPhim.coin_phim) == 0)
                     { %> 
                  <div class="d-flex align-items-center">
                     <a href="<%=WebPhimV1.Code.HeThong.url() %>/phim/<%=infoPhim.link_raw %>-<%=infoPhim.id_phim %>/<%=Tap_PhimDau.id_tap_phim  %>">
                        <div class="play-button" >
                           <i class="fa fa-play"></i>
                        </div>
                        <h4 class="w-name text-white font-weight-700">Xem ngay</h4>
                     </a>
                  </div>
                  <% } %>
               </div>
               <!-- end nut them -->
               <h4 class="trending-text text-uppercase mt-0"><%=infoPhim.ten_phim %></h4>
               <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true)
                  { %>
               <% if (WebPhimV1.Theme.NguoiDung.quyen_han > 0)
                  { %>
               <a href="<%=WebPhimV1.Code.HeThong.url()%>/cp-admin/Phim/capnhat-<%= infoPhim.id_phim%>" class="edit-icon text-primary"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Thông tin phim</a>
               <% }
                  } %>
               <div>
                  <% for (int i = 0; i < 5; i++) { %>
                  <% if (ListTap_Phim != null)
                     { %>
                  <a class="vote" href="?danhgia=<%=i+1 %>"  <% if (Request.Cookies["Log"] == null){ %> onclick="alert('Vui lòng đăng nhập'); return false;" <% } %> >
                  <% } %>
                  <%  if (i >= DG)
                     { %>
                  <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="../../Public/img/www/top-icon/star-shape.png" width="25"/>  
                  <% } else if(DG > i && DG < i + 1) {%>
                  <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="../../Public/img/www/top-icon/rating.png" width="25"/>  
                  <% } else { %>
                  <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="../../Public/img/www/top-icon/astar.png" width="25" />
                  <% } %>
                  </a>
                  <%  } %>
                  &nbsp;&nbsp;<%= DanhGia %> từ <%= NguoiDanhGia %> Lượt đánh giá
               </div>
               <ul style="margin-top: 10px" class="movie-content">
                  Thể loại:&nbsp;
                  <% for (int i = 0; i < PhimTL.Count; i++)
                     { %>
                  <a  class="btn-outline-<%if(i % 2 == 0){ %>danger<%}else{%>info<%} %>" href="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/timkiemPhim?TheLoai=<%=PhimTL[i].id_theloai%>&page=0&TheLoais=false"><%=PhimTL[i].ten_theloai%></a>&nbsp;
                  <% } %>
               </ul>
               <div class=" text-white text-detail">
                  <% if (Int32.Parse(infoPhim.coin_phim) != 0)
                     { %>
                  <li class="ml-3">
                     <i class="fa fa-credit-card" aria-hidden="true"></i> <%=infoPhim.coin_phim %>&nbsp;coin
                  </li>
                  <% } %>
                  <li class="ml-3">Tác giả:&nbsp;
                     <a href="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/timkiemPhim?page=0&TenPhim=<%=infoPhim.tac_gia%>">
                     <%=infoPhim.tac_gia %>
                     </a>
                  </li>
                  <li class="ml-3">Quốc gia:&nbsp;
                     <a href="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/timkiemPhim?page=0&TenPhim=<%=infoPhim.quoc_gia%>">
                     <%=infoPhim.quoc_gia %>
                     </a>
                  </li>
                  <li class="ml-3">Năm sản xuất:&nbsp;
                     <a href="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/timkiemPhim?page=0&TenPhim=<%=infoPhim.nam_sx%>">
                     <%=infoPhim.nam_sx %>
                     </a>
                  </li>
                  <li class="ml-3">Cập nhật lần cuối:&nbsp;
                     <%= WebPhimV1.Code.HeThong.TinhThoiGian(infoPhim.updated_at) %>
                  </li>
                  <li class="ml-3">Số tập:&nbsp;
                     <%= SumTap_Phim %>
                  </li>
                  <li class="ml-3">Lượt xem:&nbsp;<%=LuotXem %>&nbsp;<i class="fa fa-eye" aria-hidden="true"></i>
                  </li>
               </div>
            </div>
         </div>
      </div>
   </section>
   <section class="container-fluid seasons">
      <ul class="trending-pills d-flex nav nav-pills align-items-center text-center s-margin" role="tablist">
         <li class="nav-item">
            <a class="nav-link active show" data-toggle="pill" href="#danhsachTap_Phim" role="tab" aria-selected="false">Danh sách tập</a>
         </li>
         <li class="nav-item">
            <a class="nav-link " data-toggle="pill" href="#tomtatphim" role="tab" aria-selected="true">Tóm tắt phim</a>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#binhluan" role="tab" aria-selected="false">Bình luận</a>
         </li>
      </ul>
      <div class="tab-content">
         <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true)
            { %>
         <% if (WebPhimV1.Theme.NguoiDung.quyen_han > 0)
            { %>
         <a href="<%=WebPhimV1.Code.HeThong.url()%>/cp-admin/tap-phim/danhsach-<%= infoPhim.id_phim%>" class="text-primary"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Danh sách tập phim</a>
         <% }
            } %>
         <!-- danh sach tap -->
         <div id="danhsachTap_Phim" class="tab-pane fade active show" role="tabpanel">
            <div class="block-space">
               <div class="row">
                  <% if (ListTap_Phim != null) { 
                     for (int a = 0; a < ListTap_Phim.Count; a++)
                     {
                     %>
                  <!-- item -->
                  <div class="col-1-5 col-md-6 iq-mb-30">
                     <div class="epi-box">
                        <div class="epi-img position-relative">
                           <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" style="height: 201px;max-height: 200px;width: 100%;"  src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%= ImgPhim(ListTap_Phim[a].id_phim) %>" class="img-fluid img-zoom" alt="">
                           <div class="episode-play-info">
                              <div class="episode-play">
                                 <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=infoPhim.link_raw +"-"+ infoPhim.id_phim +"/" + ListTap_Phim[a].id_tap_phim %>#video">
                                 <i class="ri-play-fill"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                        <div class="epi-desc p-3">
                           <div class="d-flex align-items-center justify-content-between">
                              <span class="text-primary"><%=WebPhimV1.Code.HeThong.TinhThoiGian(ListTap_Phim[a].updated_at) %></span>
                           </div>
                           <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=infoPhim.link_raw +"-"+ infoPhim.id_phim +"/" + ListTap_Phim[a].id_tap_phim %>#video">
                              <h6 class="epi-name text-white mb-0"><%=ListTap_Phim[a].ten_tap_phim %>
                              </h6>
                           </a>
                        </div>
                     </div>
                  </div>
                  <!-- item end -->
                  <% } }else{ %>
                  <center>
                     <h1>
                        <div id="noti_tap_phim"></div>
                     </h1>
                  </center>
                  <% }  %>
               </div>
               <!-- phan trang -->
               <% int CheckPT = 0; if (Request.QueryString["page"] != null) {CheckPT = 1;} %>
               <%= WebPhimV1.Code.HeThong.PhanTrang(CheckPT, SumPage, HttpContext.Current.Request.Url.PathAndQuery, Convert.ToInt32(Request.QueryString["page"])) %>
               <!-- phan trang end--> 
            </div>
         </div>
         <!-- end danh sach tap -->
         <!-- binh luan -->
         <div id="binhluan" class="tab-pane fade " role="tabpanel">
            <div class="block-space">
               <div class="epi-box">
                  <!-- phan noi dung -->
                  <div class="list_Phim">
                     <div class="list-binhluan" style=" max-height: 700px;">
                        <%for (int a = 0; a < DSComment.Count; a++)
                           {
                           %>
                        <div class="row">
                           <div class="col-8">
                              <p title="#<%=DSComment[a].id_user %>">
                                 <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= DSComment[a].img_user %>" class="avatar" width="40" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" />
                                 <%= DSComment[a].fullname %>
                                 <%=WebPhimV1.Code.NguoiDung.HuyHieuUser(GetQuyenHan(Convert.ToInt32(DSComment[a].id_user))) %>
                                 <%if(infoPhim.id_user == DSComment[a].id_user){ %>
                                 <span class="badge badge-warning">Người đăng</span>
                                 <%} %>
                              </p>
                           </div>
                           <div class="col-4" style="text-align: right; font-size: 50%">
                              <%=WebPhimV1.Code.HeThong.TinhThoiGian(DSComment[a].created_at) %>
                           </div>
                           <div style="font-size:10px">#<%=DSComment[a].id_cmt %>&emsp; </div>
                           <div class="txt-binhluan">
                              <a href="<%= "../Phim/" + LinkRaw(DSComment[a].id_phim) + "-"+ DSComment[a].id_phim + "/"+  DSComment[a].id_tap_phim%>#binhluan">
                                 <% String NoiDung = "";
                                    if (DSComment[a].status_ != 1)
                                      {
                                          NoiDung = WebPhimV1.Code.HeThong.TuNhayCam(DSComment[a].noidung_cmt);
                                      }
                                      else
                                      {
                                          NoiDung = "Bình luận bị ẩn bởi quản trị viên!"; 
                                      }
                                         
                                           %>
                                 <%if (NoiDung.Length >= 45)
                                    {%>
                                 <div class="show-less-div-2">
                                    <%= WebPhimV1.Code.HeThong.TuNhayCam(NoiDung)  %> 
                                 </div>
                                 <% }else{ %>
                                 <%= WebPhimV1.Code.HeThong.TuNhayCam(NoiDung) %>
                                 <%  } %>
                              </a>
                           </div>
                        </div>
                        <% } %>    
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- end binh luan -->
         <!-- tom tac -->
         <div id="tomtatphim" class="tab-pane fade " role="tabpanel">
            <div class="block-space">
               <div class="row">
                  <div class="container">
                     <div class="d-flex align-items-center series mb-4">
                        <span class="text-gold ml-3">Giới thiệu</span>
                     </div>
                     <div style="    margin-left: 5%;">
                        <%= HttpUtility.HtmlDecode(infoPhim.tomtat_phim) %>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- end tom tac -->
      </div>
   </section>
   <section>
      <div  class="container-fluid seasons">
         <ul class="trending-pills d-flex nav nav-pills align-items-center text-center s-margin" role="tablist">
            <li class="nav-item">
               <a class="nav-link active show" data-toggle="pill" href="#" role="tab" aria-selected="false">Phim cùng thể loại</a>
            </li>
         </ul>
      </div>
      <!-- goi y the loai -->
      <div id ="HintTLS"></div>
      <script>
          $(document).ready(function () {
              $.ajax({
                  url: '/Code/ashx/LoadHintPhims.ashx',
                  success: function (data) {
                      document.getElementById('HintTLS').innerHTML = data.str_html;
                  }
              });
          });
      </script>
      <script>
          window.addEventListener("load", function () {
              setTimeout(function () {

                  $(".owl-carousel").owlCarousel({
                      autoplay: true,
                      autoplayTimeout: 2000,
                      autoplayHoverPause: true,
                      loop: true,
                      margin: 10,
                      responsiveClass: true,
                      responsive: {
                          0: {
                              items: 1,
                              nav: false,
                              dots: true,
                              margin: 0
                          },
                          600: {
                              items: 3,
                              nav: false,
                              dots: true,
                              margin: 25
                          },
                          768: {
                              items: 4,
                              nav: false,
                              dots: true,
                              margin: 25
                          }
                      }
                  });
              }, 2000)
          })
      </script>
      <!-- end goi y the loai -->
   </section>
</div>
<!-- end Main -->
<form></form>
<form method ="POST" id="MuaPhim">
   <input name="MuaPhim" value="true" type="hidden"/>
</form>
<form method ="POST" id="XemPhim">
   <input name="Nguoidung" value="true" type="hidden"/>
   <input name="MuaPhim" value="true" type="hidden"/>
</form>
<!-- end binh luan -->
<script type="text/javascript">
    function call_tap_phim() {
        document.getElementById("noti_tap_phim").innerHTML = "Đang tải danh sách tập phim ...";
        window.location.href = '?LoadTap_Phim=true#danhsachTap_Phim'
    }



    function muaPhim_noLogin() {
        const coin_ND = '<%=WebPhimV1.Code.NguoiDung.CheckLogin() %>';
        if (coin_ND == "False") {
            alert("Bộ phim này cần coin để có thể xem \n Vui lòng đăng nhập để tiếp tục !");
            window.location = '../dangnhap';
        }
    }

    function muaPhim() {
        const coin_ND = '<%= NguoiDungs.coin %>';
       const coin_TR = '<%= Convert.ToInt64(infoPhim.coin_phim) %>';
       var name_TR = '<%= infoPhim.ten_phim %>';
       var mess = "";
       if (coin_TR > 0) {
           if (coin_ND - coin_TR >= 0) {
               if (coin_TR > 0) {
                   mess = "phim: " + name_TR + " Đang chờ bạn mua \n Bạn có chắc muốn mua ? \n Khi mua có cơ hội nhận được 1-10% của số coin của bộ phim. "
               } else {
                   mess = "phim: " + name_TR + " Đang chờ bạn mua \n Bạn có chắc muốn mua ? ";
               }
               var r = confirm(mess);
               if (r == !0) {
                   document.getElementById("MuaPhim").submit()
               }
           } else {
               alert("Số coin không đủ, vui lòng nạp thêm để tiến hành Xem phim !")
           }
       } else {
           document.getElementById("MuaPhim").submit()
       }
   };

   function xemPhim() {
       document.getElementById("XemPhim").submit()
   };


</script>