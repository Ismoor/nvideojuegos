<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.productos.negocio.*"%>
<%
String categoriaSeleccionada = request.getParameter("cmbCategoria");
int idCategoria = (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty())
		? Integer.parseInt(categoriaSeleccionada)
		: 0;

categoria c = new categoria();
String nombreCategoria = c.obtenerNombreCategoria(idCategoria);

producto p = new producto();
String resultadoCategoria = p.buscarPrCat(idCategoria);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>N videojuegos</title>
<link href="./css/categoria.css" rel="stylesheet" type="text/css">
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
			<li><a class="active" href="categoria.jsp">Buscar Por
					Categoria</a></li>
			<li><a href="login.jsp">Login</a></li>
		</ul>
	</nav>
	<section class="main-section">
		<article>
			<h2>Productos</h2>
			<ul>
				<form method="post" action="reporteCategoria.jsp">
					<label for="categoria">Seleccionar Categoria:</label>
					<%
						String opcCategoria = c.mostrarCategoria();
						out.println(opcCategoria);
						%>
					<button type="submit">Mostrar Reporte</button>
				</form>
			</ul>
			<p>
				Nombre de la Categoría:
				<%=nombreCategoria%></p>
				<%=resultadoCategoria%>
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