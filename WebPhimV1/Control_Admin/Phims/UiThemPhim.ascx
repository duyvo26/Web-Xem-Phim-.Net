<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThemPhim.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiThemPhim" %>
<div class="card">
<div class="card-header">
   <asp:Label ID="noti" runat="server"></asp:Label>
   <div class="card card-danger">
      <div class="card-header">
         <h3 class="card-title">Thêm phim</h3>
      </div>
   </div>
</div>
</div
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<!-- noi dung -->
<!-- /.card-header -->
<div class="card-body">
   <!-- form them Phim -->
   <asp:Label ID="Label1" runat="server"></asp:Label>
   <form autocomplete="off" class="nhap-Phim" method="POST" EncType="multipart/form-data">
      <div class="form-group">
         <label for="exampleFormControlInput1">Tên phim</label>
         <input type="text" class="form-control" name="tenPhim" placeholder="Nhập tên phim">
      </div>
      <div class="form-group">
         <label for="exampleFormControlInput1">Đạo điễn</label>
         <input type="text" class="form-control" name="tacgia" value="Cập nhật" placeholder="Nhập tên Đạo điễn">
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
      <option value ="<%=quocqia[i] %>" > <%= quocqia[i] %> </option>
        <% } %>
    </select>
  </div>
             <div class="form-group">
         <label for="exampleFormControlInput1">Năm sản xuất</label>
         <input type="number" class="form-control" name="namsx" value="0">
      </div>
      <div class="form-group">
         <label for="exampleFormControlInput1">Coin</label>
         <input type="number" class="form-control" value="0" name="coin" min="0" max="9999999999" >
      </div>
      <div class="form-group" style="overflow: scroll; max-height: 300px;    ">
         <label>Thể loại phim: </label> <br>        <!-- Button trigger modal -->
             <input onkeyup="TimTL()" id="tim_tl" class="form-control"  placeholder="Tìm thể loại" type="text"/>
         <% for(int a = 0; a < DanhSachTheLoai.Count; a ++){ %>
         <label class="container_checkbox" data-value="<%=DanhSachTheLoai[a].ten_theloai %>" style=" background: #454d55; margin-left: 10px;font-size: 25px; padding: 5px; display: block">
         <input  onclick="dele_c()" type="checkbox" name="the-loai" value="<%=DanhSachTheLoai[a].id_theloai %>">&nbsp;&nbsp;<%=DanhSachTheLoai[a].ten_theloai %>
         <span class="checkmark"></span>
         </label>
         <% } %>


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
                                    TL[i].style.color = '#ff5f5f'
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
                </script>

      <!-- nhap tom tac -->
      <div class="form-group" style="margin-top: 10px">
         <label>Tóm tắt phim</label>
         <!-- chỉnh sửa dòng 61 -->         
         <textarea name="input_tomtat" id="input_tomtat">
          </textarea>
      </div>
      <script>
          CKEDITOR.replace("input_tomtat");
      </script>
      <div class="form-group">
         <label >Ảnh Bìa phim</label>
          <asp:FileUpload ID="FileUpload1" runat="server" />
      </div>
      <div class="d-flex justify-content-end">
         <button type="submit" class="btn btn-dark"  name="btn-them" value="true">Thêm phim</button>
      </div>
   </form>
   <!-- end form them Phim -->
</div>