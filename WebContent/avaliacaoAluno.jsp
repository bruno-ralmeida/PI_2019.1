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
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />
<title>Avaliação</title>


</head>
<body>
	<div class="container-fluid">
		<div class="container" style="padding-top: 2%">

			<form action="ManterAvaliacaoController.do" method="post">
				<div class="row">
					<div class="col-md-3">
						<h4>Avaliar alunos</h4>
					</div>

					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Nota e Comentario</span>
							</div>
							<input type="number" min="0" max="10" step="0.01" aria-label="First name" class="form-control" placeholder="Avaliar todos" disabled>
							<input type="text" aria-label="Last name" class="form-control" placeholder="Avaliar todos" disabled>
						</div>
					</div>
					<button type="submit" class="btn btn-success" name="acao"
						value="avaliacao">Avaliar</button>
				</div>
				<hr />
				<div id="list" class="row">

					<div class="table-responsive col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>RA</th>
									<th>Nome</th>
									<th>E-mail</th>
									<th>Nota</th>
									<th>Descrição</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${listAluno }">
									<input type="hidden" value=${u.id } />
									<tr>

										<td>${u.ra }</td>
										<td>${u.nome }</td>
										<td>${u.email }</td>
										<td style="width: 15%"><input name="n${u.id }"
											class="form-control" type="number" min="0" max="10"
											step="0.01" ></td>
										<td><input name="comentario${u.id }" class="form-control"
											type="text"></td>
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
