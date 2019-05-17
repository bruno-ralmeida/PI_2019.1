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
import model.Turma;
import service.ProfessorService;
import service.TurmaService;
import service.UsuarioService;

/**
 * Servlet implementation class ListarTurmaController
 */
@WebServlet("/ListarTurmaController.do")
public class ListarTurmaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarTurmaController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
		HttpSession session = request.getSession();
		
		Professor professor =  (Professor) session.getAttribute("usuario");
		
		
		TurmaService ts = new TurmaService();
		ArrayList<Turma> listTurma = null;
		
		if (acao.equals("buscar")) {
		listTurma = ts.selectId(professor.getId());
		session.setAttribute("listTurma", listTurma);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("selectTurma.jsp");
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
