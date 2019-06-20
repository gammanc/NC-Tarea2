<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sucursal</title>
</head>
<body>
	<h1>${message}</h1>
	<form:form action="${pageContext.request.contextPath}/sendform" method="POST" modelAttribute="store">
		<form:input type="hidden" name="id" path="code"/>
             <table>
                <tr>
                    <td><label>Nombre : </label></td>
                    <td><form:input type="text" name="name" path="name"/></td>
                </tr>
                <tr>
                    <td><label>Direccion : </label></td>
                    <td><form:input type="text" name="lname" path="address"/></td>
                </tr>
                <tr>
                    <td><label>Horarios : </label></td>
                    <td><form:input type="text" name="lname" path="schedule"/></td>
                </tr>
                <tr>
                    <td><label>Edad : </label></td>
                    <td><form:input type="number" name="age" path="numTables"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Guardar"/></td>
                </tr>
            </table>
        </form:form>	
</body>
</html>