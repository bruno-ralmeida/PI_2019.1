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

import model.Entrega;
import model.Grupo;
import model.Professor;
import model.Turma;
import service.AvaliacaoService;
import service.EntregaService;
import service.GrupoService;
import service.TurmaService;

/**
 * Servlet implementation class ListarGrupo
 */
@WebServlet("/ListarGrupoController.do")
public class ListarGrupoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarGrupoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// SESSION
		HttpSession session = request.getSession();
		String turmaIdSession = (String) session.getAttribute("turmaId");

		String pAcao = request.getParameter("acao");
		String grupoNome = request.getParameter("nomeGrupo");

		// BUSCA GRUPO DE ACORDO COM TURMA
		GrupoService gs = new GrupoService();
		ArrayList<Grupo> listGrupo = null;

		int idTurma = (turmaIdSession != null) ? Integer.parseInt(turmaIdSession) : -1;

		listGrupo = gs.selectGrupoNome(idTurma, grupoNome);

		request.setAttribute("listGrupo", listGrupo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("selectGrupo.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
