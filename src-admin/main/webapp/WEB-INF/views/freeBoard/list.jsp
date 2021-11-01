<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@include file="../includes/header.jsp" %>

<style>
    .a {
        display: flex;
        list-style: none;
        margin-left: 0.3ex;
    }

    a:link { color: #0048ff; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover {text-decoration: underline;}

    #report1:hover tbody tr:hover td {
        background: #ffc501;
        color: white;
    }
</style>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 id="h">자유 게시판</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">자유 게시판</li>
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
                            <div>
                                <form action="/freeBoard/list" method="get">
                                    <input type="hidden" name="page" value="1">
                                    <input type="hidden" name="size" value="${pageMaker.size}">

                                    <ul class="a">

                                        <label>Search</label>
                                        <li class="col-sm-12">
                                            <div class="row">
                                                <select style="width: 20vh" name="type" class="custom-select">
                                                    <option value="">===</option>
                                                    <option value="T" ${pageRequestDTO.type=="T"?"selected":""}>제목
                                                    </option>
                                                    <option value="TC" ${pageRequestDTO.type=="TC"?"selected":""}>제목,내용
                                                    </option>
                                                    <option value="TCW" ${pageRequestDTO.type=="TCW"?"selected":""}>
                                                        제목,내용,작성자
                                                    </option>
                                                </select>
                                                <input style="width: 40vh" type="text" class="form-control"
                                                       name="keyword"
                                                       value="${pageRequestDTO.keyword}">
                                                <button type="submit"
                                                        class="btn btn-warning btn-flat">Go!
                                                </button>
                                            </div>
                                        </li>
                                    </ul>
                                </form>
                            </div>


                            <div>
                                <div class="row">

                                    <div class="col-md-12">
                                        <form id="form1">
                                            <input type="hidden" name="shopName" value="${dateMaker.shopName}">
                                            <table id="report1" class="table bordered">
                                                <thead>
                                                <tr>
                                                    <th>글번호</th>
                                                    <th>작성자</th>
                                                    <th>제목</th>
                                                    <th>등록일</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${dtoList}" var="dto">
                                                    <tr onclick="javascript:moveRead(${dto.fbno})">
                                                        <td><c:out value="${dto.fbno}"></c:out></td>
                                                        <td><c:out value="${dto.writer}"></c:out></td>
                                                        <td><c:out value="${dto.title} [${dto.replyCnt}]"></c:out></td>
                                                        <javatime:format var="regDate" value="${dto.regDate}"
                                                                         pattern="yyyy년 M월 d일 a h시 m분 s초"/>
                                                        <td><c:out value="${regDate}"></c:out></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript:movePage(${pageMaker.start- 1})">
                                        << </a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                    <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link"
                                                                                                  href="javascript:movePage(${num})">${num}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next}">
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript:movePage(${pageMaker.end +1})">
                                        >> </a></li>
                                </c:if>
                            </ul>
                            <ul class="pagination pagination-sm m-0 float-left">
                                <sec:authorize access="isAuthenticated()">
                                    <button class="btn btn-warning"><a href="/freeBoard/register">글쓰기</a>
                                    </button>
                                </sec:authorize>
                            </ul>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
            <form id="actionForm" action="/freeBoard/list" method="get">
                <input type="hidden" name="page" value="${pageRequestDTO.page}">
                <input type="hidden" name="size" value="${pageRequestDTO.size}">
                <c:if test="${pageRequestDTO.type != null}">
                    <input type="hidden" name="type" value="${pageRequestDTO.type}">
                    <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
                </c:if>
            </form>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>


<script>
    const actionForm = document.querySelector("#actionForm")

    const result = '${result}';

    console.log("result", result)

    if (result && result !== '') {
        window.history.replaceState(null, '', '/freeBoard/list')
    }

    function movePage(pageNum) {
        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit()
    }

    function moveRead(fbno) {
        actionForm.setAttribute("action", "/freeBoard/read")
        actionForm.innerHTML += `<input type='hidden' name='fbno' value='\${fbno}'>`
        actionForm.submit();
    }


</script>

<%@include file="../includes/footer.jsp" %>
</body>
</html>
