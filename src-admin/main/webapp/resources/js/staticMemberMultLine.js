function multiLineMember() {

    const margin = {top: 30, right: 30, bottom: 70, left: 60},
        width = 560 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom;
    let data = [
        {date: '20대', value: 200000},
        {date: '30대', value: 400000},
        {date: '40대', value: 300000},
        {date: '50대', value: 500000},
        {date: '60대', value: 400000},
        {date: '70대', value: 100000},
        {date: '기타', value: 60000}
    ];

    let data0 = [
        {date: '20대', value: 100000},
        {date: '30대', value: 200000},
        {date: '40대', value: 150000},
        {date: '50대', value: 250000},
        {date: '60대', value: 200000},
        {date: '70대', value: 50000},
        {date: '기타', value: 8000}
    ];

    let data1 = [
        {date: '20대', value: 150000},
        {date: '30대', value: 220000},
        {date: '40대', value: 170000},
        {date: '50대', value: 270000},
        {date: '60대', value: 300000},
        {date: '70대', value: 50000},
        {date: '기타', value: 1000}
    ];


    const svg = d3.select("#ganderfd")
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
        .attr("x", width)
        .attr("y", height)
        .text("dollars");

    const y = d3.scaleLinear()
        .domain([0, d3.max(data, d => d.value)])
        .range([height, 0])
    svg.append("g")
        .call(d3.axisLeft(y))
    svg.append("text")
        .attr("class", "y label")
        .attr("text-anchor", "end")
        .attr("y", 6)
        .attr("dy", "0em")
        .attr("transform", "rotate(0)")
        .text("(years)");



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