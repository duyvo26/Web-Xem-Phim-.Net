<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiBinhLuan.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiBinhLuan" %>


<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Bình luận</h3>
         </div>
      </div>
   </div>
</div>
<!-- /.card-header -->
<div class="card-body">
   <div class="row">
      <div class="col-sm-12">
         <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
            <thead>
               <tr>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Id">Id bình luận</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="id">Tài khoản</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="id">Id người dùng</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tên phim">Tên phim</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Mã tập phim">Id tập phim</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Nội dung bình luận">Nội dung</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Trạng thái bình luận">Trạng thái</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Thời gian bình luận">Thời gian</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Có thể thêm sửa xoá ">Cài đặt</th>
               </tr>
            </thead>
            <tbody>
               <% for (int i = 0; i < DSBinhLuan.Count; i++)
                  { %>
               <tr class="odd">
                  <td>#<%=DSBinhLuan[i].id_cmt %></td>
                  <td><%=LoadName(DSBinhLuan[i].id_user) %></td>
                  <td>#<%=DSBinhLuan[i].id_user %></td>
                  <td><%=LoadNamePhim(DSBinhLuan[i].id_phim) %></td>
                  <td><%=DSBinhLuan[i].id_tap_phim %></td>
                  <td><%= StripHTML(DSBinhLuan[i].noidung_cmt) %> </td>
                  <td><%string st = ""; if (DSBinhLuan[i].status_ == 0) { st = "Hiển thị"; } else { st = "Ẩn"; }%> <%=st %>
                  </td>
                  <td><%= DSBinhLuan[i].created_at.ToString("MM/dd/yyyy HH:mm:ss") %> </td>
                  <td>
                     <a href="?Xoa=<%=DSBinhLuan[i].id_cmt%>" onclick="return confirm('Bạn có chắc muốn xoá bình luận: <%= StripHTML(DSBinhLuan[i].noidung_cmt) %>');" class="btn btn-danger">Xoá</a>
                     <a href="?status=<%=DSBinhLuan[i].id_cmt%>"  class="btn btn-info">Đổi trạng thái</a>
                  </td>
               </tr>
               <% }  %>
            </tbody>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>