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
	<%
		/* getParameter("name")는 value값을 가져온다 Values가 붙으면 복수 */
		String per1=request.getParameter("person");
		/* 복수선택으로 여러개 와야하기 때문에 배열/checkbox 처럼 사용 */
		String per2[]=request.getParameterValues("person2");
	%>
	
	조장1순위: <%=per1 %><br><br>
	
	예비조장: 
	
	<%
		if(per2==null)
		{%>
			<b style="color: red;">예비조장 없음</b>	
		<%}
		else
		{
			for(int i=0;i<per2.length;i++)
			{%>
				
				[<%=per2[i] %>]&nbsp;
			<%}%>
			<b>총 <%=per2.length %>명의 예비조장 있음</b>	
		<%}
	%>
</body>
</html>