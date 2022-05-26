<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiTapPhim.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.TrangPhim.UiTapPhim" %>
<script>
    document.title = 'Phim <%=infoPhim.ten_phim +" - "+  infoTap_Phim.ten_tap_phim %>';

    addStylesheet("<%=WebPhimV1.Code.HeThong.url() %>/Public/video/css/video-js.min.css");
    addStylesheet("<%=WebPhimV1.Code.HeThong.url() %>/Public/video/css/videojs-contrib-ads.css");
    addJS("<%=WebPhimV1.Code.HeThong.url() %>/Public/video/js/video.min.js");
    addJS("<%=WebPhimV1.Code.HeThong.url() %>/Public/video/js/videojs.ads.min.js");
    addJS("<%=WebPhimV1.Code.HeThong.url() %>/Public/video/js/videojs.hotkeys.min.js");

    function toggleFullScreen(elem) {
        // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if (
            (document.fullScreenElement !== undefined && document.fullScreenElement === null) ||
            (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) ||
            (document.mozFullScreen !== undefined && !document.mozFullScreen) ||
            (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)
        ) {
            if (elem.requestFullScreen) {
                elem.requestFullScreen();
            } else if (elem.mozRequestFullScreen) {
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullScreen) {
                elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
            } else if (elem.msRequestFullscreen) {
                elem.msRequestFullscreen();
            }
        } else {
            if (document.cancelFullScreen) {
                document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }
    }
</script>
<style>
    .full_m {
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 100%;
        border: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        z-index: 999999;
    }
</style>

<!-- Forest -->
<link href="https://unpkg.com/@videojs/themes@1/dist/forest/index.css" rel="stylesheet" />

