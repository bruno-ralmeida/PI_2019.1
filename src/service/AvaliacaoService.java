package service;

import java.io.Serializable;
import java.util.ArrayList;

import model.Aluno;
import model.Avaliacao;
import dao.AlunoDAO;
import dao.AvaliacaoDAO;

public class AvaliacaoService {

	AvaliacaoDAO dao;

	public AvaliacaoService() {
		dao = new AvaliacaoDAO();
	}

	public void insertAvaliacao(ArrayList<Avaliacao> lstAvaliacao, int idGrupo, ArrayList<Aluno> listaAluno) {
		AlunoDAO AlunoDAO = new AlunoDAO();
		ArrayList<Integer> lista = AlunoDAO.turmaAluno(idGrupo, listaAluno);

		for (int i = 0; i < lstAvaliacao.size(); i++) {
			int id = lista.get(i);
			dao.insertAvaliacao(lstAvaliacao.get(i), idGrupo, id);
		}
	}

	public void updateAvaliacao(ArrayList<Avaliacao> listaAvaliacao) {
		dao.updateAvaliacao(listaAvaliacao);
	}

	public ArrayList<Avaliacao> load(int idEntrega) {
		ArrayList<Avaliacao> lista = new ArrayList<Avaliacao>();
		lista = dao.selectEntrega(idEntrega);
		return lista;
	}

	public Avaliacao selectId(int id) {
		return dao.selectId(id);
	}

	public ArrayList<Avaliacao> selectAvaliadosNome(int idProf, String nomeAluno) {
		return dao.selectAvaliadosNome(idProf, nomeAluno);
	}
}
