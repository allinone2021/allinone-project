<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>${eventDTO.evtShop}의 이벤트</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <form id="update" action="/event/update" method="post">
            <input type="hidden" name="shop" value="${eventDTO.evtShop}">
            <div class="card card-solid">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-6">
                            <h3 class="d-inline-block d-sm-none">${eventDTO.evtTitle}</h3>
                            <input type="hidden" name="eno" value="${eventDTO.eno}">
                            <div class="col-12">
                                <c:forEach items="${eventDTO.image}" var="image">
                                    <img src="/viewImage?file=${image.getThumbnail()}" class="product-image" alt="Product Image">
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 bottom">
                            <h3 class="my-3">${eventDTO.evtTitle}</h3>
                            <p><strong>이벤트 기간 </strong> ${eventDTO.startDate}~${eventDTO.endDate}</p>
                            <hr>
                            <p>${eventDTO.evtContents}</p>
                            <c:if test="${eventDTO.evtAmount != null}">
                                <div class="callout callout-danger" style="width: 100%; position: absolute; right: 0px; bottom: 0px; margin-bottom: 0px;">
                                    <h5>${eventDTO.evtMenu}</h5>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${eventDTO.evtPrice}" var="evtPrice"/>
                                    <h5>이벤트 가격 : ${evtPrice}원</h5>
                                    <p>이벤트 수량 : ${eventDTO.evtAmount}개</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row no-print">
                        <div class="col-12">
                            <button type="button"  class="btn btn-outline-warning float-right" data-toggle="modal" data-target="#modal-default">삭제</button>
                            <c:if test="${eventDTO.evtCheck == 1}">
                                <button type="button" class="btn btn-warning float-right" style="margin-right: 5px;" id="finish">완료처리</button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
</div>
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">잠깐!</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>정말로 삭제하시겠어요?</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="removes">네</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../includes/footer.jsp" %>

<script>
    document.querySelector("#removes").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()
        const update = document.querySelector("#update")
        update.setAttribute("action", "/event/remove")
        update.submit()
    }, false)
</script>

<script>
    document.querySelector("#finish").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()
        const update = document.querySelector("#update")
        update.setAttribute("action", "/event/updateCheck")
        update.submit()
    }, false)
</script>