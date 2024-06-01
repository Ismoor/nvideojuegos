<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productos.negocio.*"%>
<% 
	int cod=0;
	String des="";
	float pre=0;
	int can=0;
	cod = Integer.parseInt(request.getParameter("editarcod"));
	des = request.getParameter("editardesc");
	pre = Float.parseFloat(request.getParameter("editarprec"));
	can = Integer.parseInt(request.getParameter("editarcant"));
	producto mp = new producto(cod, des, pre, can);
	boolean actualizado = mp.ModificarProducto(mp);
	if(actualizado == true){
		response.sendRedirect("menuVendedor.jsp");
	} else {
		out.println("Algo salio mal");
	}

%>