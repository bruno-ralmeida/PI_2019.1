package service;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.ProfessorDAO;
import model.Professor;

public class ProfessorService {

	ProfessorDAO dao;
	
	public ProfessorService() {
		dao = new ProfessorDAO();
	}
	
	public boolean create(Professor professor) throws SQLException {
		return dao.create(professor);
	}
	
	public void update(Professor professor) {
		dao.update(professor);
	}
	
	public void delete(int id) throws SQLException {
		dao.delete(id);
}
	
	public Professor load(int id) {
		return dao.load(id);
	}
	
	public ArrayList<Professor> findAllName(String nome){
		return dao.findAllName(nome);
	}
	
	
}
