<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

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
                                <li class="pt-2 px-3"><h3 class="card-title">주문수 통계</h3></li>
                                <li class="nav-item">
                                    <a class="nav-link active" id="custom-tabs-two-home-tab" data-toggle="pill"
                                       href="#custom-tabs-two-home" role="tab" aria-controls="custom-tabs-two-home"
                                       aria-selected="true">시간별 주문량 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-two-profile-tab" data-toggle="pill"
                                       href="#custom-tabs-two-profile" role="tab"
                                       aria-controls="custom-tabs-two-profile" aria-selected="false">일별 주문량 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-two-messages-tab" data-toggle="pill"
                                       href="#custom-tabs-two-messages" role="tab"
                                       aria-controls="custom-tabs-two-messages" aria-selected="false">월별 주문량 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-two-settings-tab" data-toggle="pill"
                                       href="#custom-tabs-two-settings" role="tab"
                                       aria-controls="custom-tabs-two-settings" aria-selected="false">성별, 연령별 주문량 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-two-menu-tab" data-toggle="pill"
                                       href="#custom-tabs-two-menu" role="tab" aria-controls="custom-tabs-two-settings"
                                       aria-selected="false">메뉴별 주문량 통계</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="custom-tabs-two-tabContent">
                                <div class="tab-pane fade show active" id="custom-tabs-two-home" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-home-tab">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>시간별 주문량 라인 차트</h4>
                                        </div>
                                        <div class="card-body">

                                            <div style="background: #fdf8ec">
                                                <div class="border" id="lineChartForIncomeStatement1"></div>
                                            </div>

                                        </div>
                                    </div>
                                    <hr>

                                    <div class="col-md-12">
                                        <form id="form1">
                                            <input type="hidden" name="shopName" value="${dateMaker.shopName}">
                                            <table id="report1" class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th style="width: 8vh">시간</th>
                                                    <th style="width: 25vh">가게 이름</th>
                                                    <th style="width: 20vh">주문량</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoTimeList}" var="dto">
                                                    <tr data-widget="expandable-table" aria-expanded="false">
                                                        <th><c:out value="${dto.hour} 시"></c:out></th>
                                                        <td><c:out value="${dto.shop}"></c:out></td>
                                                        <td><c:out value="${dto.orderCount}"></c:out></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>


                                </div>
                                <div class="tab-pane fade" id="custom-tabs-two-profile" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-profile-tab">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>일별 주문량 라인 차트</h4>
                                        </div>
                                        <div class="card-body">
                                            <div style="background: #fdf8ec">
                                                <div class="border" id="lineChartForIncomeStatement2"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="col-md-12">
                                        <form id="form2">
                                            <input type="hidden" name="shopName" value="${dateMaker.shopName}">
                                            <table id="report2" class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th style="width: 8vh">날짜</th>
                                                    <th style="width: 25vh">가게 이름</th>
                                                    <th style="width: 20vh">주문량</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoDayList}" var="ddto">
                                                    <tr data-widget="expandable-table" aria-expanded="false">
                                                        <td><c:out value="${ddto.date}"></c:out></td>
                                                        <td><c:out value="${ddto.shop}"></c:out></td>
                                                        <td><c:out value="${ddto.orderCount}"></c:out></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="custom-tabs-two-messages" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-messages-tab">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>월별 주문량 라인 차트</h4>
                                        </div>
                                        <div class="card-body">
                                            <div style="background: #fdf8ec">
                                                <div class="border" id="lineChartForIncomeStatement3"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="col-md-12">
                                        <form id="form3">
                                            <input type="hidden" name="shopName" value="${dateMaker.shopName}">
                                            <table id="report3" class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th style="width: 8vh">월</th>
                                                    <th style="width: 25vh">가게 이름</th>
                                                    <th style="width: 20vh">주문량</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoMonthList}" var="dddto">
                                                    <tr data-widget="expandable-table" aria-expanded="false">
                                                        <td><c:out value="${dddto.month} 월"></c:out></td>
                                                        <td><c:out value="${dddto.shop}"></c:out></td>
                                                        <td><c:out value="${dddto.orderCount}"></c:out></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="custom-tabs-two-settings" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-settings-tab">

                                    <section class="content">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>연령별 주문량 라인 차트</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div style="position:relative;"
                                                                         id="genderAgeLine"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>성별 주문량 파이 차트</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div style="position:relative;"
                                                                         id="genderPieChart"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                    <hr>
                                    <div class="col-md-12">
                                        <form id="form5">
                                            <input type="hidden" name="shopName" value="${dateMaker.shopName}">
                                            <table id="report5" class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th style="width: 8vh">월</th>
                                                    <th style="width: 25vh">성별</th>
                                                    <th style="width: 20vh">주문량</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </form>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="custom-tabs-two-menu" role="tabpanel"
                                     aria-labelledby="custom-tabs-two-settings-tab">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>메뉴별 주문량 막대 차트</h4>
                                        </div>
                                        <div class="card-body">
                                            <div style="background: #fdf8ec">
                                                <div class="border" id="orderBarChart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="col-md-12">
                                        <form id="form4">
                                            <input type="hidden" name="shopName" value="${dateMaker.shopName}">
                                            <table id="report4" class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>메뉴</th>
                                                    <th>주문량</th>
                                                    <th>가게 이름</th>
                                                    <th>판매 매출</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoMenuList}" var="ddddto">
                                                    <tr data-widget="expandable-table" aria-expanded="false">
                                                        <td><c:out value="${ddddto.menu}"></c:out></td>
                                                        <td><c:out value="${ddddto.orderCount}"></c:out></td>
                                                        <td><c:out value="${ddddto.shop}"></c:out></td>
                                                        <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${ddddto.sales}"
                                                                          var="tSales"/>
                                                        <td><c:out value="${tSales}"></c:out></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
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

<%@include file="../includes/footer.jsp" %>

<script src="/resources/js/statisticLineChart1.js"></script>
<script src="/resources/js/statisticLineChart2.js"></script>
<script src="/resources/js/statisticLineChart3.js"></script>
<script src="/resources/js/staticBarChartMenu.js"></script>
<script src="/resources/js/staticPieChart.js"></script>
<script src="/resources/js/staticMultipleLineChart.js"></script>

<script>

    const jsonTime = '${dtoTimeStr}'
    const jsonDay = '${dtoDayStr}'
    const jsonMonth = '${dtoMonthStr}'
    const jsonMenu = '${dtoMenuStr}'

    const dtoTimeGson = JSON.parse(jsonTime)
    const dtoDayGson = JSON.parse(jsonDay)
    const dtoMonthGson = JSON.parse(jsonMonth)
    const dtoMenuGson = JSON.parse(jsonMenu)

    console.log(dtoTimeGson)
    console.log(dtoDayGson)
    console.log(dtoMonthGson)
    console.log(dtoMenuGson)

    lineInStatistic1(dtoTimeGson)
    lineInStatistic2(dtoDayGson)
    lineInStatistic3(dtoMonthGson)
    barChartMenu(dtoMenuGson)
    multipleLine()
    pieGender()


</script>


</body>
</html>
