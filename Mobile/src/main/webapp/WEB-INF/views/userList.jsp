<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
</head>
<body>
	<h1>Manteniment usuaris</h1>
	<table>
		<tr>
			<td align="right" valign="bottom">
				<a href="userForm.htm">Nou</a>
			</td>
		</tr>
		<tr>
			<td>
				<table class="silver" width="180">
					<tr>
						<th></th>
					</tr>
					<c:forEach items="${users}" var="user">
						<tr>
							<td>
								<a href="userDetails.htm?id=${user.id}">${user.name} </a>
							</td>
							<td width="20">
								<a href="<c:url value='userForm.htm?id=${user.id}'/>">Modificar</a>
							</td>							
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>