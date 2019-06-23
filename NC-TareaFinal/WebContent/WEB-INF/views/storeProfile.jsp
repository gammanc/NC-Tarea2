<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/materialize.min.css">
<link rel="stylesheet" href="../resources/css/style.css">
<title>${store.name} - Perfil</title>
</head>
<body>
	<div class="container">
	
		<div class="row valign-wrapper section">
			<div class="col s6 m8">
				<h2>Sucursal</h2>
			</div>
			<c:if test = "${not empty store.code}">
			<div class="col s6 m4">
				<form action="${pageContext.request.contextPath}/addEmployee/" method="POST">
					<input type="hidden" name="storecode" value="${store.code}"/>
					<button type="submit" class="btn-large waves-effect waves-light blue">Agregar empleado a esta sucursal</button>
				</form>
			</div>
			</c:if>
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
		
		<div class="row section">
			<div class="col s12 l4 ">
					<table class="highlight">
					   <tr>
					       <td><label>Nombre </label></td>
					       <td>${store.name}</td>
					   </tr>
					   <tr>
					       <td><label>Dirección</label></td>
					       <td>${store.address}</td>
					   </tr>
					   <tr>
					       <td><label>Horario</label></td>
					       <td>${store.schedule}</td>
					   </tr>
					   <tr>
					       <td><label>Número de mesas</label></td>
					       <td>${store.numTables}</td>
					   </tr>
					   <tr>
					       <td><label>Nombre del gerente</label></td>
					       <td>${store.manager}</td>
					    </tr>
					</table>
			</div>
			
			<div class="col s12 l8 section">
					<table class="bordered highlight">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Edad</th>
								<th>Sexo</th>
								<th>Estado</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tr>${error}</tr>
						<c:forEach items="${store.employees}" var="employee">
						<tr>
							<th>${employee.name}</th>
							<th>${employee.age}</th>
							<th>${employee.gender}</th>
							<th>${employee.statusDelegate}</th>
							<th>
								<button class="waves-effect waves-light btn" onclick="window.location.href='${pageContext.request.contextPath}/employee/edit/${employee.code}'">Editar</button>
								<button class="waves-effect waves-light btn red" onclick="window.location.href='${pageContext.request.contextPath}/employee/delete/${employee.code}'">Eliminar</button>	
							</th>
						</tr>
						</c:forEach>
					</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../resources/js/materialize.min.js"></script>
</body>
</html>