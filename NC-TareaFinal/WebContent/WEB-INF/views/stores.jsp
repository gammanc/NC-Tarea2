<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/materialize.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>Sucursales</title>
</head>
<body>
	<div class="container section">
		<div class="row valign-wrapper">
			<div class="col s6 m8">
				<h2>Sucursales</h2>
			</div>
			<div class="col s6 m4">
				<form action="${pageContext.request.contextPath}/addStore" method="post">
					<button type="submit" class="btn-large waves-effect waves-light blue">Agregar una nueva sucursal</button>
				</form>
			</div>
		</div>
		
		<c:if test = "${not empty message}">
		<div class="row valign-wrapper">
			<div class="col s12">
				<div class="card-panel light-blue lighten-4">
				<span>${message}</span>
				</div>
			</div>
		</div>
		</c:if>
		
		<table class="bordered highlight">
			<thead>
				<tr>
					<th data-field="nombre">Nombre</th>
					<th data-field="ubicacion">Ubicación</th>
					<th data-field="horarios">Horarios</th>
					<th data-field="cantidadmesas">Cantidad de mesas</th>
					<th data-field="gerente">Gerente</th>
					<th data-field="acciones">Acciones</th>
				</tr>
			</thead>
			<c:forEach items="${stores}" var="store">
			<tr>
				<th>${store.name}</th>
				<th>${store.address}</th>
				<th>${store.schedule}</th>
				<th>${store.numTables}</th>
				<th>${store.manager}</th>
				<th>
					<button class="waves-effect waves-light btn blue" onclick="window.location.href='${pageContext.request.contextPath}/store/${store.code}'">Ver perfil</button>
					<button class="waves-effect waves-light btn" onclick="window.location.href='${pageContext.request.contextPath}/store/edit/${store.code}'">Editar</button>
					<button class="waves-effect waves-light btn red" onclick="window.location.href='${pageContext.request.contextPath}/store/delete/${store.code}'">Eliminar</button>
				</th>
			</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="resources/js/materialize.min.js"></script>
</body>
</html>