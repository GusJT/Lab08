<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.*"%>
<%
	String messaje = (String)request.getAttribute("messaje");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Telesales Demo (Google App Engine for Java)</title>
</head>
<body>
<span class="nav"><a href="index.html">Back</a></span><p/>
<span class="title">Create a New Account</span>
<p/>
<form name="post" method="post" action="add">
<input type="hidden" name="action" value="add"/>
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">DNI</td>
<td bgcolor="#ffffff"><input type="text" name="dni" pattern="[0-9]{8}" title="Ingrese su numero de DNI(8 digitos)" required></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">Nombre</td>
<td bgcolor="#ffffff"><input type="text" name="nameu" pattern="[a-Z]{2-20}" required></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight: bold;">Numero</td>
<td bgcolor="#ffffff"><input type="input" name="phone" pattern="[0-9]{6,9}" title="Ingrese un numero de 6 o 9 digitos" required></td>
</tr>
<tr bgcolor="#407BA8">
<td style="color: #ffffff; font-weight:bold;">Correo electronico</td>
<td bgcolor="#ffffff"><input type="input" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="caracteres@nombre del dominio" required></td>
</tr>
<tr>
<td colspan="2" bgcolor="#ffffff" align="center"><input type="submit" value="Submit"></td>
</tr>
</table>
</form>
</body>
</html>