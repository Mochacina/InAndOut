<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/chat.css" type="text/css">
<style>
	.modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 500px;
        height: auto;
        min-height: 200px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
</style>
</head>
<body style="height:100%">
	<div class="modal">
      <div class="modal_body">
      	<h4>판매 상태 변경하기</h4>
      	<p></p>
      	<div style="display:inline"><h6 id="modal_text" style="color:#264EED;display:inline">테스트</h6><h6 style="display:inline"> 상품을 판매 완료 상태로 변경하시겠습니까?</h6>
      	</div>
      	<p></p>
      	<form action="chatsaledone.do" method="post">
      	<div class="input-group mb-3" style="display:none">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">@</span>
		  </div>
		  <input type="text" id="modalsaleid" name="modalsaleid" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
		</div>
      	<hr/>
      
      	<button class="btn btn-primary" type="submit">변경</button>&nbsp;
		<button type="button" class="btn btn-secondary" id="modalClose">취소</button>
		</form>
      </div>
    </div>
	
	<jsp:include page="realGnb.jsp"/>
	<!--
	<div class="pos-f-t">
	  <nav class="navbar navbar-dark bg-dark">
	    <button class="navbar-toggler" type="button" id="mListToggle">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <a class="navbar-brand" href="afterLogin.do">${loginId}</a>
	  </nav>
	</div> -->
	
	<div class="container" style="height:100%">
	 <!-- 
	 	<h3 class=" text-center">당신의 이름: ${loginId} </h3>
	  -->
	<div class="messaging" style="height:100%">
	      <div class="inbox_msg" id="inbox_msg" style="height:700px">
	        <div class="inbox_people" id="left_box" style="height:100%">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>대화 목록</h4>
	            </div>
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> </div>
	            </div>
	          </div>
	          <div class="inbox_chat" id="chatlistbox" style="height:100%">
	          
	          	<!-- 
	            <div class="chat_list active_chat">
	              <div class="chat_people">
	                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	                <div class="chat_ib">
	                  <h5>SSS <span class="chat_date">Dec 25</span></h5>
	                  <p>Test message</p>
	                </div>
	              </div>
	            </div> -->
	            
	                      
	            
	          </div>
	        </div>
	        <div class="mesgs" style="width:60%; padding:0">
	          <div id="sale_def"  class="dropdown2" style="width:100%;height:100px;background-color: #F0F0F0;display:none;padding:16px 20px">
	          		<div>
	          			<h3>&nbsp;pepe</h3>
	          		</div>
	          		<div style="width:100%; text-align: right; padding: 5px 5px">
	          			<h4>RTX 4070 TI</h4>
	          			<h5 style>1000,000원</h5>
	          		</div>
	          		<div style="width:20px"></div>
	          		<div>
	          			<img src="/photo/1683508729270.png" style="max-height:80px">
	          		</div>
	          		<div class="dropdown-content2" id="saledonediv"> 
			          	<a href="#" id="saledone">판매 완료 변경</a>
			        </div>
	          </div>
	          <div id="sale_def2" style="display:none;width:100%;height:2px;background-color: #E6E6E6;text-align: center">
	          
	          </div>
	          <div style="width:100%;height:20px;">
	          
	          </div>
	          
	          <div class="msg_history" id="msglistbox"></div>
	          <div class="type_msg" id="type_msg" style="display:none">
	            <div class="input_msg_write" style="height:50px">
	              <input type="text" class="write_msg" placeholder="메세지를 입력하세요." id="send_msg" onkeyup="enterkey()"/>
	              <form id="uploadForm" method="post" enctype="multipart/form-data">
	              <button onclick="inputFile()" id="btnsendimg" class="msg_send_btn" type="button" style="right:40px; background:#000000"><i class="fa fa-regular fa-image"></i></button>
	              <input type="file" onchange="sendimg()" id="input-file" style="display:none"/>
	              </form>
	              <button class="msg_send_btn" type="button" onclick="sendmsg()"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
	            </div>
	          </div>
	        </div>
	      </div>
	      <p class="text-center top_spac"> Created by <a target="_blank" href="https://github.com/Mochacina">SSS</a></p>
	    </div>
	</div>
