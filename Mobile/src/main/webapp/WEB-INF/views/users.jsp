<%@ include file="/WEB-INF/views/include.jsp" %>

<html>
  <head><title><fmt:message key="title"/></title></head>
  <body>
    <h1><fmt:message key="heading"/></h1>
    <p><fmt:message key="greeting"/> <c:out value="${model.now}"/></p>
    <h3>Users</h3>
    <c:forEach items="${model.users}" var="user">
    	<a href="<c:url value="userModify.htm?id=${user.id}"/>"><c:out value="${user.code}"/> <i><c:out value="${user.name}"/></i></a><br>
    	
		<a href="userForm.htm?id=${user.id}">${user.name}</a><br><br>

    	
    </c:forEach>
    <br>
    	<a href="<c:url value="userNew"/>">Nou Usuari</a>
    <br>    
  </body>
</html>