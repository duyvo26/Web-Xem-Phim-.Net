<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiIndex.ascx.cs" Inherits="WebPhimV1.Control_Admin.UiIndex" %>
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Bảng điều kiển</h1>
            </div>
            <!-- /.col -->
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
            <!-- /.col -->
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>
                    <div class="info-box-content"><span class="info-box-text">Tổng bình luận</span> <span class="info-box-number"><%= SumBinhLuan() %></span></div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <!-- fix for small devices only -->
            <div class="clearfix hidden-md-up"></div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                    <div class="info-box-content"><span class="info-box-text">Tổng phim đã đăng</span> <span class="info-box-number"><%=SumPhim() %></span></div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <!-- /.col -->
            <!-- fix for small devices only -->
            <div class="clearfix hidden-md-up"></div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                    <div class="info-box-content"><span class="info-box-text">Tổng tập phim đã đăng</span> <span class="info-box-number"><%=SumTap_Phim() %></span></div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
                    <div class="info-box-content"><span class="info-box-text">Tổng người dùng</span> <span class="info-box-number"><%=SumNguoiDung() %></span></div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Dung lượng ổ đĩa:</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                    </div>
                    <!-- /.card-body -->
                </div>
            </div>
            <!-- /.card -->

            <script>
                //-------------
                //- DONUT CHART -
                //-------------
                // Get context with jQuery - using jQuery's .get() method.
                var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
                var donutData = {
                    labels: [
                        'Đã dùng',
                        'Còn trống',
                    ],
                    datasets: [
                      {
                          data: [<%= usingSizeRaw %>, <%= freeSizeRaw %>],
                          backgroundColor: ['#f56954', '#00a65a'],
                      }
                    ]
                }
                    var donutOptions = {
                        maintainAspectRatio: false,
                        responsive: true,
                    }
                    //Create pie or douhnut chart
                    // You can switch between pie and douhnut using the method below.
                    new Chart(donutChartCanvas, {
                        type: 'doughnut',
                        data: donutData,
                        options: donutOptions
                    });
            </script>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Xoá File rác trên hệ thống</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="table-responsive container">
                            <!-- xoa video -->
                            <div id="c_noti_video_database"></div>
                            <div id="c_noti_video_size"></div>
                            <!-- xoa Anh -->
                            <div id="c_noti_video_database_img"></div>
                            <div id="c_noti_video_size_img"></div>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="btn btn-block btn-lg btn-light" onclick="CheckXoaVideo(); return false;">Xoá file video&emsp;<i class="bi bi-film"></i></button>
                                &emsp;
                                <button type="button" class="btn btn-block btn-lg btn-light" onclick="CheckXoaIMG(); return false;">Xoá file IMG&emsp;<i class="bi bi-image-fill"></i></button>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix"></div>
                    <!-- /.card-footer -->
                </div>
                <!-- js -->
                <script>
                    function CheckXoaVideo() {
                        $.ajax({
                            data: {},
                            url: "/Code/ashx/CheckFileVideo.ashx",
                            type: "GET",
                            success: function (data) {
                                document.getElementById("c_noti_video_database").innerHTML = "<div class='alert alert-info' role='alert'>Dữ liệu trên database Phim: </div>" + data.noidungTapPhim;
                                document.getElementById("c_noti_video_size").innerHTML = "<div class='alert alert-danger' role='alert'>Tổng size đã xoá: " + data.sizefile + " MB </div>";
                            },
                        });
                    }

                    function CheckXoaIMG() {
                        $.ajax({
                            data: {},
                            url: "/Code/ashx/CheckFileAnh.ashx",
                            type: "GET",
                            success: function (data_img) {
                                document.getElementById("c_noti_video_database_img").innerHTML = "<div class='alert alert-info' role='alert'>Dữ liệu trên database Ảnh: </div>" + data_img.noidungIMG;
                                document.getElementById("c_noti_video_size_img").innerHTML = "<div class='alert alert-danger' role='alert'>Tổng size đã xoá: " + data_img.sizefile + " MB </div>";
                            },
                        });
                    }
                </script>
                <!-- js -->
            </div>

            <!-- gui tin nhan user -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Gửi tin nhắn cho tất cả người dùng</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="table-responsive container">
                            <!-- noi dung -->
                            <div id="noti_send"></div>
                            <div class="form-group">
                                <label>Mail người nhận:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                                    </div>
                                    <input type="text" id="send_mail" value="@all" class="form-control" />
                                </div>
                                <!-- /.input group -->
                            </div>
                            <div class="form-group">
                                <label>Nội dung:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                                    </div>
                                    <input type="text" id="send_noidung" value="" class="form-control" />
                                </div>
                                <!-- /.input group -->
                            </div>
                            <button type="button" class="btn btn-block btn-lg btn-light" onclick="GuiTinNhan(); return false;">Gửi tin&emsp;<i class="bi bi-send-check"></i></button>

                            <!-- noi dung -->
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix"></div>
                    <!-- /.card-footer -->
                </div>
                <!-- js -->
                <script>
                    function GuiTinNhan() {
                        var send_mail_ = document.getElementById("send_mail").value;
                        var send_noidung_ = document.getElementById("send_noidung").value;
                        $.ajax({
                            data: { mail_user: send_mail_, noidung_user: send_noidung_ },
                            url: "/Code/ashx/GuiTinNhan.ashx",
                            type: "GET",
                            success: function (data) {
                                // alert("Gửi tin thành công");
                                document.getElementById("send_noidung").value = "";
                                document.getElementById("noti_send").innerHTML = "<div class='alert alert-info' role='alert'>Gửi tin cho " + send_mail_ + " thành công </div>";
                            },
                        });
                    }
                </script>
                <!-- js -->
            </div>

            <!-- end gui tin nhan -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Danh sách đánh giá</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
                                <thead>
                                    <tr>
                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của người dùng">Người dùng</th>
                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của phim">Tên phim</th>
                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Giá trị">Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (DsDanhGia != null) { for(int i =0; i < DsDanhGia.Count; i++){ %>
                                    <tr class="odd">
                                        <td><%=LoadTaiKhoan(Convert.ToInt32(DsDanhGia[i].id_user)) %></td>
                                        <td><%=LoadNamePhim(Convert.ToInt32(DsDanhGia[i].id_phim)) %></td>
                                        <td><%=Convert.ToInt32(DsDanhGia[i].giatri) %></td>
                                    </tr>
                                    <% } } %>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix">
                        <a href="/cp-admin/Phim/danhgia" class="btn btn-sm btn-secondary float-right">Xem thêm</a>
                    </div>
                    <!-- /.card-footer -->
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Danh sách mua phim</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
                                <thead>
                                    <tr>
                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của người dùng">Người dùng</th>
                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Tên của phim">Tên phim</th>
                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Giá trị">Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (DSThuVien != null) { for (int i = 0; i < DSThuVien.Count; i++) { %>
                                    <tr class="odd">
                                        <td><%=LoadTaiKhoan(Convert.ToInt32(DSThuVien[i].id_user)) %></td>
                                        <td><%=LoadNamePhim(Convert.ToInt32(DSThuVien[i].id_phim)) %></td>
                                        <td><%=DSThuVien[i].updated_at.ToString("MM/dd/yyyy HH:mm:ss") %></td>
                                    </tr>
                                    <% } } %>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix">
                        <a href="/cp-admin/Phim/thuvien" class="btn btn-sm btn-secondary float-right">Xem thêm</a>
                    </div>
                    <!-- /.card-footer -->
                </div>
            </div>
        </div>
    </div>
    <!--/. container-fluid -->
</section>
