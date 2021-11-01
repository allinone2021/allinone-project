<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal" var="memberDTO"/><!--인증된정보-->

<div class="content-wrapper">
    <div class="col-sm-12">
        <div class="card card-warning card-warning card-outline-tabs">
            <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill"
                               href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home"
                               aria-selected="true">FAQ</a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_STORE')">
                        <li class="nav-item">
                            <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill"
                               href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile"
                               aria-selected="false">점주FAQ</a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_MEMBER')">
                        <li class="nav-item">
                            <a class="nav-link" id="custom-tabs-four-messages-tab" data-toggle="pill"
                               href="#custom-tabs-four-messages" role="tab" aria-controls="custom-tabs-four-messages"
                               aria-selected="false">회원FAQ</a>
                        </li>
                    </sec:authorize>
                </ul>
            </div>
            <form id="faqForm" action="/faq/list" method="get">
                <div class="card-body">
                    <div class="tab-content" id="custom-tabs-four-tabContent">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel"
                                 aria-labelledby="custom-tabs-four-home-tab">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title"> 자주 묻는 질문 </h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <tbody>
                                            <c:forEach items="${dtoList}" var="dto">
                                                <input type="hidden" name="fno" value="${dto.fno}">
                                                <tr data-widget="expandable-table" aria-expanded="false">
                                                    <td><c:out value="${dto.title}"></c:out> <span><i
                                                            class="float-right fas fa-chevron-down"></i></span></td>
                                                </tr>
                                                <tr class="expandable-body d-none">
                                                    <td colspan="5">
                                                        <p style="display: none;">
                                                            <c:out value="${dto.content}"></c:out>
                                                        </p>
                                                        <button type="submit"
                                                                class="btnDel btn float-right btn-sm btn-outline-danger">
                                                            삭제
                                                        </button>
                                                        <button type="button"
                                                                class="btnfaqMod btn float-right btn-sm btn-outline-warning"
                                                                data-content='${dto.content}' data-fno='${dto.fno}'
                                                                data-title='${dto.title}' data-toggle="modal"
                                                                data-target="#modal-lg"> 수정
                                                        </button>

                                                    </td>
                                                </tr>

                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_STORE')">
                            <div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel"
                                 aria-labelledby="custom-tabs-four-profile-tab">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title"> 자주 묻는 질문 </h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <tbody>
                                            <c:forEach items="${dtoList}" var="dto">

                                                <c:if test="${dto.category == 1 || dto.category == 0 }">
                                                    <input type="hidden" name="fno" value="${dto.fno}">
                                                    <tr data-widget="expandable-table" aria-expanded="false">
                                                        <td><span><c:out value="${dto.title}"></c:out></span>
                                                            <span><i class="float-right fas fa-chevron-down"></i></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="expandable-body d-none">
                                                        <td colspan="5">
                                                            <p style="display: none;">
                                                                <c:out value="${dto.content}"></c:out>
                                                            </p>
                                                            <button type="submit"
                                                                    class="btnDel btn float-right btn-sm btn-outline-danger">
                                                                삭제
                                                            </button>
                                                            <button type="button"
                                                                    class="btnfaqMod btn float-right btn-sm btn-outline-warning"
                                                                    data-content='${dto.content}' data-fno='${dto.fno}'
                                                                    data-title='${dto.title}' data-toggle="modal"
                                                                    data-target="#modal-lg"> 수정
                                                            </button>

                                                        </td>
                                                    </tr>
                                                </c:if>

                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>

                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_MEMBER')">
                            <div class="tab-pane fade" id="custom-tabs-four-messages" role="tabpanel"
                                 aria-labelledby="custom-tabs-four-messages-tab">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title"> 자주 묻는 질문 </h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <tbody>
                                            <c:forEach items="${dtoList}" var="dto">
                                                <c:if test="${dto.category == 2  || dto.category == 0 }">
                                                    <input type="hidden" name="fno" value="${dto.fno}">

                                                    <tr data-widget="expandable-table" aria-expanded="false">
                                                        <td><c:out value="${dto.title}"></c:out> <span><i
                                                                class="float-right  fas fa-chevron-down"></i></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="expandable-body d-none">
                                                        <td colspan="5">
                                                            <p style="display: none;">
                                                                <c:out value="${dto.content}"></c:out>
                                                            </p>
                                                            <button type="submit"
                                                                    class="btnDel btn float-right btn-sm btn-outline-danger">
                                                                삭제
                                                            </button>
                                                            <button type="button"
                                                                    class="btnfaqMod btn float-right btn-sm btn-outline-warning"
                                                                    data-content='${dto.content}' data-fno='${dto.fno}'
                                                                    data-title='${dto.title}' data-toggle="modal"
                                                                    data-target="#modal-lg"> 수정
                                                            </button>

                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>

                            </div>
                        </sec:authorize>
                    </div>
                </div>
            </form>
            <!-- /.card -->
        </div>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="button" class="btn btn-outline-warning float-right"><a href="/faq/register"> 글쓰기 </a></button>
        </sec:authorize>
    </div>
</div>

<div class="modal fade show" id="modal-lg">
    <form id="modModal" action="/faq/list" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">수정</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="fno">
                    <div class="form-group">
                        <label for="moda"> 질문 </label>
                        <input type="text" class="form-control" id="moda" name="title">
                    </div>
                    <div class="form-group">
                        <label for="modq"> 내용 </label>
                        <input type="text" class="form-control" id="modq" name="content">
                    </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-outline-warning btnMod">수정</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@include file="../includes/footer.jsp" %>

<script>
    const form = document.querySelector("#faqForm")
    const modForm = document.querySelector("#modModal")


    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        form.setAttribute("action", "/faq/remove")
        form.setAttribute("method", "post")
        form.submit()
    }, false)

    const modModal = $("#modal-lg")
    const modContent = document.querySelector("input[id='modq']")
    const modTitle = document.querySelector("input[id='moda']")
    const modFno = document.querySelector("input[name='fno']")


    document.querySelector(".btnfaqMod").addEventListener("click", (e) => {
        const target = e.target
        const fno = target.getAttribute("data-fno")
        const title = target.getAttribute("data-title")
        const content = target.getAttribute("data-content")
        modFno.value = fno
        modTitle.value = title
        modContent.value = content
        modModal.modal('show')
    }, false)


</script>

</body>
</html>