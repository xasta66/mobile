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
<link href="css/jquery-ui.css" rel="stylesheet" />

<style type="text/css">

.content {
    top: 0;
    left:0;
  width: 20% ;
  margin-left: 25% ;
  margin-right: 25% ;
  margin-top: 20% ; 
  opacity:1;
  position:absolute; 
   z-index:1500 
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
			</div>				
		</div>		
	</div>					


	<div class="container-fluid">
		<legend>Redactar mail</legend>
		<form class=" form-horizontal span6" id="mailForm" method="post">


				<div class="control-group">
					<label class="control-label" for="street">Mail (auto. compl.)</label>
					<div class="controls ui-widget">
						<input name="mailAddress" id="mailAddress" type="text"  class="input-xlarge">
					</div>
				</div>             
	
				<div class="control-group">
					<label class="control-label" for="street">Assumpte</label>
					<div class="controls">
						<input  name="subject" id="subject" type="text" class="input-xlarge">
					</div>
				</div>             

				<div class="control-group">
					<label class="control-label" for="street">Missatge</label>
					<div class="controls">
						<textarea name="message" id="message" class="input-xlarge" rows="7"></textarea>
					</div>
				</div>      
			<!-- progress bar / alerts div
	    	================================================== -->	
			<div id = "alert_placeholder"></div>			
			 <div class="pull-right">
			        <a href="userList.htm" class="btn">Cancel&middot;lar</a>&nbsp;&nbsp;
			        <button class="btn btn-primary" type="submit" >Enviar</button>
			 </div>
		 </form>	 
	</div>
		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/jquery.validate.js"></script>
		<script src="js/jquery-ui.js"></script>										
		<script src="js/bootstrap-transition.js"></script>
		<script src="js/bootstrap-alert.js"></script>

		<script type="text/javascript">
		
		$(document).ready(function() {

			    
			 $( "#mailAddress" ).autocomplete({
			    	source: '${pageContext. request. contextPath}/mailList.htm'

			  });


			$("#mailForm").validate({
				    rules: {
				    	/*
				    	mailAddress: {
					        required: true,
					        email: true
					      },
					     */ 
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
								$(element).closest('.control-group').removeClass('error');
							},							
						    submitHandler: function(form) {
						    	sendMail();
						    },							
							
							
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
	                    		  }, 1500);
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
			 $('#alert_placeholder').html('<div class="inmodal-backdrop"></div><div class="progress progress-danger progress-striped active content"><div  class="bar" style="width:100%;"></div></div>'); 
		}
		// Bootstrap alert
		function alertBS(returnCode, message) {
            $('#alert_placeholder').html('<div class="alert alert-' + returnCode +'"><a class="close" data-dismiss="alert">x</a><span>'+message+'</span></div>');
		}

		</script>	
</body>
</html>