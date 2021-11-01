<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp"%>




<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1><b>내 가게 정보</b></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">내 가게 정보</li>
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
                        <div class="card-header p-2">
                            <h2>${infoDTO.sname}</h2>
                        </div>
                        <!-- /.card-header -->

                        <div class="card-body">
                            <form class="form-horizontal">

                                <div class="form-group row">
                                    <label for="inputSTel" class="col-sm-2 col-form-label">전화번호</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="sTel" id="inputSTel" value="${infoDTO.sTel}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="address" id="inputAddress" value="${infoDTO.address}" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="address" id="inputEmail" value="${infoDTO.email}" readonly>
                                    </div>
                                </div>

                                <c:set value="${infoDTO.regionList.get(0)}" var="region"/>
                                <div class="form-group row">
                                    <label for="inputCity" class="col-sm-2 col-form-label">지역</label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="city" id="inputCity" value="${region.city}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control float-right" name="county" id="inputCounty" value="${region.county}" readonly>
                                        </div>
                                    </div>
                                </div>

                                <c:set value="${infoDTO.categoryList.get(0)}" var="category"/>
                                <div class="form-group row">
                                    <label for="inputType" class="col-sm-2 col-form-label">카테고리</label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="city" id="inputType" value="${category.type}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control float-right" name="county" id="inputOption" value="${category.option}" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputStoreOpen" class="col-sm-2 col-form-label">영업시간</label>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="far fa-clock"></i></span>
                                            </div>
                                            <input type="time" class="form-control float-right" name="sOpen" id="inputStoreOpen" value="${infoDTO.sOpen}" readonly>
                                        </div>
                                    </div>
                                    <b> ~ </b>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="far fa-clock"></i></span>
                                            </div>
                                            <input type="time" class="form-control float-right" name="sClose" id="inputStoreClose" value="${infoDTO.sClose}" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputStoreOff" class="col-sm-2 col-form-label">휴무일</label>
                                    <div class="col-sm-5">
                                        <c:set var="off" value="${infoDTO.sOff}" />
                                        <c:choose>
                                            <c:when test="${off eq 0}">
                                                <input type="text" class="form-control" id="inputStoreOff" value="연중무휴" readonly>
                                            </c:when>
                                            <c:when test="${off eq 1}">
                                                <input type="text" class="form-control" id="inputStoreOff" value="매달 첫째 주" readonly>
                                            </c:when>
                                            <c:when test="${off eq 2}">
                                                <input type="text" class="form-control" id="inputStoreOff" value="매달 둘째 주" readonly>
                                            </c:when>
                                            <c:when test="${off eq 3}">
                                                <input type="text" class="form-control" id="inputStoreOff" value="매달 셋째 주" readonly>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" id="inputStoreOff" value="매달 넷째 주" readonly>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-sm-5">
                                        <c:set var="offDay" value="${infoDTO.sOffDay}" />
                                        <c:if test="${infoDTO.sOff ne 0}">
                                            <c:choose>
                                                <c:when test="${offDay eq 1}">
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="월요일" readonly>
                                                </c:when>
                                                <c:when test="${offDay eq 2}">
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="화요일" readonly>
                                                </c:when>
                                                <c:when test="${offDay eq 3}">
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="수요일" readonly>
                                                </c:when>
                                                <c:when test="${offDay eq 4}">
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="목요일" readonly>
                                                </c:when>
                                                <c:when test="${offDay eq 5}">
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="금요일" readonly>
                                                </c:when>
                                                <c:when test="${offDay eq 6}">
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="토요일" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" class="form-control" id="inputStoreOffDay" value="일요일" readonly>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputStoreDesc" class="col-sm-2 col-form-label">가게 소개</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="inputStoreDesc" readonly>${infoDTO.sIntro}</textarea>
                                    </div>
                                </div>
                            </form>
                        </div><!-- /.card-body -->
                        <div class="card-footer">
                            <form id="infoForm" method="get" action="store/infoModify">
                                <button type="submit" class="btn btn-outline-warning float-right btnMod">수정</button>
                            </form>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->

            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->



<div class="modal fade" id="modal-notice">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">잠깐!</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>미입력된 가게정보가 존재합니다.<br>가게 정보를 입력하세요.</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default float-right ml-auto" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>




<%@include file="../includes/footer.jsp"%>

<script>

    const infoForm = document.querySelector("#infoForm")
    const sno = '${infoDTO.sno}'
    console.log(sno)

    document.querySelector(".btnMod").addEventListener("click", () => {
        infoForm.setAttribute("action","/store/infoModify")
        infoForm.innerHTML += `<input type='hidden' name='sno' value= '\${sno}'>`
        infoForm.submit()
    },false)



    /////////////////////////////////////////////////////////////////////////
    // 정보 미입력 시 알림 모달창 띄우기
    const sTel = '${infoDTO.sTel}'
    const address = '${infoDTO.address}'
    const sOpen = '${infoDTO.sOpen}'
    const sClose = '${infoDTO.sClose}'

    if (sTel == "" || sOpen == "" || sClose == "" || address == "") {
        $('#modal-notice').modal('show')
    }





</script>

</body>
</html>