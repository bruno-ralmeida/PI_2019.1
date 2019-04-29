package service;

import java.io.Serializable;
import java.util.ArrayList;

import dao.ProfessorDAO;
import dao.TurmaDAO;
import model.Professor;
import model.Turma;

public class TurmaService implements Serializable {
	
	TurmaDAO dao;
	
	
	public TurmaService() {
		dao = new TurmaDAO();
	}
	
	public void create(Turma turma) {
		dao.create(turma);
	}
	
	public ArrayList<Turma> findAll() {
		return dao.findAll();
	}
	

}
