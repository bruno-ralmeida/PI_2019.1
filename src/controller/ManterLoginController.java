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

import model.Aluno;
import model.Professor;
import model.Turma;
import service.AlunoService;
import service.ProfessorService;
import service.TurmaService;
import service.UsuarioService;

/**
 * Servlet implementation class ManterLogin
 */
@WebServlet("/ManterLoginController.do")
public class ManterLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManterLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		
		//Carrega os dados do BD
		UsuarioService us = new UsuarioService();
		int id = us.logar(email, senha);	
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();	
		ProfessorService ps = new ProfessorService();
		Professor professor = ps.load(id);
		
		if(id > 0) {
			
			//Verificação de professor.
			if(professor != null) {
				session.setAttribute("usuario", professor);
				view = request.getRequestDispatcher("LoginManter");
				view.forward(request, response);
			}else {
				response.sendRedirect("login.jsp");
				
			}
		}else {
			response.sendRedirect("login.jsp");
			
		}	
		
			
		
	}

}