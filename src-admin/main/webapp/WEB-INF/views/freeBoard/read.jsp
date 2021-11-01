<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>

<div class="content-wrapper">
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-warning">
            <div class="card-header">
                <h3 class="card-title"> 자유 게시판 </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <div class="form-group">
                    <label>NNO</label>
                    <input type="text" name="fbno" class="form-control" value="<c:out value="${freeBoardDTO.fbno}"/>"
                           readonly>
                </div>

                <div class="form-group">
                    <label> 제목 </label>
                    <input type="text" name="title" class="form-control" value="<c:out value="${freeBoardDTO.title}"/>"
                           readonly>
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input type="text" name="writer" class="form-control"
                           value="<c:out value="${freeBoardDTO.writer}"/>"
                           readonly>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <!-- textarea -->
                        <div class="form-group">
                            <label> 내용 </label>
                            <textarea name="content" class="form-control" rows="3" disabled><c:out
                                    value="${freeBoardDTO.content}"/>
                            </textarea>
                        </div>
                    </div>
                </div>
                <div>
                    <c:forEach items="${freeBoardDTO.files}" var="attach">
                        <div>
                            <c:if test="${attach.image}">
                                <img onclick="javascript:showOrigin('${attach.getFileLink()}')"
                                     src="/viewFile?file=${attach.getThumbnail()}">
                            </c:if>
                                ${attach.fileName}
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="card-footer">
            <div class="row">
                <div class="col-md-12">
                    <div class="float-left">
                        <div>
                            <button type="button" class="btn btn-warning btnList">LIST</button>
                            <sec:authentication property="principal" var="memberDTO"/>
                            <c:if test="${freeBoardDTO.writer eq memberDTO.mid}">
                                <button type="button" class="btn btn-warning btnMod">MODIFY</button>
                            </c:if>
                        </div>
                    </div>

                    <div class="float-right">
                        <div>
                            <td class="tg-oe15"><c:if test="${prevNum != null}">
                                <button type="button" class="btn  btn-warning"
                                        onclick="javascript:moveRead(${prevNum})">이전글
                                </button>
                            </c:if>
                            </td>
                            <td class="tg-oe15">
                                <c:if test="${nextNum != null}">
                                    <button type="button" class="btn  btn-warning"
                                            onclick="javascript:moveRead(${nextNum})">다음글
                                    </button>
                                </c:if>
                            </td>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card direct-chat direct-chat-primary">
            <div class="card-header">
                <div>
                    <h3 class="card-title">Replies</h3>
                </div>
                <hr>
                <form action="/fbreplies" method="post">
                    <div class="input-group">
                        <input type="text" name="replyer" value="<sec:authentication property="principal.mid"/>" readonly>
                        <input style="width: 100vh" type="text" name="reply" placeholder="댓글 내용 입력">
                        <button type="submit" class="btn btn-warning addBtn">등록</button>
                    </div>
                </form>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <!-- Conversations are loaded here -->

                <div class="direct-chat-messages">
                </div>


                <!--/.direct-chat-messages-->
            </div>
        </div>
    </div>
    <form id="actionForm" action="/freeBoard/list" method="get">
        <input type="hidden" name="page" value="${pageRequestDTO.page}">
        <input type="hidden" name="size" value="${pageRequestDTO.size}">
        <c:if test="${pageRequestDTO.type != null}">
            <input type="hidden" name="type" value="${pageRequestDTO.type}">
            <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
        </c:if>
    </form>
</div>

<div class="modal fade" id="modal-mod">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modify/Remove</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="rno">
                <input type="text" name="replyerMod">
                <input type="text" name="replyMod">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info btnModReply">Modify</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-image">  <!-- 그다음 id="modal-image" 로 수정 ★★★★★ -->
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <img id="targetImage"> <!-- 다른거 다 지우고 이것만 추가 ★★★ -->
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>                <!-- Close 버튼 빼고 다 없애기 ★★★ -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-danger">
    <div class="modal-dialog">
        <div class="modal-content bg-danger">
            <div class="modal-header">
                <h4 class="modal-title">댓글 신고하기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>댓글을 신고 하시겠습니까?</p>
            </div>
            <div class="modal-footer float-right">
                <button type="button" class="btn btn-outline-light" data-dismiss="modal">아니요</button>
                <button type="button" class="btn btn-outline-light">네</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<%@ include file="../includes/footer.jsp" %>

