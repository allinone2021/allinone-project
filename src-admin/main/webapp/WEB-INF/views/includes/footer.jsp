<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="main-footer">
    <strong>Copyright &copy; 2021 <a href="https://adminlte.io" style="color: #f6c244">All in One</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 1.0.0
    </div>
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<script type="text/javascript" src="/resources/plugins/moment/locale/ko.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment-with-locales.js"></script>


<!-- date-range-picker -->
<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>

<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<script src="/resources/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="/resources/plugins/jquery-validation/additional-methods.min.js"></script>

<!-- AdminLTE App -->
<script src="/resources/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/js/pages/dashboard.js"></script>



<script>
    //메뉴 선택 활성화
    $(function () {
        var url = window.location;
        // for single sidebar menu
        $('ul.nav-sidebar a').filter(function () {
            return this.href == url;
        }).addClass('active');
        //}).parent().siblings().removeClass('active').end().addClass('active');

        $('ul.nav-treeview a').filter(function () {
            return this.href == url;
        }).parentsUntil(".nav-sidebar > .nav-treeview").css({'display': 'block'}).addClass('menu-open').prev('a').addClass('active');
        //}).parentsUntil(".nav-sidebar > .nav-treeview").siblings().removeClass('active menu-open').end().addClass('active menu-open');
    });


    //최상단 이동 버튼
    $(document).ready(function(){
        $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 400);
            return false;
        });
    });



</script>