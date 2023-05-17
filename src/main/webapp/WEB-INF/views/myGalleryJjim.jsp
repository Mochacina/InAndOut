<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/home.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap');
    </style>
<body>
<jsp:include page="realGnb.jsp"/>
	<header>
	  <nav id="nav" style="position: fixed;">
	   <a href="myPage.go">모아보기</a>
	   <a href="mySales.go">판매글</a>
	   <a href="myGallery.go">갤러리</a>
	   <a href="mySalesJjim.go">관심판매글</a>
	   <a href="myGalleryJjim.go" style="color:blue; text-decoration: underline;">찜한갤러리</a>
	   <a href="userAuth.go" >설정</a>
	  </nav>
	</header>

<div id="userdetailsales">
	<h4 style="font-size:15px; color:skyblue;line-height: 300%;">
	내가 찜한 갤러리</h4>
	<c:forEach items="${interestglList}" var="ig">
	<div style="float:left; margin-right:10px; display:inline;">
		<a href="galleryDetail.do?gallery_no=${ig.sales_no}">
			<img style="max-width: 300px; height: auto; object-fit: cover;" src="/photo/${ig.new_photo_name}"/>
			<h5 align="center">${ig.gallery_subject}</h5>
		</a>
	</div>
	</c:forEach>
	</div>

    <div class="main-box">
        <div class="profile-box">
        <img src="/photo/${new_photo_name}">
            <div class="title-nickname">
            <h2>${dto.nickname}</h2>
            </div>
        </div>
        <div class="content">
        <c:choose>
        	<c:when test="${avg eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 2}">
        	<img src="resources/img/dolphin2.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 3}">
        	<img src="resources/img/dolphin3.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 4}">
        	<img src="resources/img/dolphin4.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 5}">
        	<img src="resources/img/dolphin5.png" style="width: 60px;"/>
        	</c:when>
        </c:choose>        
        </div>
            <div id="avgdolphin">&nbsp;&nbsp;나의 &돌핀 단계 : ${avg}단계&nbsp;&nbsp;</div>
            <hr>
            <div class="parent">
		        <div class="pfirst">판매글</div>
		        <div class="psecond">갤러리</div>
		        <div class="pthird">나의 관심</div>
		    		</div>
		    		<div class="child">
		        <div class="cfirst">${countsales}</div>
		        <div class="csecond">${countgallery}</div>
		        <div class="cthird">${countinterest}</div>
        		</div>

        </div>
    </div>

</body>    
</head>
</html>