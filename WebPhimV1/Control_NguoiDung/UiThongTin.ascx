<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThongTin.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.UiThongTin" %>
<script>
    document.title = "Thông Tin KDA STUDIO";
</script>


<div class="main-content">
   <section  class="sign-in-page"  style="margin-top: 60px">
      <div class="container-fluid">

    <ul class="row justify-content-center align-items-center height-self-center">
        <li>
            <h2>Nhóm 1 | Website Xem phim </h2>
        </li>
        <li><img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/avtt.png"  class="avatar" width="40"/>&emsp;Triệu Vĩnh Khang | MSSV: 199751</li>
        <li><img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/avatar/avtt.png"  class="avatar" width="40"/>&emsp;Võ Khương Duy | MSSV: 192339</li>
    </ul>
</div>
       </section>
       </div>
<style>
    ul li{
    list-style-type: none;
    padding: 10px;
    }
</style>