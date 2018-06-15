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
<form name="post" method="post" action="edit">
<input type="hidden" name="id" value="<%= employee.getId() %>"/>
<input type="hidden" name="info" value="editar"/>
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">DNI</td>
<td bgcolor="#ffffff"><input type="text" name="dni" value="<%= employee.getDni() %>" pattern="[0-9]{8}" title="Ingrese su numero de DNI(8 digitos)" required></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">Nombre</td>
<td bgcolor="#ffffff"><input type="text" name="nameu" value="<%= employee.getName() %>" pattern="[a-Z]{2-20}" required></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">Numero</td>
<td bgcolor="#ffffff"><input type="input" name="phone" value="<%= employee.getPhone() %>" pattern="[0-9]{6,9}" title="Ingrese un numero de 6 o 9 digitos" required></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight:bold;">Correo electronico</td>
<td bgcolor="#ffffff"><input type="input" name="email" value="<%= employee.getEmail() %>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="caracteres@nombre del dominio" required></td>
</tr>
<tr>
<td colspan="2" bgcolor="#ffffff" align="center"><input type="submit" value="Submit"></td>
</tr>
</table>
</form>
</body>
</html>