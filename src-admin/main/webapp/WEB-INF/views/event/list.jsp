<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>이벤트 목록</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">진행 중인 이벤트</h3>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 70px">번호</th>
                                    <th>이벤트 제목</th>
                                    <th style="width: 180px">이벤트 기간</th>
                                    <th style="width: 85px">진행여부</th>
                                    <th style="width: 75px">조회수</th>
                                </tr>
                                </thead>
                                <tbody class="event">
                                <c:forEach items="${eventDTO}" var="eventDTO">
                                    <tr onclick="javascript:moveEvtRead(${eventDTO.eno})">
                                        <td>${eventDTO.eno}</td>
                                        <td>${eventDTO.evtTitle}</td>
                                        <td>${eventDTO.startDate} ~ ${eventDTO.endDate}</td>
                                        <td><button class="btn btn-block btn-warning btn-xs">진행중</button></td>
                                        <td>${eventDTO.evtCount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">완료된 이벤트</h3>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 70px">번호</th>
                                    <th>이벤트 제목</th>
                                    <th style="width: 190px">이벤트 기간</th>
                                    <th style="width: 81px">진행여부</th>
                                    <th style="width: 70px">조회수</th>
                                </tr>
                                </thead>
                                <tbody class="endEvent">
                                <c:forEach items="${endEventDTO}" var="endEventDTO">
                                    <tr onclick="javascript:moveEvtRead(${endEventDTO.eno})">
                                        <td>${endEventDTO.eno}</td>
                                        <td>${endEventDTO.evtTitle}</td>
                                        <td>${endEventDTO.startDate} ~ ${endEventDTO.endDate}</td>
                                        <td><button class="btn btn-block btn-outline-warning btn-xs">진행완료</button></td>
                                        <td>${endEventDTO.evtCount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer clearfix">
                            <a href="/event/register"><button type="button" class="btn btn-warning float-right">이벤트 만들기</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form id="actionForm" action="/event/read" method="get"></form>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/event.js"></script>

<script>
    const actionForm = document.querySelector("#actionForm")
    function moveEvtRead(eno) {
        actionForm.innerHTML += `<input type='hidden' name='eno' value='\${eno}'>`
        actionForm.submit()
    }
</script>


<%@include file="../includes/footer.jsp" %>