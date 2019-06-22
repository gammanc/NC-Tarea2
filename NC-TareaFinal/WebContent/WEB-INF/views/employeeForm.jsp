<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empleado</title>
</head>
<body>
	<h1>${message}</h1>
	<form:form action="${pageContext.request.contextPath}/saveEmployee" method="POST" modelAttribute="employeeDTO">
		<form:input type="hidden" name="code" path="code"/>
             <table>
				<tr>
					<td><b>Sucursal:</b></td>
					<td><form:select path="storeid" class="inputs"> 
							<form:options items="${stores}" itemValue="code" itemLabel="name" id="idstore" />
						</form:select>
					</td>
				</tr>
                <tr>
                    <td><label>Nombre : </label></td>
                    <td><form:input type="text" name="name" path="name"/></td>
                    <td><form:errors path="name" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><label>Edad : </label></td>
                    <td><form:input type="number" name="age" path="age"/></td>
                    <td><form:errors path="age" cssStyle="color:red;"/></td>
                </tr>
                <tr>
                    <td><label>Sexo: </label></td>
                    <td>
                    	<form:radiobutton name="gender" path="gender" value="M"/><label>M</label> 
						<form:radiobutton name="gender" path="gender" value="F"/><label>F</label>                     
                    </td>
                </tr>
                <tr>
                    <td><label>Estado : </label></td>
                    <td>
                    	<form:radiobutton name="status" path="status" value="true"/><label>Activo</label> 
						<form:radiobutton name="status" path="status" value="false"/><label>Inactivo</label>                     
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Guardar"/></td>
                </tr>
            </table>
        </form:form>	
</body>
</html>