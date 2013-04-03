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
			<a href="userForm.htm" class="btn btn-small btn-primary">Nou usuari</a>						
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
							<td>${user.name}&ensp;${user.surname_1}&ensp;${user.surname_2}</td>
							<td>
								<a href="userDetails.htm?id=${user.id}"><i class="icon-file"></i></a>						
								<a href="userForm.htm?id=${user.id}"><i class="icon-pencil"></i></a>
	              				<a href="#deleteModal" onclick="deleteUserModal(${user.id},'${user.name} ${user.surname_1} ${user.surname_2}');" role="button" data-toggle="modal"><i class="icon-remove"></i></a>						
								<a href="#mailModal"  onclick="mailUserModal('${user.mail}');" role="button" data-toggle="modal"><i class="icon-envelope"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Modal delete 
	 ================================================== -->
	<div class="modal small hide fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
	    <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	        <h3 id="deleteModalLabel">Confirmaci&oacute;</h3>
	    </div>
	    <div class="modal-body">
		    <p id="liteDeleteModal" class="error-text"></p> 
	    </div>
	    <div class="modal-footer">
	        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel&middot;lar</button>
	        <a id=urlDeleteModal href="" class="btn btn-danger">Eliminar</a>	
	    </div>
	</div>

	<!-- Modal Mail 
	 ================================================== -->
	<div class="modal small  hide fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="mailModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			<h3 id="mailModalLabel">Mail</h3>
		</div>
		<div class="modal-body well">
				<br>
				<div class="row">
					<div class="span2">Email Address:</div>
					<div class="span3">
						<input id="mailAddressModal" type="text" class="span3">
					</div>
				</div>
				<div class="row">
					<div class="span2">Subject:</div>
					<div class="span3">
						<input type="text" class="span3">
					</div>
				</div>					
				<div class="row">	
					<div class="span2">Message:</div>
				</div>
				<br>	
				<div class="row">					
					<div class="span7">	
						<textarea name="message" id="message" class="input-xlarge span7" rows="10"></textarea>
					</div>
				</div>
		</div>
		<div class="modal-footer">
	        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel&middot;lar</button>		
			<button type="submit" class="btn btn-primary pull-right">Send</button>
	    </div>
	</div>


		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="./js/jquery-1.9.1.js"></script>
		<script src="./js/bootstrap-modal.js"></script>
		<script src="./js/bootstrap-transition.js"></script>


		<script type="text/javascript">
		//events mailModal
/*		
			$('#mailModal').on('show', function () {
//
			})

				/*
			$('#mailModal').on('hidden', function () {
//				 alert('hidden modal mail');
				})
*/
				
				
		//Passar parametres deleteModal			
			function deleteUserModal(id, name) {

				var lite = "Estas segur que vols eliminar l'usuari "+ name +"?";
				var href = 'deleteUser.htm?id=' + id;
				
				$('#liteDeleteModal').html(lite);
				$('#urlDeleteModal').attr('href', href);
			}
		
			//Passar parametres deleteModal			
			function mailUserModal(mailAddress) {
				$('#mailAddressModal').val(mailAddress);
			}			
				
		</script>
</body>
</html>