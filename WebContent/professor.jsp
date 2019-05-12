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

<title>Professor</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />

</head>
<body>
	<!-- Barra superior com os menus de navegação -->
	<div id="main" class="container" style="padding-top: 3%">


		<form action="ListarProfessorController.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2>
						<strong>Professores</strong>
					</h2>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="bProf" class="form-control" id="search" type="text"
							placeholder="Pesquisar Professores (deixe vazio para trazer todos)">
						<span class="input-group-btn" style="padding-left: 5%">
							<button class="btn btn-default" type="submit" name="acao"
								value="Buscar">
								<span class="glyphicon glyphicon-search">Buscar</span>
							</button>
						</span>
					</div>
				</div>

				<div class="col-md-3">
					<a href="cadProfessor.jsp" type="button" class="btn"
						style="background-color: #000080; color: white">Novo Professor</a>
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
							<th>Nome</th>
							<th>Matrícula</th>
							<th>E-Mail</th>
							<th class="actions">Ações</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="prof" items="${lista }">
							<tr>
								<input type="hidden" value=${prof.id }>
								<td>${prof.nome }</td>
								<td>${prof.matricula}</td>
								<td>${prof.email }</td>
								<td class="actions"><a class="btn btn-secondary btn-xs "
									href="ManterProfessorController.do?acao=Visualizar&id=${prof.id }"
									style="width: 25%">Detalhes</a> <a class="btn btn-info btn-xs"
									href="ManterProfessorController.do?acao=Editar&id=${prof.id }"
									style="width: 25%">Editar</a> <a class="btn btn-danger btn-xs"
									href="ManterProfessorController.do?acao=Excluir&id=${prof.id }"
									style="width: 25%">Excluir</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
