<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 
String userid = request.getParameter("usrid");
String pwd = request.getParameter("pwd");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
        "postgres", "Micro2016");

Statement st = con.createStatement();
ResultSet rs= st.executeQuery("select *from public.customer where username='"+ userid +"' and password='"+ pwd +"'");
if(rs.next())
{
	  session.setAttribute("userid", userid);
	  response.sendRedirect("Main.jsp");
}
else
{
	  out.println("Login Failed");
  
}
%>

</body>
</html>