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
<link href="fonts/css/all.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div class="container" style="padding-top: 2%">


			<form action="ListarGrupoDeclaracao.do" method="post">
				<div class="row">
					<div class="col-md-3">
						<h3>
							<strong>Seleção de Grupo</strong>
						</h3>
					</div>
					<div class="col-md-6">
						<div class="input-group mb-3">
							<input name="bGrupo" class="form-control" id="search" type="text"
								placeholder="Pesquisar Atividade (deixe vazio para trazer todos)"
								disabled>
							<div class="input-group-append">
								<button class="btn btn-default" type="submit" name="acao"
									value="Buscar">
									<span class="glyphicon glyphicon-search"><i
										class="fas fa-search"></i></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<hr />
			<div id="list" class="row">

				<div class="container">
					<div class="table-responsive col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Orientador</th>
									<th>Nome do Grupo</th>
									<th class="actions">Ações</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="grupo" items="${lstGrupo }">
									<c:if test="${usuario.id == grupo.orientador.id }">
										<input type="hidden" value=${grupo.id }>
										<tr>
											<td>${grupo.orientador }</td>
											<td>${grupo.nome }</td>
											<td class="actions"><a class="btn btn-outline-info"
												href="GerarDeclaracaoController.do?id=${grupo.id }">Gerar
													Declaração</a></td>
										</tr>
									</c:if>
								</c:forEach>
							<thead>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>

<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
