<%--
  Created by IntelliJ IDEA.
  User: junga
  Date: 2021-09-20
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>

<body>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper bg-white" >
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card-header"><h1 class="card-title">질문 조회</h1></div>
        <!-- /.card-header -->
        <div class="card-body">

                <input type="hidden" name="qno" class="form-control" style="background-color:white;"
                       value="<c:out value="${qnaDTO.qno}"/>" readonly var ="qnoa">

            <div class="form-group">
                <label> 제목 </label>
                <input type="text" name="title" class="form-control" style="background-color:white;"
                       value="<c:out value="${qnaDTO.title}"/>"
                       readonly>
            </div>
            <div class="form-group">     <label> 작성자 </label>
                <input type="text" name="writer" class="form-control" style="background-color:white;"
                       value="<c:out value="${qnaDTO.writer}"/>"
                       readonly></div>
            <div>
                <div class="col-sm-3">
                    <label> 첨부파일 </label>
                    <c:forEach items="${qnaDTO.files}" var="attach">
                        <div>
                            <c:if test="${attach.image}">
                                <img onclick="javascript:showOrigin('${attach.getFileLink()}')"
                                     style="width: 90%;" src="/viewFile?file=${attach.getFileLink()}">
                            </c:if>
                            <p></p>
                            <p/> ${attach.fileName}
                        </div>
                    </c:forEach>
                </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea name="content" class="form-control" rows="3" disabled
                                      style="background-color:white;"><c:out
                                    value="${qnaDTO.content}"></c:out></textarea>
                        </div>
            </div>
            <!-- /.card-body -->


            <form id="actionForm" action="/qna/list" method="get" class="col-lg-12">
                <div class="row">
                    <div class="col-3">
                        <button type="button" class="btn  btn-outline-warning btnList ">LIST</button>
                            <button type="button" class="btn  btn-outline-warning  btnMod ">MODIFY</button>
                    </div>
                    <div class="col-6"></div>
                    <div class="col-3">
                        <c:if test="${prevNum != null}">
                            <button type="button" class="btn  btn-outline-warning" onclick="javascript:moveRead(${prevNum})">이전글
                            </button>
                        </c:if>
                        <c:if test="${nextNum != null}">
                            <button type="button" class="btn  btn-outline-warning" onclick="javascript:moveRead(${nextNum})">다음글
                            </button>
                        </c:if></div>
                </div>

                <input type="hidden" name="page" value="${pageRequestDTO.page}">
                <input type="hidden" name="size" value="${pageRequestDTO.size}">
                <c:if test="${pageRequestDTO.type != null}">
                    <input type="hidden" name="type" value="${pageRequestDTO.type}">
                    <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
                </c:if>
            </form>


            <c:if test="${qnaDTO.pno eq qnaDTO.qno}">

            <form action="/qna/regAnswer" method="post" id="regAnswer">

                <div class="card-body">

                    <input type="hidden" name="pno" class="form-control" value="${qnaDTO.qno}" readonly>
                    <div class="form-group">
                        <input type="hidden" name="title" class="form-control" value="re : <c:out value="${qnaDTO.title}"/>">
                    </div>
                    <input type="hidden" name="writer" class="form-control" value="관리자">

                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <!-- textarea -->
                        <div class="form-group">
                            <label> 답변 </label>
                            <textarea name="content" class="form-control" rows="10"> <c:out value="${readAns.content ne null ? readAns.content : '현재 등록된 답변이 없습니다' }"/></textarea>
                        </div>
                    </div>
                    <div>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <button type="submit" class="btn btn-default float-right answerBtn"> 답변 등록</button>
                        </sec:authorize>
                    </div>

                </div>
                <!-- /.card-body -->

            </form>
            </c:if>



            <div class="modal fade" id="modal-image">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-body">
                            <img id="targetImage" class="img-fluid mx-auto">
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <%@include file="../includes/footer.jsp" %>
            <script>

                const actionForm = document.querySelector("#actionForm")
                const regAnswer = document.querySelector("#regAnswer")


                document.querySelector(".btnList").addEventListener("click", (e) => {
                    actionForm.submit();
                }, false)

                document.querySelector(".btnMod").addEventListener("click", () => {
                    const qno = '${qnaDTO.qno}'
                    actionForm.setAttribute("action", "/qna/modify")
                    actionForm.innerHTML += `<input type='hidden' name='qno' value='\${qno}'>`
                    actionForm.submit();
                }, false)


                function moveRead(qno) {
                    actionForm.setAttribute("action", "/qna/read")
                    actionForm.innerHTML += `<input type='hidden' name='qno' value='\${qno}'>`
                    actionForm.submit();
                }



            </script>




            <script>
                // 업로드 관련
                const modalImage = new bootstrap.Modal(document.querySelector('#modal-image'))

                function showOrigin(fileLink) {
                    document.querySelector('#targetImage').src = `/viewFile?file=\${fileLink}`
                    modalImage.show()
                }

                function after(result) {
                    console.log("after............")
                    console.log("result", result)
                }

            </script>
</body>
</html>