<div class="main-content">
    <section class="movie-detail container">
        <!-- load server -->
        <% string noidung = HttpUtility.HtmlDecode(infoTap_Phim.noidung_tap_phim); %> <% string[] Sum = noidung.Split('|'); %> <% int int_ = 0; if (!string.IsNullOrEmpty(Request.QueryString["sever-load"])) { int_ =
        Convert.ToInt32(Request.QueryString["sever-load"]); } %>
        <div class="alert alert-success" role="alert" style="margin-top: 50px;">
            <div class="d-flex justify-content-center">
                Máy chủ <%=int_ + 1 %> đang được sử dụng
            </div>
        </div>
        <% if( Sum[int_].Contains("<iframe") != true){ %>
        <input hidden id="Sum_Data_raw" value="<%= Sum.Length %>" />
        <input hidden id="url_" value="<%=WebPhimV1.Code.HeThong.url() %>/Public/video/mp4/" />
        <input hidden id="img_video" value="" />
        <input hidden id="video_ads" value="<%=WebPhimV1.Code.HeThong.url() %>/public/video/quang-cao/<%= cauhinh.video_quangcao %>" />
        <!-- load server -->
        <video id="video" class="video-js vjs-theme-forest vjs-16-9" poster="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/quang-cao/<%= cauhinh.anh_video %>" controls data-setup='{ "playbackRates": [0.5, 1, 1.5, 2] }'>
            <script>
                var video_link = "<%=Sum[int_] %>";
                var Url = document.getElementById("url_").value;
                if (video_link.includes("http") == false) {
                    document.write("<source src='" + Url + video_link + "' type='video/mp4' />");
                } else {
                    document.write("<source src='" + video_link + "' type='video/mp4' />");
                }
            </script>
        </video>

        <script>
            // tu dong chuyen tap
            if (getCookie("next_tap") == "true") {
                //auto play
                st_ = "false";
                options = { autoplay: true };
                video = videojs("video", options);
            }
            // tu dong chuyen tap

            videojs('video').ready(function () {
                this.hotkeys({
                    volumeStep: 0.1,
                    seekStep: 5,
                    enableModifiersForNumbers: false
                });
            });

            videojs('video', {}, function () {

                var player = this;

                var coinphim = "<%=infoPhim.coin_phim.Replace(" ", "")%>" ;
                if(coinphim=="0"){
                    //load quang cao
                    player.ads(); // initialize videojs-contrib-ads
                    // alert("load quang cao");

                }

                // request ads whenever there's new video content
                player.on('contentchanged', function () {
                    // in a real plugin, you might fetch new ad inventory here
                    player.trigger('adsready');

                });

                player.on('readyforpreroll', function () {
                    player.ads.startLinearAdMode();
                    // play your linear ad content

                    // bo qua vuoc qua 5 s
                    setTimeout(function (ev) {
                        player.ads.endLinearAdMode();
                    },<%=Int32.Parse(cauhinh.Time_Ads) %>);

                    // in this example, we use a static mp4
                    player.src('<%=WebPhimV1.Code.HeThong.url() %>/public/video/quang-cao/<%= cauhinh.video_quangcao %>');

                    // send event when ad is playing to remove loading spinner
                    player.one('adplaying', function () {
                        player.trigger('ads-ad-started');
                    });

                    // resume content when all your linear ads have finished
                    player.one('adended', function () {
                        click.style.display = "none";
                        player.ads.endLinearAdMode();

                    });

                });

                //end video
                player.on("ended", function(){
                    if(getCookie("next_tap")  == "true"){
                        var url = '<% try {%><%=Next.id_tap_phim%><%} catch(Exception ex) {} %>';
                        if (url != "") {
                            window.location = url + "#video";
                            //return false;
                        }
                    }
                });
                // in a real plugin, you might fetch ad inventory here
                player.trigger('adsready');
            });
        </script>
        <!-- tu dong chuyen tap -->
        <% }else{ %>
        <div class="video-wrapper">
            <%= HttpUtility.HtmlDecode(Sum[int_]).Replace("<iframe" , "<iframe id='my_iframe' ") %>
        </div>
        <% } %>

        <!--cai dat -->
        <div style="padding: 2px; width: 100%; background: #272929;">
            <div class="d-flex justify-content-center">
                <div style="padding: 20px;" data-toggle="collapse"><div id="LoadTimeGift"></div></div>

                <a class="dropdown-toggle" style="padding: 20px;" data-toggle="collapse" href="#dsmaychu" role="button" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-server"></i>&nbsp;Danh sách máy chủ </a>
                <!-- cai dat -->
                <a class="dropdown-toggle" style="padding: 20px;" data-toggle="collapse" href="#caidat" role="button" aria-expanded="false" aria-controls="collapseExample"> <i class="fa-solid fa-gear"></i>&nbsp;Cài đặt </a>
                <% if( Sum[int_].Contains("<iframe") == true){ %>
                <div style="padding: 20px;">
                    <div id="loadtime"></div>
                </div>
                <% } %>
                <a style="padding: 20px;" data-toggle="modal" data-target="#bao_loi"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Báo lỗi</a>
            </div>

            <!-- bao loi -->

            <div class="modal fade" id="bao_loi" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" style="color: black;">Báo lỗi <%=infoPhim.ten_phim %>-<%=infoTap_Phim.ten_tap_phim %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input hidden type="text" disabled class="form-control" id="tieude_loi" value="Lỗi_<%=infoPhim.ten_phim %>#<%=infoPhim.id_phim %>_<%=infoTap_Phim.ten_tap_phim %>#<%=infoTap_Phim.id_tap_phim %>" />
                            <div class="form-group">
                                <label style="color: black;">Mô tả</label>
                                <textarea class="form-control" id="noidung_loi" rows="3"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="button" onclick="GuiTinNhan_BaoLoi()" class="btn btn-warning">Gửi</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- js -->
            <script>
                function GuiTinNhan_BaoLoi() {
                <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %>
                    var send_mail_ = '<%=NguoiDungs.id_user %>';
                <% }else{ %>
                    var send_mail_ = '0';
                <% } %>

                    var id_phim = '<%=infoPhim.id_phim %>';
                    var id_tap = '<%=infoTap_Phim.id_tap_phim %>';
                    var send_tieude_ = document.getElementById("tieude_loi").value;
                    var send_noidung_ = document.getElementById("noidung_loi").value;
                    if(send_noidung_ == ""){
                        alert("Vui lòng điền chi tiết lỗi !");
                        return;
                    }
                    var noidung_ = "Tiêu đề:&nbsp;" + send_tieude_ + "&nbsp;&nbsp;Mô tả:&nbsp;<strong>" + send_noidung_ + "</strong>";
                    let NumberERR = getCookie("NumberERR");
                    if (NumberERR == null){
                        NumberERR = 1;
                    }
                    if (NumberERR <= 11111){
                        $.ajax({
                            data: { mail_user: send_mail_, noidung_user: noidung_, id_Phim: id_phim,id_Tap: id_tap   },
                            url: '/Code/ashx/GuiBaoCaoLoi.ashx',
                            type: 'GET',
                            success: function (data) {
                                // alert("Gửi tin thành công");
                                document.getElementById("noidung_loi").value = "";
                                notify('success', 'Đã gửi đến quản trị viên', 'Cảm ơn bạn đã báo cáo');
                                $('#exampleModal').modal('toggle');
                            }
                        });
                        setCookie("NumberERR", (NumberERR += 1));
                    }else{
                        notify('error', 'Cảnh báo !', 'Thao tác quá nhanh');
                    }

                }
            </script>
            <!-- js -->
            <!-- bao loi -->

            <!-- danh sach may chu -->
            <div class="collapse" id="dsmaychu">
                <div class="d-flex justify-content-center">
                    <script>

                        var Sum_Data_raw = <%= Sum.Length %>;
                        var Url = '<%=WebPhimV1.Code.HeThong.url() %>/Public/video/mp4/';

                        for (var i = 0; i < Sum_Data_raw; i++) {
                            document.write("<span  style='margin-top: 10px;color: #ffffff; font-size: 20px; padding: 2px;' id='sv_" + i + "'  onclick='loadsv_( " + i + ")'>#Máy chủ " + (i + 1) + "</span>")
                        }
                        var Data = '<%= noidung %>'.split("|");


                        function loadsv_(i) {
                            var link = Data[i];
                            window.location.href = "?sever-load=" + i + "#video";
                        }
                    </script>
                </div>
            </div>

            <div class="collapse" id="caidat">
                <div class="d-flex justify-content-center">
                    <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %> <% if( Sum[int_].Contains("<iframe") != true){ %>
                    <div id="next_tap" class="btn btn-lg btn-success" style="font-size: 16px; margin: 5px;" onclick="set_nextChuong()">
                        <h6><i class="bi bi-play-btn"></i><span id="next_tap_txt">&emsp;Bật chuyển tập</span></h6>
                    </div>
                    <div id="fullvideo" class="btn btn-lg btn-info" style="font-size: 16px; margin: 5px;" onclick="set_fullvideo()">
                        <h6><i class="bi bi-arrows-fullscreen"></i><span id="fullvideo_txt">&emsp;Bật Full video</span></h6>
                    </div>
                    <% } %> <% if( Sum[int_].Contains("<iframe") == true){ %>
                    <select id="soPhutEndvideo" onChange="selectPhut()" class="btn btn-lg btn-info" style="font-size: 16px; margin: 5px; text-align: left;">
                        <option value="0" selected>Không chuyển tập</option>
                        <option value="5">5 Phút</option>
                        <option value="23">23 Phút</option>
                        <option value="60">60 Phút</option>
                        <option value="90">1h30 phút</option>
                        <option value="120">2h phút</option>
                    </select>
                    <script>
                        // hen gio chuyen tap
                        var Stop;
                        jQuery('iframe[src*="https://"]').addClass("youtube-iframe");

                        LoadTimeNextTap();

                        function LoadTimeNextTap() {
                            //
                            var vitri = getCookie("loca");
                            var e = document.getElementById("soPhutEndvideo");
                            e.options[vitri].selected = true;
                            document.querySelector("iframe").addEventListener("mouseover", function (e) {
                                var time_next = 0;
                                if (Stop != true) {
                                    Stop = true;

                                    //
                                    setInterval(function () {
                                        time_next += 1;
                                        var date = new Date(0);
                                        var dates = getCookie("time_next") * 60 - time_next;
                                        date.setSeconds(dates); // specify value for SECONDS here
                                        var timeString = date.toISOString().substr(11, 8);
                                        var str = "<div><strong><i class='fa-solid fa-hourglass'></i>&nbsp;" + timeString + "&nbsp;";
                                        str += "&nbsp;&nbsp;<span onclick='stoptime()'><i onclick='stoptime()' class='fa fa-stop-circle' aria-hidden='true' ></i>&nbsp;Tạm dừng đếm thời gian</span></strong></div>";
                                        document.getElementById("loadtime").innerHTML = str;
                                    }, 1000);
                                    //
                                }
                                if (getCookie("time_next")) {
                                    var timeout_ = getCookie("time_next") * 60000;

                                    //300,000
                                    setTimeout(function () {
                                        var url = "<% try {%><%=Next.id_tap_phim%><%} catch(Exception ex) {} %>";
                                        if (url != "") {
                                            window.location = url + "#video";
                                            //return false;
                                        }
                                    }, timeout_);
                                }
                            });
                        }

                        function stoptime() {
                            // changes the iframe src to prevent playback or stop the video playback in our case
                            $(".youtube-iframe").each(function (index) {
                                $(this).attr("src", $(this).attr("src"));
                                return false;
                            });

                            //click function
                            setTimeout(function () {
                                alert("Tạm đừng đếm thời gian !");
                            }, 500);
                        }

                        function selectPhut() {
                            var e = document.getElementById("soPhutEndvideo");
                            var val_time = e.options[e.selectedIndex].value;
                            var loca = e.selectedIndex;

                            if (val_time == 0) {
                                setCookie("time_next", 0, -1);
                                setCookie("loca", loca, -1);
                            } else {
                                setCookie("time_next", val_time, 30);
                                setCookie("loca", loca, 30);
                            }
                            LoadTimeNextTap();
                        }
                    </script>
                    <% } %> <% }else{ %>
                    <div class="alert alert-info" role="alert">
                        Đăng nhập để có thể dùng được các tính năng mở rộng
                    </div>
                    <% } %>
                </div>

                <script>
                    var st_ = false;
                    LoadSetting_nextvideo();
                    function LoadSetting_nextvideo() {
                        if (getCookie("next_tap") == "true") {
                            //auto play
                            st_ = "false";
                            document.getElementById("next_tap_txt").innerHTML = "Tắt chuyển tập&nbsp;<i title='Tắt chuyển tập' class='fa fa-pause' aria-hidden='true'></i>";
                        } else {
                            document.getElementById("next_tap_txt").innerHTML = "Bật chuyển tập&nbsp;<i title='Bật chuyển tập' class='fa fa-play' aria-hidden='true'></i>";
                            st_ = "true";
                        }
                    }
                    function set_nextChuong() {
                        if (st_ == "true") {
                            notify("success", "Thông báo", "Bạn đã bật tính năng tự động chuyển tập !");
                        } else {
                            notify("warning", "Thông báo", "Bạn đã tắt tính năng tự động chuyển tập !");
                        }
                        setCookie("next_tap", st_, 30);
                        LoadSetting_nextvideo();
                    }

                    //auto full video
                    var st_fv = "true";
                    var full_v = 0;

                    LoadSetting_fulvideo();
                    function LoadSetting_fulvideo() {
                        if (getCookie("fullVideo") != "false") {
                            st_fv = "false";
                            document.getElementById("fullvideo_txt").innerHTML = "Bật Full video&nbsp;<i title='Bật Full video' class='fa fa-arrows-alt' aria-hidden='true'></i>";
                        } else {
                            st_fv = "true";
                            document.getElementById("fullvideo_txt").innerHTML = "Tắt Full video&nbsp;<i title='Tắt Full video' class='fa fa-times-circle' aria-hidden='true'></i>";
                            $("#video").addClass("full_m");
                            var video = document.getElementById("video");
                            toggleFullScreen(video);
                        }
                    }

                    function set_fullvideo() {
                        if (st_fv != "true") {
                            notify("success", "Thông báo", "Bạn đã bật tính năng xem video toàn màn hình !");
                            // notify('success', 'Gợi ý', 'Nhấn F11 để có thể trải nghiệm tốt nhất !');
                            full_v = 0;
                            $("#video").addClass("full_m");
                        } else {
                            notify("warning", "Thông báo", "Bạn đã tắt tính năng xem video toàn màn hình !");
                            full_v = 1;
                        }
                        setCookie("fullVideo", st_fv, 30);
                        LoadSetting_fulvideo();
                    }

                    // check exit full video
                    if (document.addEventListener) {
                        document.addEventListener("fullscreenchange", exitHandler, false);
                        document.addEventListener("mozfullscreenchange", exitHandler, false);
                        document.addEventListener("MSFullscreenChange", exitHandler, false);
                        document.addEventListener("webkitfullscreenchange", exitHandler, false);
                    }
                    function exitHandler() {
                        if (!document.webkitIsFullScreen && !document.mozFullScreen && !document.msFullscreenElement) {
                            $("#video").removeClass("full_m");
                            setCookie("fullVideo", 1, 30);
                            full_v = 1;
                            LoadSetting_fulvideo();
                        }
                    }
                    $(document).keyup(function (e) {
                        if (e.key === "Escape") {
                            // escape key maps to keycode `27`
                            $("#video").removeClass("full_m");
                            setCookie("fullVideo", 1, 30);
                            full_v = 1;
                            LoadSetting_fulvideo();
                        }
                    });
                </script>
            </div>
        </div>

        <!-- end cai dat -->
        <!-- tap phim -->
        <div class="main-content">
            <section class="movie-detail container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="trending-info season-info g-border">
                            <div class="d-flex align-items-center text-white text-detail episode-name mb-0">
                                <span><a href="<%=WebPhimV1.Code.HeThong.url() %>/phim/<%= infoPhim.link_raw %>-<%= infoPhim.id_phim %>"><%= infoPhim.ten_phim %></a></span>
                                &nbsp;-&nbsp;<span><%= WebPhimV1.Code.Phim.RutGon(infoTap_Phim.ten_tap_phim, 20) %></span>
                            </div>
                            <p>Lượt xem:&nbsp;<%= getLuotXemTap(infoTap_Phim.id_tap_phim) %> Thời gian:&nbsp;<%= infoPhim.created_at.ToString("HH:mm:ss dd-MM-yyyy") %></p>
                        </div>
                        <% if(WebPhimV1.Code.NguoiDung.CheckLogin()){ %> <% if(NguoiDungs.quyen_han != "0"){ %>
                        <a href="<%=WebPhimV1.Code.HeThong.url() %>/cp-admin/tap-phim/capnhat-<%= infoTap_Phim.id_tap_phim %>" class="text-primary"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Thông tin tập phim</a>
                        <% } %> <% } %>
                    </div>
                </div>
            </section>
            <!-- danh sach tap -->
            <section id="iq-favorites">
                <div class="container">
                    <div class="block-space">
                        <div class="row">
                            <div class="col-sm-12 overflow-hidden">
                                <div class="iq-main-header d-flex align-items-center justify-content-between">
                                    <h4 class="main-title">Danh sách tập</h4>
                                </div>
                            </div>
                        </div>
                        <!-- item -->
                        <div class="list_Phim">
                            <ul class="list-Tap_Phim" style="max-height: 300px;">
                                <% if (DsTap_Phim != null) { for (int a = 0; a < DsTap_Phim.Count; a++) { %>
                                <a style="text-decoration: none;" title="<%=DsTap_Phim[a].ten_tap_phim %>" href="<%=WebPhimV1.Code.HeThong.url() %>/Phim/<%=infoPhim.link_raw +'-'+ infoPhim.id_phim +'/' +DsTap_Phim[a].id_tap_phim %>#video">
                                    <button style="margin: 5px;" type="button" class="btns btn-outline-dark <% if (DsTap_Phim[a].id_tap_phim == infoTap_Phim.id_tap_phim){ %> active <% } %>">
                                        <%= WebPhimV1.Code.Phim.RutGon(DsTap_Phim[a].ten_tap_phim, 20) %>
                                    </button>
                                </a>
                                <% } }else{ %>
                                <center>
                                    <h1>
                                        <div id="noti_tap_phim"></div>
                                    </h1>
                                </center>
                                <% } %>
                            </ul>
                        </div>
                        <!--end  item -->
                    </div>
                </div>
            </section>
            <!-- end dst -->
            <!-- binh luan -->
            <form></form>
            <section class="container seasons">
                <ul class="trending-pills d-flex nav nav-pills align-items-center text-center s-margin" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active show" data-toggle="pill" href="#binhluan_trang" role="tab" aria-selected="false">Bình luận</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#binhluan_fb" role="tab" aria-selected="false">Bình luận Facebook</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- binh luan -->
                    <div id="binhluan_trang" class="tab-pane fade active show container" role="tabpanel">
                        <div class="block-space">
                            <div class="epi-box">
                                <!-- phan noi dung -->
                                <!-- binh luan cua trang -->
                                <!-- phan noi dung -->
                                <div class="list_Phim">
                                    <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %>
                                    <form method="post">
                                        <div class="form-group">
                                            <label>Thêm bình luận: </label>
                                            <textarea name="message" id="message"></textarea>
                                            <div class="d-flex flex-row-reverse bd-highlight">
                                                <button class="btn btn-dark" name="binhluan" style="margin-top: 10px;" value="true">Bình luận</button>
                                            </div>
                                        </div>
                                    </form>
                                    <% } %>
                                    <div class="list-binhluan" style="background: #3c3f424f; max-height: 800px;">
                                        <% if (BinhLuan != null) { for (int a = 0; a < BinhLuan.Count; a++) { GetPhanHoi(BinhLuan[a].id_cmt); %>
                                        <div class="row" style="margin-right: 10px; margin-left: 10px;">
                                            <div class="col-8">
                                                <p title="#<%=BinhLuan[a].id_user %>">
                                                    <img
                                                        onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';"
                                                        src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/<%= ImgTaiKhoan(BinhLuan[a].id_user)  %> "
                                                        class="avatar"
                                                        width="40"
                                                    />
                                                    <%= TenTaiKhoan(BinhLuan[a].id_user) %> <%=WebPhimV1.Code.NguoiDung.HuyHieuUser(GetQuyenHan(Convert.ToInt32(BinhLuan[a].id_user))) %> <%if (infoPhim.id_user == BinhLuan[a].id_user) { %>
                                                    <span class="badge badge-warning">Người đăng</span>
                                                    <%} %>
                                                </p>
                                            </div>
                                            <div class="col-4" style="text-align: right; font-size: 50%;">
                                                <%=WebPhimV1.Code.HeThong.TinhThoiGian(BinhLuan[a].created_at) %>
                                            </div>
                                            <div class="txt-binhluan">
                                                <div style="margin-right: 5px;">
                                                    <% string NoiDung = ""; if (BinhLuan[a].status_ != 1) { NoiDung = WebPhimV1.Code.HeThong.XoaKhoanTrangThua(WebPhimV1.Code.HeThong.TuNhayCam(BinhLuan[a].noidung_cmt)); } else { NoiDung =
                                                    "Bình luận bị ẩn bởi quản trị viên!"; } if (NoiDung.Length >= 35) { %>
                                                    <div class="show-less-div-2">
                                                        <%= NoiDung %>
                                                    </div>
                                                    <% }else{ %> <%= NoiDung %> <% } %>
                                                </div>
                                            </div>
                                            <div style="font-size: 10px;">#<%=BinhLuan[a].id_cmt %>&emsp;</div>
                                            <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %> <%if (BinhLuan[a].id_user == NguoiDungs.id_user) { %>
                                            <a href="?XoaBinhLuan=<%= BinhLuan[a].id_cmt %>" style="font-size: 15px;">Xoá bình luận</a>
                                            <% } %> <%if (BinhLuan[a].id_user != NguoiDungs.id_user) { %> &nbsp;
                                            <a onclick="phanhoi(this.id)" href="#bl_<%= BinhLuan[a].id_cmt %>" id="<%= BinhLuan[a].id_cmt %>" style="font-size: 15px;">Phản hồi</a>
                                            <% } %> <% } %> &nbsp;<% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %> <%if (BinhLuan[a].id_user != NguoiDungs.id_user && WebPhimV1.Theme.NguoiDung.quyen_han != 0) { %>
                                            <a href="<%= WebPhimV1.Code.HeThong.url() %>/cp-admin/Phim/binhluan?status=<%= BinhLuan[a].id_cmt %>" style="font-size: 15px;">Ẩn bình luận</a>
                                            <% } } %>
                                        </div>
                                        <!-- nhap phan hoi binh luan -->
                                        <form method="post" id="bl_<%= BinhLuan[a].id_cmt %>" style="margin-left: 20px; display: none; margin-bottom: 10px;">
                                            <input name="id-binhluan" style="display: none;" value="<%= BinhLuan[a].id_cmt %>" />
                                            <input name="user-binhluan" style="display: none;" value="<%= BinhLuan[a].id_user %>" />
                                            <div class="form-group">
                                                <label>Phản hồi bình luận: </label>
                                                <textarea name="noidung-bl" class="form-control" rows="2">@<%= TenTaiKhoan(BinhLuan[a].id_user) %>&nbsp;.</textarea>
                                            </div>
                                            <input type="submit" class="btn btn-info" name="phan_hoi" value="Phản hồi" />
                                        </form>
                                        <!-- nhap phan hoi binh luan -->
                                        <!-- load phan hoi -->
                                        <% if (LoadPhanHoi != null ){ for (int i = 0; i < LoadPhanHoi.Count(); i++) { %>
                                        <div class="row" style="margin-left: 60px;">
                                            <div class="col-8">
                                                <p title="#<%=LoadPhanHoi[i].id_user %>">
                                                    <img
                                                        onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';"
                                                        src="<%=Request.Url.GetLeftPart(UriPartial.Authority)%>/public/img/www/avatar/<%= ImgTaiKhoan(LoadPhanHoi[i].id_user)%> "
                                                        class="avatar"
                                                        width="40"
                                                    />
                                                    <%= TenTaiKhoan(LoadPhanHoi[i].id_user)%> <%=WebPhimV1.Code.NguoiDung.HuyHieuUser(GetQuyenHan(Convert.ToInt32(LoadPhanHoi[i].id_user))) %> <%if (infoPhim.id_user == LoadPhanHoi[i].id_user)
                                                    { %>
                                                    <span class="badge badge-warning">Người đăng</span>
                                                    <%} %>
                                                </p>
                                            </div>
                                            <div class="col-4" style="text-align: right; font-size: 50%;">
                                                <%=WebPhimV1.Code.HeThong.TinhThoiGian(LoadPhanHoi[i].created_at)%>
                                            </div>
                                            <div class="txt-binhluan">
                                                <% if (LoadPhanHoi[i].status_ != 1) { NoiDung = WebPhimV1.Code.HeThong.XoaKhoanTrangThua(WebPhimV1.Code.HeThong.TuNhayCam(LoadPhanHoi[i].noidung_cmt) ); } else { NoiDung = "Bình luận bị ẩn bởi quản trị viên!"; } %> <%if (NoiDung.Length >= 35) { %>
                                                <div class="show-less-div-2">
                                                    <%= NoiDung %>
                                                </div>
                                                <% } else { %> <%= NoiDung %> <% } %>
                                            </div>
                                            <div style="font-size: 10px;">#<%=LoadPhanHoi[i].id_cmt %>&emsp;</div>
                                            <% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %> <%if (LoadPhanHoi[i].id_user == NguoiDungs.id_user) { %>
                                            <a href="?XoaBinhLuan=<%= LoadPhanHoi[i].id_cmt%>" style="font-size: 15px;">Xoá bình luận</a>
                                            <% } %> <%if (LoadPhanHoi[i].id_user != NguoiDungs.id_user) { %> &nbsp;
                                            <a onclick="phanhois(this.id)" href="#bls_<%= LoadPhanHoi[i].id_cmt%>" id="<%= LoadPhanHoi[i].id_cmt%>" style="font-size: 15px;">Phản hồi</a>
                                            <% } %> <% } %> &nbsp;<% if (WebPhimV1.Code.NguoiDung.CheckLogin() == true){ %> <%if (BinhLuan[a].id_user != NguoiDungs.id_user && WebPhimV1.Theme.NguoiDung.quyen_han != 0) { %>
                                            <a href="<%= WebPhimV1.Code.HeThong.url() %>/cp-admin/Phim/binhluan?status=<%= LoadPhanHoi[i].id_cmt %>" style="font-size: 15px;">Ẩn bình luận</a>
                                            <% } } %>
                                        </div>
                                        <!-- nhap phan hoi binh luan -->
                                        <form method="post" id="bls_<%= LoadPhanHoi[i].id_cmt%>" style="margin-left: 60px; display: none; margin-bottom: 10px;">
                                            <input name="id-binhluan" style="display: none;" value="<%= BinhLuan[a].id_cmt %>" />
                                            <input name="user-binhluan" style="display: none;" value="<%= LoadPhanHoi[i].id_user %>" />
                                            <div class="form-group">
                                                <label>Phản hồi bình luận: </label>
                                                <textarea name="noidung-bl" class="form-control" rows="2">@<%= TenTaiKhoan(LoadPhanHoi[i].id_user)%>&nbsp.</textarea>
                                            </div>
                                            <input type="submit" class="btn btn-info" name="phan_hoi" value="Phản hồi" />
                                        </form>
                                        <!-- nhap phan hoi binh luan -->
                                        <% } }%>
                                        <!-- end load phan hoi -->
                                        <%} }%>
                                    </div>
                                </div>
                                <!-- end phan noi dung -->
                                <script>
                                    function phanhoi(id) {
                                        var bl_id = "bl_" + id;
                                        document.getElementById(bl_id).style.display = "block";
                                    }
                                    function phanhois(id) {
                                        var bl_id = "bls_" + id;
                                        document.getElementById(bl_id).style.display = "block";
                                    }
                                </script>
                                <!-- phan trang -->
                                <% int CheckPT = 0; if (Request.QueryString["page"] != null) {CheckPT = 1;} %> <%= WebPhimV1.Code.HeThong.PhanTrang(CheckPT, SumPage, HttpContext.Current.Request.Url.PathAndQuery+"#binhluan_trang",
                                Convert.ToInt32(Request.QueryString["page"])) %>
                                <!-- phan trang end-->
                                <!-- end phan noi dung -->
                            </div>
                        </div>
                    </div>
                    <!-- end binh luan -->
                    <!-- bl fb -->
                    <div id="binhluan_fb" class="tab-pane fade" role="tabpanel">
                        <div class="block-space">
                            <div class="row">
                                <div class="container">
                                    <div class="card-body" style="background: #ffffff;">
                                        <!-- binh luan fb -->
                                        <%= cauhinh.Cm_FB %>
                                        <div class="fb-comments" data-href="<%= WebPhimV1.Code.HeThong.url() %>/<%= infoPhim.link_raw %>-<%= infoTap_Phim.id_tap_phim %>" data-width="" data-numposts="5"></div>
                                        <!-- binh luan fb -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end fb -->
                </div>
            </section>
            <!-- end-->
        </div>
        <!-- end tap phim --.
   <!-- list video -->
        <!-- binh luan--------------------------------------------------- -->
        <script>
            tinymce.init({ selector: "#message", plugins: "emoticons", toolbar: "emoticons", toolbar_location: "bottom", menubar: !1 });

            $(document).ready(function (e) {
                $(".show-less-div-2").myOwnLineShowMoreLess({ showLessLine: 2, showLessText: "Thu gọn", showMoreText: "Xem Thêm" });
            });
        </script>
        <style>
            .fb_iframe_widget,
            .fb_iframe_widget span,
            .fb_iframe_widget span iframe[style] {
                width: 100% !important;
            }
        </style>
        <!-- end binh luan trang -->
    </section>
