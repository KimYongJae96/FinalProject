<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사 공지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

* {
	box-sizing: border-box;
}

.headt1 {
	font-family: 'GmarketSansMedium';
	font-size: 13px;
	text-align: center;
	color: white;
	background-color: #435a7c;
}

.headt2 {
	font-family: 'GmarketSansLight';
	background-color: white;
}

nav {
	background-color: white;
}

.nav-item {
	font-size: 20px;
}

#pop {
	cursor: pointer;
}

#box {
	border: 1px solid black;
	border-radius: 10px;
}
#nav-ul{
	width:100%;
}
#subLabel{
	width:fit-content;
	color:white;
}

#sideBox{
	max-height:300px;
}
</style>
</head>
<body>
	<div class="contatiner">
		<div class="row">
			<div class="col">
				<input type="hidden" value="">
			</div>
		</div>
		<div class="row headt1 p-2">
			<div class="col-8 col-md-9"></div>
			<div class="col-2 col-md-1">로그인</div>
			<div class="col-2 col-md-1" id="pop">팝업창</div>
			<div class="col-0 col-md-1"></div>
		</div>
		<div class="row headt2 p-2">
			<nav class="navbar navbar-expand-xl navbar-light"
				style="background-color: white">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"><img src="/img/logo.PNG"></a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
						aria-controls="navbarTogglerDemo02" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item p-3"><a class="nav-link active"
								aria-current="page" href="introduce.home"><b>학교소개</b></a></li>
							<li class="nav-item p-3"><a class="nav-link active" href="/academicList.notice?page=1"
								tabindex="-1"><b>공지사항</b></a></li>
							<li class="nav-item p-3"><a class="nav-link active" href="#"
								tabindex="-1"><b>학사스케쥴</b></a></li>
							<li class="nav-item p-3"><a class="nav-link active" href="#"
								tabindex="-1"><b>게시판</b></a></li>
							<li class="nav-item p-3"><a class="nav-link active" href="/reference/refList.ref?page=1"
								tabindex="-1"><b>자료실</b></a></li>
							<li class="nav-item p-3"><a class="nav-link active" href="#"
								tabindex="-1"><b>채팅</b></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="container">
		<div class="row pt-3">
			<div class="d-flex flex-row-reverse">
				<div class="bd-highlight d-none d-lg-block">
					<h5>
						<a href="/">Home&gt;</a><a href="/academicList.notice?page=1">공지사항&gt;</a><a href="/academicList.notice?page=1">학사공지</a>
					</h5>
				</div>
			</div>
			<div class="d-flex d-none d-lg-block m-2 bg-dark p-5" id="subLabel" >
			<h3><b>공지사항</b></h3>
			</div>
		</div>
			<div class="row">
				<div class="col-lg-2 d-grid text-center" id="sideBox">
					<!--collapse 추가  -->
					<nav class="navbar navbar-expand-lg mb-2 nav-pills nav-justified "style="background-color: #e3f2fd; border-radius: 10px">
					<div class="col d-grid">
						<button type="button" class="btn mb-1 d-block d-lg-none "data-bs-toggle="collapse" data-bs-target="#listCollapse" ><b>공지사항</b></button>
					</div>
						<div class="collapse navbar-collapse" id="listCollapse" >
							<ul class="navbar-nav flex-column" id="nav-ul">
								<li class="nav-item" ><a class="nav-link " href="/normalList.notice?page=1">일반공지</a>
								</li>
								<li class="nav-item"><a class="nav-link active" href="/academicList.notice?page=1">학사공지</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">장학공지</a>
								</li>
								<li class="nav-item "><a class="nav-link" href="#">취업공지  </a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="col-lg-10 d- pt-4" id="box">
					<div class="row">
						<div class="col-12">
							<H3>
								<b>학사공지</b>
							</H3>
						</div>
						<div class="col-12">
							<form action="/searchacademic.notice?page=1" method="post" class="row">
								<div class="col-md-6 order-md-2">
									<div class="row p-4">
										<div class="col-sm-12 col-md-3 p-0">
											<select class="form-select" name="category" id="select">
												<option value="1"${category == '1' ? 'selected="selected"' : ''}>제목</option>
												<option value="2"${category == '2' ? 'selected="selected"' : ''}>내용</option>
												<option value="3"${category == '3' ? 'selected="selected"' : ''} >제목+내용</option>			
											</select>
										</div>
										<div class="col-sm-12 col-md-6 p-0">
											<input class="form-control" name="content" type="search" placeholder="검색어를 입력해주세요">
										</div>
										<div class="col-sm-12 col-md-3 p-0 d-grid">
											<button type="submit" class="btn btn-primary d-md-block" id="search">검색</button>
										</div>
									</div>
								</div>
								<div class="col-md-6  align-self-center">현재 ${count}건 | 현재 ${page}/${end} 페이지</div>
							</form>
						</div>
					</div>
					<div class="row text-center" style="border-bottom: 1px solid black">
						<div class="col-md-2 d-none d-md-block">번호</div>
						<div class="col-md-4 d-none d-md-block">제목</div>
						<div class="col-md-2 d-none d-md-block">등록일</div>
						<div class="col-md-2 d-none d-md-block">첨부파일</div>
						<div class="col-md-2 d-none d-md-block">조회수</div>
					</div>
					<c:forEach var="i" items="${list}">
						<div class="row" style="border-bottom: 1px solid black">
							<div class="col-md-2 d-none d-md-block text-center">${i.rn}</div>
							<div class="col-md-4 col-12 text-left"><a href="/academicView.notice?seq=${i.n_seq}">${i.title}</a></div>
							<div class="col-md-2 col-3 text-center">
							<fmt:parseDate var="Date" value="${i.writedate}" pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${Date}" type="date" pattern="yyyy-MM-dd"/>
                            </div> 
                            <c:choose>
                           	<c:when test="${i.file == 'Y'}">
								<div class="col-md-2 col-3 text-center"><a href="/downloadAcademicAll.notice?seq=${i.n_seq}&title=${i.title}"><img src="/img/file.png"></a></div>
							</c:when>
							<c:otherwise>
								<div class="col-md-2 col-3 text-center"></div>
							</c:otherwise>	
							</c:choose>
							<div class="col-md-2 d-none d-md-block text-center">${i.view_count}</div>
						</div>
					</c:forEach>
					<c:if test="${!empty list}">
					<c:choose>
					<c:when test="${type=='default'}">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mt-3" >
							<li class="page-item"><a class="page-link" href="/academicList.notice?page=1" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
							<li class="page-item"><a class="page-link" href="/academicList.notice?page=${page-1}"><span aria-hidden="true">&lt;</span></a></li>
						<c:set var="nav" value="${fn:split(navi,'/')}"></c:set>
						<c:forEach items="${nav}" var="i">
							<li class="page-item d-none d-md-block"><a class="page-link" href="/academicList.notice?page=${i}">${i}</a></li>
						</c:forEach>
							<li class="page-item d-block d-md-none"><a class="page-link"><span>${page} / ${end}</span></a></li>
							<li class="page-item"><a class="page-link" href="/academicList.notice?page=${page+1}"><span aria-hidden="true">&gt;</span></a></li>
							<li class="page-item"><a class="page-link" href="/academicList.notice?page=${end}"aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					</c:when>
					<c:otherwise>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mt-3" >
							<li class="page-item"><a class="page-link" href="/searchAcademic.notice?page=1&category=${category}&content=${content}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
							<li class="page-item"><a class="page-link" href="/searchAcademic.notice?page=${page-1}&category=${category}&content=${content}"><span aria-hidden="true">&lt;</span></a></li>
						<c:set var="nav" value="${fn:split(navi,'/')}"></c:set>
						<c:forEach items="${nav}" var="i">
							<li class="page-item d-none d-md-block"><a class="page-link" href="/searchAcademic.notice?page=${i}&category=${category}&content=${content}">${i}</a></li>
						</c:forEach>
							<li class="page-item d-block d-md-none"><a class="page-link"><span>${page} / ${end}</span></a></li>
							<li class="page-item"><a class="page-link" href="/searchAcademic.notice?page=${page+1}&category=${category}&content=${content}"><span aria-hidden="true">&gt;</span></a></li>
							<li class="page-item"><a class="page-link" href="/searchAcademic.notice?page=${end}&category=${category}&content=${content}"aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					</c:otherwise>
					</c:choose>
					</c:if>
				</div>
			</div>
		</div>
		<!-- footer -->
		<footer>
			<jsp:include page="/WEB-INF/views/footer.jsp" />
		</footer>
	</div>
</body>
</html>