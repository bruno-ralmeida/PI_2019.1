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
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<title>Avaliação</title>


</head>
<body>
	<!-- Barra superior com os menus de navegação -->
	<div class="container" style="padding-top: 3%">

		<form action="ManterAvaliacaoController.do" method="post">
			<div id="top" class="row">

				<div class="col-md-3">
					<h3>
						<strong>Avaliar Aluno </strong>
					</h3>
				</div>
			</div>
			<!-- /#top -->
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
								<tr>
									<input type="hidden" value=${u.id } />
									<td>${u.ra }</td>
									<td>${u.nome }</td>
									<td>${u.email }</td>
									<td style="width: 15%"><input name="n${u.id }"
										class="form-control" type="number" min="0" max="10"
										step="0.01" required="required"></td>
									<td><input name="comentario${u.id }" class="form-control"
										type="text" required="required"></td>
								</tr>
							</c:forEach>
						<thead>
						</tbody>
					</table>
				</div>
			</div>
			<div class="container row">
				<input class="form-control" type=text
					placeholder="Comentar para todos" id="comentAll"> <input
					class="form-control" type="number" min="0" max="10" step="0.01"
					placeholder="Avaliar todos" id="notaAll">

				<button type="submit" class="btn btn-success" name="acao"
					value="avaliacao">Avaliar</button>
			</div>
		</form>
		<div class="row" id="all"></div>
	</div>

</body>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/jquery.js"></script>
</body>
</html>