<script>

    const modalImage = new bootstrap.Modal(document.querySelector('#modal-image'))

    function showOrigin(fileLink) {
        document.querySelector("#targetImage").src = `/viewFile?file=\${fileLink}`

        modalImage.show()
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="/resources/js/freeBoardReply.js"></script>

<script>
    const actionForm = document.querySelector("#actionForm")


    document.querySelector(".btnList").addEventListener("click", (e) => {
        actionForm.submit();
    }, false)

    document.querySelector(".btnMod").addEventListener("click", () => {
        const fbno = '${freeBoardDTO.fbno}'
        actionForm.setAttribute("action", "/freeBoard/modify")
        actionForm.innerHTML += `<input type='hidden' name='fbno' value='\${fbno}'>`
        actionForm.submit();
    }, false)


    function moveRead(fbno) {
        actionForm.setAttribute("action", "/freeBoard/read")
        actionForm.innerHTML += `<input type='hidden' name='fbno' value='\${fbno}'>`
        actionForm.submit();
    }

</script>


<script>
    // 리스트

    function getList() {

        const target = document.querySelector(".direct-chat-messages")
        const fbno = '${freeBoardDTO.fbno}'

        console.log(fbno)

        function convertTemp(replyObj) {

            console.log(replyObj)

            const {rno, fbno, reply, replyer, replyDate, modDate} = {...replyObj}

            const temp = `<div class="direct-chat-msg">
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">\${replyer}</span>
                    <span class="direct-chat-timestamp float-right">\${replyDate}</span>
                </div>
                <div class="direct-chat-text" data-rno='\${rno}' data-replyer='\${replyer}'>
                \${reply}
                    <div class="float-right">
                        <button data-rno='\${rno}' onclick="javascript:remReply('\${rno}')" class="btn btn-default btn-xs replyRemove">삭제</button>
                        <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modal-danger">신고</button>
                    </div>
                </div>`

            return temp

        }

        getReplyList(fbno).then(data => {
            console.log("=====================")
            console.log(data)


            let str = "";

            data.forEach(reply => {
                str += convertTemp(reply)
            })
            target.innerHTML = str
        })
    }

    // 최초 실행 - 꼭 붙여줘야 한다.
    (function () {
        getList()
    })()

    // 등록

    document.querySelector(".addBtn").addEventListener("click", function (e) {
        e.preventDefault()
        e.stopPropagation()
        // 모달을 띄운다면 위에는 필요가 없다. 하지만 모달을 안띄우면 위에 wj e.preventDefault, e.stopPropagation 을 찍어줘야 한다.

        const fbno = '${freeBoardDTO.fbno}'
        const replyer = document.querySelector("input[name='replyer']").value
        const reply = document.querySelector("input[name='reply']").value

        const replyObj = {fbno, replyer, reply}
        console.log(replyObj)
        addReply(replyObj).then(result => {
            getList()
            document.querySelector("input[name='replyer']").value = ""
            document.querySelector("input[name='reply']").value = ""
        })

    }, false)

    // 수정
    const modModal = $("#modal-mod") // 이것만 jquery로!! 왜냐 모달이라는 함수가 없으니까!!
    console.log(modModal)
    const modReplyer = document.querySelector("input[name='replyerMod']")
    const modReply = document.querySelector("input[name='replyMod']")
    const modRno = document.querySelector("input[name='rno']")


    document.querySelector(".direct-chat-messages").addEventListener("click", (e) => {


        const target = e.target
        const fbno = '${freeBoardDTO.fbno}'

        if (target.matches(".direct-chat-text")) {
            const rno = target.getAttribute("data-rno")
            const replyer = target.getAttribute("data-replyer")
            const reply = target.innerHTML
            console.log(rno, replyer, reply, fbno)
            modRno.value = rno
            modReply.value = reply
            modReplyer.value = replyer
            modModal.modal('show')

        }
    }, false)


    document.querySelector(".btnModReply").addEventListener("click", (e) => {

        const replyObj = {rno: modRno.value, reply: modReply.value}

        console.log("=================  btnModReply  ==============")
        console.log("=================  btnModReply  ==============")

        modifyReply(replyObj).then(result => {
            getList()
            modModal.modal("hide")
        })

    }, false)

    // 삭제

    function remReply(rno) {

        console.log("rno :", rno)

        removeReply(rno).then(result => {
            getList()
        })
    }


</script>


</body>
</html>
