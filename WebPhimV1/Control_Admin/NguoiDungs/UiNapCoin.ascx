<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiNapCoin.ascx.cs" Inherits="WebPhimV1.Control_Admin.NguoiDungs.UiNapCoin" %>
<div class="card card-info">
   <div class="card-header">
      <h3 class="card-title">Nhập đầy đủ thông tin nạp coin</h3>
   </div>
   <div class="card-body">
      <div class="input-group mb-3">
         Tài Khoản : 
         <asp:Label ID="lblIdUser" runat="server" ></asp:Label>
      </div>
      <div class="input-group mb-3">
         Số coin hiện có: 
         <asp:Label ID="LblCoinHT" runat="server" ></asp:Label>
      </div>
      <!-- nạp coin -->
      <asp:Label ID="lblnapcoin" runat="server" Text="Nạp coin"></asp:Label>
      <div class="input-group mb-3">
         <asp:TextBox id="coin" runat="server" class="form-control" onkeyup="this.value = minmax(this.value, 0, 99999999)"></asp:TextBox>
         <script type="text/javascript">
             function minmax(value, min, max) {
                 if (parseInt(value) < min || isNaN(parseInt(value)))
                     return min;
                 else if (parseInt(value) > max)
                     return max;
                 else return value;
             }
         </script>
         <div class="input-group-append">
            &ensp;
            <asp:Button ID="Themcoin" runat="server" CssClass="btn btn-info" Text="Thêm coin" OnClick="Themcoin_Click" />
            &ensp;
            <asp:Button ID="Giamcoin" runat="server" CssClass="btn btn-danger" Text="Giảm coin" OnClick="Giamcoin_Click" />
         </div>
      </div>
   </div>
</div>