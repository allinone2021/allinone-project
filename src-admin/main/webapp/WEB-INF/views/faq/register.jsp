<%--
  Created by IntelliJ IDEA.
  User: junga
  Date: 2021-09-20
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content-wrapper">
    <!-- Main content -->
    <!-- left column -->
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="card-header">
            <h2 class="card-title" style="background-color:white;"> FAQ 등록 </h2>
        </div>
        <!-- form start -->
        <form action="/faq/register" method="post" id="form1">

            <div class="card-body">
                <input type="hidden" name="fno" class="form-control" value="<c:out value="${faqDTO.fno}"/>" readonly>
                <div class="form-group">
                    <label> 질문 </label>
                    <input type="text" name="title" class="form-control" value="<c:out value="${faqDTO.title}"/>">
                </div>


            <div class="form-group row">
                <label for="inputGender" class="col-sm-2 col-form-label"> 카테고리 </label>
                <div class="col-sm-10 row" id="inputGender">
                    <div class="col-auto form-check form-check-inline">
                        <label class="form-check-label"><input class="form-check-input" type="radio" name="category" value="0">공용</label>
                    </div>
                    <div class="col-auto form-check form-check-inline">
                        <label class="form-check-label"><input class="form-check-input" type="radio" name="category" value="1">점주</label>
                    </div>
                    <div class="col-auto form-check form-check-inline">
                        <label class="form-check-label"><input class="form-check-input" type="radio" name="category" value="2">회원</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <!-- textarea -->
                    <div class="form-group">
                        <label>답변 </label>
                        <textarea name="content" class="form-control" rows="3"><c:out  value="${faqDTO.content}"></c:out></textarea>
                    </div>
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-block btn-outline-warning btn-lg" id="submitBtn"> 등록 </button>
            </div>
            </div>
        </form>


<%@include file="../includes/footer.jsp" %>

</body>
</html>
