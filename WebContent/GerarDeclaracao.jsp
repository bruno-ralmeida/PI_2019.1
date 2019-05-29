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
			<a href="selectGrupoDeclaracao.jsp" class="btn btn-default" style="width: 15%;"><i class="fas fa-reply"></i></a>
			<button onclick="imprimir()" class="btn btn-primary" style="width:15%">
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
				<h4>Declaração</h4>
				</br>
				<p>
					Declaro para os devidos fins que o(a) professor(a) <b>${orientador.nome}</b>
					, participou da Banca do Trabalho de Conclusão de Curso (TCC) dos
					discentes
					<c:forEach var="aluno" items="${listaAlunos}">
						<b>${aluno.nome}</b>, </c:forEach>
					da turma de ${grupo.nome}, da Universidade São Judas Tadeu, tendo a
					participação dos(as) professores(as):
					<c:forEach var="professor" items="${listaProfessores}">
						<c:if test="${professor.nome != orientador.nome}">
							<b>${professor.nome}, </b>
						</c:if>
					</c:forEach>
				</p>

				<p>
					São Paulo,
					<fmt:formatDate pattern="dd/MM/yyyy" value="${banca.data}" />
				</p>
			</div>

		</div>

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