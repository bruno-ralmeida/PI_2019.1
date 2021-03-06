package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Professor;
import service.ProfessorService;

/**
 * Servlet implementation class ManterProfessorController
 */
@WebServlet("/ManterProfessorController.do")
public class ManterProfessorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pAcao = request.getParameter("acao");
		String pNome = request.getParameter("nome");
		String pEmail = request.getParameter("email");
		String pSenha = request.getParameter("senha");
		String pMatricula = request.getParameter("matricula");
		String pAdministrador = request.getParameter("administrador");

		if (pAdministrador == null || pAdministrador.isEmpty())
			pAdministrador = "0";
		if (pAdministrador.equals("on"))
			pAdministrador = "1";

		int id = -1;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {

		}

		Professor professor = new Professor(pEmail, pSenha);
		professor.setId(id);
		professor.setNome(pNome);
		professor.setMatricula(pMatricula);
		professor.setAdministrador(Integer.parseInt(pAdministrador));

		ProfessorService ps = new ProfessorService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		String error = null;
		String errorC = null;
		// CRIAR
		if (pAcao.equals("Criar")) {
			try {
				if (ps.create(professor)) {
					ArrayList<Professor> lista = new ArrayList<Professor>();
					lista.add(professor);
					session.setAttribute("lista", lista);
					view = request.getRequestDispatcher("ListarProfessor.jsp");
				} else {
					errorC = "N�o Foi possivel inserir o novo professor";
					view = request.getRequestDispatcher("cadProfessor.jsp");
				}

			} catch (SQLException e) {
				if (e != null) {
					errorC = "N�o Foi possivel inserir o novo professor ";
					view = request.getRequestDispatcher("cadProfessor.jsp");
				}
			}

			// EXCLUIR
		} else if (pAcao.equals("Excluir")) {

			try {
				ps.delete(professor.getId());
				ArrayList<Professor> lista = (ArrayList<Professor>) session.getAttribute("lista");
				lista.remove(busca(professor, lista));
			} catch (Exception e) {
				if (e != null) {
					error = "N�o Foi possivel excluir o professor";
				}
			}
			view = request.getRequestDispatcher("ListarProfessor.jsp");
			// ALTERAR
		} else if (pAcao.equals("Alterar")) {
			error = null;
			ps.update(professor);
			ArrayList<Professor> lista = (ArrayList<Professor>) session.getAttribute("lista");
			int pos = busca(professor, lista);
			lista.remove(pos);
			lista.add(pos, professor);
			session.setAttribute("lista", lista);
			request.setAttribute("professor", professor);
			view = request.getRequestDispatcher("detProfessor.jsp");
		} else if (pAcao.equals("Visualizar")) {
			error = null;
			professor = ps.load(professor.getId());
			request.setAttribute("professor", professor);
			view = request.getRequestDispatcher("detProfessor.jsp");
		} else if (pAcao.equals("Editar")) {
			error = null;
			professor = ps.load(professor.getId());
			request.setAttribute("professor", professor);
			view = request.getRequestDispatcher("alterarProfessor.jsp");
		}
		session.setAttribute("erroProf", error);
		session.setAttribute("erroC", errorC);
		view.forward(request, response);

	}

	public int busca(Professor professor, ArrayList<Professor> lista) {
		Professor to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getId() == professor.getId()) {
				return i;
			}
		}
		return -1;
	}

}
