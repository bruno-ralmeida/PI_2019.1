<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Detalhes</title>
</head>
<body>


	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container" style="padding-top: 3%">
		<h2 class="page-header">
			Detalhes do Professor <Strong>${professor.nome }</Strong>
		</h2>
		<div class="row">
			<div class="col-md-12" style="padding-top: 2%">
				<p>
					<strong>id: </strong> ${professor.id }
				</p>
				<p>
					<strong>Nome: </strong> ${professor.nome }
				</p>
				<p>
					<strong>Matricula: </strong>${professor.matricula }</p>
				<p>
					<strong>E-Mail: </strong>${professor.email }</p>


				<c:if test="${professor.administrador == 1 }">
					<p>
						<strong>Administrador: </strong>Sim
					</p>
				</c:if>
				<c:if test="${professor.administrador == 0 }">
					<p>
						<strong>Administrador: </strong>Não
					</p>
				</c:if>
			</div>
		</div>
		<hr />
		<div id="actions" class="row">
			<div class="col-md-12">
				<a class="btn btn-info btn-xs"
					href="ManterProfessorController.do?acao=Editar&id=${professor.id }">Editar</a>
				<a class="btn btn-danger btn-xs"
					href="ManterProfessorController.do?acao=Excluir&id=${professor.id }">Excluir</a>
				<a href="index.jsp" class="btn btn-default">Voltar</a>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>