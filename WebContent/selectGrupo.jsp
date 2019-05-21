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


		<form action="ListarGrupoController.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h3>
						<strong>Selecione um Grupo </strong>
					</h3>
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
							<th>Professor</th>
							<th>Número do grupo</th>
							<th>Nome do Grupo</th>
							<th class="actions">Ações</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="grupo" items="${listGrupo }">
							<c:if test="${usuario.id == grupo.orientador.id }">
								<tr>
									<input type="hidden" value=${grupo.id }>
									<td>${grupo.orientador }</td>
									<td>${grupo.numero }</td>
									<td>${grupo.nome }</td>
									<td class="actions"><a class="btn btn-success btn-xs"
										href="ManterAvaliacaoController.do?acao=Grupo&id=${grupo.id }"
										style="padding: 2%">Selecionar</a></td>
								</tr>
							</c:if>
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
