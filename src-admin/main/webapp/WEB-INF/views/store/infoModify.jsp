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
                    <h1><b>내 가게 정보 수정</b></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">내 가게 정보 수정</li>
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
                            <form class="form-horizontal" id="storeForm">
                                <c:set var="star" value="<b style = 'color: red;'>*</b>"/>
                                <input type="hidden" name="sno" class="sno" value="${infoDTO.sno}">

                                <div class="form-group row">
                                    <label for="inputStoreTel" class="col-sm-2 col-form-label">${star}&nbsp;전화번호</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="sTel" class="form-control" id="inputStoreTel" value="${infoDTO.sTel}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputAddress" class="col-sm-2 col-form-label">${star}&nbsp;주소</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="address" id="inputAddress" value="${infoDTO.address}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputEmail" class="col-sm-2 col-form-label">${star}&nbsp;이메일</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="email" id="inputEmail" value="${infoDTO.email}" >
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <c:set value="${infoDTO.regionList.get(0)}" var="region"/>
                                    <c:set value="${region.city}" var="sCity"/>
                                    <c:set value="${region.county}" var="sCounty"/>
                                    <label for="inputCity" class="col-sm-2 col-form-label">${star}&nbsp;지역</label>
                                    <input type="hidden" id="region" name="region" value="${region.cityCode}">
                                    <div class="col-sm-5">
                                        <select name="city" id="inputCity" class="form-control city" onchange="getCountyList()">
                                            <option value="" selected>선택</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-5">
                                        <select name="county" id="inputCounty" class="form-control county" onchange="getCityCode()">
                                            <option value="">선택</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <c:set value="${infoDTO.categoryList.get(0)}" var="cat"/>
                                    <label for="inputStoreOff" class="col-sm-2 col-form-label">${star}&nbsp;카테고리</label>
                                    <div class="col-sm-5">
                                        <input type="hidden" name="category" id="category">
                                        <select class="form-control storeOff" id="inputCategory" onchange="setCategory()">
                                            <option value="1" name="inputCategory" ${cat.catCode == 1 ? 'selected' : ''}>반찬가게</option>
                                            <option value="2" name="inputCategory" ${cat.catCode == 2 ? 'selected' : ''}>밀키트</option>
                                            <option value="3" name="inputCategory" ${cat.catCode == 3 ? 'selected' : ''}>식당 - 한식</option>
                                            <option value="4" name="inputCategory" ${cat.catCode == 4 ? 'selected' : ''}>식당 - 양식</option>
                                            <option value="5" name="inputCategory" ${cat.catCode == 5 ? 'selected' : ''}>식당 - 중식</option>
                                            <option value="6" name="inputCategory" ${cat.catCode == 6 ? 'selected' : ''}>식당 - 일식</option>
                                            <option value="7" name="inputCategory" ${cat.catCode == 7 ? 'selected' : ''}>식당 - 아시안</option>
                                            <option value="8" name="inputCategory" ${cat.catCode == 8 ? 'selected' : ''}>식당 - 기타</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="inputStoreOpen" class="col-sm-2 col-form-label">${star}&nbsp;영업시간</label>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input type="time" name="sOpen" class="form-control float-right" id="inputStoreOpen" value="${infoDTO.sOpen}">
                                        </div>
                                    </div>
                                    <b> ~ </b>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input type="time" name="sClose" class="form-control float-right" id="inputStoreClose" value="${infoDTO.sClose}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputStoreOff" class="col-sm-2 col-form-label">${star}&nbsp;휴무일</label>
                                    <div class="col-sm-5">
                                        <select class="form-control storeOff" id="inputStoreOff" name="sOff">
                                            <option value="0" name="inputStoreOff" ${infoDTO.sOff == 0 ? 'selected' : ''}>연중무휴</option>
                                            <option value="1" name="inputStoreOff" ${infoDTO.sOff == 1 ? 'selected' : ''}>매달 첫째 주</option>
                                            <option value="2" name="inputStoreOff" ${infoDTO.sOff == 2 ? 'selected' : ''}>매달 둘째 주</option>
                                            <option value="3" name="inputStoreOff" ${infoDTO.sOff == 3 ? 'selected' : ''}>매달 셋째 주</option>
                                            <option value="4" name="inputStoreOff" ${infoDTO.sOff == 4 ? 'selected' : ''}>매달 넷째 주</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-5">
                                        <select class="form-control storeOffDay" name="sOffDay">
                                            <option value="0" name="storeOffDay" ${infoDTO.sOffDay == 0 ? 'selected' : ''}>-----</option>
                                            <option value="1" name="storeOffDay" ${infoDTO.sOffDay == 1 ? 'selected' : ''}>월요일</option>
                                            <option value="2" name="storeOffDay" ${infoDTO.sOffDay == 2 ? 'selected' : ''}>화요일</option>
                                            <option value="3" name="storeOffDay" ${infoDTO.sOffDay == 3 ? 'selected' : ''}>수요일</option>
                                            <option value="4" name="storeOffDay" ${infoDTO.sOffDay == 4 ? 'selected' : ''}>목요일</option>
                                            <option value="5" name="storeOffDay" ${infoDTO.sOffDay == 5 ? 'selected' : ''}>금요일</option>
                                            <option value="6" name="storeOffDay" ${infoDTO.sOffDay == 6 ? 'selected' : ''}>토요일</option>
                                            <option value="7" name="storeOffDay" ${infoDTO.sOffDay == 7 ? 'selected' : ''}>일요일</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputStoreIntro" class="col-sm-2 col-form-label">&nbsp;&nbsp;가게 소개</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="sIntro" id="inputStoreIntro" style="resize: none;">${infoDTO.sIntro}</textarea>
                                    </div>
                                </div>

                            </form>

                        </div><!-- /.card-body -->
                        <div class="card-footer">
                            <button type="submit" class="btn btn-outline-danger btnCxl">취소</button>
                            <button type="submit" class="btn btn-outline-warning float-right btnMod">수정</button>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

