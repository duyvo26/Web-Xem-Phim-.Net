<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThongBao.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TaiKhoan.UiThongBao" %>
<script>
    document.title = "Thông báo";
</script>
<!-- noi dung -->
<div class="main-content">
    <section style="margin-top: 60px;">
        <div class="container-fluid">
            <div class="container">
                <h3 class="m-b-50 heading-line">
                    Thông báo <i class="fa fa-bell text-muted"></i>
                    <a href="?all=true">
                        <button onclick="return confirm('Xác nhận đánh đấu đã Xem với tất cả ???')" type="button" class="btn" style="background: var(--iq-primary); margin-bottom: 20px;">Xem tất cả</button>
                    </a>
                    <!--
                  <a href="?delete=true">
                      <button onclick="return confirm('Xác nhận xoá tất cả ???')" type="button" class="btn btn-danger" style="margin-bottom: 20px;">Xoá tất cả</button>
                  </a>-->
                </h3>
                <div class="notification-ui_dd-content" style="overflow: scroll; height: 700px;">
                    <%if (ThongBaos != null) { for(int i = 0 ; i < ThongBaos.Count; i++){ %> <%if (ThongBaos[i].truy_cap == null) { %>
                    <div class="notification-list notification-list--unread" onclick="window.location='?id=<%=ThongBaos[i].id %>'">
                        <div class="notification-list_content" title="#<%=ThongBaos[i].id_user_phanhoi %>">
                            <div class="notification-list_img">
                                <%if (ThongBaos[i].id_user_phanhoi != 0 ){ %>
                                <img
                                    onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';"
                                    src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= getIMG(Convert.ToInt32(ThongBaos[i].id_user_phanhoi))  %> "
                                    class="avatar"
                                    width="40"
                                 />
                                <%}else{ %>
                                <img
                                    onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';"
                                    src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/top-icon/icon-admin.png "
                                    class="avatar"
                                    width="40"
                                />
                                <%} %>
                            </div>
                            <div class="notification-list_detail">
                                <p class="text-muted" style="color: black;"><%=ThongBaos[i].noi_dung %></p>
                                <p class="text-muted"><small> <%=ThongBaos[i].created_at.ToString("dd/MM/yyyy HH:mm:ss") %></small></p>
                            </div>
                        </div>
                    </div>
                    <%}else{ %>
                    <div class="notification-list" onclick="window.location='../<%=ThongBaos[i].url %>'">
                        <div class="notification-list_content" title="#<%=ThongBaos[i].id_user_phanhoi %>">
                            <div class="notification-list_img">
                                <%if (ThongBaos[i].id_user_phanhoi != 0 ){ %>
                                <img
                                    onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';"
                                    src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= getIMG(Convert.ToInt32(ThongBaos[i].id_user_phanhoi))  %> "
                                    class="avatar"
                                    width="40"
                                />
                                <%}else{ %>
                                <img
                                    onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';"
                                    src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/top-icon/icon-admin.png "
                                    class="avatar"
                                    width="40"
                                />
                                <%} %>
                            </div>
                            <div class="notification-list_detail">
                                <b style="color: black;"><%=ThongBaos[i].noi_dung %></b>
                                <p class="text-muted"><small> <%=ThongBaos[i].created_at.ToString("dd/MM/yyyy HH:mm:ss") %></small></p>
                            </div>
                        </div>
                    </div>
                    <% } %> <% } }%>
                </div>
                <div class="text-center">
                    <!-- phan trang -->
                    <% int CheckPT = 0; if (Request.QueryString["page"] != null) {CheckPT = 1;} %> <%= WebPhimV1.Code.HeThong.PhanTrang(CheckPT, SumPage, HttpContext.Current.Request.Url.PathAndQuery,
                    Convert.ToInt32(Request.QueryString["page"])) %>
                    <!-- phan trang end-->
                </div>
            </div>
        </div>
    </section>
</div>
<style>
    .section-50 {
        padding: 50px 0;
    }
    .m-b-50 {
        margin-bottom: 50px;
    }
    .dark-link {
        color: #333;
    }
    .heading-line {
        position: relative;
        padding-bottom: 5px;
    }
    .heading-line:after {
        content: "";
        height: 4px;
        width: 75px;
        background-color: #29b6f6;
        position: absolute;
        bottom: 0;
        left: 0;
    }
    .notification-ui_dd-content {
        margin-bottom: 30px;
    }
    .notification-list {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
        padding: 20px;
        margin-bottom: 7px;
        background: #fff;
        -webkit-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.06);
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.06);
    }
    .notification-list--unread {
        border-left: 4px solid #f62929;
    }
    .notification-list .notification-list_content {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
    }
    .notification-list .notification-list_content .notification-list_img img {
        height: 48px;
        width: 48px;
        border-radius: 50px;
        margin-right: 20px;
    }
    .notification-list .notification-list_content .notification-list_detail p {
        margin-bottom: 5px;
        line-height: 1.2;
    }
    .notification-list .notification-list_feature-img img {
        height: 48px;
        width: 48px;
        border-radius: 5px;
        margin-left: 20px;
    }
</style>
