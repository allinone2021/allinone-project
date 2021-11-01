<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>주문 내역</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">

                    <form id="update" action="/order/update" method="post">
                        <!-- Main content -->
                        <div class="invoice p-3 mb-3">
                            <!-- title row -->
                            <div class="row invoice-info">
                                <div class="col-sm-6 invoice-col">
                                    <h4><c:out value="${orderDTO.nickName}"></c:out>님의 주문</h4>
                                </div>
                                <!-- /.col -->
                                <div class="col-sm-1 invoice-col">
                                    <address>
                                        <strong>주문번호</strong><br>
                                        <strong>주문날짜</strong><br>
                                        <strong>고객 ID</strong><br>
                                        <strong>전화번호</strong><br>
                                        <strong>요청사항</strong><br>
                                        <strong>픽업시간</strong>
                                    </address>
                                </div>
                                <!-- /.col -->
                                <div class="col-sm-5 invoice-col">
                                    <address>
                                        <c:out value="${orderDTO.orderNum}"></c:out><br>
                                        <input type="hidden" name="orderNum" value="${orderDTO.orderNum}">
                                        <c:out value="${orderDTO.orderDate}"></c:out><br>
                                        <c:out value="${orderDTO.id}"></c:out><br>
                                        <c:out value="${orderDTO.phone}"></c:out><br>
                                        <c:out value="${orderDTO.comment}"></c:out><br>
                                        <c:out value="${orderDTO.pickupTime}"></c:out>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- Table row -->
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>메뉴</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                            <th>합산가격</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${orderDTO.orderMenuDTOList}" var="orderMenu">
                                            <tr>
                                                <td class="autoInc"></td>
                                                <td>${orderMenu.menu}</td>
                                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${orderMenu.price}" var="price"/>
                                                <td><c:out value="${price}원"></c:out></td>
                                                <td>${orderMenu.amount}</td>
                                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${orderMenu.totalPrice}" var="totalPrice"/>
                                                <td>${totalPrice}원</td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><strong>
                                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${allPrice}" var="allPrice"/>
                                                총 <c:out value="${allPrice}원"></c:out></strong></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                            <!-- this row will not appear when printing -->
                            <c:if test="${orderDTO.orderCheck == 1}">
                            <div class="row no-print">
                                <div class="col-12">
                                    <button type="button" onclick="javascript:reportModal(${orderDTO.id})" class="btn btn-danger float-right" data-toggle="modal" data-target="#modal-danger">신고</button>
                                    <button type="button" onclick="javascript:openModal(${orderDTO.orderNum})" class="btn btn-outline-warning float-right" data-toggle="modal" data-target="#modal-default" style="margin-right: 5px;">주문거절</button>
                                    <button type="button" class="btn btn-warning float-right finish" style="margin-right: 5px;">준비완료</button>
                                </div>
                            </div>
                            </c:if>
                        </div>
                    </form>
                    <!-- /.invoice -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->


<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-sm-6">--%>
<%--                <div class="form-group">--%>
<%--                    <div class="input-group date" id="datetimepicker3" data-target-input="nearest">--%>
<%--                        <input type="text" id="ddd" class="form-control datetimepicker-input" data-target="#datetimepicker3"/>--%>
<%--                        <div class="input-group-append" data-target="#datetimepicker3" data-toggle="datetimepicker">--%>
<%--                            <div class="input-group-text"><i class="fa fa-clock-o"></i></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <button name="hahahaha" id="hahaha"> 제출 </button>--%>


</div>
<!-- /.content-wrapper -->
<%--모달창--%>
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">잠깐!</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>정말로 거절하시겠어요?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="removes">네</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<div class="modal fade" id="modal-danger">
    <div class="modal-dialog">
        <div class="modal-content bg-danger">
            <div class="modal-header">
                <h4 class="modal-title">미 픽업 신고</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>정말로 <strong><c:out value="${orderDTO.id}"></c:out></strong>님을 신고하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-outline-light" data-dismiss="modal">아니요</button>
                <button type="button" class="btn btn-outline-light" id="report">네</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<script>
    document.querySelector(".finish").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()
        const update = document.querySelector("#update")
        update.submit()
    }, false)

    document.querySelector("#removes").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()
        const update = document.querySelector("#update")
        update.setAttribute("action", "/order/remove")
        update.submit()
    }, false)
</script>
<%--번호 매기기 스크립트--%>
<script>
    function autoIncrement(startnum) {
        let init = startnum
        let tdList = document.getElementsByClassName("autoInc")
        for (let i = 0; i < tdList.length; i++) {
            init++
            tdList[i].innerHTML = init
        }
    }

    autoIncrement(0)
</script>

<script>
    const removes = document.getElementById("removes");
    let num = ""

    function openModal(orderNum) {
        num = orderNum
        console.log(num)
        removes.onclick = () => {
            removeOrder(num)
        }
    }
</script>

<script>
    const report = document.getElementById("report");
    let userid = ""

    function reportModal(id) {
        userid = id
        console.log(userid)
        report.onclick = () => {
        }
    }
</script>
<%@include file="../includes/footer.jsp" %>

<%--<script type="text/javascript">--%>
<%--    $(function () {--%>
<%--        moment.locale('ko')--%>
<%--        $('#datetimepicker3').datetimepicker({--%>
<%--            format: 'LT'--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    document.querySelector("#hahaha").addEventListener("click", evt => {--%>
<%--        let hahaha = document.getElementById("ddd").value--%>
<%--        console.log(hahaha)--%>
<%--    }, false)--%>
<%--</script>--%>