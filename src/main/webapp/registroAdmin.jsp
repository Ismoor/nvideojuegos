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
		</ul>

	</nav>
	<section class="main-section">
		<article>
		<%
			int estadoCivil = 1;
			String nombre = request.getParameter("txtnombre");
			String cedula = "";
			int id_per = Integer.parseInt(request.getParameter("cmbPerfil"));
			String correo = request.getParameter("correo");
			String clave = "654321";
			String perfil = "";

			// Verificar si el parámetro no es null antes de intentar convertirlo
			String id_perParam = request.getParameter("id_per");
			if (id_perParam != null && !id_perParam.isEmpty()) {
				id_per = Integer.parseInt(id_perParam);
			}

			usuario u = new usuario(id_per, estadoCivil, nombre, cedula, correo, clave);
			String resultado = u.ingresarCliente();
			if(u.getId_per()==1) {
				perfil="Administrador";
			} else if(u.getId_per()==2) {
				perfil="Vendedor";
			}
			%>
			<p>
				El nombre del usuario es
				<%=nombre%></p>
				
			<p>
				El correo electrónico es
				<%=correo%></p>
			<p>
				El perfil del usuario ingresado es:
				<%=perfil %>
			</p>
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