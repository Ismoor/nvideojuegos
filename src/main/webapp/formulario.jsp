<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
            <li><a href="index.jsp">Home</a></li>
            <li><a href="categoria.jsp">Buscar Por Categoria</a></li>
            <li><a class="active" href="login.jsp">Login</a></li>
        </ul>
    </nav>
    <section class="main-section">
        <article>
            <div class="registro-box">
                <h2>Datos Personales</h2>
                <form action="respuesta.jsp" method="post">
                    <label for="nombre">Nombre:</label> 
                    <input type="text" name="txtnombre" required><br> <br> 
                    <label for="cedula">Número de Cédula:</label> 
                    <input type="text" name="cedula" maxlength="10" required><br> <br>
                    <label for="cmbECivil">Estado Civil:</label> 
                    <select name="cmbECivil">
                        <option value="1">Soltero</option>
                        <option value="2">Casado</option>
                        <option value="3">Divorciado</option>
                        <option value="4">Viudo</option>
                    </select><br> <br> 
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" name="correo" required><br> <br>
                    <label for="clave">Clave:</label> 
                    <input type="password" name="clave" minlength="6" required><br> <br>
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
            <li><a href="https://www.instagram.com/ismoor_pera"><img
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
