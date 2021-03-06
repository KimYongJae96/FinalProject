<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	}
	.row{
		--bs-gutter-x: 0rem;
	}
	/* PROFILE */
	.chatIcon,
	.deleteFriend {
		cursor: pointer;
	}
	/* ETC */
	#goChatList,#goProfile{
		text-align: center;
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
	<div class="container" id="container">
		<div>친구</div>
		<div class="row p-3 d-flex align-items-center myProfile">
			<div class="col-2 p-0 profileImg user">
				<c:choose>
					<c:when test="${user.getImg() == null }"><img src="/img/deepblue.png" width="50px"></c:when>
					<c:otherwise><img src="/files/${user.getImg()}" width="50px"></c:otherwise>
				</c:choose>
			</div>
			<div class="col-10" id="userName">${user.getUserName() }</div>
			<input type="hidden" id="userId" value=${user.getUserId() }>
		</div>
		<div class="row p-0 otherProfile">
			<c:choose>
				<c:when test="${friendList != null }">
					<c:forEach var="dto" items="${friendList }">
						<div class="row p-3 d-flex align-items-center friend">
							<div class="col-2 profileImg other">
								<c:forEach var="aDto" items="#{allUser}">
									<c:if test="${dto.getFriendId() == aDto.getUserId() }">
										<c:choose>
											<c:when test="${aDto.getImg() == null }"><img src="/img/blue.png" width="50px"></c:when>
											<c:otherwise><img src="/files/${aDto.getImg()}" width="50px"></c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</div>
							<div class="col-8 friendName">${dto.getFriendName() }</div>
							<div class="col-1 chatIcon"><i class="far fa-comment-dots"></i></div>
							<div class="col-1 deleteFriend"><i class="fas fa-minus"></i></div>
							<input type="hidden" value="${dto.getFriendId() }" class="friendId">				
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="col-12">친구가 없습니다!</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row etc">
			<div class="row p-3 searchInput">
				<input type="text" id="inputTxt" class="col-sm-8 col-12" placeholder="검색할 친구를 입력해주세요.">
				<input type="button" id="inputBtn" class="col-sm-4 col-12" value="검색">
			</div>
			<div class="row btns">
				<div id="goChatList" class="col-sm-4 col-12">chatList</div>
				<div id="goProfile" class="col-sm-4 col-12">profile update</div>
				<div id="goMain" class="col-sm-4 col-12">main</div>
			</div>
		</div>
	</div>
	

	<script>
	$(document).on("click",".chatIcon",function(){
		var userId = $("#userId").val();
		var friendId = $(this).siblings(".friendId").val();
		var userName = $("#userName").text();
		var friendName = $(this).siblings(".friendName").text();
		location.href="/chatting/roomCheck?userId="+userId+"&friendId="+friendId+"&userName="+userName+"&friendName="+friendName;
		//$("#main").load("roomCheck?userId="+userId+"&friendId="+friendId+"&userName="+userName+"&friendName="+friendName);
	 });
	
	$(document).on("click",".deleteFriend",function(){
		var userId = $("#userId").val();
		var friendId = $(this).siblings(".friendId").val();
		$.ajax({
			type: 'POST',
			url: '/chatting/deleteFriend',
			data: {userId:userId,friendId:friendId},
			dataType: 'json'
		}).done(function(resp){
			alert(resp.msg);
			location.reload();
		});
	});
	
	$("#inputBtn").on("click",function(){
		var searchTxt = $("#inputTxt").val();
		console.log(searchTxt.length);
		if(searchTxt == '' || searchTxt == null){
			alert("검색할 아이디 혹은 이름을 입력해주세요!");
		}else{
			var url = "/chatting/searchFriend?searchTxt="+searchTxt;
			var name = "searchFriend";
	        var option = "width = 500, height = 500, top = 100, left = 200";
			window.open(url,name,option);
		}
		//$("#main").load("searchFriend?searchId="+searchId);
	});
	
	$("#inputTxt").on("keydown",function(e){
		if(e.keyCode==13){
			var searchTxt = $("#inputTxt").val();
			console.log(searchTxt.length);
			if(searchTxt == '' || searchTxt == null){
				alert("검색할 아이디 혹은 이름을 입력해주세요!");
			}else{
				var url = "/chatting/searchFriend?searchTxt="+searchTxt;
				var name = "searchFriend";
		        var option = "width = 500, height = 500, top = 100, left = 200";
				window.open(url,name,option);
			}
		}
	});
	
	$("#goChatList").on("click",function(){
		//$("#main").load("chatList");
		location.href="chatList";
	});
	
	$("#goProfile").on("click",function(){
		var url = "/chatting/profilePage";
		var name = "profile";
        var option = "width = 500, height = 500, top = 100, left = 200";
		window.open(url,name,option);
	});
	
	$("#goMain").on("click",function(){
		location.href="/";
	});
	</script>
</body>
</html>