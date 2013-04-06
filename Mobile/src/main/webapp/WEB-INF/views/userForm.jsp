<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Form Usuari</title>

<link rel="stylesheet" href="./css/bootstrap.css" />
<style type="text/css"></style>
<link rel="stylesheet" href="./css/styleBootstrap.css" />
<link rel="stylesheet" href="./css/bootstrap-responsive.css" />

<script src="./js/bootstrap.js"></script>

</head>
<body>
			<div class="navbar">
				<div class="navbar-inner">
					<a class="brand" href="#">Manteniment usuaris Mobile</a>
				</div>
			</div>
		<div class="container">
			<c:choose>
				<c:when test="${user.id == null}">
					<h3>Nou usuari</h3>		 
				</c:when>
				<c:otherwise>
					<h3>Editar usuari</h3>	 
				</c:otherwise>
			</c:choose>	
			<br>					
			<form:form modelAttribute="user" action="userForm.htm" method="post">
			<div class="well">
				<div class="row">
					<div class="span2">Nom:</div>
					<div class="span3">
						<form:input path="name" class="input-block-level" />
						<form:errors path="name" cssClass="errors" />
					</div>
					<div class="span2">Codi:</div>
					<div class="span3">
						<form:input path="code" class="input-block-level" />
						<form:errors path="code" cssClass="errors" />
					</div>
				</div>
				<div class="row">
					<div class="span2">Primer cognom:</div>
					<div class="span3">
						<form:input path="surname_1" class="input-block-level" />
						<form:errors path="surname_1" cssClass="errors" />
					</div>

					<div class="span2">Segon cognom:</div>
					<div class="span3">
						<form:input path="surname_2" class="input-block-level" />
						<form:errors path="surname_1" cssClass="errors" />
					</div>
				</div>
				<div class="row">
					<div class="span2">Correu:</div>
					<div class="span3">
						<form:input path="mail" class="input-block-level" />
						<form:errors path="mail" cssClass="errors" />
					</div>

					<div class="span2">Mot clau:</div>
					<div class="span3">
						<form:input path="password" class="input-block-level" />
						<form:errors path="password" cssClass="errors" />
					</div>
				</div>
			</div>
			<a href="javascript:history.back()" class="btn">Cancel&middot;lar</a>
			<c:choose>
				<c:when test="${user.id == null}">
					<button class="btn btn-primary" type="submit" name="create">Crear</button>		 
				</c:when>
				<c:otherwise>
					<button class="btn btn-primary" type="submit" name="update">Guardar</button>		 
				</c:otherwise>
			</c:choose>			
			</form:form>
 		</div>
</body>
</html>
