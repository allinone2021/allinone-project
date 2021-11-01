<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Page</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/css/adminlte.min.css">
</head>
<body class="hold-transition login-page" style="background-color: #fff8f0">
<div class="login-box">
    <div class="login-logo">
        <img src="../../resources/img/aiologo.svg">
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-header login-card-body">
            <p class="login-box-msg">로그인하여 다양한 기능을 이용해보세요.</p>

            <form action="/login" method="post">
                <!-- action을 /login으로 설정해서 시큐리티에서 이용하는 로그인 페이지로 넘겨줌 -->
                <div class="input-group mb-3">
                    <input type="text" name="username" class="form-control" placeholder="아이디">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" name="password" class="form-control" placeholder="비밀번호">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                                로그인 유지
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-warning btn-block">로그인</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
        </div>
        <!-- /.login-card-body -->
        <div class="card-footer">
            <p class="mb-1 text-center">
                <a href="forgot-password.html" style="color:#323232">아이디, 비밀번호 찾기</a> ㅣ <a href="/store/register" style="color:#323232">회원가입</a>
            </p>
        </div>
    </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/js/adminlte.min.js"></script>
</body>
</html>