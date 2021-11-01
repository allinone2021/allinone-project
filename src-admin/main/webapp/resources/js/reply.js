

const getReplyList = async (nno, page) => {
    console.log(nno)
    console.log(page)
    if(!page){page=1}
    const response =  await  axios.get(`/replies/list/${nno}/${page}`)
    return response.data
}


async function addReply(obj) {
    const response = await axios.post("/replies/new",obj)
    return response.data
}

const removeReply = async(rno) => {
    const response = await  axios.delete(`/replies/${rno}`)
    return response.data
}

const modifyReply = async (reply) => {
    const response =  await  axios.put(`/replies/${reply.rno}`,reply)
    return response.data
}