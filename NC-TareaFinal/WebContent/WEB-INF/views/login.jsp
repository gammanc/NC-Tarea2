<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio de Sesion</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
  <div class="section"></div>
  <main>
    <center>
      <img class="responsive-img" style="width: 250px;" src="${pageContext.request.contextPath}/resources/img/logo.png" />
      <div class="section"></div>

      <h5 class="blue-text">Ingresar a la cuenta</h5>
      <div class="section"></div>

      <div class="container">
        <div class="z-depth-1 lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

          <form class="col s12" action="${pageContext.request.contextPath}/login" method="post">
            <div class='row'>
              <div class='col s12'>
              </div>
            </div>

            <div class='row'>
              <div class='input-field col s12'>
                <input type='text' name='username' id='username' />
                <label for='username'>Ingrese su usuario</label>
              </div>
            </div>

            <div class='row'>
              <div class='input-field col s12'>
                <input type='password' name='password' id='password' />
                <label for='password'>Ingrese su contraseña</label>
              </div>
            </div>

            <br/>
            <center>
              <div class='row'>
                <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect blue'>Login</button>
              </div>
            </center>
          </form>
        </div>

        <c:if test = "${not empty error}">
        <div class="row valign-wrapper">
            <div class="col s12">
                <div class="card-panel light-blue lighten-4">
                <span>${error}</span>
                </div>
            </div>
        </div>
        </c:if>

      </div>
    </center>

    <div class="section"></div>
    <div class="section"></div>
  </main>
  <!--<div class="container">
    <div class="col s12 m6 section">
      <div class="card large">
        <div class="container">
          <br><br>
          <h1 class="header center blue-text">Rústico</h1>
          <div class="row">
            <form action="${pageContext.request.contextPath}/login" method="POST" autocomplete="off">
                <div class="input-field col s12">
                  <input type="text" name="username" />
                  <label>Usuario</label>
                </div>

                <div class="input-field col s12">
                  <label>Contraseña</label>
                  <input type="password" name="password"/>
                </div>
                <button type="submit" class="btn waves-effect waves-light blue">
                    Iniciar sesión
                  </button>
            </form>
          </div>

          <c:if test = "${not empty error}">
            <div class="row valign-wrapper">
                <div class="col s12">
                    <div class="card-panel light-blue lighten-4">
                    <span>${error}</span>
                    </div>
                </div>
            </div>
          </c:if>

        </div>
      </div>
    </div>-->
    <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="resources/js/materialize.min.js"></script>
</body>
</html>