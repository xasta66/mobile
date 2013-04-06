<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Lista Usuaris</title>



<link rel="stylesheet" href="./css/bootstrap.css" />
<style></style>
<link rel="stylesheet" href="./css/styleBootstrap.css" />
<link rel="stylesheet" href="./css/bootstrap-responsive.css" />

<script src="./js/bootstrap.js"></script>

</head>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="#">Manteniment usuaris Mobile</a>
				<form class="navbar-search pull-right" action="userList.htm"  method="post">
					<input type="hidden" name="pageNo" id="pageNo"  value="${model.pageNumber}">					
 					<input type="text"      name="search"  id="search" class="search-query" placeholder="Cerca" value ="${model.search}">
				</form>		
			</div>				
		</div>		
	</div>			
	<div class="container-fluid">	
		<div class="well-fluid">
			<div class="span3">
	          <div class="well sidebar-nav">
	            <ul class="nav nav-list">
	              <li class="nav-header">Sidebar</li>
	              <li class="nav-line"><a href="userForm.htm">Nou usuari</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li class="nav-header">Sidebar</li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	            </ul>
	          </div>
	        </div>
			<div class="span9">
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
						<c:forEach items="${model.users}" var="user">
							<tr>
								<td>${user.id}</td>
								<td>${user.code}</td>
								<td>${user.name}&ensp;${user.surname_1}&ensp;${user.surname_2}</td>
								<td>
									<a href="userDetail.htm?id=${user.id}&pageNo=${model.pageNumber}"><img src="img/detail.png"></a>&nbsp;						
									<a href="userForm.htm?id=${user.id}"><img src="img/edit.png"></a>&nbsp;
		              				<a href="#deleteModal" onclick="deleteUserModal(${user.id},'${user.name} ${user.surname_1} ${user.surname_2}');" role="button" data-toggle="modal"><img src="img/bin.png"></a>&nbsp;						
									<a href="#mailModal"  onclick="mailUserModal('${user.mail}');" role="button" data-toggle="modal"><img src="img/envelope.png"></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		<!-- Pagination
		 ================================================== -->	
				<div class="pagination pagination-centered">		
					<ul>
						<c:if test="${model.pagesAvailable > 1}">
							 <%--For displaying Previous link except for the 1st page --%>
						    <c:if test="${model.pageNumber != 1}">
						        <li><a href="userList.htm?pageNo=${model.pageNumber - 1}&search=${model.search}">&laquo;</a></li>
						    </c:if>
						 
						    <%--For displaying Page numbers.
						    The when condition does not display a link for the current page--%>
						            <c:forEach begin="1" end="${model.pagesAvailable}" var="i">
						                <c:choose>
						                    <c:when test="${model.pageNumber eq i}">
						                         <li class="active"><a href="#">${i}</a></li>
						                    </c:when>
						                    <c:otherwise>
						                        <li><a href="userList.htm?pageNo=${i}&search=${model.search}">${i}</a></li>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
						            	 
						    <%--For displaying Next link --%>
						    <c:if test="${model.pageNumber lt model.pagesAvailable}">
						        <li><a href="userList.htm?pageNo=${model.pageNumber + 1}&search=${model.search}">&raquo;</a></li>
						    </c:if>
						</c:if>
				    </ul>
				</div>							
			</div>	
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
	

		//  dimencions and position deleteModal 
		$('#mailModal').modal({
		    backdrop: true,
		    keyboard: true,
		    show: false
		}).css({
		    // make width 48.5% of screen
		   'width': function () { 
		       return ($(document).width() * .485) + 'px';  
		   },
		    // center modal
		   'margin-left': function () { 
		       return -($(this).width() / 2); 
		   }
		});



		//Sens parameters to deleteModal			
		function deleteUserModal(id, name) {

			var lite = "Estas segur que vols eliminar l'usuari "+ name +"?";
			var href = 'deleteUser.htm?id=' + id;
			
			$('#liteDeleteModal').html(lite);
			$('#urlDeleteModal').attr('href', href);
		}
	
		//send parameters to mailModal			
		function mailUserModal(mailAddress) {
			$('#mailAddressModal').val(mailAddress);
		}			
			
		</script>
</body>
</html>