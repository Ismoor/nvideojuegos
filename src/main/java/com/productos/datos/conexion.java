package com.productos.datos;

import java.sql.*;

import org.apache.catalina.connector.OutputBuffer;

public class conexion {
	private static final conexion instancia = new conexion();
	private Statement St;
	private String driver;
	private String user;
	private String pwd;
	private String cadena;
	private Connection con;

	public conexion() {
		this.driver = "org.postgresql.Driver";
		this.user = "postgres";
		this.pwd = "1234";
		this.cadena = "jdbc:postgresql://localhost:5432/bd_productos";
		this.con = crearConexion();	
	}

	public static conexion obtenerInstancia() {
		return instancia;
	}

	public Connection crearConexion() {
		Connection conexion = null;
		try {
			System.out.println("Intentando cargar el driver...");
			Class.forName(driver);
			System.out.println("Driver cargado exitosamente.");

			System.out.println("Intentando establecer la conexión a la base de datos...");
			conexion = DriverManager.getConnection(cadena, user, pwd);
			System.out.println("Conexión establecida correctamente a la base de datos: " + cadena);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conexion;
	}

	public String Ejecutar(String sql) throws SQLException{
		String error="";
		Statement stmt = con.createStatement();
		try
		{
			stmt=getCon().createStatement();
			stmt.execute(sql);
			error="Datos insertados";
			System.out.println(error);
		}
		catch(Exception ex)
		{
			error = ex.getMessage();
			System.out.println(error);
		}
		return(error);
	}

	public ResultSet Consulta(String sql) throws SQLException {
		Statement stmt = con.createStatement();
		return stmt.executeQuery(sql);
	}

	public void CerrarConexion() {
		if (con != null) {
			try {
				con.close();
				System.out.println("Conexión cerrada correctamente.");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void CerrarStatement(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
				System.out.println("Statement cerrado correctamente.");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void CerrarResultSet(ResultSet rs) {
		// TODO Auto-generated method stub

	}
	public Connection getCon()
	{ 
		return this.con; 
	}
}

