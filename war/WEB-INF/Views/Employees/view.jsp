<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.*"%>
<%
	Employee employee = (Employee)request.getAttribute("employee");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<span class="nav"><a href="index.html">Back</a></span><p/>
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">DNI</td>
<td bgcolor="#ffffff"><%= employee.getDni() %></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">Nombre</td>
<td bgcolor="#ffffff"><%= employee.getName() %></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">Numero</td>
<td bgcolor="#ffffff"><%= employee.getPhone() %></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight:bold;">Correo electronico</td>
<td bgcolor="#ffffff"><%= employee.getEmail() %></td>
</tr>
</table>
</body>
</html>