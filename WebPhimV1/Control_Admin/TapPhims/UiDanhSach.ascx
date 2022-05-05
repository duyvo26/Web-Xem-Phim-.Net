<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDanhSach.ascx.cs" Inherits="WebPhimV1.Control_Admin.Tap_Phims.UiDanhSach" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Danh sách tập phim của phim: &ensp; <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=infoPhim.link_raw + "-" + infoPhim.id_phim %>"><%=infoPhim.ten_phim %></a></h3>
         </div>
      </div>
     <a href="<%=WebPhimV1.Code.HeThong.url() %>/cp-admin/Phim/capnhat-<%=infoPhim.id_phim %>">
      <button type="button" class="btn btn-primary btn-lg btn-block">Thông tin phim</button>
      </a><br>
      <a href="them-tap-phim-<%=infoPhim.id_phim %>">
      <button type="button" class="btn btn-primary btn-lg btn-block">Thêm tập phim</button>
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
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên tập phim">Tên tập phim</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Lượt xem">Lượt xem</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Ngày cập nhật">Ngày đăng</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Ngày cập nhật">Ngày cập nhật</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Có thể thêm sửa xoá phim">Cài đặt</th>
               </tr>
            </thead>
            <tbody>
               <% for (int i = 0; i < DSC.Count; i++)
                  { %>
               <tr class="odd">
                  <td>
                     <a href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=infoPhim.link_raw + "-" + DSC[i].id_phim +"/"+ DSC[i].id_tap_phim %>" target="_blank">
                     <%=DSC[i].ten_tap_phim %>
                     </a>
                  </td>
                  <td><%=LuotXemTap_Phim(DSC[i].id_tap_phim) %></td>
                  <td><%=DSC[i].created_at.ToString("dd-MM-yyyy | HH:mm:ss") %></td>
                  <td><%=DSC[i].updated_at.ToString("dd-MM-yyyy | HH:mm:ss") %></td>
                  <td><a target="_blank" href="/cp-admin/tap-phim/capnhat-<%=DSC[i].id_tap_phim%>" class="btn btn-info">Thông Tin</a>&ensp;<a href="?XoaTap_Phim=<%=DSC[i].id_tap_phim%>" onclick="return confirm('Bạn có chắc muốn xoá phim: <%= DSC[i].ten_tap_phim %>')" class="btn btn-danger">Xoá</a></td>
               </tr>
               <% }  %>
            </tbody>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>