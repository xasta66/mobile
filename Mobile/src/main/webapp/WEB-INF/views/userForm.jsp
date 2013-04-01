<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
  </head>
  <body>
    <h1>Usuari Mobile</h1>
    <form:form modelAttribute="user" action="userForm.htm" method="post">
      <table>
         <tr>
          <td align="right" valign="bottom">
            <c:choose>
              <c:when test="${user.id == null}">
                <button type="submit"  name="create"> Create </button>
              </c:when>
              <c:otherwise>
                <button type="submit"  name="delete" onclick="return confirm('Are you sure you want to delete ${user.name}?')"> Delete </button>
		   	 	<button type="submit"  name="update">Update  </button>
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
        <tr>
          <td>
            <table class="silver">
              <tr>
                <th colspan=2>Nom</th>
              </tr>
              <tr>
                <td>Nom</td>
                <td>
                  <form:input path="name" size="20" maxlength="50" />
                  <form:errors path="name" cssClass="errors"/>
                </td>
              </tr>
              <tr>
                <td>Codi</td>
                <td>
                  <form:input path="code" size="8" maxlength="8" />
                  <form:errors path="code" cssClass="errors"/>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </form:form>
    <a href="userList.htm">&lt;&lt;Tornar</a>
  </body>
</html>
