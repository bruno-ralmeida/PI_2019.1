package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Avaliacao;
import model.Professor;
import service.AvaliacaoService;

/**
 * Servlet implementation class ListarAvaliadosController
 */
@WebServlet("/ListarAvaliadosController.do")
public class ListarAvaliadosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarAvaliadosController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pAcao = request.getParameter("acao");
		

		HttpSession session = request.getSession();
		Professor prof = (Professor) session.getAttribute("usuario");
		int idTurma;
		String erroA = null;

		AvaliacaoService as = new AvaliacaoService();
		ArrayList<Avaliacao> listAvaliados = null;
		if (pAcao.equals("Buscar")) {
			session.setAttribute("listAvaliados", null);
			try {
				String nomeAluno = request.getParameter("alunoAvaliado");
				String idT = (String) session.getAttribute("turmaId");
				idTurma = Integer.parseInt(idT);
				System.out.println(nomeAluno);
				System.out.println(prof.getId());
				System.out.println(idTurma);
				listAvaliados = as.selectAvaliadosNome(prof.getId(), nomeAluno, idTurma);
				session.setAttribute("listAvaliados", listAvaliados);
				
			} catch (Exception e) {
				session.setAttribute("listAvaliados", null);
				erroA = "Dados n�o encontrados!";
			}
			session.setAttribute("erroA", erroA);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ListarAtividadesAvaliadas.jsp");
			dispatcher.forward(request, response);
		}

	
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
