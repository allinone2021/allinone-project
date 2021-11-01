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
                                <label for="inputid" class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputid" name="mid" value="${memberDTO.mid}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputMname" class="col-sm-2 col-form-label">이름</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputMname" name="mname" value="${memberDTO.mname}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputGender" class="col-sm-2 col-form-label">성별</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputGender" name="gender" value="${memberDTO.gender ? '여성' : '남성'}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputBirth" class="col-sm-2 col-form-label">생년월일</label>
                                <div class="col-sm-10">
                                    <javatime:format  var="birth" value="${memberDTO.birth}" pattern="yyyy년 M월 d일"/>
                                    <input type="text" class="form-control" id="inputBirth" name="birth" value="${birth}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputAddress" name="address" value="${memberDTO.address}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail" name="email" value="${memberDTO.email}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputTel" class="col-sm-2 col-form-label">전화번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputTel" name="mTel" value="${memberDTO.mTel}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRegdate" class="col-sm-2 col-form-label">가입일</label>
                                <div class="col-sm-10">
                                    <javatime:format  var="regdate" value="${memberDTO.regdate}" pattern="yyyy년 M월 d일 a h시 m분"/>
                                    <input type="text" class="form-control" id="inputRegdate" name="regdate" value="${regdate}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="InputStatus" class="col-sm-2 col-form-label">회원상태</label>
                                <div class="col-sm-10">
                                    <c:choose>
                                        <c:when test="${memberDTO.status == 1}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="회원" readonly>
                                        </c:when>
                                        <c:when test="${memberDTO.status == 2}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="블랙리스트" readonly>
                                        </c:when>
                                        <c:when test="${memberDTO.status == 3}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="탈퇴" readonly>
                                        </c:when>
                                        <c:when test="${memberDTO.status == 4}">
                                            <input type="text" class="form-control" id="InputStatus" name="status" value="강제탈퇴" readonly>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="offset-sm-2 col-s d-flex flex-row float-right">
                                <button type="button" class="btn btn-outline-secondary btn-space btnList">목록</button>
                                <button type="button" class="btn btn-outline-danger btn-space" data-toggle="modal"
                                        data-target="#modal-${memberDTO.status == 3 || memberDTO.status == 4?"depend":"signout"}">강제탈퇴</button>
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
<form id="actionForm" action="/member/list" method="get">
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
                <p>${memberDTO.mname}를 강제탈퇴 처리하시겠습니까?</p>
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
                <p>${memberDTO.mname}님은 이미 탈퇴한 회원입니다.</p>
            </div>
            <div class="modal-footer float-right">
                <button type="button" class="btn btn-warning float-right" data-dismiss="modal">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<%@include file="../includes/footer.jsp" %>

<script>
    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.submit();
    },false)

    function signout(){

        actionForm.setAttribute("action", "/member/status")
        actionForm.setAttribute("method", "post")
        actionForm.innerHTML +=`<input type='hidden' name='mno' value="${memberDTO.mno}">`
        actionForm.innerHTML +=`<input type='hidden' name='status' value=4>`
        actionForm.submit()
    }


    document.querySelector(".btnModify").addEventListener("click", function(e){
        e.preventDefault()
        e.stopPropagation()

        if(${memberDTO.status == 3 || memberDTO.status == 4}){
            new bootstrap.Modal(document.querySelector('#modal-depend')).show()
            return
        }

        actionForm.innerHTML +=`<input type='hidden' name='mno' value="${memberDTO.mno}">`
        actionForm.setAttribute("action", "/member/modify")
        actionForm.setAttribute("method", "get")

        actionForm.submit();
    },false)

</script>

</body>
</html>
