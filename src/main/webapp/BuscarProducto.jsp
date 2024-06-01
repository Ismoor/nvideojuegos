<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.productos.negocio.*"%>
<% 
int cod = Integer.parseInt(request.getParameter("cod"));
producto mp = new producto();
mp.ConsulEditarProductos(cod);
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
			<form action="EditarProducto.jsp" method="post">
				<table>
					<tr>
						<td>Codigo Producto:</td>
						<td><input type="text" name="editarcod" value="<%=cod%>"></td>
					</tr>
					<tr>
						<td>Categoria:</td>
						<td><output><%=mp.getId_cat() %></output></td>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input type="text" name="editardesc" value="<%=mp.getNombre()%>"></td>
					</tr>
					<tr>
						<td>Precio:</td>
						<td><input type="text" name="editarprec" value="<%=mp.getPrecio()%>" maxlength="7"></td>
					</tr>
					<tr>
						<td>Cantidad:</td>
						<td><input type="text" name="editarcant" value="<%=mp.getCantidad()%>"></td>
					</tr>
					<br />
					<br /> <input type="submit" name="Actualizar">
				</table>
			</form>
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