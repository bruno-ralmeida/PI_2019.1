package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProfessorService;
import service.TurmaService;

/**
 * Servlet implementation class ListarProfessorController
 */
@WebServlet("/ListarProfessorController")
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//RECEBE O PARAMETRO NOME DO PROFESSOR DESEJADO
		String pBprof = request.getParameter("bProf");
		
		
		//SERVICE
		ProfessorService ps = new ProfessorService();
		//BUSCA TODOS
		request.setAttribute("lista", ps.findAll());
		//BUSCA POR NOME
		request.setAttribute("lista", ps.findAllName(pBprof));
		//ENVIA RESULTADO A JSP
		

		RequestDispatcher view = request.getRequestDispatcher("index.jsp");
		view.forward(request, response);
	}

}
