//아이디 정규식
const idExp = /^[a-z0-9]{4,12}$/;
// 비밀번호 정규식
const pwExp = /^[A-Za-z0-9]{4,12}$/;
//비밀번호 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
const regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
// 이름 정규식
const nameExp = /^[가-힣]{2,6}$/;
// 이메일 검사 정규식
const mailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 전화번호 정규식
const telExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
// 사업자번호 형식체크(내용X) 정규식
const regiExp = /^\d{10}$/;

const pathname = window.location.pathname
console.log(pathname)

if(document.querySelector("#inputEmail")){
    const tmpEmail = document.querySelector("#inputEmail").value
}
if(document.querySelector("#inputRegnum")){
    const tmpRegnum = document.querySelector("#inputRegnum").value
}


//아이디체크
async function checkid(id,checkdiv){
    console.log(id)

    if(id == "") {
        console.log("공백check")
        if(checkdiv){
            checkdiv.innerHTML = "아이디를 입력해주세요"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }

    if(idExp.test(id)){

        const result = await cid(id)

        console.log("result"+result)

        if(result == 1){
            if(checkdiv){
                console.log("id use")
                checkdiv.innerHTML = "사용중인 아이디입니다"
                checkdiv.style.color = "red"

                return false
            }
            return false
        }else {
            if(checkdiv){
                checkdiv.innerHTML = "사용가능한 아이디입니다"
                checkdiv.style.color = "black"

                return true
            }
            return true
        }
    } else {
        if(checkdiv) {
            checkdiv.innerHTML = "아이디는 소문자와 숫자 4~12자리만 가능합니다"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }
}

//아이디 DB체크
async function cid(id){

    console.log("cid function")

    let response = ""

    if(pathname.includes("store")){
        console.log("store")
        response = await axios.get(`/register/checkid/store/${id}`)
    }else if(pathname.includes("member")){
        console.log("member")
        response = await axios.get(`/register/checkid/member/${id}`)
    }
    console.log("cid data:", response.data)

    return response.data
}


//비밀번호 체크
function checkpw(pw,checkdiv){

    if(pwExp.test(pw)){
        if(checkdiv) {
            checkdiv.innerHTML = "사용가능한 비밀번호입니다"
            checkdiv.style.color = "black"

            return true
        }
        return true
    } else {
        if(checkdiv) {
            checkdiv.innerHTML = "영어나 숫자로 4~12자리만 가능합니다"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }
}

//비밀번호확인 체크
function checkpw2(pw,pw2,checkdiv){
    if(pw == pw2){
        checkdiv.innerHTML = "비밀번호 확인"
        checkdiv.style.color = "black"

    } else {
        checkdiv.innerHTML = "비밀번호가 일치하지 않습니다"
        checkdiv.style.color = "red"
    }
}


//이름 체크
function checkname(name,checkdiv){

    if(nameExp.test(name)){
        if(checkdiv) {
            checkdiv.innerHTML = ""
            checkdiv.style.color = "black"

            return true
        }
        return true
    } else {
        if(checkdiv) {
            checkdiv.innerHTML = "한글 2~6자리만 입력가능합니다"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }
}


//이메일체크
async function checkemail(email, checkdiv){
    if(email == "") {
        console.log("공백check")

        if(checkdiv) {
            checkdiv.innerHTML = "이메일을 입력해주세요"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }

    if(mailExp.test(email)){

        const result = await cemail(email)
        console.log(result)

        if(result == 1){

            if(checkdiv) {
                checkdiv.innerHTML = "이미 가입된 이메일입니다"
                checkdiv.style.color = "red"

                return false
            }
            return false
        }else {

            if(checkdiv) {
                checkdiv.innerHTML = "사용 가능한 이메일입니다"
                checkdiv.style.color = "black"

                return true
            }
            return true
        }

    } else {
        if(checkdiv) {
            checkdiv.innerHTML = "이메일을 정확히 입력해주세요"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }
}


//이메일 DB체크
async function cemail(email){

    console.log("cemail function")

    if(pathname.includes("modify") && email == tmpEmail){
        return 0
    }

    let response = ""

    if(pathname.includes("store")){
        console.log("store")
        response = await axios.get(`/register/checkemail/store/${email}`)
    }else if(pathname.includes("member")){
        console.log("member")
        response = await axios.get(`/register/checkemail/member/${email}`)
    }

    console.log("cemail data:", response.data)

    return response.data
}


//전화번호체크
function checkTel(Tel,checkdiv){
    if(telExp.test(Tel)){
        if(checkdiv) {
            checkdiv.innerHTML = ""
            checkdiv.style.color = "black"

            return true
        }
        return true
    } else {
        if(checkdiv) {
            checkdiv.innerHTML = "전화번호를 정확히 입력해주세요"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }
}


//사업자번호체크
async function checkregnum(regnum,checkdiv){
    if(regnum == "") {
        console.log("공백check")
        if(checkdiv) {
            checkdiv.innerHTML = "사업자등록번호를 입력해주세요"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }

    if(regiExp.test(regnum)){

        const result = await cregnum(regnum)
        console.log(result)

        if(result == 1){
            if(checkdiv) {
                checkdiv.innerHTML = "이미 가입된 사업자등록번호입니다"
                checkdiv.style.color = "red"

                return false
            }
            return false
        }else {

            if (checkdiv) {
                checkdiv.innerHTML = ""
                checkdiv.style.color = "black"

                return true
            }
            return true
        }
    } else {
        if(checkdiv) {
            checkdiv.innerHTML = "사업자등록번호를 정확히 입력해주세요"
            checkdiv.style.color = "red"

            return false
        }
        return false
    }
}


//사업자번호 DB체크
async function cregnum(regnum){

    console.log("cregnum function")

    if(pathname.includes("modify") && regnum == tmpRegnum){
        return 0
    }

    const response = await axios.get(`/register/checkregnum/${regnum}`)

    console.log("cregnum data:", response.data)

    return response.data
}