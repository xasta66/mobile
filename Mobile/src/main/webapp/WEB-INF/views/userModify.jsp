<%@ include file="/WEB-INF/views/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Spring MVC Form Handling</title>
</head>
<body>
<form:form method="post" commandName="userModify">
   <table>
    <tr>
        <td>Identificador</td>
        <td><form:input path="id"/></td>        
    </tr>
    <tr>
        <td>Codi</td>
        <td><form:input path="code"/></td>
         <td width="60%">
          <form:errors path="code" cssClass="error"/>
        </td>       
    </tr>
    <tr>
        <td>Nom</td>
        <td><form:input path="name"/></td>
        <td width="60%">
          <form:errors path="name" cssClass="error"/>
        </td>        
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit"  value="Acceptar"/>          
        </td>
    </tr>
</table>  
</form:form>
<a href="<c:url value="users.htm"/>">Home</a>
</body>
</html>