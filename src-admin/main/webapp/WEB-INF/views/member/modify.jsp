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
                <h1 class="card-title">회원정보 수정</h1>
            </div>

            <div class="card-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="settings">
                        <form class="form-horizontal" id="form1">
                            <input type='hidden' name='mno' value="<c:out value="${memberDTO.mno}"/>">
                            <div class="form-group row">
                                <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputId" name="mid" value="<c:out value="${memberDTO.mid}"/>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputMname" class="col-sm-2 col-form-label">이름</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputMname" name="mname" value="<c:out value="${memberDTO.mname}"/>" onkeyup="checkname(this.value,getElementById('name_check'))">
                                    <div class="check_font" id="name_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputGender" class="col-sm-2 col-form-label">성별</label>
                                <div class="col-sm-10">
                                    <c:choose>
                                        <c:when test="${memberDTO.gender} == true">
                                            <input type="hidden" class="form-control" id="inputGender" name="gender" value="<c:out value="true"/>">
                                            <input type="text" class="form-control" id="inputGender" name="cgender" value="<c:out value="여성"/>" readonly>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden" class="form-control" id="inputGender" name="gender" value="<c:out value="false"/>">
                                            <input type="text" class="form-control" id="inputGender" name="cgender" value="<c:out value="남성"/>" readonly>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputBirth" class="col-sm-2 col-form-label">생년월일</label>
                                <div class="col-sm-10">
                                    <javatime:format  var="cbirth" value="${memberDTO.birth}" pattern="yyyy년 M월 d일"/>
                                    <input type="text" class="form-control" id="inputBirth" name="birth" value="<c:out value="${birth}"/>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputAddress" name="address" value="<c:out value="${memberDTO.address}"/>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail" name="email" value="<c:out value="${memberDTO.email}"/>" onkeyup="checkemail(this.value,getElementById('email_check'))">
                                    <div class="check_font" id="email_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputTel" class="col-sm-2 col-form-label">전화번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputTel" name="mTel" value="<c:out value="${memberDTO.mTel}"/>" onkeyup="checkTel(this.value,getElementById('mTel_check'))">
                                    <div class="check_font" id="mTel_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRegdate" class="col-sm-2 col-form-label">가입일</label>
                                <div class="col-sm-10">
                                    <javatime:format  var="regdate" value="${memberDTO.regdate}" pattern="yyyy년 M월 d일 a h시 m분"/>
                                    <input type="text" class="form-control" id="inputRegdate" name="regdate2" value="<c:out value="${regdate}"/>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="InputStatus" class="col-sm-2 col-form-label">회원상태</label>
                                <div class="col-sm-10">
                                    <c:choose>
                                        <c:when test="${memberDTO.status == 1}">
                                            <input type="text" class="form-control" id="InputStatus" name="c_status" value="회원" readonly>
                                        </c:when>
                                        <c:when test="${memberDTO.status == 2}">
                                            <input type="text" class="form-control" id="InputStatus" name="c_status" value="블랙리스트" readonly>
                                        </c:when>
                                        <c:when test="${memberDTO.status == 3}">
                                            <input type="text" class="form-control" id="InputStatus" name="c_status" value="탈퇴" readonly>
                                        </c:when>
                                        <c:when test="${memberDTO.status == 4}">
                                            <input type="text" class="form-control" id="InputStatus" name="c_status" value="강제탈퇴" readonly>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="temp">

                            </div>
                        </form>

                        <div class="offset-sm-2 d-flex flex-row float-right ">
                            <button type="button" class="btn btn-outline-secondary btn-space btnList">목록</button>
                            <button type="button" class="btn btn-outline-secondary btn-space btnRead">조회</button>
                            <button type="button" class="btn btn-outline-danger btn-space" data-toggle="modal"
                                    data-target="#modal-${memberDTO.status == 3 || memberDTO.status == 4?"depend":"signout"}">강제탈퇴</button>
                            <button type="button" class="btn btn-outline-warning btn-space btnModify">수정</button>
                        </div>
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
                <p>${memberDTO.mname}을 강제탈퇴 처리하시겠습니까?</p>
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
                <button type="button" class="btn btn-warning" data-dismiss="modal">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%--양식확인모달--%>
<div class="modal fade show" id="modal-check">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">양식확인</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body check-body">

            </div>
            <div class="modal-footer float-right">
                <button type="button" class="btn btn-warning" data-dismiss="modal">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%@include file="../includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/check.js"></script>


<%--버튼처리 JS--%>
<script>

    const actionForm = document.querySelector("#actionForm")
    const form1 = document.querySelector("#form1")

    // 목록이동
    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.submit();
    },false)

    // 조회이동
    document.querySelector(".btnRead").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.setAttribute("action", "/member/read")
        actionForm.setAttribute("method", "get")
        actionForm.innerHTML +=`<input type='hidden' name='mno' value="<c:out value="${memberDTO.mno}"/>">`
        actionForm.submit();
    },false)

    function signout(){

        actionForm.setAttribute("action", "/member/status")
        actionForm.setAttribute("method", "post")
        actionForm.innerHTML +=`<input type='hidden' name='mno' value="<c:out value="${memberDTO.mno}"/>">`
        actionForm.innerHTML +=`<input type='hidden' name='status' value="<c:out value="4"/>">`
        actionForm.submit()
    }

    document.querySelector(".btnModify").addEventListener("click", async (e) => {
        e.preventDefault()
        e.stopPropagation()

        if(${memberDTO.status == 3 || memberDTO.status == 4}){
            new bootstrap.Modal(document.querySelector('#modal-depend')).show()
            return
        }

        const checkmodal = new bootstrap.Modal(document.querySelector('#modal-check'))
        const checkbody = document.querySelector(".check-body")
        const username = document.querySelector("#inputMname").value
        const address = document.querySelector("#inputAddress").value
        const email = document.querySelector("#inputEmail").value
        const tel = document.querySelector("#inputTel").value

        if(!checkname(username)){

            checkbody.innerHTML = "<p>이름을 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(address.length == 0){
            checkbody.innerHTML = "<p>주소를 입력해주세요</p>"
            checkmodal.show()
            return false;
        }

        if(!await checkemail(email)){

            checkbody.innerHTML = "<p>이메일을 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(!checkTel(tel)){

            checkbody.innerHTML = "<p>전화번호를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        let str = "";

        str +=`<input type="hidden" name="page" value="<c:out value="${pageRequestDTO.page}"/>">`
        str +=`<input type="hidden" name="size" value="<c:out value="${pageRequestDTO.size}"/>">`
        str +=`<input type="hidden" name="type" value="<c:out value="${pageRequestDTO.type}"/>">`
        str +=`<input type="hidden" name="keyword" value="<c:out value="${pageRequestDTO.keyword}"/>">`

        <c:if test="${pageRequestDTO.filterArr != null}">
            <c:forEach items="${pageRequestDTO.filterArr}" var="status">
                str +=`<input type="hidden" name="filterArr" value="${status}"/>">`
            </c:forEach>
        </c:if>

        document.querySelector(".temp").innerHTML += str

        form1.setAttribute("action", "/member/modify")
        form1.setAttribute("method", "post")
        form1.submit();
    },false)

</script>

</body>
</html>
