package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SairController
 */
@WebServlet("/ManterUsuarioController")
public class ManterUsuarioCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManterUsuarioCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();	
		
		if(acao.equals("Sair")) {
			session.setAttribute("usuario", null);
			session.setAttribute("erro", null);
			session.setAttribute("lstPeriodo", null);
			session.setAttribute("periodoSelected", null);
			session.setAttribute("turmaId", null);
			session.setAttribute("listAluno", null);
			session.setAttribute("listAvaliacao", null);
			session.setAttribute("ano", null);
			session.setAttribute("semestre", null);
			session.setAttribute("anoMax", null);
			session.setAttribute("semMax", null);
			response.sendRedirect("Login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}