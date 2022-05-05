<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopLuotXem_PhimDienAnh.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.Part.TopLuotXem_PhimDienAnh" %>
<section id="topdienanh">
   <div class="container-fluid">
      <div class="row">
         <div class="col-sm-12 overflow-hidden">
            <div class="iq-main-header d-flex align-items-center justify-content-between">
               <h4 class="main-title"><a href="#topdienanh"><i class="fa fa-film" aria-hidden="true"></i>&nbsp;Top Phim Điện Ảnh </a></h4>
            </div>
            <div class="favorites-contens">
               <ul class="favorites-slider list-inline  row p-0 mb-0">
                  <% if (LuotXem != null)
                     {
                         int xephang = 0;
                         for (int a = 0; a < LuotXem.Count; a++)   
                         {
                             if (TenTheLoai(Convert.ToInt32(LuotXem[a].id_phim)) == "null") { continue; } else { xephang += 1; }
                              %>
                  <!-- item -->
                  <li class="slide-item">
                     <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= LinkRaw(Convert.ToInt32(LuotXem[a].id_phim)) + "-" + LuotXem[a].id_phim %>">
                        <div class="epi-box">
                           <div class="epi-img position-relative">
                              <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" style="height: 201px;max-height: 200px;width: 100%;" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%=ImgPhim(Convert.ToInt32(LuotXem[a].id_phim)) %>" class="img-fluid img-zoom" alt="">
                              <div class="episode-number">Top&nbsp;<%=xephang %>&nbsp;</div>
                           </div>
                           <div class="block-description">
                              <div style="    background: #000000f2;">
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