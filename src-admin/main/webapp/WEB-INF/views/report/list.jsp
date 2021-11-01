<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<%@include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content">
        <div class="container-fluid">
            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <section class="col-lg-12">
                    <!-- TO DO List -->
                    <div class="card">
                        <div class="card-header">
                            <h1 class="card-title">신고 목록 관리</h1>
                        </div>
                        <!-- /.card-header -->

                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <h6 class="card-subtitle">&lt필터조건&gt</h6>
                                    <form id="selectbox" action="/report/list" method="get">
                                        <c:if test="${pageRequestDTO.type != null}">
                                            <input type="hidden" name="type" value="${pageRequestDTO.type}">
                                            <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
                                        </c:if>
                                        <span>
                                            <div class="row my-2">
                                                <div class="col-auto">분류 </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="가게">가게</label>
                                                </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="게시판">게시판</label>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-outline-secondary">적용</button>
                                            <button type="reset" class="btn btn-outline-secondary btnReset">초기화</button>
                                        </span>

                                        <div class="float-right">
                                            <div class="form-group d-flex flex-row col">
                                                <input type="hidden" name="page" value="1">
                                                <select class="form-control" name="size">
                                                    <option value="10" ${pageMaker.size == 10?"selected":""}>10</option>
                                                    <option value="20" ${pageMaker.size == 20?"selected":""}>20</option>
                                                    <option value="50" ${pageMaker.size == 50?"selected":""}>50</option>
                                                    <option value="100" ${pageMaker.size == 100?"selected":""}>100</option>
                                                </select>
                                                <button type="submit" class="btn btn-outline-secondary text-nowrap" id="btnPage">적용</button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>

                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>신고자</th>
                                    <th>구분</th>
                                    <th>신고이유</th>
                                    <th>신고일</th>
                                    <th>취소여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${reportList}" var="dto">
                                        <tr>
                                            <td><a href="javascript:moveRead('${dto.rid}')"><c:out value="${dto.rid}"/></a></td>
                                            <td><a href="javascript:moveRead2('${dto.reporter}')"><c:out value="${dto.reporter}"/></a></td>
                                            <td><c:out value="${dto.category}"/></td>
                                            <td><c:out value="${dto.reason}"/></td>
                                            <javatime:format  var="reportdate" value="${dto.reportdate}" pattern="yyyy년 M월 d일"/>
                                            <td><c:out value="${reportdate}"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${dto.cancel == false}"><c:out value=""/></c:when>
                                                    <c:when test="${dto.cancel == true}"><c:out value="취소"/></c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="card-footer clearfix center">
                            <div class="row">
                                <div class="col-6">
                                    <div class="row">
                                        <!-- Left col -->
                                        <form action="/report/list" method="get">
                                            <input type="hidden" name="page" value="1">
                                            <input type="hidden" name="size" value="${pageMaker.size}">
                                            <c:if test="${pageRequestDTO.filterArr != null}">
                                                <c:forEach items="${pageRequestDTO.filterArr}" var="status">
                                                    <input type="hidden" name="filterArr" value="${status}">
                                                </c:forEach>
                                            </c:if>

                                            <div class="input-group mb-3 float-right">
                                                <div class="input-group-prepend" style="width: 10vh">
                                                    <select name="type">
                                                        <option value="">검색조건</option>
                                                        <option value="I" ${pageRequestDTO.type=="I"?"selected":""}>ID</option>
                                                        <option value="R" ${pageRequestDTO.type=="R"?"selected":""}>신고자</option>
                                                        <option value="IR" ${pageRequestDTO.type=="IR"?"selected":""}>ID+신고자</option>
                                                    </select>
                                                </div>

                                                <input type="text" name="keyword" value="${pageRequestDTO.keyword}" placeholder="Search">

                                                <span class="input-group-append">
                                                    <button type="submit" class="btn btn-default">
                                                      <i class="fas fa-search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <ul class="pagination pagination-sm m-0 float-right">
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
                        </div>
                    </div>
                    <!-- /.card-body -->
                </section>
                <!-- /.Left col -->
            </div>
            <!-- /.row (main row) -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.c ntent-wrapper -->




<form id="actionForm" action="/report/list" method="get">

    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>

    <c:if test="${pageRequestDTO.filterArr != null}">
        <c:forEach items="${pageRequestDTO.filterArr}" var="status">
            <input type="hidden" name="filterArr" value="${status}">
        </c:forEach>
    </c:if>
</form>


<%@ include file="../includes/footer.jsp" %>


<script>

    (function check(){

        const selectbox = document.querySelector("#selectbox")
        selectbox.querySelectorAll("input[name='filterArr']").forEach((elem) => {

            <c:forEach items="${pageRequestDTO.filterArr}" var="status">
            if(elem.value == "${status}"){
                elem.checked = true
            }
            </c:forEach>
        })
    })()

    const actionForm = document.querySelector("#actionForm")

    function movePage(pageNum) {

        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit()

    }

    function moveRead(rid) {
        console.log(rid)
        actionForm.setAttribute("action", "/report/detail")
        actionForm.innerHTML += `<input type='hidden' name='rid' value="\${rid}">`
        actionForm.innerHTML += `<input type='hidden' name='detailtype' value="rid">`
        actionForm.submit()

    }

    function moveRead2(reporter) {
        console.log(reporter)
        actionForm.setAttribute("action", "/report/detail")
        actionForm.innerHTML += `<input type='hidden' name='reporter' value="\${reporter}">`
        actionForm.innerHTML += `<input type='hidden' name='detailtype' value="reporter">`
        actionForm.submit()

    }

    selectbox.querySelector(".btnReset").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        selectbox.querySelectorAll("input").forEach((elem) => {

            elem.checked = false

        })

        selectbox.submit()
    },false)

</script>
</body>
</html>
