<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="Menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Avaliação</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="assets/style/utils.css" rel="stylesheet" />
</head>
<body>
	<!-- Barra superior com os menus de navegação -->
	<div id="main" class="container" style="padding-top: 3%">

		<form action="ListarTurmaController.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h3>
						<strong>Selecione uma turma </strong>
					</h3>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="bProf" class="form-control" id="search" type="text"
							placeholder="Pesquisar Turmas (deixe vazio para trazer todos)">
						<span class="input-group-btn" style="padding-left: 5%">
							<button class="btn btn-default" type="submit" name="acao"
								value="buscar">
								<span class="glyphicon glyphicon-search">Buscar</span>
							</button>
						</span>
					</div>
				</div>

			</div>
			<!-- /#top -->
		</form>
		<hr />
		<div id="list" class="row">


			<div class="table-responsive col-md-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Sigla</th>
							<th>Semestre Letivo</th>
							<th>Ano Letivo</th>
							<th class="actions">Ações</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach var="turma" items="${listTurma }">
							<tr>
								<input type="hidden" value= ${turma.id }>
								<td>${turma.sigla }</td>
								<td>${turma.semestreLetivo }</td>
								<td>${turma.anoLetivo }</td>
								<td class="actions"><a class="btn btn-success btn-xs"
									href="ManterAvaliacaoController.do?acao=Turma&id=${turma.id }"
									style="padding: 2%">Selecionar</a></td>
							</tr>
						</c:forEach>
					<thead>
					</tbody>
				</table>
			</div>
		</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
