<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%
String usuario="";
HttpSession sesion = request.getSession();
 if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
 {
 %>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
 }
 else
 {
 usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
 int perfil=(Integer)sesion.getAttribute("perfil");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>N videojuegos</title>
<link href="./css/menu.css" rel="stylesheet" type="text/css">
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
			<%
				pagina pag=new pagina();
				String menu=pag.mostrarMenu(perfil);
				out.print(menu);
			%>
		</ul>

	</nav>
	<section class="main-section">
		<article>
			<h1>Sitio Privado de Productos</h1>
			<h4>
				Bienvenido
				<%
					out.println(usuario);
					if(perfil==1){
						%>
						<h2>Bienvenido usuario Administrador</h2>
						<%
					}else if(perfil==2){
						%>
						<h2>Bienvenido usuario Vendedor</h2>
						<%
					}else if(perfil==3){
						%>
						<h2>Bienvenido usuario Cliente</h2>
						<%
					}
				%>
			</h4>
				<%
					
					out.print(menu);
 				}
				%>
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