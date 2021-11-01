
<%--
  Created by IntelliJ IDEA.
  User: bumre
  Date: 2021-09-21
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
    #h {
        font-weight: bold;
        font-size: 5ex;
    }

    .d {
        display: flex;
        list-style: none;
        font-weight: bold;

    }

    .d div {
        margin-left: 2ex;

    }


    .container01 {
        display: flex;
        list-style: none;
        margin-left: 3ex;
    }

    #report1 {
        margin-top: 3ex;
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
                    <h1 id="h">일별 매출표</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">일별 매출표</li>
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

                                                <div class="d">
                                                    <div>
                                                        <button type="button" class="btn btn-default"
                                                                onclick="javascript:moveMonth(${dateMaker.month - 1})">
                                                            <<
                                                        </button>
                                                    </div>
                                                    <div>
                                                        <h2>${dateMaker.month}</h2>
                                                    </div>
                                                    <div>
                                                        <button type="button" class="btn btn-default"
                                                                onclick="javascript:moveMonth(${dateMaker.month + 1})">
                                                            >>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
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
                                                    <th>DATE</th>
                                                    <th style="width: 50vh">SHOP</th>
                                                    <th>TOTAL DAILY SALES</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoDailyList}" var="ddto">
                                                    <tr onclick="javascript:moveToList('${ddto.date}')"
                                                        data-widget="expandable-table"
                                                        aria-expanded="false">
                                                        <td><c:out value="${ddto.date}"></c:out></td>
                                                        <td><c:out value="${ddto.shop}"></c:out></td>
                                                        <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${ddto.totalSales}"
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
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
            <form id="actionForm" action="/statement/dailylist" method="get">
                <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">
                <input type="hidden" name="month" value="${dateMaker.month}">
                <input type="hidden" name="year" value="${dateMaker.year}">
            </form>

            <form id="tolistForm" action="/statement/list" method="get">
                <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">
                <input type="hidden" name="today" value="">
            </form>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>

<script>
    const actionForm = document.querySelector("#actionForm")
    const tolistForm = document.querySelector("#tolistForm")
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

        // Form.setAttribute("action", "/statement/dailylist")
        // Form.setAttribute("method", "get")
        // Form.submit()

    }, false);

    document.querySelector(".btnMonthly").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        Form.setAttribute("action", "/statement/monthlylist")
        Form.setAttribute("method", "get")
        Form.submit()

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

        Form.setAttribute("action", "/statement/dailylist")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false);

    function moveToList(day) {

        tolistForm.querySelector("input[name='today']").setAttribute("value", day)
        console.log(day)
        tolistForm.submit()
    }

    function moveMonth(dateMonth) {

        if (dateMonth > 0 && dateMonth <= 12) {
            actionForm.querySelector("input[name='month']").setAttribute("value", dateMonth)
            actionForm.submit()
        } else if (dateMonth <= 0) {
            moveYear(${dateMaker.year - 1})
            actionForm.querySelector("input[name='month']").setAttribute("value", 12)
            actionForm.submit()
        } else if (dateMonth >= 13) {
            moveYear(${dateMaker.year + 1})
            actionForm.querySelector("input[name='month']").setAttribute("value", 1)
            actionForm.submit()
        }
    }

    function moveYear(dateYear) {

        actionForm.querySelector("input[name='year']").setAttribute("value", dateYear)
        actionForm.submit()
    }

</script>

<%@include file="../includes/footer.jsp" %>
</body>
</html>
