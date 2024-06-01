package com.productos.negocio;

import com.productos.datos.conexion;

import java.io.File;
import java.io.FileInputStream;
import java.sql.*;

public class producto {
	private int id;
	private int id_cat;
	private String nombre;
	private int cantidad;
	private double precio;
	private byte foto;
	public producto() {

	}

	public producto(int id, String nombre, double precio) {
		this.id = id;
		this.nombre = nombre;
		this.precio = precio;
	}

	public producto(int id, String nombre, double precio, int can) {
		this.id = id;
		this.nombre = nombre;
		this.precio = precio;
		this.cantidad = can;
	}
	public producto(int id, String nombre, double precio, int can, int cat) {
		this.id = id;
		this.nombre = nombre;
		this.precio = precio;
		this.cantidad = can;
		this.id_cat = cat;
	}

	public String buscarProductoCategoria(int cat) {
		String sentencia = "SELECT id_pr, nombre_pr, precio_pr, cantidad_pr FROM tb_producto WHERE id_cat=" + cat;
		conexion con = new conexion();
		ResultSet rs = null;
		String resultado = "<table border=1><th>ID</th><th>Producto</th><th>Precio</th><th>Cantidad</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				resultado += "<tr><td>" + rs.getInt(1) + "</td>"
						+ "<td>" + rs.getString(2) + "</td>"
						+ "<td>" + rs.getDouble(3)+ "</td>"
						+ "<td>" + rs.getInt(4)+ "</td>"
						+ "<td> <a href= BuscarProducto.jsp?cod=" + rs.getInt(1) 
						+ "><pre style=\"text-align: center\">Modificar</pre></a></td>"
						+ "<td> <a href= EliminarProducto.jsp?cod=" + rs.getInt(1)
						+ " \"><pre style=\"textalign: center\">Eliminar</pre></a></td></tr>"
						;
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}
	public String buscarPrCat(int cat) {
		String sentencia = "SELECT id_pr, nombre_pr, precio_pr, cantidad_pr FROM tb_producto WHERE id_cat=" + cat;
		conexion con = new conexion();
		ResultSet rs = null;
		String resultado = "<table border=1><th>ID</th><th>Producto</th><th>Precio</th><th>Cantidad</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				resultado += "<tr><td>" + rs.getInt(1) + "</td>"
						+ "<td>" + rs.getString(2) + "</td>"
						+ "<td>" + rs.getDouble(3)+ "</td>"
						+ "<td>" + rs.getInt(4)+ "</td>"
						+ "</tr>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}
	//CONSULTAR EDITAR
	public void ConsulEditarProductos (int cod) {
		conexion obj = new conexion (); 
		ResultSet rs = null;
		String sql = "SELECT id_pr, id_cat, nombre_pr, precio_pr, cantidad_pr FROM tb_producto where id_pr = "+ cod;
		try {
			rs= obj.Consulta (sql);
			while (rs.next()) {
				setId(rs.getInt(1));
				setId_cat(rs.getInt(2));
				setNombre(rs.getString(3));
				setPrecio(rs.getFloat (4));
				setCantidad(rs.getInt (5));
			}
		} catch (Exception e) {
		}
	}

	//MODIFICAR
	public boolean ModificarProducto (producto mp) {
		boolean agregado = false;
		conexion obj = new conexion();
		String sql = "UPDATE tb_producto SET nombre_pr='" + mp.getNombre() + "', precio_pr = "+mp.getPrecio()
		+ ",cantidad_pr = "+mp.getCantidad() + " WHERE id_pr = "+mp.getId() ;
		try {
			obj.Ejecutar (sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}
	//ELIMINAR
	public boolean EliminarProducto(int cod) {
		boolean f=false;
		conexion con = new conexion();
		String sql = "delete from tb_producto where id_pr = '"+cod+"'";
		try {
			con.Ejecutar(sql);
			f = true;
		} catch(Exception e) {
			f = false;
		}
		return f;
	}

	public String mostrarProducto() {
		StringBuilder combo = new StringBuilder("<select name='cmbCategoria'>");
		String sql = "SELECT id_pr, nombre_pr FROM tb_producto";
		ResultSet rs = null;
		conexion con = new conexion();

		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				combo.append("<option value='")
				.append(rs.getInt(1))
				.append("'>")
				.append(rs.getString(2))
				.append("</option>");
			}
			combo.append("</select>");
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}

		return combo.toString();
	}

	public producto obtenerProducto() {
		conexion con = new conexion();
		ResultSet rs = null;
		producto producto = new producto(cantidad, nombre, precio);

		try {
			String consulta = "SELECT * FROM tb_producto WHERE id_pr = " + this.id;
			rs = con.Consulta(consulta);
			if (rs.next()) {
				producto.setId(rs.getInt("id_pr"));
				producto.setNombre(rs.getString("nombre_pr"));
				producto.setCantidad(rs.getInt("cantidad_pr"));
				producto.setPrecio(rs.getDouble("precio_pr"));
				producto.setFoto(rs.getByte("foto_pr"));
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			con.crearConexion();
		}

		return producto;
	}

	public String consultarProductos(){
		String sql="SELECT * FROM tb_producto GROUP BY id_pr";
		conexion con=new conexion();
		String tabla="<table class=table table-striped><th>Producto</th><th>Precio</th><th>Añadir al carrito</th>";
		ResultSet rs=null;
		try {
			rs=con.Consulta(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getString(3)+"</td>"
						+"<td>"+rs.getDouble(5)+"</td>"
						+ "<td><input type=checkbox name=productos value="+rs.getString(1)+" </td>"
						+ "</tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	
	public String consultarNombrePrecio(int id_pr){
		String sql="SELECT * FROM tb_producto WHERE id_pr = " + id_pr;
		conexion con=new conexion();
		String nombre="";
		ResultSet rs=null;
		try {
			rs=con.Consulta(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				nombre=rs.getString(3)+" " + rs.getDouble(5);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return nombre;
	}
	public Double consultarPrecio(int id_pr){
		String sql="SELECT * FROM tb_producto WHERE id_pr = " + id_pr;
		conexion con=new conexion();
		Double precio=0.0;
		ResultSet rs=null;
		try {
			rs=con.Consulta(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				precio=rs.getDouble(5);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return precio;
	}


	public String ingresarProducto(int id, int cat,String nombre, int cantidad, double precio)
//			,String directorio)
	{
		String result="";
		conexion con=new conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_producto (id_pr,id_cat,"
				+ "nombre_pr,cantidad_pr,precio_pr)"
				//+ ",foto_pr) "
				+ "VALUES(?,?,?,?,?)";
				//+ ",?)";
		try{
			pr=con.getCon().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setInt(2,cat);
			pr.setString(3, nombre);
			pr.setInt(4, cantidad);
			pr.setDouble(5, precio);
//			File fichero=new File(directorio);
//			FileInputStream streamEntrada=new FileInputStream(fichero);
//			pr.setBinaryStream(6, streamEntrada,(int)fichero.length());
			if(pr.executeUpdate()==1)
			{
				result="se ingreso correctamente.";
			}
			else
			{
				result="no se ingreso a la base de datos.";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
		}
		finally
		{
			try
			{
				pr.close();
				con.getCon().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_cat() {
		return id_cat;
	}

	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public byte getFoto() {
		return foto;
	}

	public void setFoto(byte foto) {
		this.foto = foto;
	}
}
