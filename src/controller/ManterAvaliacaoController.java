package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Avaliacao;
import service.AvaliacaoService;
import service.TurmaService;

/**
 * Servlet implementation class ManterProfessorController
 */
@WebServlet("/ManterAvaliacaoController.do")
public class ManterAvaliacaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public static Date formataData(String pData) {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date dataUtil;
		Date data = new Date(System.currentTimeMillis());
		try {
			dataUtil = formato.parse(pData);
		} catch (ParseException e) {
			e.printStackTrace();
			dataUtil = data;
		}
		java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
		return dataSql;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		TurmaService ts = new TurmaService();
		ts.findAll();
		
		// ENVIAR PARA O JSP
		request.setAttribute("lista", ts.findAll());

		RequestDispatcher view = request.getRequestDispatcher("cadAvaliacao.jsp");
		view.forward(request, response);

	}

}
