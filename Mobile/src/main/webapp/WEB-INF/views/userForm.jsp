<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>

<script src="./js/bootstrap.js"></script>
<link rel="stylesheet" href="./css/bootstrap-responsive.css" />
<link rel="stylesheet" href="./css/bootstrap.css" />


<style>
body {
	padding-top: 60px;
	/* 60px to make the container go all the way to the bottom of the topbar */
}
</style>

</head>
<body>
	<div class="container">
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand" href="#">Manteniment usuaris Mobile</a>
			</div>
		</div>
		<br>
		<form:form modelAttribute="user" action="userForm.htm" method="post">
			<table>
				<tr>
					<td align="right" valign="bottom"><c:choose>
							<c:when test="${user.id == null}">
								<button type="submit" name="create">Create</button>
							</c:when>
							<c:otherwise>
								<button type="submit" name="delete"
									onclick="return confirm('Are you sure you want to delete ${user.name}?')">
									Delete</button>
								<button type="submit" name="update">Update</button>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>
						<table class="silver">
							<tr>
								<th colspan=2>Nom</th>
							</tr>
							<tr>
								<td>Nom</td>
								<td><form:input path="name" class="input-block-level" /> <form:errors
										path="name" cssClass="errors" /></td>
							</tr>
							<tr>
								<td>Codi</td>
								<td><form:input path="code" class="input-block-level" /> <form:errors
										path="code" cssClass="errors" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form:form>
		<a href="userList.htm">&lt;&lt;Tornar</a>
	</div>
</body>
</html>
