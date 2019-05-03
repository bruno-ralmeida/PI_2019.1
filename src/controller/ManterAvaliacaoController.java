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

import model.Grupo;
import service.GrupoService;

/**
 * Servlet implementation class ManterAvaliacaoController
 */
@WebServlet("/ManterAvaliacaoController.do")
public class ManterAvaliacaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManterAvaliacaoController() {
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
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pAcao = request.getParameter("acao");
		int pId = Integer.parseInt(request.getParameter("id"));
		RequestDispatcher view = null;
		GrupoService gs = new GrupoService();

		if (pAcao.equals("Turma")) {
			ArrayList<Grupo> listGrupo = null;
			
			HttpSession session = request.getSession();

			listGrupo = gs.loadGrupoByTurma(pId);
			session.setAttribute("listGrupo", listGrupo);

			RequestDispatcher dispatcher = request.getRequestDispatcher("selectGrupo.jsp");
			dispatcher.forward(request, response);

			// doGet(request, response);
		}
		view.forward(request, response);
	}

}
