<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$("i.camera").click(function(){
				
			$("#photo").trigger("click");//이벤트 강제 호출 
		});
	});
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
            $('#showimg').attr('src', e.target.result);
            }
            //File내용을 읽어 dataURL형식의 문자열로 저장 
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</head>
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getData(num);
%>
<body>

<%-- 이미지 미리보기 --%>
<img alt="" src="<%=dto.getPhotoname()==null?"":"save/"+dto.getPhotoname() %>" id="showimg" style="position: absolute; left: 800px; top: 100px;
max-width: 200px;">

<form action="guest/updateproc.jsp" method="post" enctype="multipart/form-data">
<%-- 수정폼은 반드시 hidden으로 num넘긴다 --%>
<input type="hidden" name="num" value="<%=num%>">
<%-- 수정하고 현재페이지에 머물기 위해 currentPage도 넘긴다 --%>
<input type="hidden" name="currentPage" value="<%=currentPage%>">
	<table class="table table-bordered" style="width: 600px;">
		<caption align="top"><b>방명록 수정</b>
			<i class="bi bi-camera camera"></i>
			<input type="file" name="photo" id="photo" style="visibility: hidden;"
			onchange="readURL(this)">
		</caption>
		
		<tr height="100">
			<td width="520">
				<textarea style="width: 500px; height: 100px;"
				name="content" required="required"><%=dto.getContent() %></textarea>
			</td>
			<td>
				<button type="submit" class="btn btn-outline-success"
				style="width: 100px; height: 100px;">수정</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>