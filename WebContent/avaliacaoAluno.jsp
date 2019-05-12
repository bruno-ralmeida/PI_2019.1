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

		<form action="ManterAvaliacaoController.do" method="post">
			<div id="top" class="row">
			
				<div class="col-md-3">
					<h3>
						<strong>Avaliar Aluno </strong>
					</h3>
				</div>
				<input name="dataDig" class="form-control" type="date" style="width: 20%"  >
			</div>
			<!-- /#top -->
		
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
								<td style="width: 15%"><input name="nota${u.id }"
									class="form-control" type="number" min="0" max="10"></td>
								<td><input name="comentario" class="form-control" type="text"></td>
								
							</tr>
						</c:forEach>
					<thead>
					</tbody>
				</table>
				</div>
				</div>
				</form>
				<div class="row" id="all">
				<input  class="form-control" type=text placeholder="Comentar para todos" id="comentAll">
				<input class="form-control" type="number" min="0" max="10" placeholder="Avaliar todos" id="notaAll">
				
				<button type="submit" class="btn btn-success" name="acao" value="avaliacao" >Avaliar</button>
				</div>
			</div>
			
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
