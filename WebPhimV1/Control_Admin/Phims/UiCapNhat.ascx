<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiCapNhat.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiCapNhat" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Cập nhật phim</h3>
         </div>
      </div>
   </div>
</div>
<!-- noi dung -->
<div class="card-body">
   <!-- form them Phim -->
   <asp:Label ID="Label1" runat="server" ></asp:Label>
   <form class="nhap-Phim" method="post" EncType="multipart/form-data">
      <div class="form-group">
         <label >Tên phim</label>
         <input type="text" class="form-control" name="tenPhim" value="<%= infoPhim.ten_phim %>">
      </div>
      <div class="form-group">
         <label>Đạo điễn</label>
         <input type="text" class="form-control" name="tacgia" value="<%= infoPhim.tac_gia %>" placeholder="Nhập tên Đạo điễn">
      </div>

        <div class="form-group">
    <label>Quốc gia</label>
    <select class="form-control" name="quocgia">
        <%
            List<string> quocqia = new List<string>();
            quocqia.Add("Nhật Bản");
            quocqia.Add("Trung Quốc");
            quocqia.Add("Mỹ");
            quocqia.Add("Hàn Quốc");
            quocqia.Add("Anh");
            quocqia.Add("Ấn Độ");
            quocqia.Add("Việt Nam");
            quocqia.Add("Hong Kong");
            quocqia.Add("Khác");
        %>
        <% for(int i = 0; i < quocqia.Count(); i++){ %>
      <option value ="<%=quocqia[i] %>" <% if (quocqia[i] == infoPhim.quoc_gia){ %> selected <% } %> > <%= quocqia[i] %> </option>
        <% } %>
    </select>
  </div>
      <div class="form-group">
         <label>Năm sản xuất</label>
         <% string nsx = "0"; if (infoPhim.nam_sx != null && infoPhim.nam_sx.Replace(" ", "").Length > 3) { nsx = infoPhim.nam_sx.Replace(" ", ""); }  %>
         <input type="number" class="form-control" name="namsx" value="<%= Int64.Parse(nsx) %>" placeholder="Nhập năm sản xuất" >
      </div>
      <div class="form-group">
         <label >Coin</label>
         <input type="number" class="form-control" name="coin" value="<%= Convert.ToDecimal(infoPhim.coin_phim) %>">
      </div>
      <div class="form-group">
         <label>Trạng thái:</label>   
         <select class="form-control" name="trangthai" >
            <option value="0" <% if (infoPhim.status_ == 0) { %> selected <% } %>>Tạm ngưng</option>
            <option value="1" <% if (infoPhim.status_ == 1) { %> selected <% } %>>Hoạt động</option>
         </select>
      </div>
      <div class="form-group">
         <div id="list1" class="dropdown-check-list" tabindex="100">
            <label><strong>Thể loại phim:</strong>
                  <input onkeyup="TimTL()" id="tim_tl"  class="form-control"  placeholder="Tìm thể loại"  type="text"/>
                 <% for (int i = 0; i < PhimTL.Count; i ++ ){ %> <%= PhimTL[i].ten_theloai + "," %> <% } %></label><br>
            <div class="form-group" style="overflow: scroll; max-height: 300px">
               <!-- Button trigger modal -->
               <% for(int a = 0; a < DanhSachTheLoai.Count; a ++){ %>
               <label class="container_checkbox" data-value="<%=DanhSachTheLoai[a].ten_theloai %>"  style=" background: #454d55; margin-left: 10px;font-size: 25px; display: block">
               <input onclick="dele_c()" type="checkbox" name="the-loai" value="<%=DanhSachTheLoai[a].id_theloai %>">&nbsp;&nbsp;<%=DanhSachTheLoai[a].ten_theloai %>
               <span class="checkmark"></span>
               </label>
               <% } %>
            </div>
         </div>
       
         <script>
             function dele_c() {
                 document.getElementById("tim_tl").value = "";
                 TimTL();
             }

             function TimTL() {
                 var timtl = document.getElementById("tim_tl").value;
                 var TL = document.getElementsByClassName('container_checkbox');
                 var TL_input = document.getElementsByName('the-loai');

                 if (timtl != "") {
                     for (let i = 0; i < TL.length; i++) {
                         if (timtl != "" && TL[i].getAttribute("data-value").toLowerCase().includes(timtl.toLowerCase())) {
                             TL[i].style.color = '#ff5f5f';
                             TL[i].style.display = 'block';
                             TL[i].style.fontSize = '30px';
                             TL_input[i].style.transform = 'scale(2)';
                         } else {
                             TL[i].style.color = 'white';
                             TL[i].style.display = 'none';
                             TL[i].style.fontSize = '25px';
                             TL_input[i].style.transform = 'scale(1)';
                         }
                     }
                 } else {
                     for (let i = 0; i < TL.length; i++) {
                         TL[i].style.color = 'white';
                         TL[i].style.display = 'block';
                         TL[i].style.fontSize = '25px';
                         TL_input[i].style.transform = 'scale(1)';
                     }
                 }

             }
             // load check the loai cap nhat
             const danhSTL = [];
         </script>
         <% for (int i = 0; i < PhimTL.Count; i ++ ){ %><script>danhSTL.push("<%= PhimTL[i].ten_theloai%>")</script><% } %>
         <script>
             var TLs = document.getElementsByClassName('container_checkbox');
             var c_TL = document.getElementsByName('the-loai');

             var str = "";
             for (let i = 0; i < TLs.length; i++) {
                 for (let a = 0; a < danhSTL.length; a++) {
                     if (TLs[i].getAttribute("data-value") == danhSTL[a]) {
                         TLs[i].style.color = '#ff5f5f';
                         TLs[i].style.backgroundColor = '#707d8d3b';
                         c_TL[i].checked = true;
                     }

                 }

             }

         </script>
      </div>
      <!-- nhap tom tac -->
      <div class="form-group">
         <label>Tóm tắt phim</label>
         <textarea name="input_tomtat" id="input_tomtat">
         <%= infoPhim.tomtat_phim %>
         </textarea>
      </div>
      <script>
          CKEDITOR.replace("input_tomtat");
      </script>
      <div class="form-group">
         <label for="exampleFormControlFile1">Ảnh Bìa phim:</label>
         <br>
         <img onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" width="200" class="img-Phim" src="<%=WebPhimV1.Code.HeThong.url() %>/public/img/Phim/<%= infoPhim.img_phim %>" onError="this.onerror=null;this.src='<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/err-img.png';" />
         <br>
         <asp:FileUpload ID="FileUpload1" runat="server" />
      </div>
      <div class="d-flex justify-content-end">
         <input type="submit" class="btn btn-dark" name="btn-capnhat" value="Chỉnh Sửa phim">
      </div>
   </form>
   <!-- end form them Phim -->
</div>