package controller;

import java.io.IOException;
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
		String pCsenha = request.getParameter("cSenha");
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
		// CRIAR
		if (pAcao.equals("Criar")) {
			ps.create(professor);
			ArrayList<Professor> lista = new ArrayList<>();
			lista.add(professor);
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("index.jsp");
			// EXCLUIR
		} else if (pAcao.equals("Excluir")) {
			ps.delete(professor.getId());
			ArrayList<Professor> lista = new ArrayList<>();
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("index.jsp");		
			
		} else if (pAcao.equals("Alterar")) {
			ps.update(professor);
			ArrayList<Professor> lista = new ArrayList<>();
			session.setAttribute("lista", lista);
			request.setAttribute("professor", professor);
			view = request.getRequestDispatcher("detProfessor.jsp"); 
		} else if (pAcao.equals("Visualizar")) {
			professor = ps.load(professor.getId());
			request.setAttribute("professor", professor);
			view = request.getRequestDispatcher("detProfessor.jsp");
		} else if (pAcao.equals("Editar")) {
			professor = ps.load(professor.getId());
			request.setAttribute("professor", professor);
			view = request.getRequestDispatcher("alterarProfessor.jsp");
		}

		view.forward(request, response);

	}


}
