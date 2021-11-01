<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="content-wrapper" style="min-height: 2646.8px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1><b>내 가게 메뉴</b></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">내 가게 메뉴</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <h2>${storeDTO.sname}</h2>

                    <button type="button" class="btn btn-warning float-right ml-auto" data-toggle="modal" data-target="#modal-menu-add">
                        <i class="fas fa-plus"></i>&nbsp;추가
                    </button>
                </div>
            </div>
            <div class="card-body pb-0">

                <div class="row menuDiv">
                    <!-- 메뉴 추가될 부분 -->

                </div>

            </div>

        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
</div>



<!--  메뉴 추가 모달  -->
<div class="modal fade" id="modal-menu-add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">메뉴 추가</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="inputName">이름</label>
                    <input type="text" class="form-control" id="inputName" name="menuName" placeholder="메뉴 이름을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="inputPrice">가격</label>
                    <input type="number" class="form-control" id="inputPrice" name="menuPrice" placeholder="메뉴 가격을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="inputDesc">설명</label>
                    <input type="text" class="form-control" id="inputDesc" name="menuDesc" placeholder="메뉴 설명을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="inputImg">사진</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" name="uploadFiles" class="custom-file-input" id="inputImg" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)" >
                            <label class="custom-file-label" for="inputImg">사진 첨부</label>
                        </div>
                        <div class="input-group-append">
                            <span class="input-group-text uploadBtn" id="uploadBtn">Upload</span>
                        </div>
                    </div>
                    <div class="uploadResult">
                        <!--썸네일 div 추가-->
                    </div>
                    <div class="temp">
                        <!-- image hidden tag 추가될 부분 -->
                        <input type="hidden" name="uuid">
                        <input type="hidden" name="fileName">
                        <input type="hidden" name="uploadPath">
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-warning btnAdd" id="btnAdd" data-dismiss="modal">추가</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<!--  메뉴 수정 모달  -->
<div class="modal fade" id="modal-menu-modify">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">메뉴 수정</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="mno">
                <div class="form-group">
                    <label for="menuName">이름</label>
                    <input type="text" class="form-control" id="menuName" name="modMenuName" >
                </div>
                <div class="form-group">
                    <label for="menuPrice">가격</label>
                    <input type="number" class="form-control" id="menuPrice" name="modMenuPrice" >
                </div>
                <div class="form-group">
                    <label for="menuDesc">설명</label>
                    <input type="text" class="form-control" id="menuDesc" name="modMenuDesc" >
                </div>
                <div class="form-group">
                    <label for="inputImg">사진</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" name="uploadFiles" class="custom-file-input" id="modMenuImg" accept="image/gif, image/jpeg, image/png" >
                            <label class="custom-file-label" for="modMenuImg">사진 첨부</label>
                        </div>
                        <div class="input-group-append">
                            <span class="input-group-text uploadBtn" id="modUploadBtn">Upload</span>
                        </div>
                    </div>
                    <!--첨부파일 내역 div-->
                    <div class="uploadResultMod">

                    </div>
                    <div class="temp">
                        <input type="hidden" name="modUuid">
                        <input type="hidden" name="modFileName">
                        <input type="hidden" name="modUploadPath">
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning btnMenuMod" id="btnMenuMod" data-dismiss="modal">수정</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<!-- 메뉴 삭제 확인 모달 -->
<div class="modal fade" id="modal-menu-delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">잠깐!</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>정말로 삭제하시겠어요?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal" id="removes">네</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<!-- 메뉴 삭제 확인 모달 -->
<div class="modal fade" id="modal-soldout-update">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">품절 관리</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>품절 상태를 변경하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal" id="soldoutCng">네</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<!-- 이미지 원본 모달 -->
<div class="modal fade" id="modal-image">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <img id="targetImage">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->





<%@include file="../includes/footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/menu.js"></script>



