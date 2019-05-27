<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="fonts/css/all.css" rel="stylesheet">
<c:import url="Menu.jsp" />
<title>Avaliação</title>
</head>
<body>
	<div class="container-fluid">
		<div class="container" style="padding-top: 2%;">

			<div class="row">
				<div class="col-md-3">
					<h3>Avaliação do grupo</h3>
				</div>

				<div class="col-md-12	">
					<h6>
						<label for="inputName">Data da avaliacao: </label> <label><fmt:formatDate
								pattern="dd/MM/yyyy" value="${listAvaliacao[1].dataAvaliacao}" />

						</label>
					</h6>
				</div>
			</div>


			<div class="col-lg-12  mt-30">

				<div class="table-responsive col-md-12">
					<table class="table table-striped" cellspacing="0" cellpadding="0">

						<thead>

							<tr>
								<th>Nome</th>
								<th>Nota</th>
								<th>Comentário</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="avaliacao" items="${listAvaliacao}">
								<input type="hidden" value="${avaliacao.entrega.id }">
								<tr>
									<td>${avaliacao.aluno.nome}</td>
									<td>${avaliacao.nota}</td>
									<td>${avaliacao.comentarios}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="offset-md-10">
			<a class="btn btn-default"
				href="ListarAvaliadosController.do?acao=Buscar" style="width: 30%"><i class="fas fa-reply"></i></a>
		</div>
	</div>
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>