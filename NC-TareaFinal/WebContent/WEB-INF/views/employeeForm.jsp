<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empleado</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div class="container">
        <div class="row valign-wrapper">
            <div class="col s6 m8">
                <h2>${action} empleado</h2>
            </div>
            <div class="col s6 m4">
                <button class="btn-large waves-effect waves-light blue" onclick="window.location.href='${pageContext.request.contextPath}/store/${id_store}'">Regresar</button>
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

        <div class="section row">
        	<form:form action="${pageContext.request.contextPath}/saveEmployee" method="POST" modelAttribute="employeeDTO" autocomplete="off">
        		<form:input type="hidden" name="code" path="code"/>

                <div class="row">
    			    <div class="input-field col s12">
    					<form:select path="storeid" class="inputs"> 
    						<form:options items="${stores}" itemValue="code" itemLabel="name" id="idstore" />
    					</form:select>
                        <label>Sucursal</label>
                    </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s6">
                        <label for="name">Nombre</label> 
                        <form:input id="name" type="text" name="name" path="name"/> 
                        <form:errors path="name" cssStyle="color:red;"/> 
                    </div>
                    
                    <div class="input-field col s6">
                        <label for="edad">Edad</label> 
                        <form:input id="edad" type="number" name="age" path="age"/>
                        <form:errors path="age" cssStyle="color:red;"/> 
                    </div>
                </div>
                
                <div class="row">
                    <div class="col s6">
                        <label>Sexo</label>
                    	<p>
                            <label><form:radiobutton name="gender" path="gender" value="M"/><span>M</span></label>
                            <label><form:radiobutton name="gender" path="gender" value="F"/><span>F</span></label>
                        </p>
                    </div>
                 
                    <div class="col s6">
                        <label>Estado</label>
                        <p>
                            <label><form:radiobutton name="status" path="status" value="true"/><span>Activo</span></label>                           
                            <label><form:radiobutton name="status" path="status" value="false"/><span>Inactivo</span></label>
                        <p>                   
                    </div>
                </div>  
                <button type="submit" class="waves-effect waves-light btn blue">Guardar</button>
            </form:form>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
    <script type="text/javascript">
     $(document).ready(function(){
            $('select').formSelect();
          });
    </script>
</body>
</html>