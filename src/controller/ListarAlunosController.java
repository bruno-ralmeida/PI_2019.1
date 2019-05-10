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
import model.Grupo;
import service.AlunoService;
import service.GrupoService;

/**
 * Servlet implementation class ListarAlunosController
 */
@WebServlet("/ListarAlunosController.do")
public class ListarAlunosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarAlunosController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//SESSION
		HttpSession session   = request.getSession();
		String grupoIdSession = session.getAttribute("pidGrupo").toString();
		//BUSCA GRUPO DE ACORDO COM TURMA
		AlunoService as = new AlunoService();
		ArrayList<Aluno> listAluno = null;
		session = request.getSession();	
		int idGrupo = (grupoIdSession != null) ? Integer.parseInt(grupoIdSession) : -1;
		listAluno = as.grupoAlunos(idGrupo);
		request.setAttribute("listAluno", listAluno);
		RequestDispatcher dispatcher = request.getRequestDispatcher("selectAluno.jsp");
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
