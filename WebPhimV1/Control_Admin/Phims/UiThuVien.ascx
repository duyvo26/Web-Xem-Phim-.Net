<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiThuVien.ascx.cs" Inherits="WebPhimV1.Control_Admin.Phims.UiThuVien" %>
<div class="card">
   <div class="card-header">
      <asp:Label ID="noti" runat="server"></asp:Label>
      <div class="card card-danger">
         <div class="card-header">
            <h3 class="card-title">Danh sách mua</h3>
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
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tên phim">Tên phim</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tài khoản mua phim">Tài khoản</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Id">Id tài khoản</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Giá bán của phim">Giá mua</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Tình trạng phim">Thời gian mua</th>
               </tr>
            </thead>
            <tbody>
               <% for (int i = 0; i < thuvien.Count; i++)
                  { %>
               <tr class="odd">
                  <td><%=LoadNamePhim(thuvien[i].id_phim) %></td>
                  <td><%=LoadName(thuvien[i].id_user) %></td>
                  <td>#<%=thuvien[i].id_user %></td>
                  <td><%=LoadCoin(thuvien[i].id_phim) %></td>
                  <td><%= thuvien[i].created_at.ToString("MM/dd/yyyy HH:mm:ss") %></td>
               </tr>
               <% }  %>
            </tbody>
             <tfoot>
            <tr>
                <th colspan="2" style="text-align:right"></th>
                <th colspan="3" style="text-align:right"></th>
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
            "responsive": false, "lengthChange": true, "autoWidth": false,
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