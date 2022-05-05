<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThuVien.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiThuVien" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Danh sách mua</h3>
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
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tên phim">Tên phim</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tài khoản mua phim">Tài khoản</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Id">Id tài khoản</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Giá bán của phim">Giá mua</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tình trạng phim">Thời gian mua</th>
               </tr>
            </thead>
            <tbody>
               <% for (int i = 0; i < thuvien.Count; i++)
                  { %>
               <tr class="odd">
                  <td><%=LoadNamePhim(thuvien[i].id_phim) %></td>
                  <td><%=LoadName(thuvien[i].id_user) %></td>
                  <td>#<%=thuvien[i].id_user %></td>
                  <td><%=LoadCoin(thuvien[i].id_phim) %></td>
                  <td><%= thuvien[i].created_at.ToString("MM/dd/yyyy HH:mm:ss") %></td>
               </tr>
               <% }  %>
            </tbody>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>