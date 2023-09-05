<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id=request.getParameter("id");
	
	MemberDao dao=new MemberDao();
	
	int check=dao.isIdCheck(id);
	
	JSONObject ob=new JSONObject();
	ob.put("check", check);

%>

<%-- 기존 url?id=값...값에 db에 있는 값을 넣으면 1/ 없는 값을 넣으면 0 --%>
<%=ob.toString()%>