<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page language="java"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="com.productos.seguridad.*"%>

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
			<li><a href="index.jsp">Home</a></li>
			<li><a href="categoria.jsp">Buscar Por Categoria</a></li>
			<li><a class="active" href="login.jsp">Login</a></li>
		</ul>
	</nav>
	<section class="main-section">
		<article>
			<%
			String estad="";
			String nombre = request.getParameter("txtnombre");
			String cedula = request.getParameter("cedula");
			int estadoCivil = Integer.parseInt(request.getParameter("cmbECivil"));
			String correo = request.getParameter("correo");
			String clave = request.getParameter("clave");
			int id_per = 3; // Valor predeterminado o asigna un valor válido si es necesario

			// Verificar si el parámetro no es null antes de intentar convertirlo
			String id_perParam = request.getParameter("id_per");
			if (id_perParam != null && !id_perParam.isEmpty()) {
				id_per = Integer.parseInt(id_perParam);
			}

			usuario usuario = new usuario(id_per, estadoCivil, nombre, cedula, correo, clave);
			String resultado = usuario.ingresarCliente();
			if(usuario.getEstado()==1) {
				estad="Soltero";
			} else if(usuario.getEstado()==2) {
				estad="Casado";
			} else if(usuario.getEstado()==3) {
				estad="Divorciado";
			}else if(usuario.getEstado()==4) {
				estad="Viudo";
			}
			%>
			<p>
				Su nombre es
				<%=nombre%></p>
			<p>
				Su cédula es
				<%=cedula%></p>
			<p>
				Su estado civil es
				<%=estad%></p>
			<p>
				Su correo electrónico es
				<%=correo%></p>

			<p>
				Resultado del registro de usuario:
				<%=resultado%></p>
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

