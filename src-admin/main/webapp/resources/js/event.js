const evtList = async (evtShop, evtCheck) => {
    const response = await axios.get(`/eventRest/list/${evtShop}/${evtCheck}`)
    return response.data
}

