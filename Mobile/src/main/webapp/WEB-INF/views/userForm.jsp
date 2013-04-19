<%@ include file="/WEB-INF/views/include.jsp"%>
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
		<form:form class="form-horizontal" modelAttribute="user" action="userForm.htm" method="post" id="userFrom">	
			<c:choose>
				<c:when test="${user.id == null}">
					<legend>Nou usuari</legend>
				</c:when>
				<c:otherwise>
					<legend>Editar usuari</legend>
				</c:otherwise>
			</c:choose>
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="name">Nom</label>
								<div class="controls">
									<form:input path="name" class="input-block-level" />
									<form:errors path="name" cssClass="errors" />
								</div>
							</div>
						</div>
						<!--/span-->
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="code">Codi</label>
								<div class="controls">
									<form:input path="code" class="input-block-level" />
									<form:errors path="code" cssClass="errors" />
								</div>
							</div>
						</div>
						<!--/span-->
					</div>
					<!--/row-->
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="surname_1">Primer Cognom</label>
								<div class="controls">
									<form:input path="surname_1" class="input-block-level" />
									<form:errors path="surname_1" cssClass="errors" />
								</div>
							</div>
						</div>
						<!--/span-->
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="surname_2">Segon Cognom</label>
								<div class="controls">
									<form:input path="surname_2" class="input-block-level" />
									<form:errors path="surname_2" cssClass="errors" />
								</div>
							</div>
						</div>
						<!--/span-->
					</div>
					<!--/row-->
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="mail">Mail</label>
								<div class="controls">
									<form:input path="mail" class="input-block-level" />
									<form:errors path="mail" cssClass="errors" />
								</div>
							</div>
						</div>
						<!--/span-->
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="password">Mot clau</label>
								<div class="controls">									
									<div class="input-append">
									  	<form:input path="password" class="input-block-level" />
									 	<a class="btn" type="submit" onclick="genPwd();">Generar</a>
									</div>					
									<form:errors path="password" cssClass="errors" />									
								</div>								
							</div>
						</div>
						<!--/span-->
					</div>
					<!--/row-->


					<fieldset>
						<legend>Address</legend>
						<div class="row-fluid">
							<div class="span12">
								<div class="control-group">
									<label class="control-label" for="street">Street</label>
									<div class="controls">
										<input type="text" class="input-xxlarge" id="street">
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="city">City</label>
									<div class="controls">
										<input type="text" id="city">
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="state">State</label>
									<div class="controls">
										<input type="text" id="state">
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="postCode">Post Code</label>
									<div class="controls">
										<input type="text" id="postCode">
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="country">Country</label>
									<div class="controls">
										<select id="country">
										<option id="0"></option>										
										<option id="1">Andorra</option>
										<option id="2">Espanya</option>										
										</select>
									</div>
								</div>

							</div>
							<!--/span-->
						</div>
						<!--/row-->
					</fieldset>
				</div>
				<!--/span-->

				<div class="span4"></div>
				<!--/span-->
			</div>
			<!--/row-->
			<div class="pull-right">
				<a href="userList.htm" class="btn">Cancel&middot;lar</a>&nbsp;&nbsp;
				<c:choose>
					<c:when test="${user.id == null}">
						<button class="btn btn-primary" type="submit" name="create">Crear</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-primary" type="submit" name="update">Guardar</button>
					</c:otherwise>
				</c:choose>
			</div>
		</form:form>

		<br>

		<footer>
			<hr>		
			<p>&copy; 2012</p>
		</footer>

	</div>
	<!--/.container-->


	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.9.1.js"></script>	
	<script src="js/jquery.validate.js"></script>		
	<script type="text/javascript">
	
	
	function genPwd(){
		
		$.ajax({
		    type:"GET",
		    url:"genPwd.htm",
            success : function(response) { 
				$("#password").val(response);
            }

		 });	
		
		
	}
	
	
	$(document).ready(function () {
		
		// on ready add error class to the spring validator errors
		$("span.errors").filter(function() {
		     var txt = this.textContent || this.innerText;
		     return txt != '';
		}).parent().closest('.control-group').addClass('error');		

        $("#userFrom").validate({
		    rules: {
			      name: {
			        required: true
			      },
			      code: {
			      	minlength: 10,
			      	maxlength: 10,
			        required: true
			      },
			      surname_1: {
			        required: true
			      },
			      surname_2: {
			        required: true
			      },
			      mail: {
			        required: true,
			        email: true
			      },
			      password: {
				    minlength: 8,
				    maxlength: 8,
			        required: true
			      }
			    },
				highlight: function(element) {
					$(element).closest('.control-group').addClass('error');
				},
				success: function(element) {
					$(element).closest('.control-group').removeClass('error');
				},
        });	
	});
	</script>

</body>
</html>

