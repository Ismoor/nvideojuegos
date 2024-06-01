<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page language="java"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="com.productos.negocio.*"%>

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
		<a href="menuVendedor.jsp">Atras</a>
	</nav>
	<section class="main-section">
		<article>
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			int categoria = Integer.parseInt(request.getParameter("cmbCategoria"));
			String nombre = request.getParameter("nombre");
			int cantidad = Integer.parseInt(request.getParameter("cantidad"));
			float precio = Integer.parseInt(request.getParameter("precio"));
			String cat = "";
			// Verificar si el parámetro no es null antes de intentar convertirlo
			String id_proParam = request.getParameter("id");
			if (id_proParam != null && !id_proParam.isEmpty()) {
				id = Integer.parseInt(id_proParam);
			}

			producto p = new producto(id, nombre, precio, cantidad, categoria);
			String resultado = p.ingresarProducto(id, categoria, nombre, cantidad, precio);
			if (p.getId_cat() == 1) {
				cat = "Juegos Fisicos";
			} else if (p.getId_cat() == 2) {
				cat = "Mandos";
			}
			%>
			<p>
				El producto
				<%=nombre%></p>
			<p>
				con la categoria
				<%=cat%></p>
			<p>
				con un stock de
				<%=cantidad%></p>
			<p>
				de precio
				<%=precio%>$
			</p>

			<p>
				El producto
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

