<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>
<%!
	Connection connection;
	Statement stmt;
	ResultSet resultSet;
	
	String name, id, pw, phone1, phone2, phone3, gender;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		id = (String) session.getAttribute("id");
		String query = "select * from member where id = '" + id + "'";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","scott","tiger");
		stmt = connection.createStatement();
		resultSet = stmt.executeQuery(query);
		
		while(resultSet.next()) {
			name = resultSet.getString("name");
			id = resultSet.getString("id");
			pw = resultSet.getString("pw");
			phone1 = resultSet.getString("phone1");
			phone2 = resultSet.getString("phone2");
			phone3 = resultSet.getString("phone3");
			gender = resultSet.getString("gender");	
		}
		
	%>
		<form action="ModifyOk" method="post" >
		Name: <input type="text" name="name" size="10" value=<%=name %>><br/>
		ID: <%=id %> <br/>
		PW: <input type="text" name="pw" size="10"><br/>
		Phone#: <select name="phone1">
		<option value="010">010</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
		<option value="011">011</option>
		</select> -
		<input type="text" name="phone2" size="5" value=<%= phone2 %>> -
		<input type="text" name="phone3" size="5" value=<%= phone3 %>><br/>
		<% 
			if(gender.equals("male")) {
		%>
				Gender: <input type="radio" name="gender" value="male" checked="checked"> Male &nbsp; <input type="radio" name="gender" value="female"> Female <br/>
		<%
		 	} else {
		%>
				Gender: <input type="radio" name="gender" value="male"> Male &nbsp; <input type="radio" name="gender" value="female" checked="checked"> Female <br/>
		<% 
			}
		%>
		<input type="submit" value="submit"><input type="reset" value="cancel"> 
	</form>
</body>
</html>