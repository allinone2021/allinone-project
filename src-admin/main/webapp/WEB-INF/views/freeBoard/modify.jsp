<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>

<div class="content-wrapper">
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-warning">
            <div class="card-header">
                <h3 class="card-title"> 자유 게시판 작성 글 수정 </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form id="modifyForm">
                <input type="hidden" name="page" value="${pageRequestDTO.page}">
                <input type="hidden" name="size" value="${pageRequestDTO.size}">

                <div class="temp">

                </div>

                <c:if test="${pageRequestDTO.type != null}">
                    <input type="hidden" name="type" value="${pageRequestDTO.type}">
                    <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
                </c:if>
                <div class="card-body">
                    <div class="form-group">
                        <label>NNO</label>
                        <input type="text" name="fbno" class="form-control"
                               value="<c:out value="${freeBoardDTO.fbno}"/>" readonly>
                    </div>
                    <div class="form-group">
                        <label> 제목 </label>
                        <input type="text" name="title" class="form-control"
                               value="<c:out value="${freeBoardDTO.title}"/>">
                    </div>
                    <div class="form-group">
                        <label> 작성자 </label>
                        <input type="text" name="writer" class="form-control"
                               value="<c:out value="${freeBoardDTO.writer}"/>" readonly>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- textarea -->
                            <div class="form-group">
                                <label> 내용 </label>
                                <textarea name="content" class="form-control" rows="3"><c:out value="${freeBoardDTO.content}"/>
                            </textarea>
                            </div>
                        </div>
                    </div>
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
                    <div class="uploadResult">
                        <c:forEach items="${freeBoardDTO.files}" var="attach">
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
                <div class="card-footer">
                    <button type="submit" class="btn btn-outline-warning btnList">목록</button>
                    <button type="submit" class="btn btn-outline-warning btnMod">수정</button>
                    <button type="submit" class="btn btn-outline-warning btnDel">삭제</button>
                </div>
            </form>
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

        const fileDivArr = uploadResultDiv.querySelectorAll("div")//배열의 개수가 첨부파일의 개수

        if (fileDivArr && fileDivArr.length > 0) { // 새로운 if 문 만들어서 밑에 복붙 내용들 넣어버리기 ★★★★★★
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
            document.querySelector(".temp").innerHTML += str // 복붙은 딱 요기까지 ★★★★★★
        }//if end

        form.setAttribute("action", "/freeBoard/modify")
        form.setAttribute("method", "post")
        form.submit()

    }, false)

    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();

        form.setAttribute("action", "/freeBoard/remove")
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
                } else { 							// 이부분 removeDiv(this) 수정 ★★★
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
