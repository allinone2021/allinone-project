
function getFormatDate(date){
    let year = date.year;
    let month = date.month;
    let day = date.day;

    let fullDate = year + '-' + month + '-' + day;

    return fullDate;
}

function lineInStatistic2(obj) {
    console.log("--------------- Line For Day -----------------")
    console.log(obj)
    console.log("--------------------------------")



    const margin = {top: 30, right: 30, bottom: 70, left: 60},
        width = 1100 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

    let data = [];

    obj.forEach(result => {
        console.log(result.date)
        console.log(result.orderCount)
        data.push({ date : getFormatDate(result.date), value :(result.orderCount)})

    })


    const svg = d3.select("#lineChartForIncomeStatement2")
        .append('svg')
        .style("width", width + margin.left + margin.right).style("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", `translate(${margin.left},${margin.top})`);

    const x = d3.scaleBand()
        .range([0, width])
        .domain(data.map(d => d.date))
        .padding(0.3);
    svg.append("g")
        .attr("transform", `translate(0, ${height})`)
        .call(d3.axisBottom(x))
        .selectAll("text")
        .attr("transform", "translate(-10,0)rotate(-45)")
        .style("text-anchor", "end");

    const y = d3.scaleLinear()
        .domain([0, d3.max(data, d => d.value)])
        .range([height, 0]);
    svg.append("g")
        .call(d3.axisLeft(y))


    svg.append("path")
        .datum(data)
        .attr("fill", "#cce5df")
        .attr("stroke", "#69b3a2")
        .attr("stroke-width", 1.5)
        .attr("stroke-linejoin", "round")
        .attr("stroke-linecap", "round")
        .attr("d", d3.area()
            .x(d => x(d.date))
            .y0(y(0))
            .y1(d => y(d.value)));

    svg.node();
}