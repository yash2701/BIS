<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>

<body>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
String user = request.getParameter("userid");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");
java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());

Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "Micro2016");

Statement stmt=con.createStatement(); 


int i = stmt.executeUpdate("Insert INTO customer (username, password, email, created_on) VALUES('" + user + "','" + pwd + "','" + email + "','" + sqlDate + "')");

if (i > 0) {
	response.sendRedirect("index.html");
} else {
	response.sendRedirect("NULL");
}
%>

	<a href="index.html">Home</a>

	

</body>
</html>