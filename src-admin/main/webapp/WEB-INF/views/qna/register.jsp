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
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content-wrapper">
    <!-- Main content -->
    <!-- left column -->
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card-header">
            <h2 class="card-title"> 질문 등록 </h2>
        </div>
        <!-- form start -->
        <form action="/qna/register" method="post" id="form1">

            <div class="card-body">
                <input type="hidden" name="qno" class="form-control" value="<c:out value="${qnaDTO.qno}"/>" readonly>
                <div class="form-group">
                    <label> 제목 </label>
                    <input type="text" name="title" class="form-control" value="<c:out value="${qnaDTO.title}"/>">

                </div>
                <div class="form-group">
                    <label> 작성자 </label>
                    <input type="text" name="writer" class="form-control" value="<c:out value="${qnaDTO.writer}"/>">
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <!-- textarea -->
                        <div class="form-group">
                            <label>내용</label>
                            <textarea name="content" class="form-control" rows="10"><c:out  value="${qnaDTO.content}"></c:out></textarea>
                        </div>
                    </div>

            </div>
            <!-- /.card-body -->
            <div>
                <div class="temp"></div>
                <button type="submit" class="btn  btn-outline-warning btn-lg" id="submitBtn"> 전송 </button>
            </div>
            </div>
        </form>
        <style>
            .uploadResult {
                display: flex;
                justify-content: center;
                flex-direction: row;
            }
        </style>
    <div class="form-group">
        <label for="exampleInputFile">File input</label>
        <div class="input-group">
            <div class="custom-file">
                <input type="file" name="uploadFiles" class="custom-file-input" id="exampleInputFile" multiple>
                <label class="custom-file-label" for="exampleInputFile">Choose file</label>
            </div>
            <div class="input-group-append">
                <span class="input-group-text" id="uploadBtn">Upload</span>
            </div>
        </div>
    </div>

    <div class="uploadResult">
        <!--div 추가-->
    </div>


    </div>
</div>


<%@include file="../includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    const uploadResultDiv = document.querySelector(".uploadResult")

    document.querySelector("#uploadBtn").addEventListener("click", (e) => {


        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")

        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append("uploadFiles", fileInput.files[i])
        }

        const headerObj = {headers: {'Content-Type': 'multipart/form-data'}}

        axios.post("/upload", formData, headerObj).then((response) => {
            const arr = response.data
            console.log(arr)

            let str = ""
            for (let i = 0; i < arr.length; i++) {

                const {uuid, fileName, uploadPath, image, thumbnail, fileLink} = {...arr[i]}


                if (image) {
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><img src='/viewFile?file=\${thumbnail}'><span>\${fileName}</span>
                            <button onclick="javascript:removeFile('\${fileLink}', this)">x</button></div>`

                } else {
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><a href='/downFile?file=\${fileLink}'> \${fileName}</a></div>` // 다운로드
                }//if end

            }//for end
            uploadResultDiv.innerHTML += str
        })

    }, false)

    function removeFile(fileLink, ele) {
        console.log(fileLink)
        axios.post("/removeFile", {fileName: fileLink}).then(response => {
            const targetDiv = ele.parentElement
            targetDiv.remove()
        })
    }


    document.querySelector("#submitBtn").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const form1 = document.querySelector("#form1")
        const fileDivArr = uploadResultDiv.querySelectorAll("div")

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
