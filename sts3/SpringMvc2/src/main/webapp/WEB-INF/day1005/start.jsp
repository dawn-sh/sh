<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>안녕하세요 우리는 오늘부터 <br>스프링 MVC 에 대해 공부합니다</h2>
	<h2>StartController로 부터 포워드</h2>
	<!-- StartController에서 model에 저장한 값을 달러{저장한 이름(requestScope. 생략가능)}으로 불러올 수 있음 -->
	<b>이름:${requestScope.name }</b><br>
	<b>주소:${addr }</b><br>
	
	<h1 class="alert alert-info">메핑연습</h1>
	<ul>
		<li><a href="apple/list">apple/list</a></li>
		<li><a href="apple/list.do">apple/list.do</a></li>
		<li><a href="apple/list.nhn">apple/list.nhn</a></li>
		<li><a href="banana/insert">banana/insert</a></li>
		<li><a href="orange/delete">orange/delete</a></li>
	</ul>
	
	
	<!-- 이미지는 webapp에 resources로 가져오고 설정은 spring/appServlet/servlet-context.xml에서 한다 -->
	<h1 class="alert alert-success">이미지연습</h1>
	<ul>
		<li><a href="shop/detail">resource의 이미지 출력</a></li>
		<li><a href="board/insert/data">WEB-INF의 이미지 출력</a></li>
	</ul>
</body>
</html>