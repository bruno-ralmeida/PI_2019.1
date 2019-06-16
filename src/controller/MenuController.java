package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Professor;
import model.Turma;
import service.TurmaService;

/**
 * Servlet implementation class MenuController
 */
@WebServlet("/LoginManter")
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//SESSION
		HttpSession session   = request.getSession();
		String periodoSession = (String) session.getAttribute("periodoSelected");
		String turmaIdSession = (String) session.getAttribute("turmaId");
		
		//PARAMETERS
		String turmaId = request.getParameter("turma");
		String periodoSelected = request.getParameter("periodo");
		
		
		//SUBSTITUI PELA SESSION CASO PAR�METRO VENHA NULO
		if(periodoSelected == null) periodoSelected = periodoSession;
		
		//PER�ODO - SPLIT
		String[] splitPeriodo = new String[2];
		splitPeriodo = (periodoSelected != null) ? periodoSelected.split("-") : new String[2];
		periodoSelected = (periodoSelected != null) ? periodoSelected : (String) session.getAttribute("periodo");
		session.setAttribute("periodoSelected", periodoSelected);
		
		//BUSCA PER�ODOS
		TurmaService ts = new TurmaService();
		ArrayList<Turma> lstPeriodo = ts.mostrarAno();
		request.setAttribute("lstPeriodo", lstPeriodo);
		session.setAttribute("lstPeriodo", lstPeriodo);
		
		//BUSCA TURMAS
		int ano = (splitPeriodo[0] != null) ? Integer.parseInt(splitPeriodo[0]) : 0;
		int semestre = (splitPeriodo[1] != null) ? Integer.parseInt(splitPeriodo[1]) : 0;
		Professor prof = (Professor) session.getAttribute("usuario");
		ArrayList<Turma> lstTurmas = ts.selectTurmaPeriodo(prof.getId(), ano, semestre);
		request.setAttribute("lstTurmas", lstTurmas);
		session.setAttribute("lstTurmas", lstTurmas);
		session.setAttribute("turmaId", turmaId);
		//REDIRECIONAMENTO DE P�GINA
		String uri = request.getHeader("referer");
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		if(pageName.equals("login.jsp")) pageName = "index.jsp";
		//TODA HORA QUE O MENU CONTROLLER FOR CHAMADO ELE IR� REDIRECIONAR A P�GINA PARA O INDEX
			if(!pageName.equals("index.jsp"))
			pageName = "index.jsp";
		
		response.sendRedirect(pageName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
