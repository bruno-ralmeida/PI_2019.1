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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String nomeAluno = request.getParameter("alunoAvaliado");
		
		HttpSession session = request.getSession();
		Professor prof = (Professor) session.getAttribute("usuario");
		
		
		
		AvaliacaoService as = new AvaliacaoService();
		ArrayList<Avaliacao> listAvaliados = null;
		
	
			System.out.println(prof.getId());
			listAvaliados = as.selectAvaliadosNome(prof.getId(), nomeAluno);
			
			session.setAttribute("listAvaliados", listAvaliados);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ListarAtividadesAvaliadas.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
