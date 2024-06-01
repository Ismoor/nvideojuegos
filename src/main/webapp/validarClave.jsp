<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%@ page import="com.productos.negocio.*"%>
<%@ page import="java.util.*"%>
<%
String usuario = "";
int perfil=0;
int id_us=0;
String clave ="";
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
perfil = (Integer) sesion.getAttribute("perfil");
id_us = (Integer) sesion.getAttribute("id_us");
clave = (String) sesion.getAttribute("clave");
out.print(clave);
String c_ant = "";
String c_act = "";
String c_act2 = "";
c_ant = request.getParameter("clave_a");
c_act = request.getParameter("clave_n");
c_act2 = request.getParameter("clave_n2");
out.print(c_ant);
out.print(c_act);


usuario us = new usuario(id_us, c_act2);
if(clave!=c_ant){
	response.sendRedirect("cambioClave.jsp?error=Datos incorrectos. Vuelva a intentarlo.");
}else if(c_act!=c_act2){
	response.sendRedirect("cambioClave.jsp?error=Datos incorrectos. Vuelva a intentarlo.");
}else if(us.ModificarClave(us)){
	response.sendRedirect("cerrarSesion.jsp");
}
}
%>