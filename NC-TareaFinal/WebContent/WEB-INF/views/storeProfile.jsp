<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${store.name} - Perfil</title>
</head>
<body>
	<h2>Perfil de sucursal</h2>

	<table>
	   <tr>
	       <td><label>Nombre : </label></td>
	       <td>${store.name}</td>
	   </tr>
	   <tr>
	       <td><label>Direccion : </label></td>
	       <td>${store.address}</td>
	   </tr>
	   <tr>
	       <td><label>Horarios : </label></td>
	       <td>${store.schedule}</td>
	   </tr>
	   <tr>
	       <td><label>Numero de mesas : </label></td>
	       <td>${store.numTables}</td>
	   </tr>
	   <tr>
	       <td><label>Nombre del gerente : </label></td>
	       <td>${store.manager}</td>
	    </tr>
	</table>
		<form action="${pageContext.request.contextPath}/addEmployee/" method="POST">
			<input type="hidden" name="storecode" value="${store.code}"/>
			<input type="submit" value="Agregar empleado a esta sucursal"/>
		</form>
	<table>
		<tr>
			<th>Nombre</th>
			<th>Edad</th>
			<th>Sexo</th>
			<th>Estado</th>
			<th>Acciones</th>
		</tr>
		<tr>${error}</tr>
		<c:forEach items="${store.employees}" var="employee">
		<tr>
			<th>${employee.name}</th>
			<th>${employee.age}</th>
			<th>${employee.gender}</th>
			<th>${employee.statusDelegate}</th>
			<th>
				<button onclick="window.location.href='${pageContext.request.contextPath}/employee/edit/${employee.code}'">Editar</button>
				<button onclick="window.location.href='${pageContext.request.contextPath}/employee/delete/${employee.code}'">Eliminar</button>	
			</th>
		</tr>
		</c:forEach>
	</table>
</body>
</html>