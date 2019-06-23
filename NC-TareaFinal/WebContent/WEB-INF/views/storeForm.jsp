<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sucursal</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row valign-wrapper">
			<div class="col s6 m8">
				<h2>${action} sucursal</h2>
			</div>
			<div class="col s6 m4">
				<form action="${pageContext.request.contextPath}/stores" method="post">
					<button type="submit" class="btn-large waves-effect waves-light blue">Regresar</button>
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

		<div class="section">
			<form:form action="${pageContext.request.contextPath}/saveStore" method="POST" modelAttribute="store" autocomplete="off">
				<form:input type="hidden" name="code" path="code"/>
				<div class="input-field col s12">
				    <label for="name">Nombre</label>
				    <form:input id="name" type="text" name="name" path="name"/>
				    <form:errors path="name" cssStyle="color:red;"/>
				</div>	
				<div class="input-field col s12">
				    <label for="address">Dirección</label>
				    <form:input id="address" type="text" name="address" path="address"/>
				    <form:errors path="address" cssStyle="color:red;"/>
				</div>
				<div class="input-field col s12">
				    <label for="sch">Horarios</label>
				    <form:input id="sch" type="text" name="schedule" path="schedule"/>
				    <form:errors path="schedule" cssStyle="color:red;"/>
				</div>
				<div class="input-field col s12">
				    <label for="nmesas">Número de mesas</label>
				    <form:input id="nmesas" type="number" name="numtables" path="numTables"/>
				    <form:errors path="numTables" cssStyle="color:red;"/>
				</div>
				<div class="input-field col s12">
				    <label for="gerente">Nombre del gerente</label>
				    <form:input id="gerente" type="text" name="manager" path="manager"/>
				    <form:errors path="manager" cssStyle="color:red;"/>
				</div>
				<button type="submit" class="waves-effect waves-light btn blue">Guardar</button>
			</form:form>
		</div>
	</div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>	
</body>
</html>