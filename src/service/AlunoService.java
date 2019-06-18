package service;

import java.util.ArrayList;

import dao.AlunoDAO;
import model.Aluno;

public class AlunoService {

	AlunoDAO dao;
	
	public AlunoService() {
		dao = new AlunoDAO();
	}
	
	public Aluno load(int id) {
		return dao.load(id);
	}
	
	//PASSANDO UM ID DE GRUPO ELE RETORNA A LISTA DE ALUNOS QUE OS MESMOS PERTECEM
	public ArrayList<Aluno> grupoAlunos(int id, int idTurma) {
		return dao.grupoAlunos(id, idTurma);
	}
	
	//RETORNA O ID DE TURMA_ALUNO DE UM ALUNO PASSANDO SEU GRUPO E ID
	public ArrayList<Integer> turmaAluno(int idGrupo, ArrayList<Aluno> listaAluno) {
		return dao.turmaAluno(idGrupo, listaAluno);
	}
	
}
