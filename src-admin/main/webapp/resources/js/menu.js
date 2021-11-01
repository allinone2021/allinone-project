
async function getMenuList(sno) {
    // console.log("getMenuList.js" + sno)
    const response = await axios.get(`/menus/list/${sno}`)
    // console.log(response.data)
    return response.data
}

async function addMenu(obj) {
    // console.log(obj)
    const response = await axios.post("/menus",obj)
    // console.log(response.data)
    return response.data
}

async function removeMenu(mno) {
    console.log(mno)
    const response = await axios.delete(`/menus/${mno}`)
    console.log(response.data)
    return response.data
}

const modifyMenu = async (menu) => {
    console.log("=========== js modify ===========")
    console.log(menu)
    const response =  await axios.put(`/menus/${menu.mno}`,menu)
    console.log(response.data)
    return response.data
}

const updateSoldOut = async (mno, soldOut) => {
    console.log("----- update soldOut js -----")
    console.log(mno, soldOut)
    const response = await axios.put(`/menus/${mno}/${soldOut}`)
    return response.data
}