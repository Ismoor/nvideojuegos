package com.productos.seguridad;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.conexion;

public class pagina {
	private int id_pag;
	String descripcion;
	String path_pag;

	public pagina(int id_pag, String descripcion, String path_pag) {
		super();
		this.id_pag = id_pag;
		this.descripcion = descripcion;
		this.path_pag = path_pag;
	}
	public pagina() {
		
	}

	public String mostrarMenu(int nperfil) {
		String menu="";
		String sql="SELECT * FROM tb_pagina pag, tb_perfil per, tb_pagper pper "
				+"WHERE pag.id_pag=pper.id_pag AND pper.id_per=per.id_per AND pper.id_per= "
				+ nperfil;
		conexion con = new conexion();
		ResultSet rs=null;
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				menu+="<li><a href="
			+ rs.getString(3)
			+ " accesskey="
			+ rs.getInt(1)+">"
			+ rs.getString(2)
			+ "</a></li>";
			}
			menu+="";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return menu;
	}	


	public int getId_pag() {
		return id_pag;
	}
	public void setId_pag(int id_pag) {
		this.id_pag = id_pag;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getPath_pag() {
		return path_pag;
	}
	public void setPath_pag(String path_pag) {
		this.path_pag = path_pag;
	}

}
