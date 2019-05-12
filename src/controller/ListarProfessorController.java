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

import service.ProfessorService;
import service.TurmaService;
import model.Professor;

/**
 * Servlet implementation class ListarProfessorController
 */
@WebServlet("/ListarProfessorController.do")
public class ListarProfessorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarProfessorController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProfessorService ps = new ProfessorService();
		ArrayList<Professor> lista = null;
		String buscar = request.getParameter("bProf");
		String acao = request.getParameter("acao");
		HttpSession session = request.getSession();

		if (acao.equals("Buscar")) {
			lista = ps.findAllName(buscar);
			session.setAttribute("lista", lista);
		} else if (acao.equals("reiniciar")) {
			lista = ps.findAll();
			session.setAttribute("lista", lista);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("professor.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
