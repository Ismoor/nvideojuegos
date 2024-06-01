<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="com.productos.negocio.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>N videojuegos</title>
<link href="./css/login.css" rel="stylesheet" type="text/css">
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
			<div class="login-box">
				<h2>Login</h2>
				<form action="verificarLogin.jsp" method="post">
					<div class="user-box">
						<input type="text" name="email" required=""> <label>Email</label>
					</div>
					<div class="user-box">
						<input type="password" name="password" required=""> <label>Password</label>
					</div>
					<button type="submit">Iniciar sesion</button>

					<div class="links">
                    <a href="#">Olvidaste tu contraseña?</a>
                    <p style="color: green;">
                        <%= request.getParameter("error") %>
                    </p>
                    <p>No tienes una cuenta? <a href="formulario.jsp">Regístrate aquí</a></p>
                </div>
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