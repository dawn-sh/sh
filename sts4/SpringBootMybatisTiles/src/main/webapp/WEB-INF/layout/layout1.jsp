<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> <!-- layout시 taglib 추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
  box-sizing: border-box;
}

body {
  font-family: 'Gamja Flower';
  padding: 10px;
  background: #f1f1f1;
}

/* Header/Blog Title */
div.title {
  font-family: 'Gamja Flower';
  padding: 30px;
  text-align: center;
  background: white;
}

div.title b{
	font-size: 50px;
}

div.title a{
	text-decoration: none;
	color: black;
}

/* Style the top navigation bar */
div.menu {
  font-family: 'Gamja Flower';
  font-size: 1.1em;
  overflow: hidden;
  background-color: #333;
  padding-left: 5%;
}

/* Style the topnav links */
div.menu a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  margin-left: 10px;
  width: 10%;
}

/* Change color on hover */
div.menu a:hover {
  background-color: #ddd;
  color: black;
}

div.main img{
	border: 1px solid #f1f1f1;
	width: 150px;
	margin-right: 30px;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
div.row{
	font-family: 'Gamja Flower';
	font-size: 1.1em;
}

div.leftcolumn {   
  float: left;
  width: 20%;
}

/* Right column */
div.rightcolumn {
  float: left;
  width: 80%;
  background-color: #f1f1f1;
  padding-left: 20px;
  font-size: 1.7em;
}

/* Add a card effect for articles */
div.card {
  background-color: white;
  padding: 20px;
  margin-top: 20px;
}

/* Clear floats after the columns */
div.row::after {
  content: "";
  display: table;
  clear: both;
}

/* Footer */
div.footer {
  padding: 20px;
  text-align: center;
  margin-top: 20px;
  border: 1px solid #f1f1f1;
  
}


/* 	div.layout div{
		border: 1px solid black;
	}
	
	div.layout div.title{
		position: absolute;
		top: 10px;
		left: 450px;
		height: 100px;
	}
	
	div.layout div.menu{
		position: absolute;
		top: 150px;
		left: 250px;
		height: 100px;
	}
	
	div.layout div.info{
		position: absolute;
		top: 250px;
		left: 50px;
		height: 200px;
		font-family: 'Dongle';
		font-size: 17px;
		width: 200px;
	}
	
	div.layout div.main{
		position: absolute;
		top: 250px;
		left: 250px;
		height: 500px;
		font-family: 'Dongle';
		font-size: 17px;
		width: 950px;
	} */
</style>
</head>
<body>
<div class="layout">
	<div class="title">
		<tiles:insertAttribute name="title"/>
	</div>
	<div class="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="row">
		<div class="leftcolumn">
			<div class="card">
				<tiles:insertAttribute name="info"/>
			</div>
		</div>
		<div class="rightcolumn">
			<div class="card">
				<tiles:insertAttribute name="main"/>
			</div>
		</div>
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>