</body>
<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal');

function inputFile(){
	$('#input-file').click();
}

function showModal() {
	event.stopPropagation();
	modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
      body.style.overflow = 'hidden';
    }
}

$('#modalClose').click(function () {
	modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
		body.style.overflow = 'hidden';
    } else {
    	body.style.overflow = 'scroll';
    }
});

var selectedDst = "${selectedRoom}";

function realTime() {
	setInterval(() => {
		list();
	}, 500);
}

realTime();

function list(){
	$.ajax({
		type: 'get',
		url: 'chatList.ajax',
		data: {},
		dataType: 'json',
		success: function(data){
			console.log(data.list);
			listDraw(data.list, data.userlist, data.salephotolist, data.userphotolist);
		},
		error: function(e) {
			console.log(e);
		}
	})	
}

function listDraw(list, userlist, salephotolist, userphotolist) {
	var content = '';
	console.log(userlist);
	list.forEach(function(item, index){
		var salephoto = "";
		if(salephotolist[index]!="rider"){
			salephoto = salephotolist[index];
		}
		if(selectedDst==item.roomid){
			content += '<div class="chat_list active_chat">';
		}else{
			content += '<div class="chat_list">';
		}
		content += '<div class="chat_people" style="display:flex" onclick="select(' + item.roomid + ')">';
		if(userphotolist[index] == null){
			content += '<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>';
		} else{
			content += '<div class="chat_img"> <img src="resources/photo/' + userphotolist[index] + '" alt="sunil"> </div>';
		}
		content += '<div class="chat_ib"><h5>';
		content += userlist[index] + ' <span class="chat_date">' + item.recent_time + '&nbsp;&nbsp;</span></h5>';
		content += '<p>'+item.recent_msg+'</p>';
		content += '</div>';
		if(salephotolist[index]!="rider"){
			salephoto = salephotolist[index];
			content += '<div><img src="/photo/' + salephoto + '" style="width:60px;height:auto;max-height:60px"></div>';
		}
		content += '</div></div>';
	});
	$('#chatlistbox').empty();
	$('#chatlistbox').append(content);
	if(selectedDst!=""){
		msgList(selectedDst);
	}
	
	/* var hei = $('#inbox_msg').css("height");
	$('#left_box').css("height", hei); */
}

function msgList(dst){
	$.ajax({
		type: 'get',
		url: 'msgList.ajax',
		data: {
			id: selectedDst
		},
		dataType: 'json',
		success: function(data){
			console.log(data.list);
			msgDraw(data.list,data.sale,data.salephoto,data.user,data.userphoto);
		},
		error: function(e) {
		}
	});
}

var enter = false;

