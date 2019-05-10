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
import model.Turma;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//SESSION
		HttpSession session   = request.getSession();
		String turmaIdSession =  session.getAttribute("idTurma").toString();
		
		//BUSCA GRUPO DE ACORDO COM TURMA
		GrupoService gs = new GrupoService();
		ArrayList<Grupo> listGrupo = null;
		session = request.getSession();	
		
		int idTurma = (turmaIdSession != null) ? Integer.parseInt(turmaIdSession) : -1;
		
		listGrupo = gs.loadGrupoByTurma(idTurma);
		request.setAttribute("listGrupo", listGrupo);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("selectEntrega.jsp");
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
