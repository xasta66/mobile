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
		<br>
	<div class="container">
		<h1>Detall usuari</h1>
		<br>
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
	</div>
</body>
</html>