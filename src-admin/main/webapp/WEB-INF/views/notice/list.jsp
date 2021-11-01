<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<style>
    #notice:hover tbody tr:hover td {
        background: rgba(255, 243, 176, 0.33);
    }
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <section class="col-lg-12 connectedSortable">
                    <!-- TO DO List -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"> 공지사항 </h3>

                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table  id = "notice"  class="table hover ">
                                <thead>
                                <tr>
                                    <th style="width: 5vh">NO</th>
                                    <th style="width: 60vh">TITLE</th>
                                    <th style="width: 10vh">조회수</th>
                                    <th style="width: 20vh">등록일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${dtoList}" var="dto">
                                    <tr onclick="javascript:moveRead(${dto.nno})">
                                        <td><c:out value="${dto.nno}"></c:out></td>
                                        <td><c:out value="${dto.title}"></c:out> &nbsp;&nbsp;&nbsp;[<c:out
                                                value="${dto.replyCnt}"></c:out>]
                                        </td>
                                        <td><c:out value="${dto.viewCount}"></c:out></td>
                                        <fmt:parseDate value="${dto.regDate}" var="dateFmt"
                                                       pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                                        <td><fmt:formatDate value="${dateFmt}" pattern="yy년MM월dd일 "/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <p/>
                            <form id="formSearch" action="/notice/list" method="get">
                                <input type="hidden" name="page" value="1">
                                <input type="hidden" name="size" value="${pageMaker.size}">
                                <!-- select -->
                                <div class="row">
                                    <div class="col-sm-9 input-group input-group-sm">
                                        <select name="type" class="custom-select col-sm-3"  >
                                            <option value="">====================================</option>
                                            <option value="T" ${pageRequestDTO.type=="T"?"selected":""}>제목</option>
                                            <option value="TC" ${pageRequestDTO.type=="C"?"selected":""}>내용</option>
                                            <option value="TCW" ${pageRequestDTO.type=="TC"?"selected":""}>제목+내용</option>
                                        </select>
                                        <input type="text" class="form-control col-sm-3" name="keyword"
                                               value="${pageRequestDTO.keyword}" >
                                        <span class="input-group-append"><button type="submit" class="btn btn-info btn-warning btnSearch" > 검색 </button></span>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class=" float-right" >
                                            <a href="/notice/register"> <button type="button" class="btn btn-outline-warning"> 글쓰기 </button> </a>
                                        </div>
                                    </div>
                                </div>

                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <ul class="pagination pagination-sm m-0 float-right">
                                    <c:if test="${pageMaker.prev}">
                                        <li class="page-item"><a class="page-link"
                                                                 href="javascript:movePage(${pageMaker.start- 1})">
                                            << </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                        <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link"
                                                                                                      href="javascript:movePage(${num})">${num}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next}">
                                        <li class="page-item"><a class="page-link"
                                                                 href="javascript:movePage(${pageMaker.end +1})">
                                            >> </a>
                                        </li>
                                    </c:if>
                                </ul>

                            </div>
                            </form>
                        </div>

                        <!-- /.card -->
                    </div>
                </section>
                <!-- /.Left col -->

            </div>
            <!-- /.row (main row) -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<form id="actionForm" action="/notice/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">
    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

<%@include file="../includes/footer.jsp" %>

<script>
    const actionForm = document.querySelector("#actionForm")
    const result = '${result}';
    if (result && result !== '') {
        window.history.replaceState(null, '', '/notice/list')
    }

    function movePage(pageNum) {
        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit()
    }

    function moveRead(nno) {
        actionForm.setAttribute("action", "/notice/read")
        actionForm.innerHTML += `<input type='hidden' name='nno' value='\${nno}'>`
        actionForm.submit();
    }


</script>

</body>
</html>
