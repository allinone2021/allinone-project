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
                            <h1 class="card-title">상세조회</h1>
                        </div>
                        <!-- /.card-header -->

                        <div class="card-body">
                            <div class="row">
                                <c:forEach items="${category}" var="list">
                                    <div class="col-12 col-sm-6 col-md-3">
                                        <div class="info-box mb-3">
                                            <div class="info-box-content">
                                                <span class="info-box-text">${list.category} 신고</span>
                                                <span class="info-box-number">${list.count}회</span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                </c:forEach>

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
                                            <td><c:out value="${dto.rid}"/></td>
                                            <td><c:out value="${dto.reporter}"/></td>
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

                            <div class="float-right">
                                <button type="button" class="btn btn-outline-secondary btn-space btnList">목록</button>
                                <button type="button" class="btn btn-outline-danger btn-space" data-toggle="modal"
                                        data-target="#modal-signout">강제탈퇴</button>
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

<%--회원 강제탈퇴모달--%>
<div class="modal fade show" id="modal-signout">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">강제탈퇴</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <c:choose>
                    <c:when test="${param.detailtype == 'rid'}">
                        <p>${reportList[0].rid}을 강제탈퇴 처리하시겠습니까?</p>
                    </c:when>
                    <c:when test="${param.detailtype == 'reporter'}">
                        <p>${reportList[0].reporter}을 강제탈퇴 처리하시겠습니까?</p>
                    </c:when>
                </c:choose>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning" onclick="javascript:signout()">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%@include file="../includes/footer.jsp" %>

<script>

    const actionForm = document.querySelector("#actionForm")

    // 목록이동
    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.submit();
    },false)

    function signout(){

        actionForm.setAttribute("action", "/report/signout")
        actionForm.setAttribute("method", "post")

        actionForm.innerHTML +=`<input type='hidden' name='detailtype' value="<c:out value="${param.detailtype}"/>">`

        if("${param.detailtype}" == "rid"){
            actionForm.innerHTML +=`<input type='hidden' name='rid' value="<c:out value="${reportList[0].rid}"/>">`
        }else if("${param.detailtype}" == "reporter"){
            actionForm.innerHTML +=`<input type='hidden' name='rid' value="<c:out value="${reportList[0].rid}"/>">`
            actionForm.innerHTML +=`<input type='hidden' name='reporter' value="<c:out value="${reportList[0].reporter}"/>">`
            actionForm.innerHTML +=`<input type='hidden' name='category' value="<c:out value="${reportList[0].category}"/>">`
        }
        actionForm.submit()
    }

</script>
</body>
</html>
