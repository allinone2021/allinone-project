<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All in One</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.min.css">

    <style>
        .content-wrapper {
            background-color: #fff8f0;
        }
    </style>

    <script src="https://d3js.org/d3.v6.js"></script>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <%--    <!-- Preloader -->--%>
    <%--    <div class="preloader flex-column justify-content-center align-items-center">--%>
    <%--        <img class="animation__shake" src="/resources/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">--%>
    <%--    </div>--%>

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">

        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">홈</a>
            </li>
        </ul>


        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">내 정보</a>
            </li>

            <li class="nav-item d-none d-sm-inline-block">
                <a href="/logout" class="nav-link">로그아웃</a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-light-yellow elevation-1" >
        <!-- Brand Logo -->
        <a href="#" class="brand-link">
            <!--@@ Main 연결 링크 추가-->
            <img src="/resources/img/aiologo_main.svg">
<%--            <img src="/resources/img/AdminLTELogo.png" alt="AllinOne" class="brand-image img-circle elevation-3" style="opacity: .8">--%>
<%--            <span class="brand-text font-weight-light"><b>All in One</b></span>--%>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="/resources/img/profileImg.png" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <!--마이페이지 연결? (가입정보확인창?)-->
                    <a href="#" class="d-block">StoreName</a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" role="menu">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <!-- 통합 후에 a 태그에 각각 주소 입력하기 -->

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                이용자 분석
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>기간별 분석</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>성별 연령별 분석</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-thumbs-up"></i>
                            <p>찜 증감 분석</p>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-receipt"></i>
                            <p>
                                주문 내역
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>오늘 주문 내역</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>총 주문 내역</p>
                                </a>
                            </li>
                        </ul>
                    </li>


                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-won-sign"></i>
                            <p>
                                매출 내역
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>오늘 매출 내역</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>총 매출 내역</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a href="/store/info?sno=1" class="nav-link">
                            <i class="nav-icon fas fa-info"></i>
                            <p>내 가게 정보</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/store/menu?sno=1" class="nav-link">
                            <i class="nav-icon far fa-copy"></i>
                            <p>메뉴 관리</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/store/review?sno=1" class="nav-link">
                            <i class="nav-icon far fa-comment-dots"></i>
                            <p>리뷰 보기</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-list-alt"></i>
                            <p>이벤트 목록</p>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                회원 관리
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/store/list" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>가게 회원 관리</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/member/list" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>일반 회원 관리</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/report/list" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>신고 목록 관리</p>
                                </a>
                            </li>
                        </ul>
                    </li>


                    <li class="nav-item">
                        <a href="/notice/list" class="nav-link">
                            <i class="nav-icon fas fa-exclamation-circle"></i>
                            <p>공지사항</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-question-circle"></i>
                            <p>
                                질문게시판
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/qna/list" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Q & A </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/faq/list" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>FAQ</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>


    <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"></i></a>