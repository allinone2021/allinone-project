<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="content-wrapper bg-white">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Dashboard</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Small boxes (Stat box) -->
            <!-- /.row -->
            <div class="row">
                <div class="col-12 col-sm-12">
                    <div class="card card-warning card-tabs">
                        <div class="card-header p-0 pt-1">
                            <ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
                                <li class="pt-2 px-3"><h3 class="card-title">회원수 통계</h3></li>
                                <li class="nav-item">
                                    <a class="nav-link active" id="custom-tabs-two-home-tab" data-toggle="pill"
                                       href="#custom-tabs-two-home" role="tab" aria-controls="custom-tabs-two-home"
                                       aria-selected="true">일별 회원가입 수</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-two-profile-tab" data-toggle="pill"
                                       href="#custom-tabs-two-profile" role="tab"
                                       aria-controls="custom-tabs-two-profile" aria-selected="false">월별 회원가입 수</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body col-md-12">
                            <div class="tab-content" id="custom-tabs-two-tabContent">
                                <div class="tab-pane fade show active" id="custom-tabs-two-home" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-home-tab">

                                    <section class="content">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>종합, 성별 회원가입자 수 라인 차트</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div style="position:relative;"
                                                                         id="LineMemberDay"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>연령별 회원가입자 수 파이 차트</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div style="position:relative;"
                                                                         id="pieChartForMemberDay"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                    <hr>

                                    <section class="content">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <form id="form1">
                                                                        <table id="report1"
                                                                               class="table table-bordered">
                                                                            <h5>종합</h5>
                                                                            <thead>
                                                                            <tr>
                                                                                <th>날짜</th>
                                                                                <th>가입자 수</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${genderTotalDateList}"
                                                                                       var="dto">
                                                                                <tr data-widget="expandable-table"
                                                                                    aria-expanded="false">
                                                                                    <td><c:out
                                                                                            value="${dto.date}"></c:out></td>
                                                                                    <td><c:out
                                                                                            value="${dto.customerNum}"></c:out></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <form id="form2">
                                                                        <table id="report2"
                                                                               class="table table-bordered">
                                                                            <h5>남자</h5>
                                                                            <thead>
                                                                            <tr>
                                                                                <th>날짜</th>
                                                                                <th>가입자 수</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${maleTotalDateList}"
                                                                                       var="dto">
                                                                                <tr data-widget="expandable-table"
                                                                                    aria-expanded="false">
                                                                                    <td><c:out
                                                                                            value="${dto.date}"></c:out></td>
                                                                                    <td><c:out
                                                                                            value="${dto.customerNum}"></c:out></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <form id="form3">
                                                                        <table id="report3"
                                                                               class="table table-bordered">
                                                                            <h5>여자</h5>
                                                                            <thead>
                                                                            <tr>
                                                                                <th>날짜</th>
                                                                                <th>가입자 수</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${femaleTotalDateList}"
                                                                                       var="dto">
                                                                                <tr data-widget="expandable-table"
                                                                                    aria-expanded="false">
                                                                                    <td><c:out
                                                                                            value="${dto.date}"></c:out></td>
                                                                                    <td><c:out
                                                                                            value="${dto.customerNum}"></c:out></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                </div>
                                <div class="tab-pane fade" id="custom-tabs-two-profile" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-profile-tab">

                                    <section class="content">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>종합, 성별 회원가입자 수 라인 차트</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div style="position:relative;"
                                                                         id="LineMemberMonth"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>연령별 회원가입자 수 파이 차트</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div style="position:relative;"
                                                                         id="pieChartForMemberMonth"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                    <hr>

                                    <section class="content">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <form id="form4">
                                                                        <table id="report4"
                                                                               class="table table-bordered">
                                                                            <h5>종합</h5>
                                                                            <thead>
                                                                            <tr>
                                                                                <th>월</th>
                                                                                <th>가입자 수</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${genderTotalMonthList}"
                                                                                       var="dto">
                                                                                <tr data-widget="expandable-table"
                                                                                    aria-expanded="false">
                                                                                    <td><c:out
                                                                                            value="${dto.month}"></c:out></td>
                                                                                    <td><c:out
                                                                                            value="${dto.customerNum}"></c:out></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <form id="form5">
                                                                        <table id="report5"
                                                                               class="table table-bordered">
                                                                            <h5>남자</h5>
                                                                            <thead>
                                                                            <tr>
                                                                                <th>월</th>
                                                                                <th>가입자 수</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${maleTotalMonthList}"
                                                                                       var="dto">
                                                                                <tr data-widget="expandable-table"
                                                                                    aria-expanded="false">
                                                                                    <td><c:out
                                                                                            value="${dto.month}"></c:out></td>
                                                                                    <td><c:out
                                                                                            value="${dto.customerNum}"></c:out></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <form id="form6">
                                                                        <table id="report6"
                                                                               class="table table-bordered">
                                                                            <h5>여자</h5>
                                                                            <thead>
                                                                            <tr>
                                                                                <th>월</th>
                                                                                <th>가입자 수</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${femaleTotalMonthList}"
                                                                                       var="dto">
                                                                                <tr data-widget="expandable-table"
                                                                                    aria-expanded="false">
                                                                                    <td><c:out
                                                                                            value="${dto.month}"></c:out></td>
                                                                                    <td><c:out
                                                                                            value="${dto.customerNum}"></c:out></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>

<script src="/resources/js/staticMultiLineMemberDay.js"></script>
<script src="/resources/js/staticMultiLineMemberMonth.js"></script>
<script src="/resources/js/staticPieChartMemberDay.js"></script>
<script src="/resources/js/staticPieChartMemberMonth.js"></script>

<script>

    const jsonAgeDaily = '${dtoAgeDailyStr}'
    const jsonAgeMonthly = '${dtoAgeMonthlyStr}'
    const jsonGenderDate = '${dtoGenderDateStr}'
    const jsonMaleDate = '${dtoMaleDateStr}'
    const jsonFemaleDate = '${dtoFemaleDateStr}'
    const jsonGenderMonth = '${dtoGenderMonthStr}'
    const jsonMaleMonth = '${dtoMaleMonthStr}'
    const jsonFemaleMonth = '${dtoFemaleMonthStr}'

    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")
    console.log(jsonAgeDaily)
    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")


    const AgeDailyGson = JSON.parse(jsonAgeDaily)
    const AgeMonthlyGson = JSON.parse(jsonAgeMonthly)
    const GenderDateGson = JSON.parse(jsonGenderDate)
    const MaleDateGson = JSON.parse(jsonMaleDate)
    const FemaleDateGson = JSON.parse(jsonFemaleDate)
    const GenderMonthGson = JSON.parse(jsonGenderMonth)
    const MaleMonthGson = JSON.parse(jsonMaleMonth)
    const FemaleMonthGson = JSON.parse(jsonFemaleMonth)

    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")
    console.log(AgeDailyGson)
    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")
    console.log(AgeMonthlyGson)
    console.log("=========================================")
    console.log("=========================================")
    console.log("=========================================")


    memberMultiLineDay(GenderDateGson, MaleDateGson, FemaleDateGson)
    memberMultiLineMonth(GenderMonthGson, MaleMonthGson, FemaleMonthGson)
    pieMemberDay(AgeDailyGson)
    pieMemberMonth(AgeMonthlyGson)
</script>


<%@include file="../includes/footer.jsp" %>
</body>
</html>
