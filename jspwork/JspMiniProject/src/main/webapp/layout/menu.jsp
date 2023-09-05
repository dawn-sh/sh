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
<%
	//절대경로잡기 .... /JspMiniProject
	String root=request.getContextPath();

	String id=(String)session.getAttribute("myid");
	String loginok=(String)session.getAttribute("loginok");
%>

<link rel="stylesheet" type="text/css" href="<%=root %>/menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=root %>/menu/css/menu.css">
    
<script type="text/javascript" src="<%=root %>/menu/js/jquery.js"></script>
<script type="text/javascript" src="<%=root %>/menu/js/function.js"></script>

</head>
<body>
	<%-- <a href="<%=root%>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">Q & A</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">회원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">Shop</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="#"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=root%>">Home</a></li>
					<li class="parent">
						<a href="#">about 회원</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=login/loginmain.jsp"><i class="icon-wrench"></i> 로그인</a></li>
							<li><a href="<%=root%>/index.jsp?main=member/memberform.jsp"><i class="icon-credit-card"></i> 회원가입</a></li>
							<%
								if(loginok!=null && id.equals("admin"))
								{ //loginok!=null은 혹시나 하는 null값 체크
							%>
							<li><a href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i class="icon-gift"></i> 회원목록</a></li>
							<%}
							%>
							<li><a href="<%=root%>/index.jsp?main=member/myinfo.jsp"><i class="bi bi-info-square-fill"></i></i> MyInfo</a></li>
						</ul>
					</li>
					<li><a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">회원방명록</a></li>
					<li class="parent">
						<a href="<%=root%>/index.jsp?main=board/boardlist.jsp">스마트게시판</a>
					</li>
					<li><a href="<%=root%>/index.jsp?main=load/map.jsp">찾아오시는길</a></li>
					
					<li class="parent">
						<a href="#">쇼핑몰</a>
						<ul class="sub-menu">
							<%
								if(loginok!=null && id.equals("admin"))
								{ //loginok!=null은 혹시나 하는 null값 체크
							%>
							<li><a href="<%=root%>/index.jsp?main=shop/addform.jsp">상품등록</a></li>
							<%}
							%>
							<li><a href="<%=root%>/index.jsp?main=shop/shoplist.jsp">상품목록</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>  
</body>
</html>