<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%@ page import="com.productos.negocio.*"%>
<%
String categoriaSeleccionada = request.getParameter("cmbCategoria");
int idCategoria = (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty())
		? Integer.parseInt(categoriaSeleccionada)
		: 0;

categoria c = new categoria();
String nombreCategoria = c.obtenerNombreCategoria(idCategoria);

producto p = new producto();
String resultadoCategoria = p.buscarProductoCategoria(idCategoria);
%>
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
			<li><a class="active" href="menuVendedor.jsp">Productos</a></li>
			<li><a href="cambioClave.jsp">Cambiar clave</a></li>
		</ul>
	</nav>
	<section class="main-section">
		<div class="content-right">
			<article>
				<div class="registro-box">
					<h2>Registro Producto</h2>
					<form action="registro.jsp" method="post">
						<label for="ID">ID:</label> <input type="text" name="id" required><br>
						<br> <label for="cmbCategoria">Categoria:</label>
						<%
							String opcCategoria = c.mostrarCategoria();
							out.println(opcCategoria);
						%>
						<label for="nombre">Nombre:</label> <input type="text"
							name="nombre" required><br> <br> <label
							for="cantidad">Cantidad:</label> <input type="text"
							name="cantidad" required><br> <br> <label
							for="precio">Precio:</label> <input type="text" name="precio"
							required><br> <br>
						<button type="submit">Añadir producto</button>
						<button type="reset">Limpiar</button>
					</form>
				</div>
			</article>
			<aside class="content-right">
				<ul>
					<form method="post" action="menuVendedor.jsp">
						<label for="cmbCategoria">Buscar por categoria:</label>
						<%
							out.println(opcCategoria);
						%>
						<button type="submit">Mostrar Reporte</button>
					</form>
					<p>
						Nombre de la Categoría:
						<%=nombreCategoria%></p>
						<%=resultadoCategoria%>
				</ul>
			</aside>
		</div>
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