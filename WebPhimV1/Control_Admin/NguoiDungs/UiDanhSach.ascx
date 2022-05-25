<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiDanhSach.ascx.cs" Inherits="WebPhimV1.Control_Admin.NguoiDungs.UiDanhSach" %>
<div class="card">
    <div class="card-header">
        <asp:Label ID="noti" runat="server"></asp:Label>
        <div class="card card-danger">
            <div class="card-header">
                <h3 class="card-title">Người dùng</h3>
            </div>
        </div>
        <a href="<%=WebPhimV1.Code.HeThong.url() %>/cp-admin/nguoidung/them">
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#themtheloai">
                Thêm người dùng
     
            </button>
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
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="ID">Id người dùng</th>
                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của người dùng">Full Name</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tên đăng nhập">Tài khoản</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Mail">Mail</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Số tiền của người dùng">Coin</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Cấp độ của người dùng">Quyền hạn</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tình trạng tài khoản">Trạng thái</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="at">Ngày tạo</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="ut">Cập nhật gần nhất</th>
                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Có thể thêm sửa xoá người dùng">Cài đặt</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < DanhSachND.Count; i++)
                       { %>
                    <%if (Convert.ToInt32(DanhSachND[i].quyen_han) <= Convert.ToInt32(NguoiDungs.quyen_han))
                      { %>
                    <tr class="odd">
                        <td class="dtr-control sorting_1" tabindex="0">#<%=DanhSachND[i].id_user %></td>
                        <td><%=DanhSachND[i].fullname %></td>
                        <td><%=DanhSachND[i].ten_dangnhap %></td>
                        <td><%=DanhSachND[i].mail %></td>
                        <td><%=DanhSachND[i].coin %></td>
                        <td><%= HienQHan(Convert.ToInt32(DanhSachND[i].quyen_han)) %></td>
                        <td><% if (DanhSachND[i].status_ == 1)
                               { %> Hoạt động <% }
                               else
                               { %>Tạm dừng<% } %></td>
                       <td><%=DanhSachND[i].created_at.ToString("MM/dd/yyyy HH:mm:ss")	 %></td>
                       <td><%=DanhSachND[i].updated_at.ToString("MM/dd/yyyy HH:mm:ss")	 %></td>
                        <td><a href="/cp-admin/nguoidung/capnhat-<%=DanhSachND[i].id_user%>" class="btn btn-info">Thông Tin</a>&ensp;<a href="/cp-admin/nguoidung/napcoin-<%=DanhSachND[i].id_user%>" class="btn btn-success">Nạp Coin</a>&ensp;<a href="?Xoa=<%=DanhSachND[i].id_user%>" onclick="return confirm('Bạn có chắc muốn xoá người dùng: <%= DanhSachND[i].ten_dangnhap %>')" class="btn btn-danger">Xoá</a></td>
                    </tr>
                    <% }
                       } %>
                </tbody>
            </table>
        </div>
        <!-- /.card-body -->
    </div>
</div>
