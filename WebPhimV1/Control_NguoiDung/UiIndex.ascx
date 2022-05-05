<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiIndex.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.UiIndex" %>
<%@ Register Src="~/Control_NguoiDung/Part/TopLuotXem_HanhDong.ascx" TagPrefix="uc1" TagName="TopLuotXem_HanhDong" %>
<%@ Register Src="~/Control_NguoiDung/Part/TopLuotXem_HaiHuoc.ascx" TagPrefix="uc1" TagName="TopLuotXem_HaiHuoc" %>
<%@ Register Src="~/Control_NguoiDung/Part/TopLuotXem_PhimDienAnh.ascx" TagPrefix="uc1" TagName="TopLuotXem_PhimDienAnh" %>


<script>
    document.title = "Trang Chủ ";
</script>
<!-- Slider Start -->
<section id="home" class="iq-main-slider p-0">
   <div id="home-slider" class="slider m-0 p-0">
      <%
         for (int i = 0; i < listGoiyDoc.Count(); i++)
         {
             if (Convert.ToInt32(listGoiyDoc[i].status_) != 0)
             { %>
      <!-- item -->
      <div class="slide slick-bg s-bg-1"  style="object-fit: cover; background-image: url(<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%= listGoiyDoc[i].img_phim %>);}">
         <div class="container-fluid position-relative h-100">
            <div class="slider-inner h-100">
               <div class="row align-items-center  h-100">
                  <div class="col-xl-6 col-lg-12 col-md-12">
                     <a href="javascript:void(0);">
                        <div class="channel-logo" data-animation-in="fadeInLeft" data-delay-in="0.5">
                           <h4><i class="fa-solid fa-lightbulb-on"></i>&nbsp;Gợi ý cho bạn</h4>
                        </div>
                     </a>
                     <h3 class="slider-text title text-uppercase" data-animation-in="fadeInLeft"
                        data-delay-in="0.6"><% RutGon_TieuDe(listGoiyDoc[i].ten_phim, 30); %></h3>
                     <div class="d-flex align-items-center r-mb-23" data-animation-in="fadeInUp" data-delay-in="1.2">
                        <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= listGoiyDoc[i].link_raw + "-" +listGoiyDoc[i].id_phim %>" class="btn btn-hover"><i class="fa fa-play mr-2"
                           aria-hidden="true"></i>Xem</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- item -->
      <% }
         } %>
   </div>
   <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 44 44" width="44px" height="44px" id="circle"
         fill="none" stroke="currentColor">
         <circle r="20" cy="22" cx="22" id="test"></circle>
      </symbol>
   </svg>
</section>
<!-- Slider End -->
<!-- MainContent -->
<div class="main-content">
   <section id="topluotxem">
      <div class="container-fluid">
         <div class="row">
            <div class="col-sm-12 overflow-hidden">
               <div class="iq-main-header d-flex align-items-center justify-content-between">
                  <h4 class="main-title"><a href="#topluotxem"><i class="fa fa-trophy" aria-hidden="true"></i>&nbsp;Top Lượt Xem</a></h4>
               </div>
               <div class="favorites-contens">
                  <ul class="favorites-slider list-inline row p-0 mb-0">
                     <% if (LuotXem != null)
                        {
                            for (int a = 0; a < LuotXem.Count; a++)
                            { %>
                     <!-- item -->
                     <li class="slide-item">
                        <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= LinkRaw(Convert.ToInt32(LuotXem[a].id_phim)) + "-" + LuotXem[a].id_phim %>">
                           <div class="epi-box">
                              <div class="epi-img position-relative">
                                 <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" style="height: 201px;max-height: 200px;width: 100%;" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%=ImgPhim(Convert.ToInt32(LuotXem[a].id_phim)) %>" class="img-fluid img-zoom" alt="">
                                 <div class="episode-number">Top&nbsp;<%=a+1 %>&nbsp;</div>
                              </div>
                              <div class="block-description">
                                 <div style=" background: #000000f2;">
                                    <%=tenPhim(Convert.ToInt32(LuotXem[a].id_phim)) %>
                                 </div>
                                 <div class="hover-buttons">
                                    <span class="btn btn-hover">
                                    <i class="fa fa-play mr-1" aria-hidden="true"></i>
                                    Play Now
                                    </span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </li>
                     <!-- item -->
                     <% }
                        } %>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- danh sach phim -->
   <section id="danhsachphim">
      <div class="container-fluid">
         <div class="col-sm-12 overflow-hidden">
            <div class="iq-main-header d-flex align-items-center justify-content-between">
               <a href="<%=WebPhimV1.Code.HeThong.url() %>/timkiemPhim?xemthem=true&page=0" class="edit-icon text-primary" style="top: 0px;"><i class="fa-solid fa-share-all"></i>&nbsp;Xem tất cả</a>
               <h4 class="main-title"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;Danh Sách Phim </h4>
            </div>
            <div class="favorites-contens">
               <div class="row">
                  <% if (DanhSachPhim != null)
                     {
                         for (int a = 0; a < DanhSachPhim.Count; a++)
                         {  %>
                  <!-- item -->
                  <div class="col-6 col-sm-4 col-md-4 col-lg-4 col-xl-3">
                     <div class="epi-box">
                        <div class="epi-img position-relative">
                           <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" style="height: 201px;max-height: 200px;width: 100%;"  src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%= DanhSachPhim[a].img_phim %>" class="img-fluid img-zoom" alt="">
                           <div class="episode-number"><%= WebPhimV1.Code.HeThong.TinhThoiGian(DanhSachPhim[a].updated_at) %></div>
                           <div class="episode-play-info">
                              <div class="episode-play">
                                 <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= DanhSachPhim[a].link_raw + "-" +DanhSachPhim[a].id_phim %>">
                                 <i class="ri-play-fill"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                        <div class="epi-desc p-3">
                           <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= DanhSachPhim[a].link_raw + "-" +DanhSachPhim[a].id_phim %>">
                              <h6 class="epi-name text-white mb-0"><%=DanhSachPhim[a].ten_phim %>
                              </h6>
                           </a>
                        </div>
                     </div>
                  </div>
                  <!-- item end -->
                  <% }
                     } %>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- end danh sach phim -->


        <!-- goi y the loai -->
    <div id ="HintTL"></div>
       <script>
           $(document).ready(function () {
               $.ajax({
                   url: '/Code/ashx/LoadHintTL.ashx',
                   success: function (data) {
                       document.getElementById('HintTL').innerHTML = data.str_html;
                   }
               });
           });
      </script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    


    <script>
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
    </script>

   




</div>
<!--END MainContent -->
<div style="padding: 50px"></div>

 