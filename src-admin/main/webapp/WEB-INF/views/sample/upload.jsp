<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UPLOAD SAMPLE</title>
</head>
<body>

<h1>upload page</h1>

<input type="file" name="uploadFiles" onchange="fileCheck(this)" accept="image/jpeg, image/png"/><button id="uploadBtn">UPLOAD</button>




<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script type="text/javascript">

    function fileCheck(obj) {
        pathpoint = obj.value.lastIndexOf('.');
        filepoint = obj.value.substring(pathpoint+1,obj.length);
        filetype = filepoint.toLowerCase();
        if(filetype=='jpg' || filetype=='png' || filetype=='jpeg') {
            // 정상적인 이미지 확장자 파일일 경우 ...
        } else {
            alert('jpg, png 파일만 선택할 수 있습니다.');
            parentObj  = obj.parentNode
            node = parentObj.replaceChild(obj.cloneNode(true),obj);
            return false;
        }
    }

    //upload 버튼에 이벤트 추가
    document.querySelector("#uploadBtn").addEventListener("click", (e) => {
        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")
        for (let i = 0; i < fileInput.files.length; i++) {
            //여기 주는 이름이 컨트롤러에서 받는 Param의 이름이 됨
            formData.append("uploadFiles", fileInput.files[i])
        }

        console.log(fileInput)
        console.log(formData)

        const headerObj = { headers: {'Content-Type':'multipart/form-data'} }
        axios.post("/upload", formData, headerObj)
    }, false)

</script>

</body>
</html>
