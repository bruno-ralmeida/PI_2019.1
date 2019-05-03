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

<title>Home</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="assets/style/utils.css" rel="stylesheet" />
</head>
<body>
	<!-- Barra superior com os menus de navegação -->
	<div id="main" class="container" style="padding-top: 3%">


		<form action="ManterAvaliacaoController.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h3>
						<strong>Selecione um Grupo </strong>
					</h3>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="bProf" class="form-control" id="search" type="text"
							placeholder="Pesquisar Grupos (deixe vazio para trazer todos)">
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
							<th>ID</th>
							<th>Professor</th>
							<th>Número do grupo</th>
							<th>Nome do Grupo</th>
							<th class="actions">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="grupo" items="${listGrupo }">
							<tr>
								<td>${grupo.id }</td>
								<td>${grupo.orientador }</td>
								<td>${grupo.numero }</td>
								<td>${grupo.nome }</td>
								<td class="actions"><a class="btn btn-success btn-xs"
									href="ManterAvaliacaoController.do?acao=Grupo&id=${grupo.id }"
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