</div>

<% if(WebPhimV1.Code.NguoiDung.CheckLogin() ){ %>

<script>
    // TimeGiftCoin //
    // 5 phut
    //var time = 300000;
    var numberTime = getCookie("numberTimer");

    if (numberTime == "") {
        LoadTimeGiftCoin(1);
        setCookie("numberTimer", 1, 0.5);
    } else {
        LoadTimeGiftCoin(numberTime);
    }

    function LoadTimeGiftCoin(number) {
        var time = 10000 * number;
        //setTimeout(function(){
        setTimeout(function () {
            GiftCoin(number);
        }, time);
        // }, time);
    }
    function GoiDeQuy(number){
        var numberTime = number + "1";
        setCookie("numberTimer", numberTime, 0.5);
        LoadTimeGiftCoin(numberTime);
    }
    var Max;
    function GiftCoin(number) {
        $.ajax({
            data: {},
            url: "/Code/ashx/GiftCoin.ashx",
            type: "GET",
            success: function (data) {
                if(data.dulieu == "DaNap"){
                    GoiDeQuy(number);
                }else{
                    Max = true;
                }
            },
        });
    }
    LoadTimeGiftView();
    var saveTime = 1;
    function LoadTimeGiftView() {
        setInterval(function () {
            var date = new Date(0);
            var time = getCookie("numberTimer") * 1000 * 0.01;
            var sec = time - saveTime;
            if(Max == true){
                document.getElementById("LoadTimeGift").innerHTML = "<i class='fa-solid fa-gift'></i>&nbsp;Hết số lượt nhận coin";
            }else{
                if(sec > 0){
                    date.setSeconds(sec); // specify value for SECONDS here
                    saveTime = saveTime + 1;
                    var timeString = date.toISOString().substr(11, 8);
                    document.getElementById("LoadTimeGift").innerHTML = "<i class='fa-solid fa-gift'></i>&nbsp;" + timeString;
                }else{
                    document.getElementById("LoadTimeGift").innerHTML = "<i class='fa-solid fa-gift'></i>&nbsp;Loading...";
                }
            }
           
        }, 1000);
    }

    // TimeGiftCoin //
</script>
<% } %>
