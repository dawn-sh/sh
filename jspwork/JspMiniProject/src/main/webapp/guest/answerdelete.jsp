<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String idx=request.getParameter("idx");
	
	AnswerDao dao=new AnswerDao();
	
	dao.deleteAnswer(idx);
%>