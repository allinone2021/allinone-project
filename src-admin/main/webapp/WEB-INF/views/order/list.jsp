<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>오늘 주문 내역</h1>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">들어온 주문</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 85px">주문번호</th>
                                    <th style="width: 110px">ID</th>
                                    <th style="width: 130px">전화번호</th>
                                    <th>주문일자</th>
                                    <th style="width: 70px">버튼</th>
                                </tr>
                                </thead>
                                <tbody class="order">
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">완료된 주문</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 85px">주문번호</th>
                                    <th style="width: 110px">ID</th>
                                    <th style="width: 130px">전화번호</th>
                                    <th>주문일자</th>
                                </tr>
                                </thead>
                                <tbody class="finishOrder">
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/order.js"></script>
<%--주문 리스트 호출 스크립트--%>
<script>
    <%--스크립트 중 제일 먼저 실행--%>
    (function () {
        getList()
    })()
    function getList() {
        const order = document.querySelector(".order")
        let orderCheck = 1
        let limitNum = 1000
        <%--json 데이터를 html로 변환해주는 펑션--%>
        function convertTemp(menusObj) {
            const {orderNum, id, nickName, phone, shop, comment, orderDate, orderCheck, orderConfirm, pickupTime} = {...menusObj}
            const temp = `<tr>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${orderNum}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${id}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${phone}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${orderDate}</td>
                                  <td><button type="button" onclick="javascript:openModal(\${orderNum})" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modal-default">거절</button></td>
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
<script>
    <%--스크립트 중 제일 먼저 실행--%>
    (function () {
        getFinishList()
    })()

    function getFinishList() {
        const finishOrder = document.querySelector(".finishOrder")
        let orderCheck = 0
        let limitNum = 1000
        <%--json 데이터를 html로 변환해주는 펑션--%>
        function convertTemp(menusObj) {
            const {orderNum, id, nickName, phone, shop, comment, orderDate, orderCheck, orderConfirm, pickupTime} = {...menusObj}
            const temp = `<tr>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${orderNum}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${id}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${phone}</td>
                                  <td onclick="javascript:moveRead(\${orderNum})">\${orderDate}</td>
                              </tr>`
            return temp
        }
        <%--제일 먼저 실행되는 펑션--%>
        customList(orderCheck, limitNum).then(data => {
            let str = ""
            data.forEach(menus => {
                str += convertTemp(menus)
            })
            finishOrder.innerHTML = str
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
</script>
<%--주문 리스트 삭제 펑션--%>
<script>
    function removeOrder(orderNum) {
        remove(orderNum).then(result => {
            getList()
        })
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
<%@include file="../includes/footer.jsp" %>