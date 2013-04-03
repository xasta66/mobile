<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>

<script src="./js/bootstrap.js"></script>
<link rel="stylesheet" href="./css/bootstrap-responsive.css"/>
<link rel="stylesheet" href="./css/bootstrap.css"/>


    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>

</head>
<body>
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand" href="#">Manteniment usuaris Mobile</a>
			</div>
		</div>
		<h3>Detall usuari</h3>
		<br>
		<div class="well">
			<table class="table table-bordered">
				<tr>
					<td>Codi: ${user.code}</td>
					<td>Nom: ${user.name}&ensp;${user.surname_1}&ensp;${user.surname_2}</td>
				</tr>
				<tr>
					<td>mail: ${user.mail}</td>
					<td>Mot calu: ${user.password}</td>
				</tr>				
			</table>
		</div>
		<a href="userList.htm" class="btn btn-small btn-primary">Tornar</a>
	</div>
</body>
</html>