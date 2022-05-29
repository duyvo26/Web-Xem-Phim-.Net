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
                  <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="1">Mã giao dịch</th>
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
                  <td class="dtr-control sorting_1" tabindex="0">#<%= logCoin[i].id_log %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=LoadName(Convert.ToInt32(logCoin[i].id_user_chuyen)) %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=LoadName(Convert.ToInt32(logCoin[i].id_user_nhan)) %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=logCoin[i].coin %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=logCoin[i].ghichu %></td>
                  <td class="dtr-control sorting_1" tabindex="0"><%=logCoin[i].created_at.ToString("dd/MM/yyyy HH:mm:ss") %></td>
               </tr>
               <% } } %>
            </tbody>
             <tfoot>
            <tr>
                <th colspan="4" style="text-align:right"></th>
                <th colspan="2" style="text-align:right"></th>
                
            </tr>
        </tfoot>
         </table>
      </div>
      <!-- /.card-body -->
   </div>
</div>

<script>

    // Create our number formatter.
    var formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',

        // These options are needed to round to whole numbers if that's what you want.
        //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
        //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
    });


    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": true, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print"],
            "iDisplayLength": 10,
            footerCallback: function (row, data, start, end, display) {
                var api = this.api();

                // Remove the formatting to get integer data for summation
                var intVal = function (i) {
                    return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;
                };

                // Total over all pages
                total = api
                    .column(3)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(3, { page: 'current' })
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(4).footer()).html('$' + formatter.format(pageTotal) + ' ( $' + formatter.format(total) + ' toàn bộ coin)');
            },
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    });
</script>