<script>



    ///////////////////////////////////////////////////////////////////////////////////////
    //파일 업로드 & 썸네일 처리
    const uploadResultDiv = document.querySelector(".uploadResult")
    document.querySelector("#uploadBtn").addEventListener("click", (e) => {
        console.log("*---------------------------")
        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")
        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append("uploadFiles", fileInput.files[i])
        }
        console.log(fileInput)
        console.log(formData)
        const headerObj = {headers: {'Content-Type': 'multipart/form-data'}}
        console.log("**---------------------------")
        axios.post("/upload", formData, headerObj).then(response => {
            const arr = response.data
            console.log(arr)
            console.log("***---------------------------")
            let str = "";
            for (let i = 0; i < arr.length; i++) {
                //spread operator
                const {uuid, fileName, uploadPath, thumbnail, fileLink} = {...arr[i]}  //이거로 div 만들어야함
                console.log("--------------------")
                console.log(arr[i])
                console.log(thumbnail)
                console.log(fileLink)
                console.log("--------------------")
                str += `<div class="imgDiv" data-thumbnail='\${thumbnail}' data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}'><img src='/viewFile?file=\${thumbnail}'><span>\${fileName}</span>
                    <button class="btn btn-default" onclick="javascript:removeFile('\${fileLink}', this)">x</button></div>`
            }//for end
            uploadResultDiv.innerHTML = str
            console.log("****---------------------------")
        })
    }, false)



    function removeFile(fileLink, ele) {
        console.log(fileLink)
        console.log("---------------------------*")
        axios.post("/removeFile", {fileName: fileLink}).then(response => {
            console.log("---------------------------**")
            const targetDiv = ele.parentElement
            console.log(targetDiv)
            console.log("---------------------------***")
            targetDiv.remove()
        })
    }



    ///////////////////////////////////////////////////
    //메뉴 추가 JS
    const addDiv = document.querySelector("#modal-menu-add")
    const btnAdd = document.querySelector("#btnAdd")
    btnAdd.addEventListener("click", function(e) {

        console.log("========= add menu =========")
        const fileDiv = uploadResultDiv.querySelector(".imgDiv")
        console.log(fileDiv)
        //imgDiv 못찾으면 그냥 uploadResultDiv 에서 찾아오자

        const nameInput = document.querySelector("input[name = 'menuName']")
        const priceInput = document.querySelector("input[name = 'menuPrice']")
        const descInput = document.querySelector("input[name = 'menuDesc']")
        const imgInput = document.querySelector("input[name='uploadFiles']")
        const uuidInput = document.querySelector("input[name='uuid']")
        const fileNameInput = document.querySelector("input[name='fileName']")
        const uploadPathInput = document.querySelector("input[name='uploadPath']")

        console.log(nameInput, priceInput, descInput, imgInput)
        console.log("-------------------------------------------")

        const uuid = fileDiv.getAttribute("data-uuid")
        const fileName = fileDiv.getAttribute("data-filename")
        const path = fileDiv.getAttribute("data-uploadpath")
        console.log("------------*---------------")
        console.log(uuid, fileName, path)
        console.log("------------*---------------")

        uuidInput.setAttribute("value", uuid)
        fileNameInput.setAttribute("value", fileName)
        uploadPathInput.setAttribute("value", path)

        const sno = '${storeDTO.sno}'
        const menuName = nameInput.value
        const menuPrice = priceInput.value
        const menuDesc = descInput.value
        const menuImg = imgInput.value

        console.log("---------------------menuObj------------------------")
        const menuObj = {sno, menuName, menuPrice, menuDesc, menuImg, fileName, uuid, path}
        console.log(menuObj)
        console.log("---------------------menuObj------------------------")

        addMenu(menuObj).then(result => {
            console.log(result)
            getList()
            nameInput.value = ''
            priceInput.value = ''
            descInput.value = ''
            imgInput.value = ''
            uploadResultDiv.innerHTML=null
        })
        console.log("========= /add menu =========")
    }, false)



    ///////////////////////////////////////////////////
    //메뉴 수정/삭제 Js
    const menuDiv = document.querySelector(".menuDiv")
    const modDiv = document.querySelector("#modal-menu-modify")

    const modMno = document.querySelector("input[name='mno']")
    const modName = document.querySelector("input[name='modMenuName']")
    const modPrice = document.querySelector("input[name='modMenuPrice']")
    const modDesc = document.querySelector("input[name='modMenuDesc']")
    const modImg = document.querySelector("input[name='modUploadFile']")
    const modUuid = document.querySelector("input[name='modUuid']")
    const modFileName = document.querySelector("input[name='modFileName']")
    const modPath = document.querySelector("input[name='modUploadPath']")
    const modUploadResultDiv = document.querySelector(".uploadResultMod")

    menuDiv.addEventListener("click", (e) => {
        console.log("---------------menuDiv---------------")
        const target = e.target
        console.log(target)

        //메뉴에서 수정버튼 눌러서 모달창 띄우기
        if (target.matches("#btnMod")) {
            console.log("----------------------mod modal load-----------------------")
            const mno = target.getAttribute("data-mno")
            const menuName = target.getAttribute("data-name")
            const menuPrice = target.getAttribute("data-price")
            const menuDesc = target.getAttribute("data-desc")
            const menuImg = target.getAttribute("data-filename")
            const menuUuid = target.getAttribute("data-uuid")
            const menuPath = target.getAttribute("data-uploadpath")
            const menuThumbnail = target.getAttribute("data-thumbnail")
            const menuFileLink = target.getAttribute("data-filelink")

            console.log("----------------------------------")
            console.log(menuImg, menuUuid, menuPath, menuThumbnail, menuFileLink)
            console.log("----------------------------------")

            modMno.value = mno
            modName.value = menuName
            modPrice.value = menuPrice
            modDesc.value = menuDesc

            modUuid.value = menuUuid
            modPath.value = menuPath
            modFileName.value = menuImg

            if (menuImg != null) {
                let str = ""
                str = `<div class="imgDiv" data-thumbnail='\${menuThumbnail}' data-uuid='\${menuUuid}' data-filename='\${menuImg}' data-uploadpath='\${menuPath}'><img src='/viewFile?file=\${menuThumbnail}'><span>\${menuImg}</span>
                    <button class="btn btn-default" onclick="javascript:removeFile('\${menuFileLink}', this)">x</button></div>`
                modUploadResultDiv.innerHTML = str
            }

            document.querySelector(".btnMenuMod").setAttribute("data-mno", mno)

            document.querySelector("#modUploadBtn").addEventListener("click", (e) => {
                console.log("#---------------------------")
                const formData = new FormData()
                const fileInput = document.getElementById("modMenuImg")
                for (let i = 0; i < fileInput.files.length; i++) {
                    formData.append("uploadFiles", fileInput.files[i])
                }
                console.log(fileInput)
                console.log(formData)
                const headerObj = {headers: {'Content-Type': 'multipart/form-data'}}
                console.log("##---------------------------")
                axios.post("/upload", formData, headerObj).then(response => {
                    const arr = response.data
                    console.log(arr)
                    console.log("###---------------------------")
                    let str = "";
                    for (let i = 0; i<arr.length; i++) {
                        const {uuid, fileName, uploadPath, thumbnail, fileLink} = {...arr[i]}  //이거로 div 만들어야함
                        console.log(fileName)

                        target.setAttribute("data-filename",fileName)
                        target.setAttribute("data-uuid",uuid)
                        target.setAttribute("data-uploadpath",uploadPath)
                        target.setAttribute("data-thumbnail",thumbnail)
                        target.setAttribute("data-filelink",fileLink)

                        str = `<div class="imgDiv" data-thumbnail='\${thumbnail}' data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}'><img src='/viewFile?file=\${thumbnail}'><span>\${fileName}</span>
                    <button class="btn btn-default" onclick="javascript:removeFile('\${fileLink}', this)">x</button></div>`
                    }

                    modUploadResultDiv.innerHTML = str
                    console.log("####---------------------------")
                })
                console.log("----------------------/.mod modal load-----------------------")



                //모달에서 수정버튼 눌러서 db연결
                //btnMenuMod
                document.querySelector("#btnMenuMod").addEventListener("click", (e) => {
                    console.log("----------------------mod modal-----------------------")
                    const mno = modMno.value
                    const menuName = modName.value
                    const menuPrice = modPrice.value
                    const menuDesc = modDesc.value


                    const menuImg = target.getAttribute("data-filename")
                    const menuUuid = target.getAttribute("data-uuid")
                    const menuPath = target.getAttribute("data-uploadpath")
                    const menuThumbnail = target.getAttribute("data-thumbnail")
                    const menuFileLink = target.getAttribute("data-filelink")

                    const fileName = menuImg
                    const uuid = menuUuid
                    const path = menuPath

                    const menuObj = {mno, menuName, menuPrice, menuDesc, fileName, uuid, path}
                    console.log(menuObj)
                    modifyMenu(menuObj).then(result => {
                        getList()
                        modUploadResultDiv.innerHTML = null
                        console.log("----------------------/.mod modal-----------------------")
                    })
                },false)

            }, false)

        }

        //메뉴에서 삭제버튼 눌러서 확인 모달 띄우고 db연결
        if (target.matches(".btnMenuDel")) {
            console.log("----------------------del modal-----------------------")
            const mno = target.getAttribute("data-mno")
            const removes = document.getElementById("removes");
            removes.onclick = () => {
                removeMenu(mno).then(result => {
                    getList()
                    console.log("----------------------/del modal-----------------------")
                })
            }
        }

        if (target.matches(".btnSoldOut") || target.matches(".soldOutDiv")) {
            console.log("----------------------sold modal-----------------------")
            const mno = target.getAttribute("data-mno")
            let soldOut = target.getAttribute("data-soldOut")

            console.log("++----------------------")
            console.log(soldOut)
            console.log(typeof soldOut)
            console.log("++----------------------")

            const soldoutCng = document.getElementById("soldoutCng");
            soldoutCng.onclick = () => {
                console.log(soldOut)
                soldOut == 'false' ? soldOut = true : soldOut = false
                console.log(mno)
                console.log(soldOut)
                updateSoldOut(mno, soldOut).then(result => {
                    getList()
                    console.log("----------------------/.sold modal-----------------------")
                })
            }
        }

    }, false)

    console.log("***************")
    const test = false
    console.log(test)
    const test00 = test === false ? `true` : `false`
    console.log(test00)
    console.log("***************")




    ///////////////////////////////////////////////////
    //메뉴 목록 출력
    function getList() {
        console.log("=========get list=========")
        const target = document.querySelector(".menuDiv")
        const sno = '${storeDTO.sno}'

        function convertTemp(menuObj) {
            const {mno, sno, menuName, menuPrice, soldOut, menuDesc, uuid, fileName, path, thumbnail, fileLink} = {...menuObj}
            console.log(mno, soldOut)

            const fileStr = uuid !== null && uuid !=='null'?`data-uuid='\${uuid}' data-fileName='\${fileName}' data-uploadPath='\${path}' data-thumbnail='\${thumbnail}' data-fileLink='\${fileLink}' `:""

            const descStr = menuDesc !== null && menuDesc !=='null' ? ` data-desc = '\${menuDesc}' ` : ""

            const imgTag = uuid !== null && uuid !=='null' ?
                `<img onclick="javascript:showOrigin('\${fileLink}')" src="/viewFile?file=\${thumbnail}" alt="menu-image" class="img-circle img-fluid">`
                : `<img src="/resources/img/defaultMenu.jpg" class="img-circle img-fluid">`

            const price = menuPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

            const soldOverlay = soldOut ? `<div class=" overlay dark soldOutDiv"  data-mno = '\${mno}' data-soldout = '\${soldOut}' data-toggle="modal" data-target="#modal-soldout-update">
                                    <i class="fas fa-8x fa-ban "></i>
                                </div>` : ""

            const temp = `<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column" >
                            <div class="card bg-light d-flex flex-fill">
                                <div class="card-header text-muted border-bottom-0"></div>
                                <div class="card-body pt-0">
                                    <div class="row">
                                        <div class="col-5 text-center">
                                            \${imgTag}
                                        </div>
                                        <div class="col-7">
                                            <h2 class="lead"><b>\${menuName}</b></h2>
                                            <p class="text-muted"><b><i>\${price}</i> 원</b></p>
                                            <p class="text-muted">\${menuDesc}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="button" class="btn btn-sm btn-outline-danger float-left btnMenuDel" data-mno = '\${mno}' data-toggle="modal" data-target="#modal-menu-delete">삭제</button>
                                    <button type="button" class="btn btn-sm btn-default mx-auto ml-auto btnSoldOut" data-mno = '\${mno}' data-soldout = '\${soldOut}' data-toggle="modal" data-target="#modal-soldout-update">품절</button>
                                    <button type="button" class="btn btn-sm btn-outline-warning float-right btnMod" id="btnMod"
                                    data-mno = '\${mno}' data-name = '\${menuName}' data-price = '\${menuPrice}' \${descStr} \${fileStr}
                                    data-toggle="modal" data-target="#modal-menu-modify" >수정</button>
                                </div>
                                \${soldOverlay}
                            </div>
                        </div>`
            return temp
        }

        getMenuList(sno).then(data => {
            let str = "";
            data.forEach(menu => {
                str += convertTemp(menu)
            })
            target.innerHTML = str
        })
        console.log("=========get list=========")
    }

    (function () {
        getList()
    })()



    const modalImage = new bootstrap.Modal(document.querySelector('#modal-image'))
    function showOrigin(fileLink) {
        document.querySelector("#targetImage").src = `/viewFile?file=\${fileLink}`
        modalImage.show()
    }




    function fileCheck(obj) {
        let pathpoint = obj.value.lastIndexOf('.');
        let filepoint = obj.value.substring(pathpoint+1,obj.length);
        let filetype = filepoint.toLowerCase();
        if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
            // 정상적인 이미지 확장자 파일일 경우 ...
        } else {
            alert('이미지 파일만 선택할 수 있습니다.');
            let parentObj  = obj.parentNode
            let node = parentObj.replaceChild(obj.cloneNode(true),obj);
            return false;
        }
        if(filetype=='bmp') {
            let upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?');
            if(!upload) return false;
        }
    }

</script>


</body>
</html>