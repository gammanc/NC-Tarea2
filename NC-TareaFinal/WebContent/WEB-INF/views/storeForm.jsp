<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sucursal</title>
</head>
<body>
	<h1>${message}</h1>
	<form:form action="${pageContext.request.contextPath}/saveStore" method="POST" modelAttribute="store">
		<form:input type="hidden" name="code" path="code"/>
             <table>
                <tr>
                    <td><label>Nombre : </label></td>
                    <td><form:input type="text" name="name" path="name"/></td>
                    <td><form:errors path="name" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><label>Direccion : </label></td>
                    <td><form:input type="text" name="address" path="address"/></td>
                    <td><form:errors path="address" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><label>Horarios : </label></td>
                    <td><form:input type="text" name="schedule" path="schedule"/></td>
                    <td><form:errors path="schedule" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><label>Numero de mesas : </label></td>
                    <td><form:input type="number" name="numtables" path="numTables"/></td>
                    <td><form:errors path="numTables" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><label>Nombre del gerente : </label></td>
                    <td><form:input type="text" name="manager" path="manager"/></td>
                    <td><form:errors path="manager" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Guardar"/></td>
                </tr>
            </table>
        </form:form>	
</body>
</html>