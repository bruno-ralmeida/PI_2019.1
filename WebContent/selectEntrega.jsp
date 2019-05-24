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
<div class="container-fluid">
	<div class="container" style="padding-top: 2%">

		<form action="ListarEntregaController.do" method="post">
			<div class="row">
				<div class="col-md-8">
					<h3>
						<strong>Selecione uma atividade</strong>
					</h3>
				</div>

			</div>
		</form>
		<hr />
		<div id="list" class="row">


			<div class="table-responsive col-md-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Grupo</th>
							<th>Atividade</th>
							<th class="actions">Ações</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="entrega" items="${listEntrega }">
							<input type="hidden" value=${entrega.id }>
							<tr>

								<td>${entrega.grupo.id }</td>
								<td>${entrega.atividade }</td>



								<td class="actions"><a class="btn btn-success btn-xs"
									href="ManterAvaliacaoController.do?acao=Entrega&id=${entrega.id }&idEntrega=${entrega.id }&idGrupo=${entrega.grupo.id }"
									style="padding: 2%">Selecionar</a></td>
							</tr>
						</c:forEach>
					<thead>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
