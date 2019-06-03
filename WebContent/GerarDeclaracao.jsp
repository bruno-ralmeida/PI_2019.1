<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="fonts/css/all.min.css" rel="stylesheet">
<title>Declaração</title>
</head>
<div class="d-print-none">
	<div class="card text-center">
		<div class="card-body">
			<a href="selectGrupoDeclaracao.jsp" class="btn btn-default"
				style="width: 15%;"><i class="fas fa-reply"></i></a>
			<button onclick="imprimir()" class="btn btn-primary"
				style="width: 15%">
				<i class="fas fa-print"></i>
			</button>

		</div>
	</div>
</div>


<div class="container-fluid" style="margin-top: 2%">
	<div class="container bg-light"
		style="padding-bottom: 2%; border: outset 5px; margin-top: 15px">

		<!-- LOGO PRINCIPAL -->
		<div class="row center-block">
			<div class="col-lg-12">
				</br> <img src="Img/usjt.png" class="rounded mx-auto d-block img-width">
			</div>
		</div>

		<div class="row mt-30" style="padding: 2%">
			<div class="col-md-6 offset-md-3 text-center">
				<h1>Declaração</h1>
				<h3 style="font-size: 24px;">
					Declaro, para os devidos fins, que o professor
					</h3>
					<h3 style="font-size: 24px;">${orientador.nome}</h3>
					<p>
						participou, na qualidade de professor orientador, da Banca de
						Trabalho de Conclusão de Curso de Graduação dos alunos
						<c:forEach var="aluno" items="${listaAlunos}">
							<b>${aluno.nome}</b>, </c:forEach>
						no dia
						<fmt:formatDate pattern="dd/MM/yyyy" value="${banca.data }" />
						, nesta Universidade, sob o título:
						<c:forEach var="entrega" items="${listEntrega }">${entrega.atividade }</c:forEach>
					</p>

					<p>
						São Paulo, <fmt:formatDate pattern="dd/MM/yyyy" value="${listAvaliacao.dataAvaliacao}"/>.
					</p>

					<div class="table-responsive col-md-12">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td>Banca Examinadora</td>
								</tr>
								<tr>
									<td>Professor orientador: <c:forEach var="professor"
											items="${listaProfessores}">
											<c:if test="${professor.nome != orientador.nome}">
												<b>${professor.nome}, </b>
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>

		</div>
		<p style="text-align: center;">Professora Dra. Ana Paula Gonçalves Serra</br> Coordenadora dos
						cursos Ciência da Computação, Engenharia de Computação, Sistemas
						de Informação e</br> Tecnologia em Análise e Desenvolvimento de
						Sistemas
					</p>
		

	</div>
</div>

<script>
	function imprimir() {
		window.print();
	}
</script>

<body>

	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>