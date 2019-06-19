<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="Menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="fonts/css/all.min.css" rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />
<link href="fonts/css/all.min.css" rel="stylesheet">
<title>Avaliação</title>
</head>
<body>
	<div class="container-fluid">
		<div class="container" style="padding-top: 2%">

			<form
				action="ManterAvaliacaoController.do?idEntrega=${listaAvaliacao[1].entrega.id}"
				method="post">

				<div class="row">
					<div class="col-md-9">
						<h4>Avaliar alunos</h4>
					</div>

					<div class="align-items-end">
						<a class="btn btn-danger btn-sm"
							href="ListarAvaliadosController.do?acao=Buscar"> Cancelar </a>
						<button type="submit" class="btn btn-success btn-sm" name="acao"
							value=Salvar>Salvar</button>
					</div>


				</div>
				<hr />
				<div id="list" class="row">

					<div class="table-responsive col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Nome</th>
									<th>E-mail</th>
									<th>Nota</th>
									<th>Descrição</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="avaliacao" items="${listaAvaliacao}">
									<input type="hidden" name="aId${avaliacao.id}"
										value="${avaliacao.id}" />
									<tr>
										<td>${avaliacao.aluno.nome}</td>
										<td>${avaliacao.aluno.email}</td>
										<td style="width: 15%"><input name="n${avaliacao.id }"
											class="form-control" type="number" min="0" max="10"
											step="0.01" required="required" value="${avaliacao.nota}"></td>
										<td><input input type="text" class="form-control"
											name="comentario${avaliacao.id }"
											id="comentarios${avaliacao.id }"
											value="${avaliacao.comentarios}" required="required"></td>
									</tr>
								</c:forEach>
							<thead>
							</tbody>
						</table>

					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
