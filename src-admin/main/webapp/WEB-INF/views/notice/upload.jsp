<%--
  Created by IntelliJ IDEA.
  User: bumre
  Date: 2021-09-07
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <input type="file" name="uploadFiles" multiple><button id="uploadBtn">UPLOAD</button>
    <div class="uploadResult">
    </div>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>

        const uploadResultDiv = document.querySelector(".uploadResult")

        document.querySelector("#uploadBtn").addEventListener("click", (e) => {

            // FormData => Ajax form 전송을 가능하게 하는 객체를 생성함으로 메모리상에 공간을 만든다.
            const formData = new FormData()
            const fileInput = document.querySelector("input[name='uploadFiles']")

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
                   const {uuid, fileName, uploadPath, image, thumbnail, fileLink} = {...arr[i]}  //이거로 div 만들어야함


                    if(image) {

                        str += `<div data-uuid='\${uuid}'><img src='/viewFile?file=\${thumbnail}'><span>\${fileName}</span>
                                <button onclick="javascript:removeFile('\${fileLink}', this)">x</button></div>`
                        //http://localhost:8080/viewFile?file=2021/09/08/aaa.jpg
                        //여기서 this 는 <button>을 의미함
                    }else {
                        str += `<div data-uuid='\${uuid}'><a href='/downFile?file=\${fileLink}'> \${fileName}</a></div>` // 다운로드
                        // fileLink -> 파일 위치 경로
                    }//if end



                }//for end
                uploadResultDiv.innerHTML += str
                //업로드 여러번 가능 - 기존걸 유지하면서 str 추가해야함
            })

        }, false)

        function removeFile(fileLink, ele) { // ele 는 this의 파라미터 -> 즉 버튼 태그를 의미하는 것 같다.
            console.log(fileLink)
            axios.post("/removeFile", {fileName:fileLink}).then(response => { // deleted 가 postMapping으로 부터 return되어 response에 담김. 하지만 사용 안됨.
                // 웹에 업로드 창 밑에 썸네일 이미지들 x 버튼 과 동시에 사라지게 하기.
                const targetDiv = ele.parentElement // 버튼 태그의 parentElement 인 div 태그를 targetDiv로 지정
                targetDiv.remove() // 버튼을 담고 있는 지정된 targetDiv 를 삭제시킴.
                // 이로써 폴더에서도 원본 이미지와 섬네일 이미지가 삭제 되고, 웹에서 업로드 창 밑에 있는 썸네일 이미지들도 삭제를 시킴.
                                                                    // 즉 <div class="uploadResult"> 에 있는 이미지 div 태그들이
                                                                    // 지워짐으로써 업로드 창 밑에 썸네일이 사라지는 것이다.
            })

        }


    </script>
</body>
</html>
