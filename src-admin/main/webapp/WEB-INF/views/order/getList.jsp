<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>총 주문 내역</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="col-md-12">
            <div class="card card-default">
                <div class="card-body">
                    <div class="form-group">
                        <label>날짜별 검색</label>
                        <form id="formSearch">
                            <input type="hidden" name="page" value="1">
                            <input type="hidden" name="size" value="10">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">
                                    <i class="far fa-calendar-alt"></i>
                                  </span>
                                </div>
                                <input type="text" class="form-control float-right" id="reservation" name="selectDate" value="${customRequestDTO.selectDate}">
                                <button type="button" class="btn btn-warning btn-sm" id="searching" style="margin-right: 5px;"><strong>검색</strong></button>
                                <button type="button" class="btn btn-outline-warning btn-sm" id="reset">초기화</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>ID</th>
                                    <th>전화번호</th>
                                    <th>주문일자</th>
                                </tr>
                                </thead>
                                <tbody class="order">
                                    <c:forEach items="${orderDTO}" var="orderDTO">
                                        <tr onclick="javascript:moveRead(${orderDTO.orderNum})">
                                            <td>${orderDTO.orderNum}</td>
                                            <td>${orderDTO.id}</td>
                                            <td>${orderDTO.phone}</td>
                                            <td>${orderDTO.orderDate}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                    <li class="page-item"><a class="page-link" href="javascript:movePage(${num})">${num}</a></li>
                                </c:forEach>
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form id="actionForm" action="/order/getList" method="get">
        <input type="hidden" name="page" value="${customRequestDTO.page}">
        <input type="hidden" name="size" value="${customRequestDTO.size}">
        <c:if test="${customRequestDTO.selectDate != null}">
            <input id="selectDate" type="hidden" name="selectDate" value="${customRequestDTO.selectDate}">
        </c:if>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/order.js"></script>

<script>
    function movePage(pageNum) {
        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit();
    }
</script>

<script>
    const actionForm = document.querySelector("#actionForm")
    function moveRead(orderNum) {
        actionForm.setAttribute("action", "/order/read")
        actionForm.innerHTML += `<input type='hidden' name='orderNum' value='\${orderNum}'>`
        actionForm.submit()
    }
</script>

<script>
    document.querySelector("#reset").addEventListener("click", evt => {
        let selectDate = document.getElementById("selectDate")
        actionForm.removeChild(selectDate)
        actionForm.submit()
    }, false)
</script>

<script>
    const formSearch = document.querySelector("#formSearch")
    document.querySelector("#searching").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()
        formSearch.setAttribute("action", "/order/getList")
        formSearch.setAttribute("method", "get")
        formSearch.submit()
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
                locale: {
                    format: 'YYYY-MM-DD',
                    separator: '~',
                    applyLabel: "적용",
                    cancelLabel: "닫기"
                },
            }
        )
    })
</script>