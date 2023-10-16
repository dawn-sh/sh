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
	<h3>ex3번 예제</h3>
	<br>
	<button type="button" id="btn3" class="btn btn-warning">list3 json 배열 데이터 출력하기</button>
	
	<div id="out3"></div>
	
	<script type="text/javascript">
		$("#btn3").click(function(){
			
			$.ajax({
				
				data:"get",
				dataType:"json",
				url:"list3",
				success:function(res){
					
					var s="";
					
					$.each(res,function(i,elt){
						
						/* figure 사진을 담는 태그 / figcaption 설명을 담는 태그 */
						s+="<figure>";
						s+="<img src='image/"+elt.photo+"' width='100'>";
						s+="<figcaption><b>";
						s+=elt.name;
						s+="</b></figcaption>";
						s+="</figure>";
					});
					
					
					$("#out3").html(s);
				}
			});
		});
	</script>
	
</body>
</html>