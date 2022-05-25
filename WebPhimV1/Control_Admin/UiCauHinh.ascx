<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiCauHinh.ascx.cs" Inherits="WebPhimV1.Control_Admin.UiCauHinh" %>
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Cấu hình hệ thống</h1>
            </div>
            <!-- /.col -->
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<div class="container-fluid">
    <div class="card card-danger">
        <div class="card-header">
            <h3 class="card-title">Hệ thống</h3>
        </div>
        <asp:Label ID="noti" runat="server"></asp:Label>
        <div class="card-body">
            <!-- form -->
            <form></form>
            <form method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Tên Website:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="tenweb" value="<%=HeThongs.ten_web %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>Địa chỉ:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="diachi" value="<%=HeThongs.diachi_lh %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>Mail:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="mail" value="<%=HeThongs.email_lh %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>Số ĐT:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="sdt_lh" value="<%=HeThongs.sdt_lh %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>LH FB:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="lh_fb" value="<%=HeThongs.lh_fb %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>LH ZaLo:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="lh_zalo" value="<%=HeThongs.lh_zalo %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>Copyright: </label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="copyright" value="<%=HeThongs.copyright %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group" hidden>
                    <label>Instagram: </label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="text" name="lh_itg" value="<%=HeThongs.lh_itg %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->


                <!-- /.input group -->
                <div class="form-group" hidden>
                    <label>Event noel</label><br />

                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="event_noel" value="true" <%if (HeThongs.event_noel == "true") { %> checked <% } %>>
                                <label class="form-check-label">
                                    Bật
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="event_noel" value="false" <%if (HeThongs.event_noel == "false") { %> checked <% } %>>
                                <label class="form-check-label">
                                    Tắt
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.input group -->
                                <!-- /.input group -->
                <div class="form-group" hidden>
                    <label>Event Tết</label><br />

                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="event_tet" value="true" <%if (HeThongs.event_tet == "true") { %> checked <% } %>>
                                <label class="form-check-label">
                                    Bật
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="event_tet" value="false" <%if (HeThongs.event_tet == "false") { %> checked <% } %>>
                                <label class="form-check-label">
                                    Tắt
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.input group -->
                <!-- form -->
                <div class="form-group">
                    <label>Code Fb Chat:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <textarea class="form-control" name="fb_chat" rows="6">
                       <%=HeThongs.Fb_mess %>

                        </textarea>
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->

                <!-- form -->
                <div class="form-group">
                    <label>Code Fb Page:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <textarea class="form-control" name="fb_page" rows="6">
                       <%=HeThongs.Fb_page %>

                        </textarea>
                    </div>
                    <!-- /.input group -->
                </div>

                <div class="form-group">
                    <label>Code Fb Comment:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <textarea class="form-control" name="fb_Comment" rows="6">
                       <%=HeThongs.Cm_FB %>

                        </textarea>
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->

                <!-- form -->
                <div class="form-group">
                    <label>Logo Website:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/logo/<%= HeThongs.logo_web %>" width="300px" />
                    <div class="input-group">
                        <div class="input-group-prepend" style="margin-top: 20px;">
                            <br />
                            <input  accept=".jpg, .png, .gif"  type="file" name="UploadedFileLogo" value="Select File" />
                        </div>
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.form group -->
                <!-- form -->
                <div class="form-group">
                    <label>Mã QR Thanh Toán Trực Tuyến:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/thanhtoan/<%= HeThongs.thanhtoan_online %>" width="200px" />
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <input  accept=".jpg, .png, .gif"  type="file" name="UploadedFileThanhToan" value="Select File" />
                    </div>
                    <!-- /.input group -->
                </div>

                <!-- /.input group -->
                <div class="form-group">
                    <label>Trang lỗi 404:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/404/<%= HeThongs.img_404 %>" width="200px" />
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <input  accept=".jpg, .png, .gif"  type="file" name="UploadedFile404" value="Select File" />
                    </div>
                </div>
                <!-- /.input group -->

                <!-- /.input group -->
                <div class="form-group">
                    <label>Img Noti Nhân vật:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/noti/<%= HeThongs.img_nhanvat %>" width="200px" />
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <input  accept=".jpg, .png, .gif"  type="file" name="UploadedFileNhanVat" value="Select File" />
                    </div>
                </div>
                <!-- /.input group -->

                <!-- /.input group -->
                <div class="form-group">
                    <label>Img Noti Nền:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/noti/<%= HeThongs.img_nen %>" width="200px" />
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <input   accept=".jpg, .png, .gif"  type="file" name="UploadedFileNen" value="Select File" />
                    </div>
                </div>
                <!-- /.input group -->
                <!-- /.input group -->
                <div class="form-group">
                    <label>Img Noti Chữ:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/noti/<%= HeThongs.img_chu %>" width="200px" />
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <input  accept=".jpg, .png, .gif"  type="file" name="UploadedFileChu" value="Select File" />
                    </div>
                </div>
                <!-- /.input group -->
                
                
                <!-- /.input group -->
                <div class="form-group">
                    <label>Img Video:</label><br />
                    <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/quang-cao/<%= HeThongs.anh_video %>" width="200px" />
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <br />
                        <input accept=".jpg, .png, .gif" type="file" name="UploadedFileImgVideo" value="Select File" />
                    </div>
                </div>
                <!-- /.input group -->

                                <!-- form -->
                <div class="form-group">
                    <label>Video quảng cáo: </label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input accept=".mp4,.webm,.mkv,.avi" type="text" name="video_quangcao" value="<%=HeThongs.video_quangcao %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>
                
                  <input type="file" name="Upvideo" value="Select File" />
                <!-- /.form group -->

               <div class="form-group">
                    <label>Thời gian quảng cáo (Milliseconds):</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-file-earmark-ppt"></i></span>
                        </div>
                        <input type="number" name="Time_Ads" max="10000" value="<%=Int32.Parse(HeThongs.Time_Ads) %>" class="form-control" />
                    </div>
                    <!-- /.input group -->
                </div>


                <input value="Cập Nhật" class="btn btn-danger" name="capnhat" type="submit" />
            </form>
            <!-- /.form group -->
        </div>
        <!-- /.card-body -->
    </div>
</div>
