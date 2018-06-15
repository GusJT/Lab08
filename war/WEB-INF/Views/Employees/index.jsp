<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%
	List<Employee> employees = (List<Employee>)request.getAttribute("employees");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="/index.html">Regresar</a>
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">
<tr>
<td>ID</td>
<td>DNI</td>
<td>Nombre</td>
<td>Numero</td>
<td>Email</td>
<td>Status</td>
</tr>
<% if (employees.size() > 0) { %>
	<% for (int i = 0;i<employees.size();i++) { %>
		<% Employee e = (Employee)employees.get(i); %>
		<tr style="background:#ffffff" onMouseOver="this.style.background='#eeeeee';" onMouseOut="this.style.background='#ffffff';">
		<td nowrap style="font-weight: bold;"><%= e.getId() %></td>
		<td style="font-weight: bold;"><%= e.getDni() %></td>
		<td style="font-weight: bold;"><%= e.getName() %></td>
		<td style="font-weight: bold;"><%= e.getPhone() %></td>
		<td style="font-weight: bold;"><%= e.getEmail() %></td>
		<td style="font-weight: bold;"><%= e.getStatus() %></td>
		<td><a href="/view?id=<%= e.getId() %>">View</a></td>
		<td><a href="/edit?id=<%= e.getId() %>">Edit</a></td>
		<td><form name="post_<%= e.getId() %>" style="display:none;" method="post" action="delete"><input type="hidden" name="employeeId" value="<%= e.getId() %>"/></form><a href="#" onclick="if (confirm(&quot;Are you sure you want to delete # <%= e.getId() %>?&quot;)) { document.post_<%= e.getId() %>.submit(); } event.returnValue = false; return false;">Delete</a></td>
		</tr>
	<% } %>
</table>
<% } else { %>
<p/><span class="heading">No hay empleados registrados</span>
<% } %>
</body>
</html>