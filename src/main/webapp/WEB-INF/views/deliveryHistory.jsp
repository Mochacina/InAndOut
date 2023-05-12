<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.main-box{
		border: 1px solid black;
		width: 40%;
		border-radius: 10px;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	.button-box{
	}
	#m{
		display: inline-block;
	}
	.tag_top{
		margin-left: 10px;
	}
</style>
</head>
<body>

	<jsp:include page="realGnb.jsp"/>
	
	<h2 class="tag_top">총 <div id="m"></div> 건의 배송 이력이 필터링되었습니다.</h2>
	<input type="button" value="배송완료필터링" onclick="location.href=''"/>
	
	<c:forEach items="${deliveryHistory}" var="dh">
	
		<div class="main-box">
			<div>
				<img  width="500" src="resources/photo/${dh.new_photo_name}"/>
				${dh.nickname} 님
			</div>
			
			<div>${dh.subject}</div>
			<div>배송번호 : ${dh.delivery_accept_no}</div>
		
			<div>배송지 ${dh.to_addr}</div>
			<div>배송완료시간 ${dh.delivery_time}</div>
			
			<div>${dh.delivery_state}</div>
		</div>
	 </c:forEach>
</body>
<script>

	var cnt = document.getElementsByClassName("main-box").length;
	document.getElementById( "m" ).innerText = cnt;
	console.log(cnt);
	
</script>
</html>