package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Aluno;
import model.Avaliacao;
import model.Entrega;
import model.Grupo;
import service.AlunoService;
import service.AvaliacaoService;
import service.EntregaService;
import service.GrupoService;

/**
 * Servlet implementation class ManterAvaliacaoController
 */
@WebServlet("/ManterAvaliacaoController.do")
public class ManterAvaliacaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Aluno> listAluno;
	private ArrayList<Avaliacao> listAvaliacao;

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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pId = request.getParameter("id");
		String pIdEntrega = request.getParameter("idEntrega");
		String pIdGrupo = request.getParameter("idGrupo");
		String pAcao = request.getParameter("acao");
		String sNota = null;
		String com = null;
		ArrayList<Aluno> listAluno = null;

		listAluno = null;
		RequestDispatcher view = null;

		int id = -1;
		int idGrupo = -1;
		int idEntrega = -1;

		try {
			id = Integer.parseInt(pId);
			idEntrega = Integer.parseInt(pIdEntrega);
			idGrupo = Integer.parseInt(pIdGrupo);
		} catch (Exception e) {

		}

		HttpSession session = request.getSession();
		GrupoService gs = new GrupoService();
		AlunoService as = new AlunoService();
		EntregaService es = new EntregaService();

		if (pAcao.equals("Buscar")) {
			ArrayList<Grupo> listGrupo = null;
			try {
				String idT = (String) session.getAttribute("turmaId");
				int idTurma = Integer.parseInt(idT);
				listGrupo = gs.loadGrupoByTurma(idTurma);
				session.setAttribute("listGrupo", listGrupo);
			} catch (Exception e) {
				// COLOCAR MENSAGEM DE LISTA VAZIA
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("selectGrupo.jsp");
			dispatcher.forward(request, response);
		}

		else if (pAcao.equals("Grupo")) {
			ArrayList<Entrega> listEntrega = null;
			session = request.getSession();
			listEntrega = es.selectNaoAvaliados(id);
			session.setAttribute("listEntrega", listEntrega);
			RequestDispatcher dispatcher = request.getRequestDispatcher("selectEntrega.jsp");
			dispatcher.forward(request, response);
		} else if (pAcao.equals("Entrega")) {

			try {
				session.setAttribute("idEntrega", idEntrega);
				String idT = (String) session.getAttribute("turmaId");
				int idTurma = Integer.parseInt(idT);
				listAluno = as.grupoAlunos(idGrupo, idTurma);
			} catch (Exception e) {
				// COLOCAR MENSAGEM DE LISTA VAZIA
			}
			session.setAttribute("idGrupo", idGrupo);
			session.setAttribute("listAluno", listAluno);
			RequestDispatcher dispatcher = request.getRequestDispatcher("avaliacaoAluno.jsp");
			dispatcher.forward(request, response);
		} else if (pAcao.equals("avaliacaoT")) {

			listAluno = (ArrayList<Aluno>) session.getAttribute("listAluno");
			ArrayList<Avaliacao> listAvaliacao = new ArrayList<Avaliacao>();
			int idGrupoSel = (int) session.getAttribute("idGrupo");
			int idEntregaSel = (int) session.getAttribute("idEntrega");

			String pNotaTodos = request.getParameter("nTodos");
			String pComentariosTodos = request.getParameter("cTodos");

			double nota = Double.parseDouble(pNotaTodos);
			System.out.println(nota);
			// pegar as informacoes do formulario para criar o objeto, logo em seguida joga
			// o mesmo para dentro de uma lista
			for (int i = 0; i < listAluno.size(); i++) {
				int idT = listAluno.get(i).getId();
				Avaliacao avaliacao = new Avaliacao();
				avaliacao.setEntrega(es.loadEntrega(idEntregaSel));
				avaliacao.setNota(nota);
				avaliacao.setComentarios(pComentariosTodos);
				avaliacao.setDataAvaliacao(pegarData());
				avaliacao.setAluno(as.load(idT));
				listAvaliacao.add(avaliacao);
			}

			// AVALIACAO SERVICE
			AvaliacaoService aS = new AvaliacaoService();
			aS.insertAvaliacao(listAvaliacao, idGrupoSel, listAluno);

			ArrayList<Avaliacao> listaT = new ArrayList<>();
			// carrega os objetos para mostrar na tela
			for (int i = 0; i < listAvaliacao.size(); i++) {
				Avaliacao avaliacao = new Avaliacao();
				avaliacao = aS.selectId(listAvaliacao.get(i).getId());
				listaT.add(avaliacao);

			}

			// enviar para o jsp
			request.setAttribute("listAvaliacao", listAvaliacao);
			request.setAttribute("idGrupo", idGrupo);
			view = request.getRequestDispatcher("visualizarAvaliacao.jsp");
			view.forward(request, response);

		} else if (pAcao.equals("avaliacaoI")) {

			listAluno = (ArrayList<Aluno>) session.getAttribute("listAluno");
			ArrayList<Avaliacao> listAvaliacao = new ArrayList<Avaliacao>();
			int idGrupoSel = (int) session.getAttribute("idGrupo");
			int idEntregaSel = (int) session.getAttribute("idEntrega");

			for (int i = 0; i < listAluno.size(); i++) {
				int idT = listAluno.get(i).getId();
				sNota = (String) request.getParameter("n" + idT);
				com = (String) request.getParameter("c" + idT);
				double dNota = Double.parseDouble(sNota);
				// AVALIACAO MODEL
				Avaliacao ava = new Avaliacao();
				ava.setEntrega(es.loadEntrega(idEntregaSel));
				ava.setGrupo(gs.load(idGrupoSel));
				ava.setDataAvaliacao(pegarData());
				ava.setComentarios(com);
				ava.setNota(dNota);
				ava.setAluno(as.load(idT));
				listAvaliacao.add(ava);
			}

			// AVALIACAO SERVICE
			AvaliacaoService aS = new AvaliacaoService();
			aS.insertAvaliacao(listAvaliacao, idGrupoSel, listAluno);

			ArrayList<Avaliacao> lista = new ArrayList<>();
			// carrega os objetos para mostrar na tela
			for (int i = 0; i < listAvaliacao.size(); i++) {
				Avaliacao avaliacao = new Avaliacao();
				avaliacao = aS.selectId(listAvaliacao.get(i).getId());
				lista.add(avaliacao);

			}
			// enviar para o jsp
			request.setAttribute("listAvaliacao", listAvaliacao);
			request.setAttribute("idGrupo", idGrupo);
			view = request.getRequestDispatcher("visualizarAvaliacao.jsp");
			view.forward(request, response);

		} else if (pAcao.equals("Editar")) {
			int idEn = Integer.parseInt(request.getParameter("idEntrega"));
			// enviar para o jsp
			request.setAttribute("idGrupo", idGrupo);
			request.setAttribute("idEntrega", idEn);
			session.setAttribute("idEn", idEn);
			AvaliacaoService aS = new AvaliacaoService();
			ArrayList<Avaliacao> listaAvaliacao = aS.load(idEn);
			request.setAttribute("idEntrega", idEntrega);
			request.setAttribute("listaAvaliacao", listaAvaliacao);
			view = request.getRequestDispatcher("alterarAvaliacao.jsp");
			view.forward(request, response);
		} else if (pAcao.equals("Salvar")) {
			// enviar para o jsp
			int idEn = Integer.parseInt(request.getParameter("idEntrega"));
			AvaliacaoService aS = new AvaliacaoService();
			ArrayList<Avaliacao> listaAvaliacao = new ArrayList<Avaliacao>();
			listaAvaliacao = aS.load(idEn);

			for (int i = 0; i < listaAvaliacao.size(); i++) {
				Avaliacao avaliacao = null;
				int idT = listaAvaliacao.get(i).getId();

				// pegando dados do formulario
				int idAva = Integer.parseInt(request.getParameter("aId" + idT));
				double pNota = Double.parseDouble(request.getParameter("n" + idT));
				String pComentarios = request.getParameter("comentario" + idT);

				// criando uma nova avaliacao e colocando na lista
				avaliacao = new Avaliacao(idAva, pNota, pComentarios);
				listaAvaliacao.set(i, avaliacao);

			}

			aS.updateAvaliacao(listaAvaliacao);
			// enviar para o jsp
			request.setAttribute("idGrupo", idGrupo);
			request.setAttribute("listAvaliacao", listaAvaliacao);
			view = request.getRequestDispatcher("ListarAtividadesAvaliadas.jsp");
			view.forward(request, response);
		} else if (pAcao.equals("Visualizar")) {
			int idEn = Integer.parseInt(request.getParameter("idEntrega"));
			AvaliacaoService aS = new AvaliacaoService();
			ArrayList<Avaliacao> listaAvaliacao = aS.load(idEn);
			// enviar para o jsp
			request.setAttribute("listAvaliacao", listaAvaliacao);
			request.setAttribute("idGrupo", idGrupo);
			view = request.getRequestDispatcher("visualizarAvaliacao.jsp");
			view.forward(request, response);
		}

	}

	public static Date pegarData() {
		java.util.Date dataUtil;
		Date data = new Date(System.currentTimeMillis());
		dataUtil = data;
		java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
		return dataSql;
	}

}