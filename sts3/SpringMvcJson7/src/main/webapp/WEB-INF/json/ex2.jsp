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
	<h3>ex2번 예제</h3>
	<br>
	<button type="button" id="btn2" class="btn btn-danger">list2 json데이터 출력하기</button>
	
	<div id="out2"></div>
	
	<script type="text/javascript">
		$("#btn2").click(function(){
			
			$.ajax({
				
				data:"get",
				dataType:"json",
				url:"list2",
				success:function(data){
					
					$("#out2").empty();
					$("#out2").append("상품이름: "+data.product+"<br>");
					$("#out2").append("상품가격: "+data.price+"<br>");
					$("#out2").append("보증기간: "+data.warrenty+"<br>");
					
				}
			});
		});
	</script>
	
</body>
</html>