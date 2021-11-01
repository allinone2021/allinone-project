<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>점주님, 환영합니다!</h1>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>


    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- Left col. -->
                <section class="col-lg-6">
                    <!-- 현재 주문 내역 card -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">주문 내역</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 15vw">주문번호</th>
                                    <th style="width: 15vw">ID</th>
                                    <th style="width: 30vw">전화번호</th>
                                    <th style="width: 25vw">주문일자</th>
                                    <th style="width: 10vw"></th>
                                </tr>
                                </thead>
                                <tbody class="order">

                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <button type="button" class="btn btn-warning btn-sm float-right"
                                    onclick="javascript:moveList()">더보기
                            </button>
                        </div>
                    </div>
                    <!-- /.card -->

                    <!-- 차트 card -->
                    <div class="card">
                        <div class="card-header">
                            연령별 주문 통계
                        </div>
                        <div class="card-body">
                            <div id="Ganderfd"></div>
                        </div>
                    </div>


                    <!-- /.Left col end -->
                </section>

                <!-- Right col. -->
                <section class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"> 공지사항 </h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table table-hover ">
                                <thead>
                                <tr>
                                    <th style="width: 5vw">NO</th>
                                    <th style="width: 60vw">TITLE</th>
                                    <th style="width: 35vw">등록일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${dtoList}" var="dto">
                                    <tr onclick="javascript:moveNotice(${dto.nno})">
                                        <td><c:out value="${dto.nno}"></c:out></td>
                                        <td><c:out value="${dto.title}"></c:out> &nbsp;&nbsp;&nbsp;[<c:out
                                                value="${dto.replyCnt}"></c:out>]
                                        </td>
                                        <fmt:parseDate value="${dto.regDate}" var="dateFmt"
                                                       pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                                        <td><fmt:formatDate value="${dateFmt}" pattern="yy년MM월dd일 "/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <button type="button" class="btn btn-warning btn-sm float-right"
                                    onclick="javascript:moveNotice()">더보기
                            </button>
                        </div>
                    </div>
                    <!-- /.card -->

                    <!-- 차트 card -->
                    <div class="card">
                        <div class="card-header">
                            성별 주문 통계
                        </div>
                        <div class="card-body">
                            <div id="pieChartForMain"></div>
                        </div>
                    </div>

                    <!-- /.Right col. -->
                </section>



            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    <%--read로 넘어가기 위한 폼--%>
    <form id="actionForm" action="/order/read" method="get"></form>
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
                    <button type="button" class="btn btn-warning" data-dismiss="modal" id="removes">네</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
<%--엑시오스와 외부js 호출 스크립트--%>


<%@include file="../includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/order.js"></script>
<script src="/resources/js/multiLineForMain.js"></script>
<script src="/resources/js/d3PieChart.js"></script>

<%--주문 리스트 호출 스크립트--%>
<script>
    forMain()
    pieForMain()

    <%--스크립트 중 제일 먼저 실행--%>
    (function () {
        getList()
    })()
    <%--주문 리스트 만들어 주는 펑션--%>

    function getList() {
        const order = document.querySelector(".order")
        let orderCheck = 1
        let limitNum = 5
        <%--json 데이터를 html로 변환해주는 펑션--%>

        function convertTemp(menusObj) {
            const {orderNum, id, nickName, phone, shop, comment, orderDate, orderCheck, orderConfirm, pickupTime} = {...menusObj}
            if(orderConfirm == 1) {
                $(document).Toasts('create', {
                    title: '새로운 주문이 들어왔어요!',
                    body: `\${nickName}님의 주문, \${pickupTime}에 수령 예정`
                })
                updateConfirm(orderNum).then(result => {
                })
            }
            const temp = `<tr>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${orderNum}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${id}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${phone}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${orderDate}</td>
                                  <td><button type="button" onclick="javascript:openModal(\${orderNum})" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal-default">거절</button></td>
                              </tr>`
            return temp
        }

        <%--제일 먼저 실행되는 펑션--%>
        customList(orderCheck, limitNum).then(data => {
            let str = ""
            data.forEach(menus => {
                str += convertTemp(menus)
            })
            order.innerHTML = str
        })
    }
</script>
<%--read로 이동하는 펑션--%>
<script>
    const actionForm = document.querySelector("#actionForm")

    function moveRead(orderNum) {
        actionForm.innerHTML += `<input type='hidden' name='orderNum' value='\${orderNum}'>`
        actionForm.submit()
    }

    //list로 이동하는 펑션
    function moveList() {
        actionForm.setAttribute("action", "/order/list")
        actionForm.submit()
    }

    //주문 리스트 삭제 펑션
    function removeOrder(orderNum) {
        remove(orderNum).then(result => {
            getList()
        })
    }

    function moveNotice() {
        actionForm.setAttribute("action", "/notice/list")
        actionForm.submit()
    }

</script>

<%--모달 스크립트--%>
<script>
    const removes = document.getElementById("removes");
    let num = ""

    function openModal(orderNum) {
        num = orderNum
        removes.onclick = () => {
            removeOrder(num)
        }
    }
</script>

<script>
    setInterval(getList, 3000)
</script>
