<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="Menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<!-- MAIN -->
<link href="assets/style/utils.css" rel="stylesheet" />
<title>Grupos</title>
</head>

<body>
	<div class="row mt-30">
		<div class="col-md-6 offset-md-3 text-center">
			<h2 class="text-muted text-capitalize title">Declaração</h2>
		</div>
		<div class="col-lg-12">
			<div class="row justify-content-md-center">
				<div class="col-4">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Banca</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="professor" items="${listaProfessores}">
								<tr>
									<td>${professor.nome}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-4">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Nome do grupo</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="grupo" items="${lstGrupo}">
								<tr>
									<td>${grupo.nome}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-4">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Integrantes</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="aluno" items="${listaAlunos}">
								<tr>
									<td>${aluno.nome}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
