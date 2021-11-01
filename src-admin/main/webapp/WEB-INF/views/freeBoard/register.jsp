<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>

<style>
    .uploadResult {
        display: flex;
        justify-content: center;
        flex-direction: row;
    }
</style>

<div class="content-wrapper">
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-warning">
            <div class="card-header">
                <h3 class="card-title"> 자유 게시판 글 등록 </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form action="/freeBoard/register" id="registerForm" method="post">
                <div class="card-body">
                    <div class="form-group">
                        <label> 제목 </label>
                        <input type="text" name="title" class="form-control">
                    </div>
                    <div class="form-group">
                        <label> 작성자 </label>
                        <input type="text" name="writer" class="form-control" value="<sec:authentication property="principal.mid"/>" readonly>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- textarea -->
                            <div class="form-group">
                                <label> 내용 </label>
                                <textarea name="content" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
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
                    <div class="temp"></div>
                    <div>
                        <div class="float-left">
                            <button type="submit" id="submitBtn" class="btn btn-block btn-outline-warning">글 등록하기</button>
                        </div>
                        <div class="float-right">
                            <button type="submit" class="btn btn-block btn-outline-warning backToList">리스트로 돌아가기</button>
                        </div>
                    </div>
                </div>
            </form>




            <div class="uploadResult">
                <!--div 추가-->
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    const uploadResultDiv = document.querySelector(".uploadResult")

    document.querySelector("#uploadBtn").addEventListener("click", (e) => {

        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")
        // name="uploadFiles" 라는 input 태그에서 값을 받아와야하기 때문에 위에 input 태그에다가 name='uploadFiles'을
        // 추가해준 것이다. ★★★★

        for (let i = 0; i < fileInput.files.length; i++) {
            //여기 주는 이름이 컨트롤러에서 받는 파람의 이름이 됨
            formData.append("uploadFiles", fileInput.files[i])
        }

        console.log(fileInput)
        console.log(formData)

        const headerObj = { headers: {'Content-Type':'multipart/form-data'} }

        //결과값이 배열로 나올거같지만 안나옴
        axios.post("/upload", formData, headerObj).then((response) => {
            const arr = response.data
            //data = 배열
            //arr = 업로드 결과 하나
            console.log(arr)
            // return arr

            let str = ""
            for (let i = 0; i < arr.length; i++) {
                const {uuid, fileName, uploadPath, image, fileLink, thumbnail} = {...arr[i]}
                if(image) {
                    //태그 내에 정보를 다 담아줌
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><img src='/viewFile?file=\${thumbnail}'>
                            <span>\${fileName}</span><button onclick="javascript:removeFile('\${fileLink}', this)">x</button></div>`
                }else {
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'>
                            <a href='/downFile?file=\${fileLink}'> \${fileName}</a></div>` // 다운로드
                    // data-uuid='\${uuid} 이런것들 추가!!!
                }//if end
            }//for end
            uploadResultDiv.innerHTML += str
            //업로드 여러번 가능 - 기존걸 유지하면서 str 추가해야함
        })

    }, false)

    function removeFile(fileLink, ele) {
        console.log(fileLink)
        axios.post("/removeFile", {fileName:fileLink}).then(response => {
            const targetDiv = ele.parentElement
            targetDiv.remove()
        })

    }

    document.querySelector("#submitBtn").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const form1 = document.querySelector("#registerForm")
        //현재 화면의 파일 정보를 hidden 태그로 변경해야함
        const fileDivArr = uploadResultDiv.querySelectorAll("div") // 이 부분 추가 ★★
        //fileDivArr 배열의 크기가 첨부파일의 개수

        // 이 부분 추가 ★★
        if (!fileDivArr) {  // JS는 == false 안하고 앞에 (not)! 만 붙여줘도됨
            return
            //없으면 그냥 submit 반환
        }
        let str = "";
        //있으면 loop
        for (let i = 0; i < fileDivArr.length; i++) {
            const target = fileDivArr[i]
            const uuid = target.getAttribute("data-uuid")
            const fileName = target.getAttribute("data-filename")
            const uploadPath = target.getAttribute("data-uploadpath")
            const image = target.getAttribute("data-image")
            //위의 4개의 정보로 hidden 태그 만들어서 form 태그 내에 추가할 것
            // 위에 넣어줬던 임의의 input 태그는 삭제해주기! ★★★★★★★★★

            str += `<input type= 'hidden' name='files[\${i}].uuid' value='\${uuid}'>`
            str += `<input type= 'hidden' name='files[\${i}].fileName' value='\${fileName}'>`
            str += `<input type= 'hidden' name='files[\${i}].uploadPath' value='\${uploadPath}'>`
            str += `<input type= 'hidden' name='files[\${i}].image' value='\${image}'>`
        }
        //form 을 submit

        const temp = document.querySelector(".temp").innerHTML += str

        form1.submit()
    }, false)


</script>

<script>
    const Form = document.querySelector("#registerForm")

    document.querySelector(".backToList").addEventListener("click", (e)=> {
        e.preventDefault()
        e.stopPropagation()

        Form.setAttribute("action", "/freeBoard/list")
        Form.setAttribute("method", "get")
        Form.submit()

    }, false)
</script>

<%@include file="../includes/footer.jsp" %>
</body>
</html>
