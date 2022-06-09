﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiTimKiemPhim.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.UiTimKiemPhim" %>
<form></form>
<div class="main-content">
<section class="movie-detail container-fluid "  style="margin-top:80px">
   <div class="row ">
      <!-- noi dung thanh ben trai -->
      <div class="col-sm-9">
         <section class="main-content">
            <div class="search-2 epi-box">
               <form method="get" action="#">
                  <input type="hidden" name="page" value="0" >
                  <input type="text" name="TenPhim" placeholder="Tên phim hoặc Tác giả"> 
                  <button type="submit">Tìm</button>  
               </form>
            </div>
         </section>
         <section  class="main-content">
            <div class="container epi-box">
               <div class="col-sm-12 overflow-hidden">
                  <div class="iq-main-header d-flex align-items-center justify-content-between">
                     <h4 class="main-title">
                        <!--tim kiem theo ten Phim -->            
                        <% if (timKiemTheoTen != null && timKiemCoin == null && timKiemTheLoais == null && timKiemTheLoai == null) { %>
                        Tìm kiếm : <%=namePhim %>  
                        <%} %>
                        <!--tim kiem theo ten Phim --> 
                        <!--tim kiem theo the loai --> 
                        <% if (timKiemTheoTen == null && timKiemCoin == null && timKiemTheLoais == null && timKiemTheLoai != null)
                           { %>
                        <%=GetNameTL(Convert.ToInt32(Request.QueryString["TheLoai"])) %>:&nbsp;
                        <%=GetMotaTL(Convert.ToInt32(Request.QueryString["TheLoai"])) %>
                        <% } %>
                        <!--tim kiem theo the loai -->
                        <!--tim kiem theo the loais --> 
                        <% if (timKiemTheoTen == null && timKiemCoin == null && timKiemTheLoais != null && timKiemTheLoai == null)
                           { %>
                        <%=Request.QueryString["TenTL"] %>
                        <%   } %>
                        <!--tim kiem theo the loais --> 
                        <!--tim kiem theo coin--> 
                        <%   if (timKiemTheoTen == null && timKiemCoin != null && timKiemTheLoais == null && timKiemTheLoai == null)
                           { %>
                        Coin : Giao động:&nbsp;<%=string.Format("{0:#,##0}", Convert.ToDecimal(min))  %>-<%=string.Format("{0:#,##0}", Convert.ToDecimal(max))  %>
                        <%} %>
                        <!--tim kiem theo coin-->                        
                     </h4>
                  </div>
                  <div class="favorites-contens">
                  </div>
                  <!-- noi dung -->
                  <div class="row" style="    margin-bottom: 5%;">
                     <%    if (timKiem != null) { 
                        for (int a = 0; a < timKiem.Count; a++) // tim kiem tat ca
                        { %>
                     <div class="col-6 col-sm-4 col-md-4 col-lg-4 col-xl-3">
                        <div class="epi-box">
                           <div class="epi-img position-relative">
                              <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" style="height: 201px;max-height: 200px;width: 100%;" src="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/public/img/Phim/<%= timKiem[a].img_phim%>" class="img-fluid  " alt="">
                              <div class="episode-play-info">
                                 <div class="episode-play">
                                    <a href="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/Phim/<%= timKiem[a].link_raw + "-" + timKiem[a].id_phim%>">
                                    <i class="ri-play-fill"></i>
                                    </a>
                                 </div>
                              </div>
                           </div>
                           <div class="epi-desc p-3">
                              <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= timKiem[a].link_raw + "-" + timKiem[a].id_phim%>">
                                 <h6 class="epi-name text-white mb-0">    <%= WebPhimV1.Code.Phim.RutGon(timKiem[a].ten_phim, 30) %>
                                 </h6>
                              </a>
                           </div>
                        </div>
                     </div>
                     <% } %>
                     <%if (timKiem.Count == 0)
                        { %> 
                     <center>
                        <h3>Không tìm thấy nội dung cần tìm !!!</h3>
                     </center>
                     <%} 
                        } %>  
                     <!------------- _>
                        <!-- ko tim thay noi dung gi -->
                     <%if (timKiemTheLoai == null && timKiemTheLoai == null && timKiemTheLoais == null && timKiemTheoTen == null && timKiem == null && timKiemCoin == null)
                        {   %>
                     <center style="font-size: 30px;margin: auto;">Bạn cần tìm ?</center>
                     <%} %>
                     <!-- noi dung -->
                  </div>
                  <!-- phan trang -->
                  <% int CheckPT = 0; if (Request.QueryString["page"] != null) {CheckPT = 1;} %>
                  <%= WebPhimV1.Code.HeThong.PhanTrang(CheckPT, SumPage, HttpContext.Current.Request.Url.PathAndQuery, Convert.ToInt32(Request.QueryString["page"])) %>
                  <!-- phan trang end--> 
               </div>
         </section>
         </div>
         <!--end noi dung thanh ben trai -->
         <!-- noi dung thanh ben phai -->
         <div class="col-sm-3">
            <!-- khung lọc thể loại -->
            <section  class="main-content">
               <div class="container epi-box">
                  <div class="iq-main-header d-flex align-items-center justify-content-between">
                     <h4 class="main-title">
                        <i class="fa-solid fa-coins"></i>&nbsp; Tìm kiếm theo coin    
                     </h4>
                  </div>
                  <!-- end thanh tieu de --> 
                  <div class="form-group">
                     <div  style="display: inline-flex;">
                        <input type="number" id="min"class="form-control"  placeholder="Giá thấp nhất">
                        <input type="number"  id="max" class="form-control" placeholder="Giá cao nhất">
                     </div>
                     <button type="button" class="btn" style="margin: auto;background: var(--iq-primary); color: white" onclick="TimCoin()">Tìm</button>
                  </div>
               </div>
            </section>
            <section  class="main-content">
               <div class="container epi-box">
                  <div class="iq-main-header d-flex align-items-center justify-content-between">
                     <h4 class="main-title">
                        <i class="fa-solid fa-file-certificate"></i>&nbsp;Tìm kiếm nhiều thể loại    
                     </h4>
                  </div>
                  <!-- end thanh tieu de --> 
                  <div class="list-theloai-timkiem" style="max-height: 350px; height: auto" >
                     <%if (TheLoai != null) { 
                        for (int a = 0; a < TheLoai.Count; a++)
                        { %>
                     <label class="container_checkbox" title="<%= TheLoai[a].mota_theloai %>">
                     &nbsp;<%= TheLoai[a].ten_theloai %>
                     <input type="checkbox"  name="<%=TheLoai[a].ten_theloai %>" value="<%= TheLoai[a].id_theloai %>"  >
                     <span class="checkmark" ></span>
                     </label>
                     <% } }%> 
                  </div>
                  <input type="button" onclick="LocTL()"  value="Lọc thể loại" class="btn btn-danger" style=" margin-top: 5%;    margin-bottom: 5%; background: var(--iq-primary); color: white"/>
                  <!--tim kiem nhieu the loai -->
               </div>
            </section>
         </div>
         <!--end noi dung thanh ben phai -->
      </div>
</section>
</div>
<script>
    var array_tenTL = []; function getCheckedCheckboxesFor() { var b = document.querySelectorAll('input[type="checkbox"]:checked'), a = []; Array.prototype.forEach.call(b, function (c) { a.push(c.value); array_tenTL.push(c.name) }); return a } function LocTL() { window.location.href = "timkiemPhim?TheLoai=" + getCheckedCheckboxesFor() + "&page=0&&TheLoais=true&TenTL=" + array_tenTL } function TimTL(a) { window.location.href = "timkiemPhim?TheLoai=" + a + "&page=0&TheLoais=false" } function TimCoin() { min = document.getElementById("min").value; max = document.getElementById("max").value; if (min == "" && max == "") { min = 0; max = 0 } if (min == "" && max != "") { min = 0 } if (min != "" && max == "") { max = min } if (min > 99999999) { min = 99999999 } if (max > 99999999) { max = 99999999 } window.location = "timkiemPhim?coin=true&min=" + min + "&max=" + max + "&page=0" };
</script>