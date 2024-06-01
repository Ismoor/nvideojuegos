<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productos.negocio.*"%>
<% 
	int cod = Integer.parseInt(request.getParameter("cod"));
	producto cp = new producto();
	boolean f = cp.EliminarProducto(cod);
	if(f==true){
		response.sendRedirect("menuVendedor.jsp");
	}

%>