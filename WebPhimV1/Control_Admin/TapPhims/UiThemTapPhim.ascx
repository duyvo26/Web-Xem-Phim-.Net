<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThemTapPhim.ascx.cs" Inherits="WebPhimV1.Control_Admin.Tap_Phims.UiThemTap_Phim" %>
<script>
    function setCookie(cname, cvalue, exdays) {
        const d = new Date();
        d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
        let expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    function getCookie(cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(";");
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == " ") {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    setCookie("NamePhim", "<%= infoPhim.link_raw %>", 1);
</script>
<div class="card">
    <div class="card-header">
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <div class="card card-danger">
            <div class="card-header">
                <h3 class="card-title">
                    Thêm tập phim: <%=infoPhim.ten_phim%>
                    <!-- da sua thanh 2 cham  -->
                </h3>
            </div>
        </div>
        <a href="../tap-phim/danhsach-<%=infoPhim.id_phim %>">
            <button type="button" class="btn btn-primary btn-lg btn-block">Danh Sách tập phim</button>
        </a>
    </div>
</div>
<div class="card-body">
    <!-- End thêm tiêu đề -->
    <asp:Label ID="noti" runat="server"> </asp:Label>
    <!-- Tên tập phim -->
    <form class="nhap-Phim" method="post">
        <div class="form-group">
            <label for="exampleFormControlInput1">Tên tập phim</label>
            <input type="text" onkeyup="Call_tapPhim()" class="form-control" id="tapPhim" placeholder="Nhập tên tập phim hoặc số tập phim" name="ten_tap_phim" />
            <script>
                function Call_tapPhim() {
                    var tapPhim = document.getElementById("tapPhim").value;
                    var soTap = tapPhim.split(" ");
                    if (soTap[1] > 0) {
                        setCookie("LuuSoTap_STR", soTap[0], 30);
                        setCookie("LuuSoTap", soTap[1], 30);
                        setCookie("UrlSoTap", window.location.href, 30);
                    }
                }

                if (window.location.href == getCookie("UrlSoTap")) {
                    let num = Number(getCookie("LuuSoTap")) + 1;
                    document.getElementById("tapPhim").value = getCookie("LuuSoTap_STR") + " " + num;
                }

                function TangsoTapClick() {
                    var tapPhim = document.getElementById("tapPhim").value;
                    var soTap = tapPhim.split(" ");
                    let num = Number(soTap[1]);
                    setCookie("LuuSoTap", num, 30);
                }
            </script>
        </div>
        <!--END Tên tập phim -->
        <!-- nhap noi dung Tap_Phim -->
        <div class="form-group">
            <!-- Button trigger modal -->
            <label>Tên file mp4</label>
            <br />
            <a href="https://abyss.to/dashboard/upload" target="_blank">
                <button type="button" class="btn btn-primary">
                    Máy chủ video dự phòng abyss.to
                </button>
            </a>
            <div class="input-group-prepend">
                <input type="text" id="txt_names" class="form-control" value="" />
                <button id="add-link" class="btn btn-info">Thêm đường dẫn</button>
            </div>
            <input hidden onchange="load_view()" type="text" id="txt_name" class="form-control" value="" name="input_tap_phim" />
            <div style="background: #ffffff; color: black; padding: 10px;">
                <div id="view"></div>
            </div>
            <script>
                load_view();
                var add = document.getElementById("add-link");
                add.onclick = function () {
                    var views = document.getElementById("txt_names").value;
                    var val_raw = document.getElementById("txt_name").value;
                    if (views != "") {
                        if (val_raw != "") {
                            document.getElementById("txt_name").value = val_raw + "|" + views;
                        } else {
                            document.getElementById("txt_name").value = views;
                        }

                        load_view();
                    }
                    return false;
                };
                function load_view() {
                    var view = document.getElementById("txt_name").value.split("|");
                    var str = "";
                    for (var i = 0; i < view.length; i++) {
                        str += "<li onclick='edit_item(this)' data-id='" + i + "' >" + encodeURI(view[i]) + "&ensp;<i class='bi bi-trash3' onclick='dele_item(this);' data-id='" + i + "'></i></li>";
                    }
                    document.getElementById("view").innerHTML = str;
                    document.getElementById("txt_names").value = "";
                }
                function dele_item(id) {
                    let text = "Bạn có chắc muốn xoá file video này";
                    if (confirm(text) == true) {
                        var id = $(id).data("id");
                        var view = document.getElementById("txt_name").value.split("|");
                        var str = "";
                        var str_nd = "";
                        for (var i = 0; i < view.length; i++) {
                            if (i == id) {
                                continue;
                            }
                            str += "<li onclick='edit_item(this)' data-id='" + i + "' >" + encodeURI(view[i]) + "&ensp;<i class='bi bi-trash3' onclick='dele_item(this);' data-id='" + i + "'></i></li>";
                            str_nd += encodeURI(view[i]) + "|";
                        }
                        document.getElementById("view").innerHTML = str;
                        var str_s = "";
                        if (str_nd.substr(str_s.length - 1) == "|") {
                            str_s = str_nd.substr(0, str_nd.length - 1);
                        } else {
                            str_s = str_nd;
                        }
                        document.getElementById("txt_name").value = str_s;
                    }
                }

                function edit_item(id) {
                    var id = $(id).data("id");
                    var view = document.getElementById("txt_name").value.split("|");
                    var str = "";
                    var str_nd = "";
                    for (var i = 0; i < view.length; i++) {
                        if (i == id) {
                            document.getElementById("txt_names").value = view[i];
                        }
                    }
                }
            </script>
            <input style="margin-top: 10px;" type="file" onchange="ClickUp()" name="postedFile" accept=".mp4,.webm,.mkv,.avi" />
            <script>
                function ClickUp() {
                    document.getElementById("btnUpload").click();
                }
            </script>
            <input type="button" class="btn btn-danger" id="btnUpload" value="Tải lên" />
            <progress id="fileProgress" style="display: none;"></progress>
            <script type="text/javascript">
                var url = "/Code/ashx/UploadVideo.ashx";

                $("body").on("click", "#btnUpload", function () {
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: new FormData($("form")[0]),
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (file) {
                            document.getElementById("add_phim").disabled = false;
                            $("#fileProgress").hide();
                            var link_old = document.getElementById("txt_name").value;
                            if (link_old != "") {
                                $("#txt_name").val(link_old + "|" + file.name);
                            } else {
                                $("#txt_name").val(file.name);
                            }
                            load_view();
                        },
                        error: function (error) {
                            alert("Có lỗi vui lòng kiểm tra\n File không lớn hơn 2GB");
                            console.log("error:" + imgFile);
                        },
                        xhr: function () {
                            var fileXhr = $.ajaxSettings.xhr();

                            if (fileXhr.upload) {
                                document.getElementById("add_phim").disabled = true;
                                $("progress").show();
                                fileXhr.upload.addEventListener(
                                    "progress",
                                    function (e) {
                                        // dat goi gan upload
                                        if (e.lengthComputable) {
                                            if (e.total < 2000000000) {
                                                $("#fileProgress").attr({
                                                    value: e.loaded,
                                                    max: e.total,
                                                });
                                            } else {
                                                $("progress").hide();
                                                fileXhr.abort();
                                            }
                                        }
                                    },
                                    false
                                );
                            }
                            return fileXhr;
                        },
                    });
                });
            </script>
        </div>
        <div class="d-flex justify-content-end" style="margin-bottom: 5px; margin-right: 5px;">
            <input type="submit" id="add_phim" class="btn btn-dark" onclick="TangsoTapClick()" name="btn" value="Thêm tập phim" />
        </div>
    </form>
    <!-- End nội dung -->
</div>
