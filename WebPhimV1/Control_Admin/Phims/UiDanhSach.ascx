<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDanhSach.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiDanhSach" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">phim</h3>
         </div>
      </div>
      <a href="<%=WebPhimV1.Code.HeThong.url() %>/cp-admin/Phim/themPhim">
      <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#themtheloai"> Thêm phim </button>
      </a>
   </div>
</div>
<!-- /.card-header -->
<div class="card-body">
   <div class="row">
      <div class="col-sm-12">
         <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
            <thead>
               <tr>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của người dùng">Img</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tên phim">Tên phim</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Lượt xem">Lượt xem</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Người đăng phim">Người đăng</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Giá bán của phim">Giá mua</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tổng tập phim của phim">Tổng tập phim</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tình trạng phim">Trạng thái</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Ngày đăng của phim">Ngày đăng</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Ngày cập nhật của phim">Ngày cập nhật</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Có thể thêm sửa xoá phim">Cài đặt</th>
               </tr>
            </thead>
            <tbody>
               <% for (int i = 0; i < dsPhim.Count; i++)
                  { %>
               <tr class="odd">
                  <td class="dtr-control sorting_1" tabindex="0"><img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" width="100px" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%=dsPhim[i].img_phim %>" /></td>
                  <td>
                     <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=dsPhim[i].link_raw + " - " + dsPhim[i].id_phim %>" target="_blank">
                     <%=dsPhim[i].ten_phim %>
                     </a>
                  </td>
                  <td>
                     <%=LuotXemPhim(dsPhim[i].id_phim) %>
                  </td>
                  <td>
                     <%=LoadName(dsPhim[i].id_user) %>
                  </td>
                  <td>
                     <%=dsPhim[i].coin_phim %>
                  </td>
                  <td>
                     <%=TongTap_Phim(dsPhim[i].id_phim) %>
                  </td>
                  <td>
                     <% if (dsPhim[i].status_ == 1)
                        { %> Hoạt động
                     <% }else{ %>Tạm dừng
                     <% } %>
                  </td>
                  <td>
                     <%=dsPhim[i].created_at.ToString("MM/dd/yyyy HH:mm:ss") %>
                  </td>
                  <td>
                     <%=dsPhim[i].updated_at.ToString("MM/dd/yyyy HH:mm:ss") %>
                  </td>
                  <td><a href="/cp-admin/Phim/capnhat-<%=dsPhim[i].id_phim%>" class="btn btn-info">Thông Tin</a>&ensp;<a href="/cp-admin/tap-phim/danhsach-<%=dsPhim[i].id_phim%>" class="btn btn-success">Danh sách tập phim</a>&ensp;<a href="?Xoa=<%=dsPhim[i].id_phim%>" onclick="return confirm('Bạn có chắc muốn xoá phim: <%= dsPhim[i].ten_phim %>')" class="btn btn-danger">Xoá</a></td>
               </tr>
               <% }  %>
            </tbody>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>