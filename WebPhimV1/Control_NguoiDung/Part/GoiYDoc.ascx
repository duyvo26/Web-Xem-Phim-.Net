<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GoiYDoc.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.Part.GoiYDoc" %>
<!-- Set up your HTML -->
<div class="owl-carousel">
   <%
      for (int i = 0; i < listGoiyDoc.Count(); i++)
      {
          if (Convert.ToInt32(listGoiyDoc[i].status_) != 0)
          { %>
   <div class="item">
      <div class="pad15">
         <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= listGoiyDoc[i].link_raw + "-" + listGoiyDoc[i].id_phim %>">
         <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" style="pointer-events: none;" class="card-img-top" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%= listGoiyDoc[i].img_phim %>" onerror="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" />
         </a>
      </div>
      <a style="pointer-events: none;" href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%= listGoiyDoc[i].link_raw + "-" +listGoiyDoc[i].id_phim %>">
         <div class="card-body">
            <div style="font-weight: 600; font-size: 16px" title="<%=listGoiyDoc[i].ten_phim %>">
               <% RutGon_TieuDe(listGoiyDoc[i].ten_phim, 40); %>
            </div>
         </div>
      </a>
   </div>
   <% }
      } %>
</div>
<script>
    $(document).ready(function () {
        $(".owl-carousel").owlCarousel({
            center: true,
            loop: true,
            margin: 10,
            autoplayTimeout: 4000,
            autoplay: true,
            responsive: {
                0: {
                    items: 2
                },
                600: {
                    items: 4
                },
                1000: {
                    items: 6
                }
            }
        });
    });


</script>