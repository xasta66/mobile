<%@ include file="/WEB-INF/views/include.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/styleBootstrap.css" rel="stylesheet"/>
<style type="text/css">

</style>
<link href="css/bootstrap-responsive.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

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
		<table class="table">
			<tr>
				<td class="rightCell">Nom:</td>
				<td>${model.user.name}</td>									
				<td class="rightCell">Codi:</td>
				<td>${model.user.code}</td>
			</tr>
			<tr>
				<td class="rightCell">Primer cognom:</td>				
				<td>${model.user.surname_1}</td>
				<td class="rightCell">Segon cognom:</td>					
				<td>${model.user.surname_2}</td>
			</tr>	
			<tr>
				<td class="rightCell">Mail:</td>				
				<td>${model.user.mail}</td>
				<td class="rightCell">Mot clau:</td>					
				<td>${model.user.password}</td>
			</tr>				
		</table>
		<div class="pull-right">
			<a href="javascript:history.back()" class="btn btn-small btn-primary">Tornar</a>
		</div>
		<br>
		<footer>
			<hr>		
			<p>&copy; 2012</p>
		</footer>	
	</div>
</body>
</html>