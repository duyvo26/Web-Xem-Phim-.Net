<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDanhGia.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiDanhGia" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Danh sách đánh giá</h3>
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
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của người dùng">Người dùng</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của phim">Tên phim</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Giá trị">Giá trị</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Giá trị">Thời gian</th>
               </tr>
            </thead>
            <tbody>
               <% if (DsDanhGia != null) { 
                  for(int i =0; i < DsDanhGia.Count; i++){ %>
               <tr class="odd">
                  <td><%=LoadName(Convert.ToInt32(DsDanhGia[i].id_user)) %></td>
                  <td><%=LoadNamePhim(Convert.ToInt32(DsDanhGia[i].id_phim)) %></td>
                  <td><%=Convert.ToInt32(DsDanhGia[i].giatri) %></td>
                  <td><%=DsDanhGia[i].updated_at %></td>
               </tr>
               <% } } %>
            </tbody>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>