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
<style>
</style>
<div class="content-wrapper" style="background-color:white;">
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card-header"><h1 class="card-title">공지사항 조회</h1></div>
        <!-- /.card-header -->
        <div class="card-body">
            <div class="form-group">
                <label>NO</label>
                <input type="text" name="nno" class="form-control" style="background-color:white;"
                       value="<c:out value="${noticeDTO.nno}"/>" readonly></div>
            <div class="form-group">
                <label> 제목 </label>
                <input type="text" name="title" class="form-control" style="background-color:white;"
                       value="<c:out value="${noticeDTO.title}"/>"
                       readonly>
            </div>
            <div>
                <label> 첨부파일 </label>
                <c:forEach items="${noticeDTO.files}" var="attach">
                    <div>
                        <c:if test="${attach.image}">
                            <img onclick="javascript:showOrigin('${attach.getFileLink()}')"
                                 src="/viewFile?file=${attach.getThumbnail()}">
                        </c:if>
                        <a href='/downFile?file=${attach.getFileLink()}' style="text-decorations:none; color:inherit; ">&nbsp;&nbsp;${attach.fileName}</a>
                    </div>

                </c:forEach>
            </div>


            <div class="row">
                <div class="col-sm-12">
                    <!-- textarea -->
                    <div class="form-group">
                        <label>내용</label>
                        <textarea name="content" class="form-control" rows="3" disabled style="background-color:white;"><c:out
                                value="${noticeDTO.content}"></c:out></textarea>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.card-body -->

        <form id="actionForm" action="/notice/list" method="get" class="col-lg-12">
            <div class="row">
                <div class="col-3">
                    <button type="button" class="btn  btn-outline-warning btnList ">LIST</button>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <button type="button" class="btn  btn-outline-warning  btnMod ">MODIFY</button>
                    </sec:authorize>
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


        <sec:authorize access="isAuthenticated()">
        <form action="/replies/new" method="post" id="replyForm">
            <div class="input-group ">
                <input type="hidden" name="nno" value="${noticeDTO.nno}">
                <input name="replyer">
                <input type="text" name="reply" placeholder="댓글 입력" class="form-control">
                <span class="input-group-append">
            <button type="button" class="btn btn-outline-warning addBtn"> 댓글 등록 </button></span>
            </div>
        </form>
        </sec:authorize>

        <section class="content">
            <!-- Default box -->
            <div class="card replyDiv" style="overflow: auto; height: 1000px;">
                <p/>
                <div class="replyList">
                </div>
                <div class="replyPaging"></div>
            </div>
        </section>


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


        <div class="modal fade show" id="modal-lg">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">댓글 수정</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="rno">
                        <div class="form-group">
                            <label for="replyerMod">작성자</label>
                            <input type="text" class="form-control" id="replyerMod" name="replyerMod">
                        </div>
                        <div class="form-group">
                            <label for="replyMod">댓글 내용</label>
                            <input type="text" class="form-control" id="replyMod" name="replyMod">
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <sec:authentication property="principal.mid">
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-outline-warning btnModReply">수정</button>
                        </sec:authentication>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <%@include file="../includes/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="/resources/js/reply.js"></script>
        <script>
            getList();

            const actionForm = document.querySelector("#actionForm")

            document.querySelector(".btnList").addEventListener("click", (e) => {
                actionForm.submit();
            }, false)

            document.querySelector(".btnMod").addEventListener("click", () => {
                const nno = '${noticeDTO.nno}'
                actionForm.setAttribute("action", "/notice/modify")
                actionForm.innerHTML += `<input type='hidden' name='nno' value='\${nno}'>`
                actionForm.submit();
            }, false)


            function moveRead(nno) {
                actionForm.setAttribute("action", "/notice/read")
                actionForm.innerHTML += `<input type='hidden' name='nno' value='\${nno}'>`
                actionForm.submit();
            }


            // 댓글등록 누를경우
            document.querySelector(".addBtn").addEventListener("click", function (e) {
                e.preventDefault()
                e.stopPropagation()
                const nno = '${noticeDTO.nno}'
                const replyer = document.querySelector("input[name='replyer']").value
                const reply = document.querySelector("input[name='reply']").value
                if (replyer.length > 0 && reply.length > 0) {
                    const replyObj = {nno, replyer, reply}
                    console.log(replyObj)
                    addReply(replyObj).then(result => {
                        getList()
                        document.querySelector("input[name='replyer']").value = ""
                        document.querySelector("input[name='reply']").value = ""
                    })

                }
            }, false)


            function getList(page) {
                const target = document.querySelector(".replyList")
                console.log("page : " + page)
                const nno = '${noticeDTO.nno}'
                const count = '${dtoList.count}'


                function convertTemp(replyObj) {
                    console.log(replyObj)
                    const {rno, nno, reply, replyer, replyDate, modDate} = {...replyObj}
                    const temp = `  <div class="post" style="margin-right: 10px; margin-left: 10px ">
    <div class="user-block">
  [ \${replyer} ]
<span class="float-right">  \${replyDate} </span>
    </div>

     \${reply}
        <button type="button"   class="btnDelReply float-right btn btn-outline-danger btn-sm " onclick="javascript:replyDel('\${rno}')"> 삭제 </button>
<button type="button"  class="btnReplyMod float-right  btn btn-outline-warning btn-sm" data-replyer='\${replyer}' data-reply='\${reply}' data-rno = '\${rno}' data-toggle="modal" data-target="#modal-lg"> 수정 </button>
<button  type="button"  class="btnReplyReport float-right btn btn-outline-warning btn-sm" data-replyer='\${replyer}' data-reply='\${reply}' >신고</button>
</div>`
                    return temp
                }

                getReplyList(nno, page).then(data => {
                    console.log(data) // array
                    console.log(data.dtoList) // array
                    console.log(data.count) // array

                    showReplyPage(data.count);
                    console.log(pageNum)
                    let list = data.dtoList;
                    let str = "";
                    list.forEach(reply => {
                        str += convertTemp(reply)
                    })
                    target.innerHTML = str
                })
            }


            document.querySelector(".replyDiv").addEventListener("click", (e) => {
                const target = e.target
                console.log(target)
                const nno = '${noticeDTO.nno}'
                if (target.matches(".btnReplyMod")) {
                    const rno = target.getAttribute("data-rno")
                    const replyer = target.getAttribute("data-replyer")
                    const reply = target.getAttribute("data-reply")
                    console.log(rno, replyer, reply, nno)
                    modRno.value = rno
                    modReply.value = reply
                    modReplyer.value = replyer
                    modModal.modal('show')
                }
            }, false)


            const modModal = $("#modal-lg")
            const modReplyer = document.querySelector("input[name='replyerMod']")
            const modReply = document.querySelector("input[name='replyMod']")
            const modRno = document.querySelector("input[name='rno']")

            document.querySelector(".btnModReply").addEventListener("click", (e) => {
                const replyObj = {rno: modRno.value, reply: modReply.value}
                console.log(replyObj)
                modifyReply(replyObj).then(result => {
                    getList()
                    modModal.modal("hide")
                })
            }, false)


            function replyDel(rno) {
                removeReply(rno).then(result => {
                    getList()
                })
            }


            let pageNum = 1;
            const replyPaging = document.querySelector(".replyPaging")

            // 댓글 페이징 함수
            function showReplyPage(replyCnt) {

                let endNum = Math.ceil(pageNum / 10.0) * 10;
                let startNum = endNum - 9;

                let prev = startNum != 1;
                let next = false;

                if (endNum * 10 >= replyCnt) {
                    endNum = Math.ceil(replyCnt / 10.0);
                }

                if (endNum * 10 < replyCnt) {
                    next = true;
                }

                let str = "<ul class='pagination pull-right'>";

                if (prev) {
                    str += `<li class='page-item'><a class='page-link' href="javascript:getList('startNum - 1')"> 이전 </a></li>`
                }


                for (let i = startNum; i <= endNum; i++) {
                    let active = pageNum == i ? "active" : "";
                    str += `<li class='page-item align-content-center active'><a class='page-link' href="javascript:getList(\${i})">\${i}</a></li>`

                }

                if (next) {
                    str += `<li class='page-item'><a class='page-link' href="javascript:getList(\${endNum + 1})"> 다음 </a></li>`
                }

                str += "</ul></div>";

                console.log(str);

                replyPaging.innerHTML = str

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
