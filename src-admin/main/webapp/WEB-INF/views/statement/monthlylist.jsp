<%--
  Created by IntelliJ IDEA.
  User: bumre
  Date: 2021-09-20
  Time: 오후 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
    .d {
        display: flex;
        list-style: none;
        font-weight: bold;

    }

    .d div {
        margin-left: 2ex;

    }

    #report1 {
        margin-top: 3ex;
    }

    #h {
        font-weight: bold;
        font-size: 5ex;
    }

    .container01 {
        display: flex;
        list-style: none;
        margin-left: 3ex;
    }

    #report1:hover tbody tr:hover td {
        background: #ffc501;
        color: white;
    }
</style>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 id="h">월별 매출표</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">월별 매출표</li>
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

                        <div class="card-body">
                            <div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="dt-button btn-group flex-wrap">
                                            <div class="container01">
                                                <div class="d">
                                                    <div>
                                                        <button type="button" class="btn btn-default"
                                                                onclick="javascript:moveYear(${dateMaker.year - 1})"> <<
                                                        </button>
                                                    </div>
                                                    <div>
                                                        <h2>${dateMaker.year}</h2>
                                                    </div>
                                                    <div>
                                                        <button type="button" class="btn btn-default"
                                                                onclick="javascript:moveYear(${dateMaker.year + 1})"> >>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="float-right">
                                            <button type="submit" class="btn btn-warning btnCurrent">현재로 돌아가기</button>
                                            <button type="submit" class="btn btn-warning btnToday">당일 매출</button>
                                            <button type="submit" class="btn btn-warning btnDaily">일 매출표</button>
                                            <button type="submit" class="btn btn-warning btnMonthly">월 매출표</button>
                                            <button type="submit" class="btn btn-warning btnYear">연 매출표</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <form id="form1">
                                            <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">

                                            <table id="report1" class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>YEAR</th>
                                                    <th>MONTH</th>
                                                    <th style="width: 50vh">SHOP</th>
                                                    <th>TOTAL MONTHLY SALES</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoMonthlyList}" var="dddto">
                                                    <tr onclick="javascript:moveToDaily(${dddto.month}, ${dddto.year})"
                                                        data-widget="expandable-table" aria-expanded="false">
                                                        <td><c:out value="${dddto.year}"></c:out></td>
                                                        <td><c:out value="${dddto.month}"></c:out></td>
                                                        <td><c:out value="${dddto.shop}"></c:out></td>
                                                        <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${dddto.totalSales}"
                                                                          var="Sales"/>
                                                        <td><c:out value="${Sales}"></c:out></td>
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
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
            <form id="actionForm" action="/statement/monthlylist" method="get">
                <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">
                <input type="hidden" name="year" value="${dateMaker.year}">
            </form>

            <form id="toDailyForm" action="/statement/dailylist" method="get">
                <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">
                <input type="hidden" name="year" value="">
                <input type="hidden" name="month" value="">
            </form>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>


<script>
    const actionForm = document.querySelector("#actionForm")

    const toDailyForm = document.querySelector("#toDailyForm")

    const Form = document.querySelector("#form1")

    document.querySelector(".btnToday").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        Form.setAttribute("action", "/statement/list")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false)

    document.querySelector(".btnDaily").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        Form.setAttribute("action", "/statement/dailylist")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false);

    document.querySelector(".btnMonthly").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        // Form.setAttribute("action", "/statement/monthlylist")
        // Form.setAttribute("method", "get")
        // Form.submit()

    }, false);

    document.querySelector(".btnYear").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        Form.setAttribute("action", "/statement/yearlist")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false);

    document.querySelector(".btnCurrent").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        Form.setAttribute("action", "/statement/monthlylist")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false);

    function moveToDaily(month, year) {
        toDailyForm.querySelector("input[name='year']").setAttribute("value", year)
        toDailyForm.querySelector("input[name='month']").setAttribute("value", month)
        toDailyForm.submit()
    }

    function moveYear(dateYear) {
        actionForm.querySelector("input[name='year']").setAttribute("value", dateYear)
        actionForm.submit()
    }


</script>

<%@include file="../includes/footer.jsp" %>
</body>
</html>