<form id="actionForm" action="/store/info" method="get">
    <input type="hidden" value="${infoDTO.sno}" name="sno">
</form>


<%@ include file="../includes/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressApi.js"></script>


<script>

    //지역 select box 동적으로 가져오기//
    const inputCity = document.querySelector("#inputCity")

    async function getCities() {
        let str = `<option value="" selected>선택</option>`;
        console.log("getCities js")

        const cities = await axios.get(`/manage/city`)
        console.log(cities)

        const cityList = cities.data
        console.log(cityList)
        console.log(cityList.forEach)

        cityList.forEach(city => {
            console.log(city)

            str += `<option value='\${city}'>\${city}</option>`
        })
        inputCity.innerHTML = str
    }
    getCities();

    ////////

    const inputCounty = document.querySelector("#inputCounty")

    async function getCountyList() {
        console.log("getCountyList")
        let city = {city : inputCity.value}
        console.log(city)

        let str = `<option value="" selected>선택</option>`;

        const response = await axios.put("/manage/city/countylist", city)
        console.log(response)

        let countyList = response.data
        console.log(countyList)

        countyList.forEach(county => {
            str += `<option value='\${county}'>\${county}</option>`
        })
        inputCounty.innerHTML = str
    }

    ////////

    async function getCityCode() {
        let code = {city : inputCity.value, county : inputCounty.value}
        console.log(code)
        console.log(code.city)
        console.log(code.county)

        let str = "";
        const response = await axios.put("/manage/city/cityCode", code)
        console.log(response)

        let cityCode = response.data
        console.log(cityCode)

        const region = document.querySelector("#region")

        region.setAttribute("value", cityCode)
    }

    ////////////////////////////////////

    const inputCat = document.querySelector("#inputCategory")
    const category = document.querySelector("#category")

    function setCategory() {
        console.log(inputCat.value)
        category.setAttribute("value", inputCat.value)
    }


    ////////////////////////////////////


    const form = document.querySelector("#storeForm")
    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnMod").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        form.setAttribute("action", "/store/infoModify")
        form.setAttribute("method", "post")
        form.submit()
    }, false)

    document.querySelector(".btnCxl").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()
        actionForm.submit()
    }, false)






</script>

</body>
</html>