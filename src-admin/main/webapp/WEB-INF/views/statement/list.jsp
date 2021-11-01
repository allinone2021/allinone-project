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
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>

    #h {
        font-weight: bold;
        font-size: 5ex;
    }

    #report1 {
        margin-top: 3ex;
    }

    .card {
        display: flex;
        list-style: none;
    }


</style>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 id="h">당일 매출표</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">당일 매출표</li>
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
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="dt-button btn-group flex-wrap">
                                        <form action="/statement/list" method="get">
                                            <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">
                                            <div class="input-group date" id="reservationdate"
                                                 data-target-input="nearest">
                                                <input type="text" name="today" value="${dateMaker.today}"
                                                       class="form-control datetimepicker-input"
                                                       data-target="#reservationdate"/>
                                                <div class="input-group-append" data-target="#reservationdate"
                                                     data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-default">날짜 조회</button>
                                            </div>
                                        </form>
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
                                                <th style="width: 8vh">SALES No.</th>
                                                <th style="width: 25vh">DATE</th>
                                                <th style="width: 20vh">SHOP</th>
                                                <th style="width: 20vh">SALES</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${dtoList}" var="dto">
                                                <tr data-widget="expandable-table" aria-expanded="false">
                                                    <th><c:out value="${dto.orderNum}"></c:out></th>
                                                    <javatime:format var="orderDate" value="${dto.orderDate}"
                                                                     pattern="yyyy년 M월 d일 a h시 m분 s초"/>
                                                    <td><c:out value="${orderDate}"></c:out></td>
                                                    <td><c:out value="${dto.shop}"></c:out></td>
                                                    <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                      value="${dto.totalPrice}"
                                                                      var="price"/>
                                                    <td><c:out value="${price}"></c:out></td>

                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-left">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript:movePage(${pageMaker.start -1})"> << </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                    <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link"
                                                                                                  href="javascript:movePage(${num})">${num}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${pageMaker.next}">
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript:movePage(${pageMaker.end +1})"> >> </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
            <form id="actionForm" action="/statement/list" method="get">
                <input type="hidden" name="shopName" value="<sec:authentication property="principal.mid"/>">
                <input type="hidden" name="today" value="${dateMaker.today}">
                <input type="hidden" name="page" value="${pageMaker.page}">
                <input type="hidden" name="size" value="${pageMaker.size}">
            </form>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>


<script>

    const Form = document.querySelector("#form1")

    document.querySelector(".btnToday").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        // Form.setAttribute("action", "/statement/dailylist")
        // Form.setAttribute("method", "get")
        // Form.submit()

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

        Form.setAttribute("action", "/statement/list")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false);

    function movePage(pageNum) {

        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit()

    }

</script>

<%@include file="../includes/footer.jsp" %>
<!-- date-range-picker -->


<script>
    $(function () {

        console.log("-----------------------------");
        console.log("-----------------------------");
        console.log("-----------------------------");

        $('#reservationdate').datetimepicker({
            format: "YYYY-MM-DD"
        });
        console.log("-----------------------------");
        console.log("-----------------------------");

    })
</script>


</body>
</html>
