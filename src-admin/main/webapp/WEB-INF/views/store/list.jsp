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
                    <div class="card">
                        <div class="card-header">
                            <h1 class="card-title">가게 회원 관리</h1>
                        </div>
                        <!-- /.card-header -->

                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <h6 class="card-subtitle">&lt필터조건&gt</h6>
                                    <form id="selectbox" action="/store/list" method="get">
                                        <c:if test="${pageRequestDTO.type != null}">
                                          <input type="hidden" name="type" value="${pageRequestDTO.type}">
                                          <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
                                        </c:if>

                                        <span>
                                            <div class="row my-2">
                                                <div class="col-auto">회원상태 </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="1">미승인</label>
                                                </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="2">승인거부</label>
                                                </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="3">승인</label>
                                                </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="4">탈퇴</label>
                                                </div>
                                                <div class="col-auto form-check form-check-inline">
                                                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="filterArr" value="5">강제탈퇴</label>
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
                                        <th>가게명</th>
                                        <th>사업자등록번호</th>
                                        <th>가입일</th>
                                        <th>회원상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${storeDTOList}" var="dto">
                                        <tr>
                                            <td><c:out value="${dto.sid}"/></td>
                                            <td><a href="javascript:moveRead(${dto.sno})"><c:out value="${dto.sname}"/></a></td>
                                            <td><c:out value="${dto.regnum}"/></td>
                                            <javatime:format  var="regdate" value="${dto.regdate}" pattern="yyyy년 M월 d일"/>
                                            <td><c:out value="${regdate}"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${dto.status == 1}"><c:out value="미승인"/></c:when>
                                                    <c:when test="${dto.status == 2}"><c:out value="승인거부"/></c:when>
                                                    <c:when test="${dto.status == 3}"><c:out value="승인"/></c:when>
                                                    <c:when test="${dto.status == 4}"><c:out value="탈퇴"/></c:when>
                                                    <c:when test="${dto.status == 5}"><c:out value="강제탈퇴"/></c:when>
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
                                        <form action="/store/list" method="get">
                                            <input type="hidden" name="page" value="1">
                                            <input type="hidden" name="size" value="${pageMaker.size}">
                                            <c:if test="${pageRequestDTO.filterArr != null}">
                                                <c:forEach items="${pageRequestDTO.filterArr}" var="status">
                                                    <input type="hidden" name="filterArr" value="${status}">
                                                </c:forEach>
                                            </c:if>

                                            <div class="input-group mb-3 float-right">
                                                <div class="input-group-prepend" style="width: 15vh">
                                                    <select name="type">
                                                        <option value="">검색조건</option>
                                                        <option value="I" ${pageRequestDTO.type=="I"?"selected":""}>ID</option>
                                                        <option value="S" ${pageRequestDTO.type=="S"?"selected":""}>가게명</option>
                                                        <option value="N" ${pageRequestDTO.type=="N"?"selected":""}>사업자등록번호</option>
                                                        <option value="IS" ${pageRequestDTO.type=="IS"?"selected":""}>ID+가게명</option>
                                                        <option value="ISN" ${pageRequestDTO.type=="ISN"?"selected":""}>ID+가게명+사업자등록번호</option>
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
<!-- /.content-wrapper -->


<form id="actionForm" action="/store/list" method="get">
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


<%@include file="../includes/footer.jsp" %>


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

    function moveRead(sno) {

        actionForm.setAttribute("action", "/store/read")
        actionForm.innerHTML += `<input type='hidden' name='sno' value='\${sno}'>`
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
