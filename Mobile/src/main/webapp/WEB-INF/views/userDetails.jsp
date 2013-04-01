<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>detail</title>
</head>
<body>
	<h1>
		userMobile
	</h1>
	<table width="260">
		<tr>
			<th colspan=2>detall</th>
		</tr>
		<tr>
			<td>Nom</td>
			<td>${user.name}</td>
		</tr>
		<tr>
			<td>id</td>
			<td><fmt:formatNumber type="number" value="${user.id}" /></td>
		</tr>
		<tr>
			<td>codi</td>
			<td>${user.code}</td>
		</tr>
	</table>
	<a href="userList.htm"> &lt;&lt;Tornar</a>
</body>
</html>