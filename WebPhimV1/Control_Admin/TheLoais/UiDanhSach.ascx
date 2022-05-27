<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDanhSach.ascx.cs" Inherits="WebPhimV1.Control_Admin.TheLoais.UiDanhSach" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Thể Loại</h3>
         </div>
      </div>
      <!-- Button trigger modal -->
      <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#themtheloai">
      Thêm thể loại
      </button>
      <!-- Modal -->
      <div class="modal fade" id="themtheloai" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Thêm thể loại</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <label> Tên thể loại: </label><br>
                  <div class="input-group">
                     <asp:TextBox ID="tentheloai" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                  </div>
                  <label> Mô tả thể loại: </label><br>
                  <div class="input-group">
                     <asp:TextBox ID="motatheloai" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                  </div>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <asp:Button ID="btntheloai" runat="server" class="btn btn-primary" Text="Thêm thể loại" OnClick="btntheloai_Click"/>
               </div>
            </div>
         </div>
      </div>
      <%try
         {
             Request.QueryString["thongtin"].ToString(); %>
      <!-- cap nhat the loai  -->
      <div class="modal-body">
         <label> Tên thể loại: </label><br>
         <div class="input-group">
            <asp:TextBox ID="cnTenTheLoai" runat="server" class="form-control"></asp:TextBox>
         </div>
         <label> Mô tả thể loại: </label><br>
         <div class="input-group">
            <asp:TextBox ID="cnMoTaTheLoai" runat="server" class="form-control"></asp:TextBox>
         </div>
         <br>
         <asp:Button ID="btnCapNhat" runat="server" class="btn btn-primary" Text="Cập nhật thể loại" OnClick="btnCapNhat_Click" />
      </div>
      <%}
         catch { } %>
      <!-- cap nhat the loai  -->
   </div>
</div>
<!-- /.card-header -->
<div class="card-body">
<div class="row">
   <div class="col-sm-12">
      <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
         <thead>
            <tr>
               <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên thể loại">Tên thể loại</th>
               <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Mô tả của thể loại đó">Mô tả</th>
               <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Có thể thêm sửa xoá">Cài đặt</th>
            </tr>
         </thead>
         <tbody>
            <% if (DanhSachTL != null){ for (int i = 0; i < DanhSachTL.Count; i++)
                   { %>
            <tr class="odd">
               <td class="dtr-control sorting_1" tabindex="0"><%=DanhSachTL[i].ten_theloai %></td>
               <td><%=DanhSachTL[i].mota_theloai %></td>
               <td><a href="/cp-admin/theloai/danhsach?thongtin=<%=DanhSachTL[i].id_theloai%>" class="btn btn-info">Thông Tin</a>
                  &ensp;<a href="?Xoa=<%=DanhSachTL[i].id_theloai%>" onclick="return confirm('Bạn có chắc muốn xoá thể loại: <%= DanhSachTL[i].ten_theloai %>')" class="btn btn-danger">Xoá</a>
               </td>
            </tr>
            <% } } %>
         </tbody>
      </table>
   </div>
   <!-- /.card-body -->
</div>
</div>


<script>

    $(function () {
        $("#example1").DataTable({
            "responsive": false, "lengthChange": true, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print"],
            "iDisplayLength": 10,
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    });
</script>