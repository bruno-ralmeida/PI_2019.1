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

import dao.AlunoDAO;
import dao.EntregaDAO;
import model.Aluno;
import model.Entrega;
import model.Grupo;
import service.AlunoService;
import service.EntregaService;
import service.GrupoService;

/**
 * Servlet implementation class ManterAvaliacaoController
 */
@WebServlet("/ManterAvaliacaoController.do")
public class ManterAvaliacaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RequestDispatcher view;
	private RequestDispatcher view2;

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
		String pId = request.getParameter("id");
		String pAcao = request.getParameter("acao");
		
		
		int id = -1;
	
		try {
		
			id = Integer.parseInt(pId);
			
		} catch(Exception e) {
			
		}
		
		
		HttpSession session = request.getSession();
		GrupoService gs = new GrupoService();
		AlunoService as = new AlunoService();
		EntregaService es = new EntregaService();
		
		
		
		if (pAcao.equals("Turma")) {
			ArrayList<Grupo> listGrupo = null;
			session = request.getSession();
			listGrupo = gs.loadGrupoByTurma(id);
			session.setAttribute("listGrupo", listGrupo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("selectGrupo.jsp");
			dispatcher.forward(request, response);
		} else if (pAcao.equals("Grupo")) {
			ArrayList<Entrega> listEntrega = null;
			session = request.getSession();
			listEntrega = es.loadTodos(id);
			session.setAttribute("listEntrega", listEntrega);		
			RequestDispatcher dispatcher = request.getRequestDispatcher("selectEntrega.jsp");
			dispatcher.forward(request, response);
		} else if (pAcao.equals("Entrega")) {
			ArrayList<Aluno> listAluno = null;
			listAluno = as.grupoAlunos(6);
			session.setAttribute("listAluno", listAluno);
			RequestDispatcher dispatcher = request.getRequestDispatcher("selectAluno.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
