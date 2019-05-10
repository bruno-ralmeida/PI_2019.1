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

		<form action="ListarAlunosController.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h3>
						<strong>Avaliar Aluno </strong>
					</h3>
				</div>
				<input name="data" class="form-control" id="data" type="date" style="width: 20%">
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
							<th>RA</th>
							<th>Nome</th>
							<th>E-mail</th>
							<th>Nota</th>
							<th>Descrição</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="u" items="${listAluno }">
							<tr>
								<td>${u.id }</td>
								<td>${u.ra }</td>
								<td>${u.nome }</td>
								<td>${u.email }</td>
								<td style="width: 15%"><input name="nota"
									class="form-control" id="search" type="number" min=0 max=10></td>
								<td><input name="desc" class="form-control" id="nota"
									type="text"></td>
							</tr>
						</c:forEach>
					<thead>
					</tbody>
				</table>
				<a class="btn btn-success btn-xs" href="ManterAvaliacaoController.do?acao=Nota&id=${u.id }">Avaliar</a>
			</div>
		</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
