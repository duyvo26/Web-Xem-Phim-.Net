<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiNapCoin.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.UiNapCoin" %>
<script>
    document.title = "Nạp Coin";
</script>

 <%= HeThongs.Fb_mess %>



<div class="wrapper">
    <div class="card px-4">
        <div class=" my-3">
            <p class="h8">Hình thức thanh toán</p>
        </div>
        <div class="debit-card mb-3">
            <div class="d-flex flex-column h-100"> <label class="d-block">
                    <div class="d-flex position-relative">
                        <div> <img src="<%=WebPhimV1.Code.HeThong.url() %>/Public/img/www/top-icon/momo.png" class="visa" alt="">
                           
                        </div>
                      
                    </div>
                </label>
                <div class="mt-auto fw-bold d-flex align-items-center justify-content-between">
                    <p><%= HeThongs.sdt_lh %></p>
                    <p>
               <img style="width: 55px; height: 55px;" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/thanhtoan/<%= HeThongs.thanhtoan_online %>" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" />
            </p>
                </div>
            </div>



        </div>
    </div>
  <% if (Request.Cookies["Log"] != null){ %>
<button type="button" class="btns" data-toggle="modal" data-target="#thanhtoan" style=" width: 100%;  color: white;  background: #cb2121">
  Thanh toán
</button>
  <% } %>
<!-- Modal -->
<div class="modal fade" id="thanhtoan" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color: black">Mã thanh toán</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="d-flex justify-content-center">
      <img style="width: 300px; height:  300px" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/thanhtoan/<%= HeThongs.thanhtoan_online %>" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" />
          </div>
          <div style="color: black">
              <center>
             <strong>
                  Nội dung chuyển tiền: <%=NguoiDungs.ten_dangnhap %> <%=DateTime.Now.ToString("dd-HH") %> nạp tiền
             </strong>
            <p>Tỷ lệ nạp x10</p>
              </center>
            <p>Chúng tôi sẽ xử lý trong thời gian sớm nhất</p>
            <p>We will handle it as soon as possible</p>
          </div>
      </div>
     </div>
  </div>
</div>
</div>



<style>
.wrapper{margin-right:auto;margin-left:auto;max-width:460px;box-shadow:3px 3px 5px #1b1b1ba2}.card{background-color:#1d1d1d}.card .atm{width:90px;height:90px;object-fit:cover}.card .visa{width:50px;height:45px;object-fit:fill}.card .master{width:50px;height:50px;object-fit:fill}.debit-card{width:100%;height:210px;padding:20px;background-color:#d18cb1;background-image:linear-gradient(160deg,#ae3576 0,#ad8199 100%);position:relative;border-radius:5px;box-shadow:3px 3px 5px #0000001a;transition:all .3s ease-in;cursor:pointer}.debit-card:hover{box-shadow:5px 3px 5px #000000a2}.card-2{background-color:#21d4fd;background-image:linear-gradient(116deg,#21d4fd 0,#b721ff 100%)}.text-muted{font-size:.8rem}.text-white{font-size:14px}.input{position:absolute;top:6px;right:0}input[type="radio"]{appearance:none;width:20px;height:20px;background-color:#eee;position:relative;border-radius:3px;cursor:pointer;display:flex;align-items:center;justify-content:center;outline:0}input[type="radio"]:after{position:absolute;width:100%;height:100%;font-family:"Font Awesome 5 Free";font-weight:600;content:"\f00c";color:#fff;font-size:15px;display:none}input[type="radio"]:checked,input[type="radio"]:checked:hover{background-color:blue}input[type="radio"]:checked::after{display:flex;align-items:center;justify-content:center}input[type="radio"]:hover{background-color:#ddd}
</style>