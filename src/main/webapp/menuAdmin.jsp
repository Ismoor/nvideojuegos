<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%@ page import="com.productos.negocio.*"%>
<%@ page import="java.util.*"%>
<%
String usuario = "";
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
{
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
usuario = (String) sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
int perfil = (Integer) sesion.getAttribute("perfil");
int id_us = (Integer) sesion.getAttribute("id_us");
String clave = (String) sesion.getAttribute("clave");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>N videojuegos</title>
<link href="./css/formulario.css" rel="stylesheet" type="text/css">
</head>
<body>

	<header>
		<h1>
			<img src="./public/N_videojuegos_logo.png" alt="Logo" class="logo">
			<span>N Videojuegos</span>
		</h1>

	</header>
	<nav>
		<ul>
			<li><a href="cerrarSesion.jsp">Cerrar sesion</a></li>
			<li><a class="active" href="menuAdmin.jsp">Registro usuarios</a></li>
			<li><a href="cambioClave.jsp">Cambiar clave</a></li>
			
		</ul>

	</nav>
	<section class="main-section">
		<article>
			<div class="registro-box">
				<h2>Registro vendedores y administradores</h2>
				<form action="registroAdmin.jsp" method="post">
					<label for="nombre">Nombre:</label> <input type="text"
						name="txtnombre" required><br> <br>
						<label for="correo">Correo Electrónico:</label>
					<input type="email" name="correo" required><br> <br>
					
					<label for="cmbPerfil">Perfil:</label> <select
						name="cmbPerfil">
						<option value="1">Admin</option>
						<option value="2">Vendedor</option>
					</select><br> <br> 
					<button type="submit">Registrar usuario</button>
					<button type="reset">Limpiar</button>
				</form>
			</div>
		</article>
	</section>
	<footer>
		<h3>Síguenos en nuestras redes sociales</h3>
		<ul>
			<li><a href="https://www.facebook.com/miltonismael.peralta"><img
					src="imagenes/facebook.jpg" alt="Facebook"></a></li>
			<li><a href="https://www.instagram.com/ismoor_pera"> <img
					src="imagenes/instagram.jpg" alt="Instagram"></a></li>
			<li><a href="https://x.com/ismoor97"><img
					src="imagenes/x.jpg" alt="X"></a></li>
			<li><a
				href="https://www.linkedin.com/in/milton-peralta-5a7482307?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app"><img
					src="imagenes/linkedin.png" alt="LinkedIn"></a></li>

		</ul>
	</footer>
</body>
</html>