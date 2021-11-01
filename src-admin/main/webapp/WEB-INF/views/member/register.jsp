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
                <h1 class="card-title">회원가입</h1>
            </div>

            <div class="card-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="settings">
                        <form class="form-horizontal" id="form1" action="/member/register" method="post">
                            <div class="form-group row">
                                <label for="inputid" class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputid" name="mid" onkeyup="checkid(this.value,getElementById('id_check'))">
                                    <div class="check_font" id="id_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPw" class="col-sm-2 col-form-label">비밀번호</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPw" name="mpw" onkeyup="checkpw(this.value,getElementById('pw_check'))">
                                    <div class="check_font" id="pw_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPw2" class="col-sm-2 col-form-label">비밀번호확인</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPw2" name="mpw2" onkeyup="checkpw2(getElementById('inputPw').value,this.value,getElementById('pw2_check'))">
                                    <div class="check_font" id="pw2_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputMname" class="col-sm-2 col-form-label">이름</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputMname" name="mname" onkeyup="checkname(this.value,getElementById('name_check'))">
                                    <div class="check_font" id="name_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputGender" class="col-sm-2 col-form-label">성별</label>
                                <div class="col-sm-10 row" id="inputGender">
                                    <div class="col-auto form-check form-check-inline">
                                        <label class="form-check-label"><input class="form-check-input gender" type="radio" name="gender" value="false">남성</label>
                                    </div>
                                    <div class="col-auto form-check form-check-inline">
                                        <label class="form-check-label"><input class="form-check-input gender" type="radio" name="gender" value="true">여성</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputBirth" class="col-sm-2 col-form-label">생년월일</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="inputBirth" name="birth">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRegion" class="col-sm-2 col-form-label">내지역</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputRegion" name="region">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputAddress" name="address">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail" name="email" onkeyup="checkemail(this.value,getElementById('email_check'))">
                                    <div class="check_font" id="email_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputTel" class="col-sm-2 col-form-label">핸드폰</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputTel" name="mTel" onkeyup="checkTel(this.value,getElementById('mTel_check'))">
                                    <div class="check_font" id="mTel_check"></div>
                                </div>
                            </div>

                            <div class="temp">

                            </div>
                        </form>

                        <div class="offset-sm-2 d-flex flex-row float-right ">
                            <button type="button" class="btn btn-outline-warning btn-space btnRegister">가입</button>
                        </div>
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
        </div>
    </section>
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


<script>

    document.querySelector(".btnRegister").addEventListener("click", async (e) => {
        e.stopPropagation()
        e.preventDefault()

        const form1 = document.querySelector("#form1")
        const checkmodal = new bootstrap.Modal(document.querySelector('#modal-check'))
        const checkbody = document.querySelector(".check-body")
        const userid = document.querySelector("#inputid").value
        const userpw = document.querySelector("#inputPw").value
        const userpw2 = document.querySelector("#inputPw2").value
        const username = document.querySelector("#inputMname").value
        const gender = document.querySelectorAll("input[name='gender']")
        const region = document.querySelector("#inputRegion").value
        const address = document.querySelector("#inputAddress").value
        const email = document.querySelector("#inputEmail").value
        const tel = document.querySelector("#inputTel").value

        if(!await checkid(userid)){

            checkbody.innerHTML = "<p>아이디를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(!checkpw(userpw)){

            checkbody.innerHTML = "<p>비밀번호를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(userpw != userpw2){

            checkbody.innerHTML = "<p>비밀번호가 서로 다릅니다. 비밀번호를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(!checkname(username)){

            checkbody.innerHTML = "<p>이름을 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        let radiocheck = false;
        for (var i = 0; i < gender.length; i++) {
            if (gender[i].checked) {
                radiocheck = true
            }
        }

        if(!radiocheck){

            checkbody.innerHTML = "<p>성별을 선택해주세요</p>"
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

        form1.submit()

    }, false)
</script>

</body>
</html>
