<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<h2>WEB-INF에 있는 이미지들</h2>
	<!-- mappgin주소가 /board/insert/data로 되어 있어서
		 맨 앞의 "/"의 의미는 start 뒤에 있는 "/" 기존 폴더를 2번 앞에 가서 시작해야 이미지가 제대로 나옴
		 즉 ../../ 하게 되면 start/image/11.png 라는 뜻을 가지게 됨 -> image는 servlet-context.xml에서 설정해준 mapping 
		 -> servlet-context.xml에서 base-package를 start로 잡아 놨음 .. start가 루트로 시작 -->
	<img alt="" src="../../image/11.png">
	<img alt="" src="../../image/shop/17.png">
</body>
</html>