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
import service.AvaliacaoService;
import service.EntregaService;
import service.GrupoService;

/**
 * Servlet implementation class ListarEntregaController
 */
@WebServlet("/ListarEntregaController")
public class ListarEntregaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarEntregaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//SESSION
				HttpSession session   = request.getSession();
				String grupoIdSession = session.getAttribute("idGrupo").toString();
				
				session.setAttribute("pIdGrupo", grupoIdSession);
				//BUSCA ENTREGAS DE ACORDO COM O GRUPO
				GrupoService gs = new GrupoService();
				ArrayList<Grupo> listGrupo = null;
				session = request.getSession();	

				int idGrupo = (grupoIdSession != null) ? Integer.parseInt(grupoIdSession) : -1;
				
				listGrupo = gs.loadGrupoByTurma(idGrupo);
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
