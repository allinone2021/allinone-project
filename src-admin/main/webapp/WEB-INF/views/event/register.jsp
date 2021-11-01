<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>이벤트 만들기</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <form id="registerForm" action="/event/register" method="post">
                <div class="row">
                    <input type="hidden" name="evtShop" value="<sec:authentication property="principal.sid"></sec:authentication>">
                    <div class="col-md-6">
                        <div class="card card-default">
                            <div class="card-header">
                                <h3 class="card-title">필수 입력사항</h3>
                            </div>
                            <div class="card-body">

                                <div class="form-group">
                                    <label for="evtTitle">이벤트 제목</label>
                                    <input type="text" name="evtTitle" id="evtTitle" class="form-control" placeholder="제목을 입력하여 주세요.">
                                </div>

                                <div class="form-group">
                                    <label for="evtContents">이벤트 내용</label>
                                    <textarea class="form-control" id="evtContents" name="evtContents" rows="3" placeholder="내용을 입력하여 주세요."></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputFile">이벤트 이미지</label>
                                    <div class="input-group">
                                        <div class="custom-file">
                                            <input type="file" name="uploadFiles" class="custom-file-input" id="exampleInputFile">
                                            <label class="custom-file-label" for="exampleInputFile">이미지를 등록하여 주세요.</label>
                                        </div>
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="uploadBtn">Upload</span>
                                        </div>
                                    </div>
                                    <div class="uploadResult">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>이벤트 기간</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="far fa-calendar-alt"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="evtDate" class="form-control float-right" id="reservation" name="selectDate" value="">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-default">
                            <div class="card-header">
                                <h3 class="card-title">선택 입력사항</h3>
                            </div>

                            <div class="card-body">

                                <div class="form-group">
                                    <label>이벤트 메뉴</label>
                                    <input type="text" name="evtMenu" class="form-control" placeholder="메뉴를 입력하여 주세요.">
                                </div>

                                <div class="form-group">
                                    <label for="evtAmount">메뉴 수량</label>
                                    <input type="text" name="evtAmount" id="evtAmount" class="form-control" placeholder="숫자만 입력하여 주세요.">
                                </div>

                                <div class="form-group">
                                    <label for="evtPrice">이벤트 금액</label>
                                    <input type="text" name="evtPrice" id="evtPrice" class="form-control" placeholder="숫자만 입력하여 주세요.">
                                </div>

                            </div>

                            <div class="card-footer">
                                <div class="row no-print">
                                    <div class="col-12">
                                        <a href="/event/list"><button type="button" class="btn btn-outline-warning float-right">취소</button></a>
                                        <button type="submit" id="submitBtn" class="btn btn-warning float-right" style="margin-right: 5px;">이벤트 등록</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="temp">
                </div>
            </form>
        </div>
    </section>
</div>

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Default Modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    function formSubmit() {
        const imageDivArr = uploadResultDiv.querySelectorAll("div")
        const registerForm = document.querySelector("#registerForm")

        if (!imageDivArr) {
            registerForm.submit()
            return
        }

        let str = "";
        for (let i = 0; i < imageDivArr.length; i++) {
            const target = imageDivArr[i]
            const uuid = target.getAttribute("data-uuid")
            const fileName = target.getAttribute("data-filename")
            const uploadPath = target.getAttribute("data-uploadpath")
            const image = target.getAttribute("data-image")

            //히든태그만들어서 폼태그에 추가
            str += `<input type= 'hidden' name='image[\${i}].uuid' value='\${uuid}'>`
            str += `<input type= 'hidden' name='image[\${i}].fileName' value='\${fileName}'>`
            str += `<input type= 'hidden' name='image[\${i}].uploadPath' value='\${uploadPath}'>`
            str += `<input type= 'hidden' name='image[\${i}].image' value='\${image}'>`

        }
        document.querySelector(".temp").innerHTML += str
        registerForm.submit()
    }
</script>

<script>

    const uploadResultDiv = document.querySelector(".uploadResult")

    document.querySelector("#uploadBtn").addEventListener("click", (e) => {

        let imgFile = $('#exampleInputFile').val();
        let fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
        if(!imgFile.match(fileForm)) {
            alert("이미지 파일만 업로드 가능")
            return
        }

        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")

        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append("uploadFiles", fileInput.files[i]) //  이게 컨트롤러에서 받는 이름
        }

        console.log("폼데이터 결과물"+formData)

        const headerObj = {headers: {'Content-Type' : 'multipart/form-data'}}

        axios.post("/uploadImage", formData, headerObj).then((response) => {
            const arr = response.data
            console.log(arr)

            let str = ""
            for(let i = 0 ; i < arr.length ; i++) {
                const {uuid, fileName, uploadPath, image, thumbnail} = {...arr[i]}
                str = `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'>이미지 등록이 완료되었습니다.</div>`
            }
            uploadResultDiv.innerHTML = str

        })
    }, false)

</script>

<%@include file="../includes/footer.jsp" %>

<script>
    $(function () {
        moment.locale('ko')
        $('#reservation').daterangepicker(
            {
                timePicker: false,
                timePicker24Hour: true,
                timePickerSeconds: true,
                singleDatePicker: false,
                locale: {
                    format: 'YYYY-MM-DD',
                    separator: '~',
                    applyLabel: "적용",
                    cancelLabel: "닫기"
                },
            }
        )
    })
</script>

<script>
    $(function () {
        $.validator.setDefaults({
            submitHandler: function () {
                formSubmit()
            }
        });
        $('#registerForm').validate({
            rules: {
                evtTitle: {required: true},
                evtContents: {required: true},
                evtAmount: {number: true},
                evtPrice: {number: true},
                uploadFiles: {required: true}
            },
            messages: {
                evtTitle: {required: "제목을 입력하여 주세요."},
                evtContents: {required: "내용을 입력하여 주세요."},
                evtAmount: {number: "숫자만 입력하여 주세요."},
                evtPrice: {number: "숫자만 입력하여 주세요."},
                uploadFiles: {required: "이미지를 등록하여 주세요."}
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>
