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
<link href="css/styleBootstrap.css" rel="stylesheet" />
<style type="text/css">

.content {
  width: 50% ;
  margin-left: auto ;
  margin-right: auto ;
  margin-top: 25% ; 
}


#navNewUser {visibility:hidden;}

/* Large desktop */
@media (min-width: 1200px) { 

}
 
/* Portrait tablet to landscape and desktop */
@media (min-width: 801px) and (max-width: 979px) {

}
 
/* Landscape phone to portrait tablet */
@media (max-width: 800px) {

#sideBar{display:none;}

#usersTable {width: 95%;}  

#navNewUser {visibility:visible;}


}
 
/* Landscape phones and down */
@media (max-width: 480px) {

}


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
			<div class="container-fluid">
				<a class="brand" href="#">Manteniment usuaris Mobile</a>
				
				    <ul class="nav">
				      <li id="navNewUser"><a href="userForm.htm">Nou usuari</a></li>
				    </ul>
				
				<form class="navbar-search pull-right" action="userList.htm"  method="post">
					<input type="hidden" name="pageNo" id="pageNo"  value="${model.pageNumber}">					
 					<input type="text"      name="search"  id="search" class="search-query" placeholder="Cerca" value ="${model.search}">
				</form>		
			</div>				
		</div>		
	</div>					
	<div class="container-fluid">		
		<div class="well-fluid">		
			<div class="span3" id="sideBar">
	          <div class="well sidebar-nav">
	            <ul class="nav nav-list">
	              <li class="nav-header">MEN&Uacute;</li>
	              <li class="nav-line"><a href="userForm.htm">Nou usuari</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	            </ul>
	          </div>
	        </div>
			<div id="usersTable" class="span9">			
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="10%">Id</th>
							<th width="20%">Codi</th>
							<th width="30%">Nom</th>
							<th width="24%">Mail</th>
							<th colspan="4" width="16%"></th>	
															
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model.users}" var="user">
							<tr>
								<td>${user.id}</td>
								<td>${user.code}</td>
								<td>${user.name}&ensp;${user.surname_1}&ensp;${user.surname_2}</td>
								<td>${user.mail}</td>
								<td>
									<a href="userDetail.htm?id=${user.id}&pageNo=${model.pageNumber}"><img src="img/detail.png"></a>					
								</td>
								<td>								
									<a href="userForm.htm?id=${user.id}"><img src="img/edit.png"></a>	
								</td>
								<td>	
		              				<a href="#deleteModal" onclick="deleteUserModal(${user.id},'${user.name} ${user.surname_1} ${user.surname_2}');" role="button" data-toggle="modal"><img src="img/bin.png"></a>			
								</td>
								<td>	
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
				<footer>
					<hr>		
					<p>&copy; 2012</p>
				</footer>								
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

		<form class=" form-horizontal modal-form" id="mailForm" method="post">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="mailModalLabel">Mail</h3>
			</div>
	 
			<div class="modal-body">

				<div class="control-group">
					<label class="control-label" for="street">Mail</label>
					<div class="controls">
						<input name="mailAddressModal" id="mailAddressModal" type="text" >
					</div>
				</div>             
	
				<div class="control-group">
					<label class="control-label" for="street">Assumpte</label>
					<div class="controls">
						<input  name="subject" id="subject" type="text" data-required="true">
					</div>
				</div>             

				<div class="control-group">
					<label class="control-label" for="street">Missatge</label>
					<div class="controls">
						<textarea name="message" id="message" class="input-xlarge" rows="7"></textarea>
					</div>
				</div>      
			</div>
			<!-- progress bar / alerts div
	    	================================================== -->	
			<div id = "alert_placeholder"></div>			
			 <div class="modal-footer">
			        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel&middot;lar</button>
			        <button type="submit"  class="btn btn-primary pull-right">Enviar</button>
			 </div>
		 </form>	 
	</div>

		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/jquery.validate.js"></script>				
		<script src="js/bootstrap-modal.js"></script>
		<script src="js/bootstrap-transition.js"></script>
		<script src="js/bootstrap-alert.js"></script>

		<script type="text/javascript">
		//events mailModal
/*		
			$('#mailModal').on('show', function () {
//
			})
*/
			//	on hidden modal close all alerts
			$('#mailModal').on('hidden', function () {
				
				$("#mailForm").validate().resetForm();
				$(".error").removeClass("error");
				$(".success").removeClass("success");

				$(".alert").alert('close');
				mailForm.reset();
			})

			$('#mailModal').modal({
			    backdrop: 'static', // can't be closed by clickin the mouse
			    keyboard: false, // can't be closed by pressing a key 
			    show: false
			})
				
		//Sends parameters to deleteModal			
		function deleteUserModal(id, name) {

			var lite = "Estas segur que vols eliminar l'usuari "+ name +"?";
			var href = 'deleteUser.htm?id=' + id;
			
			$('#liteDeleteModal').html(lite);
			$('#urlDeleteModal').attr('href', href);
		}
			
		//sends parameters to mailModal			
		function mailUserModal(mailAddress) {			
			$('#mailAddressModal').val(mailAddress);
		}			
			
		// mailForm validate
		$(document).ready(function () {

			var validator = $("#mailForm").validate({
				    rules: {
					      mailAddressModal: {
					        required: true,
					        email: true
					      },
					      subject: {
					      	minlength: 2,
					        required: true
					      },
					      message: {
					        minlength: 2,
					        required: true
					      }
					    },
							highlight: function(element) {
								$(element).closest('.control-group').addClass('error');
							},
							success: function(element) {
								element
								.closest('.control-group').removeClass('error');
							},
					
							
						    submitHandler: function(form) {
						    	sendMail();
						    }							
							
							
		        });	
		});
		
		
		// submit mailModal                                                              
		function sendMail() { 
						
			var str = $("#mailForm").serialize();
			
			//Show progress bar
			progressBar();
			
			$.ajax({
			    type:"POST",
			    data:str,
			    url:"sendEmail.htm",
//                cache: false,
//                contentType: "multipart/form-data",
                success : function(response) { 
                		
                	var array = response.split('-')

                	var returnCode = array[0];
                	var message = array[1];
                	
                    alertBS(returnCode, message);

                    if(returnCode=="success"){
	                    setTimeout(
	                    		  function() 
	                    		  {
	                      			$('#mailModal').modal('hide');
	                    		  }, 2000);
                	}

                }, 
                error: function (x, e) {
                    if (x.status === 0) {
                        alert('You are offline!!\n Please Check Your Network. ' + x.reponseText);
                    }
                    else if (x.status == 404) {
                        alert('Requested URL not found.');
                    } else if (x.status == 500) {
                        alert('Internel Server Error.');
                    } else if (e == 'parsererror') {
                        alert('Error.\nParsing JSON Request failed.');
                    } else if (e == 'timeout') {
                        alert('Request Time out.');
                    } else {
                        alert('Unknow Error.\n' + x.responseText);
                    }
                }
			});
			
			
		}  
		
		function progressBar(){
			 $('#alert_placeholder').html('<div class="inmodal-backdrop"><div class="progress progress-danger progress-striped active content"><div class="bar" style="width:100%;"></div></div></div>'); 
		}
		// Bootstrap alert
		function alertBS(returnCode, message) {
            $('#alert_placeholder').html('<div class="alert alert-' + returnCode +'"><a class="close" data-dismiss="alert">x</a><span>'+message+'</span></div>');
		}

		</script>	
</body>
</html>