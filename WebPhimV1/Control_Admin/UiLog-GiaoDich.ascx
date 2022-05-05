<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiLog-GiaoDich.ascx.cs" Inherits="WebPhimV1.Control_Admin.UiLog_GiaoDich" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Giao dịch</h3>
         </div>
      </div>
   </div>
</div>
<!-- /.card-header -->
<div class="card-body">
   <div class="row">
      <div class="col-sm-12">
         <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
            <thead>
               <tr>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="1">Id User Chuyển</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="2">Id User Nhận</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="3">Coin</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="4">Ghi Chú</th>
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="5">Thời gian</th>
               </tr>
            </thead>
            <tbody>
               <% if (logCoin != null) { 
                  for (int i = 0; i < logCoin.Count; i++)
                  { %>
               <tr class="odd">
                  <td class="dtr-control sorting_1" tabindex="0"><%=LoadName(Convert.ToInt32(logCoin[i].id_user_chuyen)) %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=LoadName(Convert.ToInt32(logCoin[i].id_user_nhan)) %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=logCoin[i].coin %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=logCoin[i].ghichu %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=logCoin[i].created_at.ToString("MM/dd/yyyy HH:mm:ss") %></td>
               </tr>
               <% } } %>
            </tbody>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>