<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>총 주문 내역</h1>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="col-md-12">
            <div class="card card-default">
                <div class="card-body">
                    <!-- Date range -->
                    <div class="form-group">
                        <label>날짜별 검색</label>

                        <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text">
                                <i class="far fa-calendar-alt"></i>
                              </span>
                            </div>
                            <input type="text" class="form-control float-right" id="reservation">
                            <button type="button" class="btn btn-primary btn-sm" id="searching"><strong>검색</strong></button>
                        </div>
                        <!-- /.input group -->
                    </div>
                    <!-- /.form group -->
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>ID</th>
                                    <th>전화번호</th>
                                    <th>주문일자</th>
                                </tr>
                                </thead>
                                <tbody class="order">
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">
                                <li class="page-item"><a class="page-link" href="#">이전</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">다음</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>

<%--    <input type="date" id="starting">~<input type="date" id="ending">--%>
<%--    <button id="searching" type="button">검색</button>--%>

    <%--read로 넘어가기 위한 폼--%>
    <form id="actionForm" action="/order/read" method="get"></form>

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
    <%--주문 리스트 만들어 주는 펑션--%>

    function getList() {
        const order = document.querySelector(".order")
        let shop = 'musinsa'
        <%--json 데이터를 html로 변환해주는 펑션--%>

        function convertTemp(menusObj) {
            const {orderNum, id, nickName, phone, shop, comment, orderDate, orderCheck, orderConfirm, pickupTime} = {...menusObj}
            const temp = `<tr onclick="javascript:moveRead(\${orderNum})">
                                  <td>\${orderNum}</td>
                                  <td>\${id}</td>
                                  <td>\${phone}</td>
                                  <td>\${orderDate}</td>
                              </tr>`
            return temp
        }

        <%--제일 먼저 실행되는 펑션--%>
        allList(shop).then(data => {
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
</script>
<script>
    document.querySelector("#searching").addEventListener("click", evt => {
        const order = document.querySelector(".order")
        let shop = 'musinsa'
        let selectDate = document.querySelector("#reservation").value
        function convertTemp(menusObj) {
            const {orderNum, id, nickName, phone, shop, comment, orderDate, orderCheck, orderConfirm, pickupTime} = {...menusObj}
            const temp = `<tr onclick="javascript:moveRead(\${orderNum})">
                                  <td>\${orderNum}</td>
                                  <td>\${id}</td>
                                  <td>\${phone}</td>
                                  <td>\${orderDate}</td>
                              </tr>`
            return temp
        }

        specificList(shop, selectDate).then(data => {
            let str = ""
            data.forEach(menus => {
                str += convertTemp(menus)
            })
            order.innerHTML = str
        })
    }, false)
</script>




<%@include file="../includes/footer.jsp" %>
<script>
    $(function () {
        moment.locale('ko')
        $('#reservation').daterangepicker(
            {
                timePicker: false,
                timePicker24Hour: true,
                timePickerSeconds: true,
                singleDatePicker: false,
                locale :{
                    format: 'YYYY-MM-DD',
                    separator: '~',
                    applyLabel: "적용",
                    cancelLabel: "닫기"
                },
            }
        )
    })
</script>

