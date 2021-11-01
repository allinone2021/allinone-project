<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1><b>내 가게 리뷰</b></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">내 가게 리뷰</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">

            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header p-2">
                            <div class="row">
                                <div class="col-md-2 col-sm-6 col-12"></div>
                                <div class="col-md-4 col-sm-6 col-12">
                                    <div class="info-box shadow">
                                        <span class="info-box-icon bg-warning"><i class="far fa-comment"></i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text"><h5><b>총 리뷰 수</b></h5></span>
                                            <span class="info-box-number"><b>${reviewList.get(0).totalCnt}</b></span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-4 col-sm-6 col-12">
                                    <div class="info-box shadow">
                                        <span class="info-box-icon bg-warning"><i class="far fa-comment"></i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text"><h5><b>오늘 리뷰 수</b></h5></span>
                                            <span class="info-box-number"><b>${reviewList.get(0).todayCnt}</b></span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-lg-2 col-6"></div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body p-0">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 20%">작성자</th>
                                    <th>리뷰 내용</th>
                                    <th style="width: 25%">작성일</th>
                                    <th style="width: 10%"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${reviewList}" var="review">
                                    <tr data-widget="expandable-table" aria-expanded="true">
                                        <td><c:out value="${review.writer}"></c:out></td>
                                        <td><c:out value="${review.content}"></c:out></td>
                                        <javatime:format var="regdate" value="${review.regdate}" pattern="yyyy년 M월 d일 a h시 m분"/>
                                        <td><c:out value="${regdate}"></c:out></td>
                                        <td><button type="button" class="btn btn-block btn-danger btnReport">신고</button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@include file="../includes/footer.jsp"%>

<script>


</script>

</body>
</html>