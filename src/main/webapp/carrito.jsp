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
<link href="./css/carrito.css" rel="stylesheet" type="text/css">
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
			<li><a class="active" href="carrito.jsp">Carrito de compras</a></li>
		</ul>

	</nav>
	<section class="main-section">
		<article>
			<form name="listadoProductos" action="carrito.jsp">
				<%
				producto producto = new producto();
				String tabla = producto.consultarProductos();
				out.print(tabla);
				%>
				<p>
					<input type="submit" name="button" id="button" value="Enviar" />
				</p>
			</form>
			<h2>Mi carrito</h2>
			<img src="imagenes/carrito.png" width="80" height="100"
				alt="carrito de compras" />
			<ul>
				<%
				List<String> listaElementos = (List<String>) session.getAttribute("carrito");
				String nompr = "";
				int e=0;
				Double pr=0.0;
				producto p = new producto();
				if (listaElementos == null) {
					listaElementos = new ArrayList<String>();
					session.setAttribute("carrito", listaElementos);
				}
				String[] elementos = request.getParameterValues("productos");
				int i = 0;
				if (elementos != null) {
					while (i < elementos.length) {
						listaElementos.add(elementos[i]);
						i++;
					}
				}
				for (String tmp : listaElementos) {
					e = Integer.parseInt(tmp);
					nompr = p.consultarNombrePrecio(e);
					pr += p.consultarPrecio(e);
					//if()
					out.println("<li>" + nompr + "</li>");
				}
				%>
			</ul>
			<p>Precio total: <%= pr%></p>


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