function msgDraw(list,sale,salephoto,user,userphoto){
	
	var content = '';
	list.forEach(function(item, index){
		if(item.from_id == "${loginId}"){
			content += '<div class="outgoing_msg"><div class="sent_msg" style="margin-right: 5px">';
			if(item.new_photo_name != null){
				content += '<img style="max-width: 200px;max-height: 200px" src="/photo/' + item.new_photo_name + '" alt="sunil">'
			}else{
				content += '<p>' + item.msg_content + '</p>';
			}
			content += '<span class="time_date">' + item.from_time + '</span> </div>';
		}else{
			content += '<div class="incoming_msg"><div class="incoming_msg_img" style="margin-left: 10px;">';
			if(userphoto!= null){
				content += '<img src="resources/photo/' + userphoto + '" alt="sunil"> </div>';
			}else{
				content += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>';
			}
			content += '<div class="received_msg"><div class="received_withd_msg">';
			if(item.new_photo_name != null){
				content += '<img style="max-width: 200px;max-height: 200px" src="/photo/' + item.new_photo_name + '" alt="sunil">'
			}else{
				content += '<p>' + item.msg_content + '</p>';
			}
			content += '<span class="time_date">' + item.from_time + '</span> </div> </div>';
			
		}
		content += '</div>'
	});

	$('#msglistbox').empty();
	$('#msglistbox').append(content);
	
	$('#sale_def').css("display","flex");
	$('#sale_def2').css("display","block");
	$('#type_msg').css("display","block");
	
	content = '';
	content += '<h3 style="min-width: 100px; width: auto">&nbsp;' + user + '&nbsp;님</h3></div>';
	content += '<div style="display:flex;width:100%" onclick="location.href=\'salesDetail.do?sales_no=' + sale.sales_no + '\'">'
	content += '<div style="width:100%; display:block; padding: 5px 5px">';
	content += '<div style="float:right"><div style="display:flex">';
	if(sale.sales_state == "판매중"){
		if(sale.user_id == "${loginId}"){
			content += '<button class="btn btn-primary" id="saledonebtn" onclick="showModal()">판매중</button>';
		} else{
			content += '<button class="btn btn-primary">판매중</button>';
		}
	}else if(sale.sales_state == "판매중단"){
		content += '<button class="btn btn-secondary">판매중단</button>';
	}else{
		content += '<button class="btn btn-secondary">판매완료</button>';
	}
	content += '&nbsp;&nbsp;<h4>' + sale.subject + '</h4></div>';
	content += '<div style="text-align:right"><h5>' + "₩ " + sale.price + '</h5></div></div></div><div style="width:20px"></div><div>';
	content += '<img src="/photo/' + salephoto + '" style="max-height:80px"></div></div>';
	//content += '<div class="dropdown-content2" id="saledonediv" onclick="showModal()"><a href="#" id="saledone">판매 완료 변경</a></div>';
	
	$('#sale_def').empty();
	$('#sale_def').append(content);
	$('#modal_text').text(sale.subject);
	$('#modalsaleid').val(sale.sales_no);
	
	$("#send_msg").mouseenter(function name() {
		$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
	});
	if (enter){
		$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
		enter=false;
	}
	
	if (sale.sales_state == "판매완료" || sale.sales_state == "판매중단"){
		$('#send_msg').attr("placeholder", "메세지를 보낼 수 없는 상태입니다.");
		$('#send_msg').prop('readonly', true);
		$('#btnsendimg').removeAttr("onclick");
	} else {
		$('#send_msg').attr("placeholder", "메세지를 입력하세요.");
		$('#send_msg').prop('readonly', false);
		$('#btnsendimg').attr("onclick","inputFile()");
	}
	
	var saleid = sale.user_id;
	console.log(saleid);
	if(saleid == "${loginId}"){
		$('#sale_def').hover(function () {
			$('.dropdown-content2').css("display","block");
		}, function () {
			$('.dropdown-content2').css("display","none");
		});
	} else {
		$('#sale_def').unbind('mouseenter mouseleave');
	}
	
	
}



function select(roomid){
	selectedDst = roomid;
	list();
}

function enterkey(){
    if(window.event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
    	console.log("엔터쳤음");
        sendmsg(); //formname에 사용자가 지정한 form의 name입력
		enter = true;
		$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
    }
}

function sendmsg(){
	var param = {};
	param.id = "${loginId}";
	param.msg = $("#send_msg").val();
	param.roomid = selectedDst;
	
	$("#send_msg").val('');
	if(selectedDst!="" && param.msg!=""){
		$.ajax({
			type: 'post',
			url: 'msgSend.ajax',
			data: param,
			dataType: 'json',
			success: function(){
				list();
				
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
}

function sendimg(){
	
	const formData = new FormData();
	const imageInput = $("#input-file");
	const files = imageInput[0].files;
	
	console.log(files);
	formData.append("id", "${loginId}");
	formData.append("roomid", selectedDst);
	formData.append("uploadFile", files[0]);
	console.log(formData);
		
	$.ajax({
		type: 'post',
		url: 'imgSend.ajax',
		processData: false,
	    contentType: false,
		data:formData,
		dataType: 'json',
		success: function(rtn){
			list();
			$('#msglistbox').scrollTop($('#msglistbox')[0].scrollHeight);
		},
		error: function(e) {
			console.log(e);
		}
	});
}
</script>
</html>