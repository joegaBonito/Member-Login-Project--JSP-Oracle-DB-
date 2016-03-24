<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%! 
    	String name, id, pw;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		name = (String) session.getAttribute("name");
		id = (String) session.getAttribute("id");
		pw = (String) session.getAttribute("pw");
	%>
	
	Hello <%=name %>. <br/>
	<a href="modify.jsp">Edit your profile</a>
</body>
</html>