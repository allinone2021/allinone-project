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
            <h2 class="card-title" > 질문 수정 </h2>
        </div>
        <!-- form start -->
        <form action="/qna/modify" method="post" id="modifyForm">
            <input type="hidden" name="page" value="${pageRequestDTO.page}">
            <input type="hidden" name="size" value="${pageRequestDTO.size}">
            <c:if test="${pageRequestDTO.type != null}">
                <input type="hidden" name="type" value="${pageRequestDTO.type}">
                <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
            </c:if>


            <div class="card-body">
                <input type="hidden" name="qno" class="form-control" value="<c:out value="${qnaDTO.qno}"/>">


                <div class="form-group">
                    <label> 제목 </label>
                    <input type="text" name="title" class="form-control" value="<c:out value="${qnaDTO.title}"/>">

                </div>
                <div class="form-group">
                    <label> 작성자 </label>
                    <input type="text" name="writer" readonly class="form-control"
                           value="<c:out value="${qnaDTO.writer}"/>">
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <!-- textarea -->
                        <div class="form-group">
                            <label>내용</label>
                            <textarea name="content" class="form-control" rows="10"><c:out
                                    value="${qnaDTO.content}"></c:out></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->

            <div>
                <div class="temp">
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-warning btnList">목록</button>
                    <button type="submit" class="btn btn-warning btnMod">수정</button>
                    <button type="submit" class="btn btn-danger btnDel">삭제</button>
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
            <c:forEach items="${qnaDTO.files}" var="attach">
                <div data-uuid="${attach.uuid}" data-filename="${attach.fileName}"
                     data-uploadpath="${attach.uploadPath}" data-image="${attach.image}">
                    <c:if test="${attach.image}">
                        <img src="/viewFile?file=${attach.getThumbnail()}">
                        <span>${attach.fileName}</span>
                        <button class="btn btn-outline-danger" onclick="javascript:removeDiv(this)"> X</button>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
</div>

<form id="actionForm" action="/qna/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">
    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>


<%@include file="../includes/footer.jsp" %>

<script>
    const form = document.querySelector("#modifyForm")

    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation()
        actionForm.submit();
    }, false)

    document.querySelector(".btnMod").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        const fileDivArr = uploadResultDiv.querySelectorAll("div")

        if (fileDivArr && fileDivArr.length > 0) {
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
            document.querySelector(".temp").innerHTML += str
        }//if end

        form.setAttribute("action", "/qna/modify")
        form.setAttribute("method", "post")
        form.submit()

    }, false)

    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        form.setAttribute("action", "/qna/remove")
        form.setAttribute("method", "post")
        form.submit()

    }, false)


</script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    const uploadResultDiv = document.querySelector(".uploadResult")

    document.querySelector("#uploadBtn").addEventListener("click", (e) => {

        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")

        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append("uploadFiles", fileInput.files[i])
        }

        console.log(fileInput)
        console.log(formData)

        const headerObj = {headers: {'Content-Type': 'multipart/form-data'}}

        axios.post("/upload", formData, headerObj).then((response) => {
            const arr = response.data
            console.log(arr)

            let str = ""
            for (let i = 0; i < arr.length; i++) {
                const {uuid, fileName, uploadPath, image, thumbnail, fileLink} = {...arr[i]}

                if (image) {
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><img src='/viewFile?file=\${thumbnail}'><span>\${fileName}</span>
                        <button onclick="javascript:removeDiv(this)">x</button></div>`
                } else { 						
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><a href='/downFile?file=\${fileLink}'> \${fileName}</a></div>` // 다운로드
                }//if end
            }//for end
            uploadResultDiv.innerHTML += str
        })
    }, false)

    function removeDiv(ele) {
        ele.parentElement.remove()
    }
</script>

</body>
</html>
