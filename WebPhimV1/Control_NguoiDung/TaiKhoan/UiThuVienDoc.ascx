<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThuVienDoc.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TaiKhoan.UiThuVienDoc" %>
<!-- noi dung -->
<div style="padding: 10px" class="iq-main-header d-flex align-items-center justify-content-between">
   <h4 class="main-title"><i class="fa-solid fa-book-bookmark"></i>&nbsp;Thư viện phim</h4>
</div>
<asp:Label ID="noti" runat="server"></asp:Label>
<!-- phan noi dung -->
<div class="row list_Phim">
<% 
   if (ThuVien != null) { 
   for (int a = 0; a < ThuVien.Count; a++) { %>
<div class="col-6 col-sm-4 col-md-4 col-lg-4 col-xl-3">
   <% DateTime date1 = GetDateTimeTV(Convert.ToInt32(ThuVien[a].id_tap_phim)); %>
   <% DateTime date2 = GetDateTimePhim(Convert.ToInt32(ThuVien[a].id_phim)); %>
   <% if (DateTime.Compare(date1, date2) <= 0) {%>
   <div class=" card epi-img position-relative" style="background: #ff8d18;  padding: 1px;">
      <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" title="Có tập phim mới cập nhật !!!" style="position: absolute;" width="60" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/top-icon/New.gif" />
      <% }else{ %>
      <div class=" card epi-img position-relative">
         <%} %>
         <span style="position: absolute;right: 0;width: auto; padding: 5px">
         <a onclick="return confirm('Bạn có chắc muốn xoá phim: <%= ThuVien[a].ten_phim %> ra khỏi thư viện ???')" href="?XoaPhim=<%=ThuVien[a].id_thuvien %>">
              <h2 style="color: red"><i  class="fa fa-trash-o" aria-hidden="true"></i></h2>
         </a>
         </span>

         <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=ThuVien[a].link_raw + "-" + ThuVien[a].id_phim %>">
            <img class="card-img-top" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%=ThuVien[a].img_phim %>"onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" /><!-- da sua thanh 2 cham  -->
         </a>
         <a title="<%=TenTap_Phim(Convert.ToInt32(ThuVien[a].id_tap_phim)) %>" href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=ThuVien[a].link_raw + "-" + ThuVien[a].id_phim + "/" + ThuVien[a].id_tap_phim %>">
            <div class="tenTap_Phim"><% RutGon_TieuDe(TenTap_Phim(Convert.ToInt32(ThuVien[a].id_tap_phim)), 15); %></div>
         </a>
         <div class="epi-desc p-3">
             <div class="epi-name text-white mb-0">
            <a  title="<%=ThuVien[a].ten_phim %>" href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=ThuVien[a].link_raw + "-" + ThuVien[a].id_phim %>">
            <%= ThuVien[a].ten_phim %>
            </a>
                 </div>
         </div>
      </div>
   </div>
   <% } } %>   
</div>
<!-- phan trang xem them -->
<div class="d-flex justify-content-center">
   <nav aria-label="Page navigation example">
      <ul class="pagination">
         <%if (ThuVien.Count > 0 && SumPage > 0)
            {
                for (int i = 0; i <= SumPage; i++)
                { %>
         <li class="page-item"><a class="page-link" href="?page=<%=i %>"><%= i %></a></li>
         <% }
            } %>
      </ul>
   </nav>
</div>
<!-- phan trang xem them -->
<!-- end phan noi dung -->