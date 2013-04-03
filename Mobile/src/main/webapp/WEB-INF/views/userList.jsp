<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>

<script src="./js/bootstrap.js"></script>
<script src="./js/bootstrap-min.js"></script>
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
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="brand" href="#">Manteniment usuaris Mobile</a>
				</div>						
			</div>		
		</div>	
		<br>
				
		<button class="btn btn-small btn-primary" onclick="location.href='userForm.htm'">Nou usuari</button>
		<p>&ensp;</p>
		<div class="well">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Codi</th>
						<th>Nom</th>
						<th></th>											
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.code}</td>
							<td>${user.name} ${user.surname_1}</td>
							<td>
								<a href="userDetails.htm?id=${user.id}"><i class="icon-file"></i></a>						
								<a href="userForm.htm?id=${user.id}"><i class="icon-pencil"></i></a>
	              				<a href="#detailModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>						
								<a href="#mailModal" role="button" data-toggle="modal"><i class="icon-envelope"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Modal detall 
	 ================================================== -->
	<div class="modal small hide fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
	    <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	        <h3 id="detailModalLabel">Confirmaci&oacute; eliminar</h3>
	    </div>
	    <div class="modal-body">
	        <p class="error-text">Estas segur que vols eliminar aquest usuari?</p>
	    </div>
	    <div class="modal-footer">
	        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel&middot;lar</button>
	        <button class="btn btn-danger" data-dismiss="modal" onclick="alert('borrar')">Eliminar</button>
	    </div>
	</div>

	<!-- Modal Mail 
	 ================================================== -->
	<div class="modal small hide fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="mailModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			<h3 id="mailModalLabel">Mail</h3>
		</div>
		<div class="modal-body">
			<form class="well span8">
				<div class="row">
					<div class="span3">
						<label>First Name</label> <input type="text" class="span3"
							placeholder="Your First Name"> <label>Last Name</label> <input
							type="text" class="span3" placeholder="Your Last Name"> <label>Email
							Address</label> <input type="text" class="span3"
							placeholder="Your email address"> <label>Subject</label>
						<select id="subject" name="subject" class="span3">
							<option value="na" selected="">Choose One:</option>
							<option value="service">General Customer Service</option>
							<option value="suggestions">Suggestions</option>
							<option value="product">Product Support</option>
						</select>
					</div>
					<div class="span5">
						<label>Message</label>
						<textarea name="message" id="message" class="input-xlarge span5"
							rows="10"></textarea>
					</div>

					<button type="submit" class="btn btn-primary pull-right">Send</button>
				</div>
			</form>
		</div>
	</div>


		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="./js/jquery-1.9.1.js"></script>
		<script src="./js/bootstrap-modal.js"></script>
		<script src="./js/bootstrap-transition.js"></script>
</body>
</html>