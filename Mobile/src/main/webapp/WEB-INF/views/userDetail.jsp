<%@ include file="/WEB-INF/views/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Detall Usuari</title>

<link rel="stylesheet" href="./css/bootstrap.css" />
 <style></style>
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
		<h3>Detall usuari</h3>
		<br>
		<div class="well">
			<table class="table table-bordered">
				<tr>
					<td>Codi: ${model.user.code}</td>
					<td>Nom: ${model.user.name}&ensp;${model.user.surname_1}&ensp;${model.user.surname_2}</td>
				</tr>
				<tr>
					<td>mail: ${model.user.mail}</td>
					<td>Mot calu: ${model.user.password}</td>
				</tr>				
			</table>
		</div>
		<a href="javascript:history.back()" class="btn btn-small btn-primary">Tornar</a>
	</div>
</body>
</html>