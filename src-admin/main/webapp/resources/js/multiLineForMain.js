

function forMain() {
    const margin = {top: 30, right: 30, bottom: 70, left: 60},
        width = 600 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom;
    let data = [
        {date: '20대', value: 20},
        {date: '30대', value: 40},
        {date: '40대', value: 30},
        {date: '50대', value: 50},
        {date: '60대', value: 40},
        {date: '70대', value: 10},
        {date: '기타', value: 6}
    ];

    let data0 = [
        {date: '20대', value: 10},
        {date: '30대', value: 20},
        {date: '40대', value: 15},
        {date: '50대', value: 25},
        {date: '60대', value: 20},
        {date: '70대', value: 5},
        {date: '기타', value: 2}
    ];

    let data1 = [
        {date: '20대', value: 15},
        {date: '30대', value: 22},
        {date: '40대', value: 17},
        {date: '50대', value: 27},
        {date: '60대', value: 30},
        {date: '70대', value: 50},
        {date: '기타', value: 4}
    ];


    const svg = d3.select("#Ganderfd")
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
        .attr("transform", "translate(0)rotate(0)")
        .style("text-anchor", "end");
    svg.append("text")
        .attr("class", "x label")
        .attr("text-anchor", "end")
        .attr("x", width+25)
        .attr("y", height+25)
        .text("연령");

    const y = d3.scaleLinear()
        .domain([0, d3.max(data, d => d.value)])
        .range([height, 0])
    svg.append("g")
        .call(d3.axisLeft(y))
    svg.append("text")
        .attr("class", "y label")
        .attr("text-anchor", "end")
        .attr("y", 6)
        .attr("dy", "-0.9em")
        .attr("transform", "rotate(0)")
        .text("주문량");



    svg.append("path")
        .datum(data)
        .attr("fill", "none")
        .attr("stroke", "#69b3a2")
        .attr("stroke-width", 3.5)
        .attr("stroke-linejoin", "round")
        .attr("stroke-linecap", "round")
        .attr("d", d3.line()
            .x(d => x(d.date))
            .y(d => y(d.value)));
    svg.append("path")
        .datum(data0)
        .attr("fill", "none")
        .attr("stroke", "#b3698c")
        .attr("stroke-width", 3.5)
        .attr("stroke-linejoin", "round")
        .attr("stroke-linecap", "round")
        .attr("d", d3.line()
            .x(d => x(d.date))
            .y(d => y(d.value)));
    svg.append("path")
        .datum(data1)
        .attr("fill", "none")
        .attr("stroke", "#6979b3")
        .attr("stroke-width", 3.5)
        .attr("stroke-linejoin", "round")
        .attr("stroke-linecap", "round")
        .attr("d", d3.line()
            .x(d => x(d.date))
            .y(d => y(d.value)));

    svg.node();
}