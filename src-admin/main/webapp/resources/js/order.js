const allList = async (shop) => {
    const response = await axios.get(`/orderRest/allList/${shop}`)
    return response.data
}

const customList = async (orderCheck, limitNum) => {
    const response = await axios.get(`/orderRest/customList/${orderCheck}/${limitNum}`)
    return response.data
}

const specificList = async (shop, selectDate) => {
    const response = await axios.get(`/orderRest/specificList/${shop}/${selectDate}`)
    return response.data
}

const remove = async(orderNum) => {
    const response = await  axios.delete(`/orderRest/${orderNum}`)
    return response.data
}

const updateConfirm = async(orderNum) => {
    const response = await  axios.put(`/orderRest/updateConfirm/${orderNum}`)
    return response.data
}