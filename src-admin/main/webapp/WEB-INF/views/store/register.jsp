<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All in One</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.min.css">

    <style>
        .content-wrapper {
            background-color: #fff8f0;
        }
    </style>

    <script src="https://d3js.org/d3.v6.js"></script>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">


    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">

        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">홈</a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-light-yellow elevation-1" >
        <!-- Brand Logo -->
        <a href="#" class="brand-link">
            <img src="/resources/img/aiologo_main.svg">
        </a>

    </aside>

    <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"></i></a>
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
                        <form class="form-horizontal" id="form1" action="/store/register" method="post">
                            <c:set var="star" value="<b style = 'color: red;'>*</b>"/>
                            <div class="form-group row">
                                <label for="inputId" class="col-sm-2 col-form-label">${star}&nbsp;ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputId" name="sid" onkeyup="checkid(this.value,getElementById('id_check'))">
                                    <div class="check_font" id="id_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPw" class="col-sm-2 col-form-label">${star}&nbsp;비밀번호</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPw" name="spw" onkeyup="checkpw(this.value,getElementById('pw_check'))">
                                    <div class="check_font" id="pw_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPw2" class="col-sm-2 col-form-label">${star}&nbsp;비밀번호확인</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPw2" name="spw2" onkeyup="checkpw2(getElementById('inputPw').value,this.value,getElementById('pw2_check'))">
                                    <div class="check_font" id="pw2_check"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputSname" class="col-sm-2 col-form-label">${star}&nbsp;가게명</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputSname" name="sname">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRegnum" class="col-sm-2 col-form-label">${star}&nbsp;사업자등록번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputRegnum" name="regnum" onkeyup="checkregnum(this.value,getElementById('regnum_check'))">
                                    <div class="check_font" id="regnum_check"></div>
                                </div>
                            </div>

                            <div class="temp">

                            </div>

                        </form>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">${star}&nbsp;첨부파일</label>
                            <div class="offset-col-sm-2">
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" name="uploadFiles" class="custom-file-input" id="exampleInputFile" multiple>
                                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="uploadBtn">Upload</span>
                                    </div>
                                </div>

                                <div class="uploadResult">
                                    <c:forEach items="${storeDTO.files}" var="attach">
                                        <c:if test="${!empty attach.uuid}">
                                            <div data-uuid="${attach.uuid}" data-filename ="${attach.fileName}" data-uploadpath="${attach.uploadPath}" data-image="${attach.image}">
                                                <c:choose>
                                                    <c:when test="${attach.image}">
                                                        <img onclick="javascript:showOrigin('${attach.getFileLink()}')" src="/viewFile?file=${attach.getThumbnail()}">
                                                        <a href='/downFile?file=${attach.getFileLink()}'><span>${attach.fileName}</span></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href='/downFile?file=${attach.getFileLink()}'><span>${attach.fileName}</span></a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:if test="${attach.fileName != null}">
                                                    <button onclick="javascript:removeDiv(this)">x</button>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

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

    const form1 = document.querySelector("#form1")
    const uploadResultDiv = document.querySelector(".uploadResult")
    const btnRegister = document.querySelector(".btnRegister")

    document.querySelector("#uploadBtn").addEventListener("click", (e) => {

        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")

        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append("uploadFiles", fileInput.files[i])
        }

        console.log(fileInput)
        console.log(formData)

        const headerObj = { headers: {'Content-Type':'multipart/form-data'} }

        axios.post("/upload", formData, headerObj).then((response) => {
            const arr = response.data
            console.log(arr)

            let str = ""
            for (let i = 0; i < arr.length; i++) {
                const {uuid, fileName, uploadPath, image, thumbnail, fileLink} = {...arr[i]}

                if(image) {

                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><img src='/viewFile?file=\${thumbnail}'><span>\${fileName}</span>
                            <button onclick="javascript:removeDiv(this)">x</button></div>`

                }else {
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><a href='/downFile?file=\${fileLink}'> \${fileName}</a>
                            <button onclick="javascript:removeDiv(this)">x</button></div>`
                }//if end

            }//for end
            uploadResultDiv.innerHTML += str
        })

    }, false)

    function removeDiv(ele) {
        ele.parentElement.remove()
    }


    document.querySelector(".btnRegister").addEventListener("click", async (e) => {
        e.stopPropagation()
        e.preventDefault()

        const fileDivArr = uploadResultDiv.querySelectorAll("div")
        const checkmodal = new bootstrap.Modal(document.querySelector('#modal-check'))
        const checkbody = document.querySelector(".check-body")
        const storeid = document.querySelector("#inputId").value
        const storepw = document.querySelector("#inputPw").value
        const storepw2 = document.querySelector("#inputPw2").value
        const storename = document.querySelector("#inputSname").value
        const storeRegnum = document.querySelector("#inputRegnum").value
        const fileInput = document.querySelector("input[name='uploadFiles']")

        if(!await checkid(storeid)){

            checkbody.innerHTML = "<p>아이디를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(!checkpw(storepw)){

            checkbody.innerHTML = "<p>비밀번호를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(storepw != storepw2){

            checkbody.innerHTML = "<p>비밀번호가 서로 다릅니다. 비밀번호를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(storename.length == 0){

            checkbody.innerHTML = "<p>가게명을 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(!await checkregnum(storeRegnum)){

            checkbody.innerHTML = "<p>사업자등록번호를 확인해주세요</p>"
            checkmodal.show()

            return false;
        }

        if(fileInput.files.length == 0){

            checkbody.innerHTML = "<p>첨부파일을 등록해주세요</p>"
            checkmodal.show()

            return false;

        }

        if (!fileDivArr) {
            form1.submit()
            return
        }

        let str = "";
        for (let i = 0; i < fileDivArr.length; i++) {
            const target = fileDivArr[i]
            const uuid = target.getAttribute("data-uuid")
            const fileName = target.getAttribute("data-filename")
            const uploadPath = target.getAttribute("data-uploadpath")
            const image = target.getAttribute("data-image")

            str += `<input type= 'hidden' name='files[\${i}].uuid' value='\${uuid}'>`
            str += `<input type= 'hidden' name='files[\${i}].fileName' value='\${fileName}'>`
            str += `<input type= 'hidden' name='files[\${i}].uploadPath' value='\${uploadPath}'>`
            str += `<input type= 'hidden' name='files[\${i}].image' value='\${image}'>`
        }

        const temp = document.querySelector(".temp").innerHTML += str
        form1.submit()
    }, false)

</script>

</body>
</html>
