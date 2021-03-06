<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://kit.fontawesome.com/a24c081181.js" crossorigin="anonymous"></script>
<style>
	/* COMMON */
	*{
		box-sizing: border-box;
		padding: 0px;
		margin: 0px;
	}
/* 	div{
		border: 1px solid black;
	} */
	.container{
		padding: 50px;
		/* width: 1000px; */
		height: 700px;
	}
	.row{
		--bs-gutter-x: 0rem;
	}
	/* CHAT */
	.contents{
		height: 80%;
		overflow-y:auto;
		word-wrap:break-word;
	}
	.contents .me{
		text-align: right;
	}
	.contents .others{
		text-align: left;
	}
	.contents .sendImg{
		width: 100px;
		height: 100px;
	}
	.contents #message{
		height: 20%;
	}
	.etc div{
		text-align: center;
	}
	#emoticons{
		padding: 10px;
	}
	#emoticons img{
		width: 50px;
		height: 50px;
	}
	.others{
		display: flex;
		align-items: center;
		padding: 5px;
	}
	.others .proImg{
		width: 30px;
		margin-right: 4px; 
	}
	.imgLink{
		display: block;
	}
	.members{
		border-bottom: 1px solid black;
	}
	.joinuserName{
		cursor: point;
	}
</style>
</head>
<script type="text/javascript">
 window.history.forward();
 function noBack(){
	window.history.forward();
 }
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div class="container">
		<input type="hidden" id="userId" value="${userId }">
		<input type="hidden" id="roomNumber" value="${roomNumber }">
		<input type="button" id="invite" value="초대하기">
		<input type="button" id="leave" value="방 나가기">
		<div class="row"> 
			<div class="row">참가자</div>
			<div class="row members">
				<c:forEach var="jDto" items="${joinList}">
					<c:forEach var="aDto" items="${allUser}">
						<c:if test="${jDto.getUserId() == aDto.getUserId() }">
							<div class="col-3 d-flex member">
								<c:choose>
									<c:when test="${aDto.getImg() == null}"><img src="/img/blue.png" width="30px" class="joinUserImg"></c:when>
									<c:otherwise><img src="/files/${aDto.getImg()}" width="30px" class="joinUserImg"></c:otherwise>
								</c:choose>
								<div class="joinUserId" style="display: none">${jDto.getUserId()}</div>
								<div class="col joinUserName">${jDto.getUserName()}</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<input type="text" class="col-10" id="searchTxt">
			<div class="col-1" id="searchBtn"><i class="fas fa-search"></i></div>
			<div class="col-1 next">next</div>
		</div>
		<div class="row contents" id="contents">			
			<c:if test="${list != null }">
				<c:forEach var="dto" items="${list}">
					<c:choose>
						<c:when test="${dto.getUserId() == userId}">
							<c:choose>
								<c:when test="${dto.getOriName() == null }">
									<div class="row">
										<p class="col me">${dto.getMessage() }</p>
									</div>
								</c:when>
								<c:when test="${dto.getOriName() != null and dto.getSavedName() == null}">
									<div class="row">
										<div class="col me"><img src="${dto.getOriName()}" class="sendImg"></div>
									</div>
								</c:when>
								<c:when test="${dto.getFormat()=='gif' or dto.getFormat()=='png' or dto.getFormat()=='jpg' or dto.getFormat()=='raw' or dto.getFormat()=='tif' or dto.getFormat()=='tiff' or dto.getFormat()=='bpm' or dto.getFormat()=='rle' or dto.getFormat()=='dib'}">
									<div class="row">
										<div class="col me">
											<img src='/files/${dto.getSavedName() }' class="sendImg">
											<a href='/chatting/download?seq=${dto.getSeq() }&oriName=${dto.getOriName() }&savedName=${dto.getSavedName() }&roomNumber=${dto.getRoomNumber() }&uploadDate=${dto.getUploadDate() }' class='imgLink'>${dto.getOriName() }</a>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row me">
										<a href="/chatting/download?seq=${dto.getSeq() }&oriName=${dto.getOriName() }&savedName=${dto.getSavedName() }&roomNumber=${dto.getRoomNumber() }&uploadDate=${dto.getUploadDate() }">${dto.getOriName() }</a>
									</div>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>	
							<c:forEach var="aDto" items="${allUser}">
								<c:if test="${dto.getUserId() == aDto.getUserId() }">						
								<c:choose>
									<c:when test="${dto.getOriName() == null }">
										<div class="row others">	
											<div class="col-1">
												<c:choose>
													<c:when test="${aDto.getImg() == null}"><img src="/img/blue.png" class="proImg"></c:when>
													<c:otherwise><img src="/files/${aDto.getImg()}" class="proImg"></c:otherwise>
												</c:choose>
											</div>
											<div class="col-2">${aDto.getUserName()}: </div>
											<p class="col-9">${dto.getMessage() }</p>
										</div>
									</c:when>

									<c:when test="${dto.getOriName() != null and dto.getSavedName() == null}">
										<div class="row others">	
											<div class="col-1">
												<c:choose>
													<c:when test="${aDto.getImg() == null}"><img src="/img/blue.png" class="proImg"></c:when>
													<c:otherwise><img src="/files/${aDto.getImg()}" class="proImg"></c:otherwise>
												</c:choose>
											</div>
											<div class="col-2">${aDto.getUserName()}: </div>
											<img src="${dto.getOriName()}" class="col-8 sendImg">
										</div>
									</c:when>

									<c:when test="${dto.getFormat()=='gif' or dto.getFormat()=='png' or dto.getFormat()=='jpg' or dto.getFormat()=='raw' or dto.getFormat()=='tif' or dto.getFormat()=='tiff' or dto.getFormat()=='bpm' or dto.getFormat()=='rle' or dto.getFormat()=='dib'}">
										<div class='row others'>
											<div class="col-1">
												<c:choose>
													<c:when test="${aDto.getImg() == null}"><img src="/img/blue.png" class="proImg"></c:when>
													<c:otherwise><img src="/files/${aDto.getImg()}" class="proImg"></c:otherwise>
												</c:choose>
											</div>
											<div class="col-2">${aDto.getUserName()}: </div> 
											<div class="col-8">
												<img src='/files/${dto.getSavedName() }' class="sendImg">
												<a href='/chatting/download?seq=${dto.getSeq() }&oriName=${dto.getOriName() }&savedName=${dto.getSavedName() }&roomNumber=${dto.getRoomNumber() }&uploadDate=${dto.getUploadDate() }' class='imgLink'>${dto.getOriName() }</a>
											</div>
										</div>
									</c:when>
									
									<c:otherwise>
										<div class="row others">
											<div class="col-1">
												<c:choose>
													<c:when test="${aDto.getImg() == null}"><img src="/img/blue.png" class="proImg"></c:when>
													<c:otherwise><img src="/files/${aDto.getImg()}" class="proImg"></c:otherwise>
												</c:choose>
											</div>
											<div class="col-2">${aDto.getUserName()}: </div>
											<a href="/chatting/download?seq=${dto.getSeq() }&oriName=${dto.getOriName() }&savedName=${dto.getSavedName() }&roomNumber=${dto.getRoomNumber() }&uploadDate=${dto.getUploadDate() }" class="col-8">${dto.getOriName() }</a>
										</div>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
		</div>
		<div class="row" id="emoticons" style="display:none;">
			<img src="/img/happy.png" id="happy" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/excited.png" id="excited" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/nomal.png" id="nomal" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/soso.png" id="soso" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/sleepy.png" id="sleepy" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/sad.png" id="sad" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/angry.png" id="angry" ondblclick="sendEmoticon(this)" class="col">
			<img src="/img/surprised.png" id="surprised" ondblclick="sendEmoticon(this)" class="col">
		</div>
		<div class="row etc">
			<div id="fileWrapper" class="col-6">
				<i class="far fa-file-alt" id="fileIcon"></i>
				<form name="signform" id="signform" method="POST" ENCTYPE="multipart/form-data">
    				<input type="file" id="file" name="file" multiple="true" style="display:none;" onchange="upload()" >
				</form>	
			</div>
			<div id="emoticonIcon" class="col-6"><i class="far fa-laugh"></i></div>
		</div>
		<div class="row sendMsg">
			<input type="text" id="message" class="col-10">
			<button id="send" class="col-2">Send</button>
		</div>
		<div class="row">
			<input type="button" id="goChatList" value="목록">
			<input type="button" id="goChatHome" value="채팅 홈">
		</div>
	</div>
	
	<script>
		var socket = new SockJS("/wechat"); // 엔드포인트 주소 넣기
		var client = Stomp.over(socket); // 연결 이후 작업 처리하는 코드
		
		$(document).ready(function(){
			var roomNumber = $("#roomNumber").val();
			
			$.ajax({
				type: 'POST',
				url: '/chatting/deleteUserState',
				data: {roomNumber:roomNumber},
				success: function(data) { console.log("success!")}
			});
		});
		
		client.connect({},function(resp){ // {}는 헤더정보 없으면  빈 칸
			console.log(resp);
			var roomNumber = $("#roomNumber").val();
			var joinUserId = '';
			var joinUserName = '';
			var joinUserImg = '';
			
			scrollBottom();
			
			$(".member").each(function(index){
				if(index!=0){
					joinUserId += ',';
					joinUserName += ',';
					joinUserImg += ',';
				}
				joinUserId += $(this).children(".joinUserId").text();
				joinUserName += $(this).children(".joinUserName").text();
				joinUserImg += $(this).children(".joinUserImg").attr("src");
			})
			
			var arrId = joinUserId.split(",");
			var arrName = joinUserName.split(",");
			var arrImg = joinUserImg.split(",");
			
			client.subscribe("/topic/chat/"+roomNumber,function(msg){ // 구독할 url 넣기
				var result = JSON.parse(msg.body);
				var userId = '';
				var userName = '';
				var userImg = '';
				
				for(var i=0;i<arrId.length;i++){
					if(result.userId == arrId[i]){
						userImg = arrImg[i]; 
						userName = arrName[i];
					}
				}
			
				if(result.userId == $("#userId").val()){
					$(".contents").append("<div class='row'><p class='col me'>"+result.message+"</p></div>");
				}else{
					$(".contents").append("<div class='row others'><div class='col-1'><img src='"+userImg+"' class='proImg'></div><div class='col-3'>"+userName+" : </div><p class='col-8'>"+result.message+"</p></div>");
				}
				scrollBottom();
			});
			client.subscribe("/topic/chat/emoticon/"+roomNumber,function(msg){ // 구독할 url 넣기
				var result = JSON.parse(msg.body);
				var userId = '';
				var userName = '';
				var userImg = '';
				
				for(var i=0;i<arrId.length;i++){
					if(result.userId == arrId[i]){
						userImg = arrImg[i]; 
						userName = arrName[i];
					}
				}
				
				if(result.userId == $("#userId").val()){
					$(".contents").append("<div class='row'><div class='col me'><img src='"+result.oriName+"' class='sendImg'></div></div>");
				}else{
					$(".contents").append("<div class='row others'><div class='col-1'><img src='"+userImg+"' class='proImg'></div><div class='col-3'>"+userName+" : </div><img src='"+result.oriName+"' class='col-8 sendImg'></div>");
				}
				scrollBottom();
			});
			client.subscribe("/topic/file/"+roomNumber,function(msg){ // 구독할 url 넣기
				var result = JSON.parse(msg.body);
				var userId = '';
				var userName = '';
				var userImg = '';
				
				for(var i=0;i<arrId.length;i++){
					if(result.userId == arrId[i]){
						userImg = arrImg[i]; 
						userName = arrName[i];
					}
				}
				
				if(result.userId == $("#userId").val()){
					$(".contents").append("<div class='row me'><a href='/chatting/download?seq="+result.seq+"&oriName="+result.oriName+"&savedName="+result.savedName+"&roomNumber="+result.roomNumber+"&uploadDate="+result.uploadDate+"'>"+result.oriName+"</a></div>");
				}else{
					$(".contents").append("<div class='row others'><div class='col-1'><img src='"+userImg+"' class='proImg'></div><div class='col-3'>"+userName+" : </div><a href='/chatting/download?seq="+result.seq+"&oriName="+result.oriName+"&savedName="+result.savedName+"&roomNumber="+result.roomNumber+"&uploadDate="+result.uploadDate+"'>"+result.oriName+"</a></div>");
				}
				scrollBottom();
			});
			client.subscribe("/topic/img/"+roomNumber,function(msg){ // 구독할 url 넣기
				var result = JSON.parse(msg.body);
				var userId = '';
				var userName = '';
				var userImg = '';
				
				for(var i=0;i<arrId.length;i++){
					if(result.userId == arrId[i]){
						userImg = arrImg[i]; 
						userName = arrName[i];
					}
				}
				
				if(result.userId == $("#userId").val()){
					$(".contents").append("<div class='row'><div class='col me'><img src='/files/"+result.savedName+"' class='sendImg'><br><a href='/chatting/download?seq="+result.seq+"&oriName="+result.oriName+"&savedName="+result.savedName+"&roomNumber="+result.roomNumber+"&uploadDate="+result.uploadDate+"'>"+result.oriName+"</a></div></div>");
				}else{
					$(".contents").append("<div class='row others'><div class='col-1'><img src='"+userImg+"' class='proImg'></div><div class='col-3'>"+userName+" : </div><div class='col-8'><img src='/files/"+result.savedName+"' class='sendImg'><br><a href='/chatting/download?seq="+result.seq+"&oriName="+result.oriName+"&savedName="+result.savedName+"&roomNumber="+result.roomNumber+"&uploadDate="+result.uploadDate+"'>"+result.oriName+"</a></div></div>");
				}
				scrollBottom();
			});
		});
		
		$("#send").on("click",function(){
			var userId = $("#userId").val();
			var msg = $("#message").val();
			var roomNumber = $("#roomNumber").val();
			$("#message").val("");
			client.send("/app/chat/"+roomNumber,{},JSON.stringify({userId:userId,message:msg,roomNumber:roomNumber})); // 세번째 인자값은 보내려는 메세지(String 혹은 json 형태로)
		});
		
		$("#message").on("keydown",function(e){
			if(e.keyCode==13){
				var userId = $("#userId").val();
				var msg = $("#message").val();
				var roomNumber = $("#roomNumber").val();
				$("#message").val("");
				client.send("/app/chat/"+roomNumber,{},JSON.stringify({userId:userId,message:msg,roomNumber:roomNumber}));
			}
		});
		
		$("#fileIcon").on("click",function(){
			 $('#file').click();
		});
		
		$("#emoticonIcon").on("click",function(){
			var flag = $("#emoticons").css("display");
			(flag == "block")?$("#emoticons").css("display","none"):$("#emoticons").css("display","block");
		});
		
		function sendEmoticon(e){
			var roomNumber = $("#roomNumber").val();
			var userId = $("#userId").val();
			var emoticon = $(e).attr("src");
			client.send("/app/chat/emoticon/"+roomNumber,{},JSON.stringify({userId:userId,oriName:emoticon,roomNumber:roomNumber}));
			$("#emoticons").css("display","none");
		}
		
		function upload(){
			var roomNumber = $("#roomNumber").val();
			var userId = $("#userId").val();
			var formData = new FormData($("#signform")[0]);
			/* formData.append("file", $("#file")[0].files[0]); */
			
			$.ajax({
				type: 'POST', 
				url: '/chatting/upload?roomNumber='+roomNumber+'&userId='+userId, 
				processData: false, // 필수 
				contentType: false, // 필수 
				data: formData, 
				success: function(data) { console.log("success!")}
			});
		}
		
		$(document).on("click","#download",function(){
			var savedName = $(this).children(".savedName").val();
			console.log(savedName);
			$.ajax({
				type: 'POST', 
				url: '/chatting/download',
				data: {savedName: savedName}, 
				success: function(data) { console.log("success!")}
			});
		});
		
		// 방에 초대하기
		$("#invite").on("click",function(){
			// 팝업창 띄워서 초대할 사람 선택
			var roomNumber = $("#roomNumber").val();
			var url = "/chatting/friendAddPage?roomNumber="+roomNumber;
			var name = "friendAdd";
            var option = "width = 500, height = 500, top = 100, left = 200";
			window.open(url,name,option);
		});
		
		// 방에서 나가기
		$("#leave").on("click",function(){
			var result = confirm("방을 나가시겠습니까?(확인을 누를시 해당 채팅방은 목록에 나타나지 않습니다.)");
			if(result){
				var roomNumber = $("#roomNumber").val();
				var userId = $("#userId").val();
				location.href="/chatting/leave?roomNumber="+roomNumber+"&userId="+userId;
			}
		});
		// 채팅 목록으로 가기
		$("#goChatList").on("click",function(){
			var roomNumber = $("#roomNumber").val();
			
			$.ajax({
				type: 'POST',
				url: '/chatting/insertUserState',
				data: {roomNumber:roomNumber},
				success: function(data) { console.log("success!")}
			});
			
			location.href="/chatting/chatList";
		});
		// 채팅홈으로 가기
		$("#goChatHome").on("click",function(){
			var roomNumber = $("#roomNumber").val();
			
			$.ajax({
				type: 'POST',
				url: '/chatting/insertUserState',
				data: {roomNumber:roomNumber},
				success: function(data) { console.log("success!")}
			});
			
			location.href="/chatting/chatHome";
		});
		
		// 멤버 클릭시 멤버 프로필 정보
		$(document).on("click",".joinUserName",function(){
			var joinUserId = $(this).siblings(".joinUserId").text();
			var url = "/chatting/profileView?joinUserId="+joinUserId;
			var name = "profileView";
	        var option = "width = 500, height = 500, top = 100, left = 200";
			window.open(url,name,option);
		});
		
		var count = 0;
		
		// 대화내용 검색
		$(document).ready(function(){	
			$("#searchBtn").on("click",function(){
				var searchTxt = $("#searchTxt").val();
				
				if(searchTxt == null || searchTxt == ''){
					alert("검색 키워드를 입력해주세요!");
				}else{
					var keyword = $("p:contains('"+searchTxt+"')");
					
					if(count < keyword.length){ 
						var offset = $(keyword[count]).offset();
						console.log(offset);
						$('.contents').animate({scrollTop : offset.top}, 400);
						$(keyword[count-1]).css("background-color","white");
						$(keyword[count]).css("background-color","yellow");
						count++;
					}else{
						alert("마지막 검색 결과입니다.");
						$("#searchTxt").val("");
						keyword.css("background-color","white");
						count = 0;
					} 
				}
			});
		});
		
		$("#searchTxt").on("keydown",function(e){
			if(e.keyCode==13){
				var searchTxt = $("#searchTxt").val();
				
				if(searchTxt == null || searchTxt == ''){
					alert("검색 키워드를 입력해주세요!");
				}else{
					var keyword = $("p:contains('"+searchTxt+"')");
					
					if(count < keyword.length){ 
						var offset = $(keyword[count]).offset();
						console.log(offset);
						$('.contents').animate({scrollTop : offset.top}, 400);
						$(keyword[count-1]).css("background-color","white");
						$(keyword[count]).css("background-color","yellow");
						count++;
					}else{
						alert("마지막 검색 결과입니다.");
						$("#searchTxt").val("");
						keyword.css("background-color","white");
						count = 0;
					} 
				}
			}
		});
		
		function scrollBottom(){
			var sideContents = document.getElementById("contents");
			sideContents.scrollTop = sideContents.scrollHeight;
		}		
	</script>
</body>
</html>