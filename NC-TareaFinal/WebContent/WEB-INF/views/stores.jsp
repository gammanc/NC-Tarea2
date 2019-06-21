<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sucursales</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/addStore" method="post">
		<input type="submit" value="Agregar una nueva sucursal"/>
	</form>
	
	<br>
	<h1>${message}</h1>
	<br>
	
	<table>
		<tr>
			<th>Nombre</th>
			<th>Ubicacion</th>
			<th>Horarios</th>
			<th>Cantidad de mesas</th>
			<th>Gerente</th>
			<th>Acciones</th>
		</tr>
		<tr>${error}</tr>
		<c:forEach items="${stores}" var="store">
		<tr>
			<th>${store.name}</th>
			<th>${store.address}</th>
			<th>${store.schedule}</th>
			<th>${store.numTables}</th>
			<th>${store.manager}</th>
			<th>
				<button onclick="window.location.href='${pageContext.request.contextPath}/store/${store.code}'">Ver perfil</button>
				<button onclick="window.location.href='${pageContext.request.contextPath}/store/edit/${store.code}'">Editar</button>
				<button onclick="window.location.href='${pageContext.request.contextPath}/store/delete/${store.code}'">Eliminar</button>	
			</th>
		</tr>
		</c:forEach>
	</table>
</body>
</html>