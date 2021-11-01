<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<%@include file="../includes/header.jsp" %>

<style>
    .btn-space {
        margin-right: 5px;
    }
</style>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid bg-white">

            <div class="card-header">
                <h1 class="card-title">상세조회</h1>
            </div>

            <div class="card-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="settings">
                        <form class="form-horizontal">
                            <div class="form-group row">
                                <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputId" name="sid" value="<c:out value="${storeDTO.sid}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputSname" class="col-sm-2 col-form-label">가게명</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputSname" name="sname" value="<c:out value="${storeDTO.sname}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRegnum" class="col-sm-2 col-form-label">사업자등록번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputRegnum" name="regnum" value="<c:out value="${storeDTO.regnum}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputAddress" name="address" value="<c:out value="${storeinfoDTO.address}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputTel" class="col-sm-2 col-form-label">전화번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputTel" name="sTel" value="<c:out value="${storeinfoDTO.sTel}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail" name="email" value="<c:out value="${storeinfoDTO.email}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRegdate" class="col-sm-2 col-form-label">가입일</label>
                                <div class="col-sm-10">
                                    <javatime:format  var="regdate" value="${storeDTO.regdate}" pattern="yyyy년 M월 d일 a h시 m분"/>
                                    <input type="text" class="form-control" id="inputRegdate" name="regdate" value="<c:out value="${regdate}"></c:out>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="InputStatus" class="col-sm-2 col-form-label">회원상태</label>
                                <div class="col-sm-10">
                                    <c:choose>
                                        <c:when test="${storeDTO.status == 1}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="미승인" readonly>
                                        </c:when>
                                        <c:when test="${storeDTO.status == 2}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="승인거부" readonly>
                                        </c:when>
                                        <c:when test="${storeDTO.status == 3}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="승인" readonly>
                                        </c:when>
                                        <c:when test="${storeDTO.status == 4}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="탈퇴" readonly>
                                        </c:when>
                                        <c:when test="${storeDTO.status == 5}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="강제탈퇴" readonly>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">첨부파일</label>
                                <div class="col-sm-10">
                                    <div>
                                        <c:forEach items="${storeDTO.files}" var="attach">
                                            <c:if test="${!empty attach.uuid}">
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${attach.image}">
                                                            <img onclick="javascript:showOrigin('${attach.getFileLink()}')" src="/viewFile?file=${attach.getThumbnail()}">
                                                            <a href='/downFile?file=${attach.getFileLink()}'><span>${attach.fileName}</span></a>
                                                            <!-- getThumbnail()은 파일링크이다. -->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href='/downFile?file=${attach.getFileLink()}'><span>${attach.fileName}</span></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="offset-sm-2 col-s d-flex flex-row float-right">
                                <button type="button" class="btn btn-outline-secondary btn-space btnList">목록</button>
                                <button type="button" class="btn btn-outline-warning btn-space" data-toggle="modal"
                                        data-target="#modal-${storeDTO.status == 4 || storeDTO.status == 5?"depend":"approval"}">승인</button>
                                <button type="button" class="btn btn-outline-warning btn-space" data-toggle="modal"
                                        data-target="#modal-${storeDTO.status == 4 || storeDTO.status == 5?"depend":"reject"}">거부</button>
                                <button type="button" class="btn btn-outline-danger btn-space" data-toggle="modal"
                                        data-target="#modal-${storeDTO.status == 4 || storeDTO.status == 5?"depend":"signout"}">강제탈퇴</button>
                                <button type="button" class="btn btn-outline-secondary btn-space btnModify">수정</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
        </div>
    </section>
</div>


<%--form--%>
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

<%--가입승인모달--%>
<div class="modal fade show" id="modal-approval">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">가입 승인</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${storeDTO.sname}의 가입을 승인하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning"onclick="javascript:approval()">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%--가입거절모달--%>
<div class="modal fade show" id="modal-reject">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">가입 거부</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${storeDTO.sname}의 가입을 거부하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning" onclick="javascript:reject()">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

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
                <p>${storeDTO.sname}을 강제탈퇴 처리하시겠습니까?</p>
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

<%--탈퇴한 회원 모달--%>
<div class="modal fade show" id="modal-depend">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Info</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${storeDTO.sname}님은 이미 탈퇴한 회원입니다.</p>
            </div>
            <div class="modal-footer float-right">
                <button type="button" class="btn btn-warning" data-dismiss="modal">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%--이미지 모달--%>
<div class="modal fade" id="modal-image">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-body text-center">
                <img class="img-fluid mx-auto" id="targetImage">
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
    const modalImage = new bootstrap.Modal(document.querySelector('#modal-image'))

    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.submit();
    },false)

    function approval(){

        actionForm.setAttribute("action", "/store/status")
        actionForm.setAttribute("method", "post")
        actionForm.innerHTML +=`<input type='hidden' name='sno' value="<c:out value="${storeDTO.sno}"></c:out>">`
        actionForm.innerHTML +=`<input type='hidden' name='status' value=3>`
        actionForm.submit()

    }

    function reject(){

        actionForm.setAttribute("action", "/store/status")
        actionForm.setAttribute("method", "post")
        actionForm.innerHTML +=`<input type='hidden' name='sno' value="<c:out value="${storeDTO.sno}"></c:out>">`
        actionForm.innerHTML +=`<input type='hidden' name='status' value=2>`
        actionForm.submit()
    }

    function signout(){

        actionForm.setAttribute("action", "/store/status")
        actionForm.setAttribute("method", "post")
        actionForm.innerHTML +=`<input type='hidden' name='sno' value="<c:out value="${storeDTO.sno}"></c:out>">`
        actionForm.innerHTML +=`<input type='hidden' name='status' value=5>`
        actionForm.submit()
    }


    document.querySelector(".btnModify").addEventListener("click", function (e){
        e.preventDefault()
        e.stopPropagation()

        if(${storeDTO.status == 4 || storeDTO.status == 5}){
            new bootstrap.Modal(document.querySelector('#modal-depend')).show()
            return
        }

        actionForm.innerHTML +=`<input type='hidden' name='sno' value="<c:out value="${storeDTO.sno}"></c:out>">`
        actionForm.setAttribute("action", "/store/modify")
        actionForm.setAttribute("method", "get")

        actionForm.submit();
    },false)

    function showOrigin(fileLink) {

        document.querySelector('#targetImage').src = `/viewFile?file=\${fileLink}`
        modalImage.show()

    }

</script>

</body>
</html>
