package model;

import java.util.ArrayList;

import dao.ProfessorDAO;

/**
*
* @author Bruno Rocha
*/
public class Professor extends Usuario {

	private int administrador;
	private String matricula;
	private ArrayList<Grupo> lstGrupos;

	public Professor(String email, String senha) {
		super(email, senha);
	}


	public Professor(int id, String nome, String email, String senha, String matricula2, int administrador2) {
		super(email, senha);
	}


	public int getAdministrador() {
		return administrador;
	}

	public void setAdministrador(int administrador) {
		this.administrador = administrador;
	}

	public String getMatricula() {
		return matricula;
	}
	
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public ArrayList<Grupo> getLstGrupos() {
		return lstGrupos;
	}

	public void setLstGrupos(ArrayList<Grupo> lstGrupos) {
		this.lstGrupos = lstGrupos;
	}
	
	public void create() {
		ProfessorDAO dao = new ProfessorDAO();
		dao.create(this);
	}
	
	public void load() {
		ProfessorDAO dao = new ProfessorDAO();
		dao.load(this.getId());
	}
	
	public void update() {
		ProfessorDAO dao = new ProfessorDAO();		
		dao.update(this);
	}

	public void delete() {
		ProfessorDAO dao = new ProfessorDAO();		
		dao.delete(this.getId());
	}	
	
	@Override
	public String toString() {
		return  this.getNome(); 
	}
}
