<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio de Sesion</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="POST">
            <table>
               <tr>
                   <td><label>Usuario : </label></td>
                   <td><input type="text" name="username" /></td>
               </tr>
               <tr>
                   <td><label>Contrasena: </label></td>
                   <td><input type="text" name="password"/></td>
               </tr>
               <tr>
               		${error}
               </tr>
               <tr>
                   <td><input type="submit" value="Iniciar Sesion"/></td>
               </tr>
           </table>
       </form>
</body>
</html>